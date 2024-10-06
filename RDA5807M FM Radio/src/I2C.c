#include "I2C.h"


void I2C_setup(void)
{
    GPIO_Init(I2C_PORT, I2C_SCL_PIN, GPIO_MODE_OUT_OD_HIZ_FAST);
    GPIO_Init(I2C_PORT, I2C_SDA_PIN, GPIO_MODE_OUT_OD_HIZ_FAST);
    
    I2C_DeInit();
    I2C_Init(100000, 
             0x00, 
	    I2C_DUTYCYCLE_2, 
	    I2C_ACK_CURR, 
	    I2C_ADDMODE_7BIT, 
	    (CLK_GetClockFreq() / 1000000));
    I2C_Cmd(ENABLE);	
}


uint16_t I2C_read(uint8_t address, uint8_t bytes_to_read)
{
    uint16_t value = 0x0000;
    uint8_t num_of_bytes = bytes_to_read;   
    uint8_t bytes[2];

    while(I2C_GetFlagStatus(I2C_FLAG_BUSBUSY));

    I2C_GenerateSTART(ENABLE);
    while(!I2C_CheckEvent(I2C_EVENT_MASTER_MODE_SELECT));

    I2C_Send7bitAddress(address, I2C_DIRECTION_RX);
    while(!I2C_CheckEvent(I2C_EVENT_MASTER_RECEIVER_MODE_SELECTED));

    while(num_of_bytes)
    {
      if(I2C_CheckEvent(I2C_EVENT_MASTER_BYTE_RECEIVED))
      {   
           if(num_of_bytes == 0)
           {
                    I2C_AcknowledgeConfig(I2C_ACK_NONE);
                    I2C_GenerateSTOP(ENABLE);   
           }
           
           bytes[(num_of_bytes - 1)] = I2C_ReceiveData();

           num_of_bytes--;
      }
    };    

    value = ((bytes[1] << 8) | bytes[0]);  

    return value;
}


void I2C_write(uint8_t address, uint8_t *value, uint8_t bytes_to_write)
{
   uint8_t i = 0;   
   
   I2C_GenerateSTART(ENABLE);
   while(!I2C_CheckEvent(I2C_EVENT_MASTER_MODE_SELECT));
   
   I2C_Send7bitAddress(address, I2C_DIRECTION_TX); 
   while(!I2C_CheckEvent(I2C_EVENT_MASTER_TRANSMITTER_MODE_SELECTED));
   
   for(i = 0; i < bytes_to_write; i++)
   {
       I2C_SendData(value[i]);
       while(!I2C_CheckEvent(I2C_EVENT_MASTER_BYTE_TRANSMITTED));
   }
   
   I2C_GenerateSTOP(ENABLE);  	
}