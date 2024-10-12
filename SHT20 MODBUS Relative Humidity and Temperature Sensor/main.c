#include "STM8S.h"
#include "lcd.h"
#include "stdio.h"


#define TX_buffer_length            8
#define RX_buffer_length            10


uint8_t cnt = 0x00;
uint8_t RX_buffer[RX_buffer_length];

static const char TX_buffer[TX_buffer_length] = {0x01, 0x04, 0x00, 0x01, 0x00, 0x02, 0x20, 0x0B};


void setup(void);
void CLK_setup(void);
void GPIO_setup(void);
void UART3_setup(void);
void UART3_Receive(void);
uint16_t make_word(uint8_t HB, uint8_t LB);
void get_HB_LB(uint16_t value, uint8_t *HB, uint8_t *LB);
uint16_t MODBUS_RTU_CRC16(uint8_t *data_input, uint8_t data_length);
void flush_RX_buffer(void);
void send_command(void);


void main(void)
{
    char buffer[40];

    uint8_t i = 0;
    uint16_t CRC_check_1 = 0x0000;
    uint16_t CRC_check_2 = 0x0000;
    
    float T = 0.0;
    float RH = 0.0;      

    setup();

    LCD_goto(0, 0);
    LCD_putstr("Tmp/'C:");
    LCD_goto(0, 1);
    LCD_putstr("R.H/ %:");    
    
    while(1)
    {
        send_command();
        CRC_check_1 = MODBUS_RTU_CRC16(RX_buffer, 7);
        CRC_check_2 = make_word(RX_buffer[8], RX_buffer[7]);

      
        if(CRC_check_1 == CRC_check_2)
        {
            T = (((float)make_word(RX_buffer[3], RX_buffer[4])) / 10.0);
            RH = (((float)make_word(RX_buffer[5], RX_buffer[6])) / 10.0);
            
            sprintf(buffer, "%2.1f", T);
            LCD_goto(12, 0);
            LCD_putstr(buffer);
            
            sprintf(buffer, "%2.1f", RH);
            LCD_goto(12, 1);
            LCD_putstr(buffer);
        }

        else
        {
            LCD_goto(12, 0);
            LCD_putstr("--.-");
            LCD_goto(12, 1);
            LCD_putstr("--.-");
        }

        GPIO_WriteReverse(GPIOE, GPIO_PIN_0);
        delay_ms(600);
    };
}


void CLK_setup(void)
{
    CLK_DeInit();

    CLK_HSECmd(DISABLE);
    CLK_LSICmd(DISABLE);
    CLK_HSICmd(ENABLE);
    while(!CLK_GetFlagStatus(CLK_FLAG_HSIRDY));

    CLK_ClockSwitchCmd(ENABLE);
    CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);
    CLK_SYSCLKConfig(CLK_PRESCALER_CPUDIV16);

    CLK_ClockSwitchConfig(CLK_SWITCHMODE_AUTO, CLK_SOURCE_HSI, 
    DISABLE, CLK_CURRENTCLOCKSTATE_ENABLE);

    CLK_PeripheralClockConfig(CLK_PERIPHERAL_I2C, DISABLE);
    CLK_PeripheralClockConfig(CLK_PERIPHERAL_ADC, DISABLE);
    CLK_PeripheralClockConfig(CLK_PERIPHERAL_SPI, DISABLE);
    CLK_PeripheralClockConfig(CLK_PERIPHERAL_AWU, DISABLE);
    CLK_PeripheralClockConfig(CLK_PERIPHERAL_UART1, DISABLE);
    CLK_PeripheralClockConfig(CLK_PERIPHERAL_UART3, ENABLE);
    CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER1, DISABLE);
    CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER2, DISABLE);
    CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER3, DISABLE);
    CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER4, DISABLE);
}


