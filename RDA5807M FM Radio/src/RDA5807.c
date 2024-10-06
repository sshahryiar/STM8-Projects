#include "RDA5807.h"
#include "I2C.h"


uint8_t Volume = 0;
uint8_t RDA5807_state = 0;
uint16_t Frequency = 0;


void RDA5807_init(void)		  
{	
    Frequency = 1000;
    Volume = 1;
    RDA5807_state = 1;

    RDA5807_write_reg(RDA5807_REG_05H, 0x0002);        
    delay_ms(30);
    RDA5807_write_reg(RDA5807_REG_02H, 0xD281);        
    RDA5807_write_reg(RDA5807_REG_03H, 0x0000);       
    RDA5807_write_reg(RDA5807_REG_04H, 0x0040);        
    RDA5807_write_reg(RDA5807_REG_05H, 0x88A2);              
    
    RDA5807_set_frequency(Frequency);
    GPIO_Init(SPEAKER_PORT, SPEAKER_PIN, GPIO_MODE_OUT_PP_HIGH_SLOW);
} 


uint16_t RDA5807_read_reg(uint8_t address)			
{
    uint16_t value = 0x0000;
    /*
    SW_I2C_start();
    SW_I2C_write(RDA5807_I2C_Address);
    SW_I2C_wait_ACK();	
    SW_I2C_write(address);
    SW_I2C_wait_ACK();		
    SW_I2C_start();
    SW_I2C_write(RDA5807_I2C_Address + 1);
    SW_I2C_wait_ACK();	
    HB = SW_I2C_read(I2C_ACK); 
    LB = SW_I2C_read(I2C_NACK);     
    SW_I2C_stop();
    */
    
    value = I2C_read(RDA5807_I2C_Address, 2);
   
    return value;
}


void RDA5807_write_reg(uint8_t address, uint16_t value)  
{
    uint8_t bytes[2];
    
    bytes[1] = (value & 0x00FF);
    bytes[0] = ((value & 0xFF00) >> 0x08);
    /*
    SW_I2C_start();
    SW_I2C_write(RDA5807_I2C_Address);
    SW_I2C_wait_ACK();	
    SW_I2C_write(address);
    SW_I2C_wait_ACK();	
    SW_I2C_write(HB);
    SW_I2C_wait_ACK();	
    SW_I2C_write(LB);
    SW_I2C_wait_ACK();	
    SW_I2C_stop();
    */
    
    I2C_write(RDA5807_I2C_Address, bytes, 2);
}


uint16_t RDA5807_get_signal_strength(void)
{
    uint16_t value = 0;

    if(RDA5807_state)
    {
        value = RDA5807_read_reg(RDA5807_REG_0BH);		
        value = ((value >> 9) & 0x7F);    
    }
    
    return value;     
}


void RDA5807_seek_direction(uint8_t direction)
{
    uint16_t temp = 0x0000;
    
    if(RDA5807_state)
    {
        temp = RDA5807_read_reg(RDA5807_REG_02H);        
        if(direction)
            temp |= (1 << 9);			
        else
            temp &= ~(1 << 9);
        
        RDA5807_write_reg(RDA5807_REG_02H, temp);
    }
}


uint16_t RDA5807_search_frequency(void)  
{
    uint16_t temp = 0x0000;

    temp = RDA5807_read_reg(RDA5807_REG_02H);  	
    temp |= (1 << 8);     
    RDA5807_write_reg(RDA5807_REG_02H, temp);
    
    while((RDA5807_read_reg(RDA5807_REG_0AH) & (1 << 14)) == 0x0000)  
    {
        delay_ms(10);   
    }
    temp = ((RDA5807_read_reg(RDA5807_REG_0AH) & 0x3FF) + 870);  
    
    return temp;   	 
}


void RDA5807_set_frequency(uint16_t frequency)
{
    uint16_t tmp = 0x0000;
    uint16_t temp = 0x0000;    
        
    temp = RDA5807_read_reg(RDA5807_REG_03H);	
    temp &= 0x3F;
    
    if(frequency < 870)
    {
      frequency = 870;
    }
    
    if(frequency > 1080)
    {
      frequency = 1080;
    }
    
    tmp = (frequency - 870);
       
    temp |= (tmp << 6);   
    temp |= (1 << 4);
    
    RDA5807_write_reg(RDA5807_REG_03H, temp);	
    delay_ms(50);
}


void RDA5807_set_volume(uint8_t value)
{
    uint16_t temp = 0x0000;
    
    if(value > 15)
    {
      value = 15;
    }
    
    else if(value <= 0)
    {
      value = 0;
      GPIO_WriteLow(SPEAKER_PORT, SPEAKER_PIN);
    }
    
    else
    {
      GPIO_WriteHigh(SPEAKER_PORT, SPEAKER_PIN);
    }

    if(RDA5807_state)
    {  
        temp = RDA5807_read_reg(RDA5807_REG_05H);		
        temp &= 0xFFF0;				   
        RDA5807_write_reg(RDA5807_REG_05H, (temp | value));			
    }
}


void RDA5807_enable(void)
{
    uint16_t temp = 0x0000;
    
    temp = RDA5807_read_reg(RDA5807_REG_02H);

    if((temp & 0x01) == 0x00)
    {
        RDA5807_init();
        RDA5807_state = 1;
    }
    else
    {      
        RDA5807_write_reg(RDA5807_REG_02H, 0x0000);	
        RDA5807_state = 0;
    }    
}