void GPIO_setup(void)
{
    GPIO_DeInit(GPIOA);
    GPIO_DeInit(GPIOD);
    GPIO_DeInit(GPIOE);
    GPIO_DeInit(GPIOG);  
    GPIO_DeInit(GPIOI); 
    
    GPIO_Init(GPIOA, GPIO_PIN_3, GPIO_MODE_OUT_OD_LOW_FAST);    
    GPIO_Init(GPIOA, GPIO_PIN_6, GPIO_MODE_OUT_OD_LOW_FAST);   

    GPIO_Init(GPIOD, GPIO_PIN_5, GPIO_MODE_OUT_PP_HIGH_FAST);
    GPIO_Init(GPIOD, GPIO_PIN_6, GPIO_MODE_IN_FL_NO_IT);
    
    GPIO_Init(GPIOE, GPIO_PIN_0, GPIO_MODE_OUT_OD_LOW_FAST);   
    
    GPIO_Init(GPIOG, GPIO_PIN_6, GPIO_MODE_OUT_PP_LOW_FAST);   
}


void UART3_setup(void)
{
    UART3_DeInit();

    UART3_Init(9600, 
               UART3_WORDLENGTH_8D, 
               UART3_STOPBITS_1, 
               UART3_PARITY_NO, 
               UART3_MODE_TXRX_ENABLE);

    UART3_ITConfig(UART3_IT_RXNE, ENABLE);
    enableInterrupts();

    UART3_Cmd(ENABLE);
}


void setup(void)
{
    CLK_setup();
    GPIO_setup();
    UART3_setup();
    LCD_init();
}
  

void UART3_Receive(void)
{
    if(UART3_GetFlagStatus(UART3_FLAG_RXNE))
    {
        RX_buffer[cnt++] = UART3_ReceiveData8();
        UART3_ClearITPendingBit(UART3_IT_RXNE);
        UART3_ClearFlag(UART3_FLAG_RXNE);
        GPIO_WriteReverse(GPIOA, GPIO_PIN_3);
    }
}


uint16_t make_word(uint8_t HB, uint8_t LB)
{
    uint16_t tmp = 0;

    tmp = (uint16_t)HB;
    tmp <<= 8;
    tmp |= (uint16_t)LB;

    return tmp;
}


void get_HB_LB(uint16_t value, uint8_t *HB, uint8_t *LB)
{
    *LB = ((uint8_t)(value & 0x00FF));
    *HB = ((uint8_t)((value & 0xFF00) >> 8));
}


uint16_t MODBUS_RTU_CRC16(uint8_t *data_input, uint8_t data_length)
{
    uint8_t n = 0x08;
    uint8_t s = 0x00;
    uint16_t CRC_word = 0xFFFF;

    for(s = 0; s < data_length; s++)
    {
      CRC_word ^= ((unsigned int)data_input[s]);

      n = 8;
      while(n > 0)
      {
        if((CRC_word & 0x0001) == 0)
        {
          CRC_word >>= 1;
        }

        else
        {
          CRC_word >>= 1;
          CRC_word ^= 0xA001;
        }

        n--;
      }
    }

    return CRC_word;
}


void flush_RX_buffer(void)
{
    int8_t i = (RX_buffer_length - 1);

    while(i > -1)
    {
        RX_buffer[i] = 0x00;
        i--;
    };
}


void send_command(void)
{
    uint8_t i = 0x00;
    
    flush_RX_buffer();

    GPIO_WriteReverse(GPIOA, GPIO_PIN_6);
    GPIO_WriteHigh(GPIOG, GPIO_PIN_6);
    delay_ms(10);

    for(i = 0; i < 8; i++)
    {
       UART3_SendData8(TX_buffer[i]);
       while(UART3_GetFlagStatus(UART3_FLAG_TXE) == RESET);
    }
    
    delay_ms(4);
    
    cnt = 0;
    GPIO_WriteLow(GPIOG, GPIO_PIN_6);
    delay_ms(400);    
}