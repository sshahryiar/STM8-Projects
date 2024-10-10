#include "STM8S.h"
#include "lcd.h"
#include "stdio.h"


#define sync_high          15500
#define sync_low           11500
#define one_high            2600
#define one_low             1900
#define zero_high           1300
#define zero_low             950


bool frame_received = FALSE;
uint8_t bits = 0;
uint16_t time_slots[33];


void setup(void);
void CLK_setup(void);
void GPIO_setup(void);
void TIM3_setup(void);
void receive_IR(void);
uint8_t decode(uint8_t start_pos, uint8_t end_pos);
void decode_NEC(uint8_t *addr, uint8_t *cmd);
void erase_frames(void);


void main(void)
{
    char buffer[40];

    uint8_t address = 0;
    uint8_t command = 0;

    setup();
    
    LCD_goto(0, 0);
    LCD_putstr("Address:");
    LCD_goto(0, 1);
    LCD_putstr("Command:");
    
    LCD_goto(12, 0);
    LCD_putstr("0x00");
    LCD_goto(12, 1);
    LCD_putstr("0x00");
   
    while(1)
    {
        if(frame_received == TRUE)
        {
          decode_NEC(&address, &command);
          
          LCD_goto(14, 0);
          if(address < 0x10)
          {
            LCD_putstr("0");
          }
                   
          sprintf(buffer, "%2X", address);
          LCD_putstr(buffer);
            
          LCD_goto(14, 1);
          if(command < 0x10)
          {
            LCD_putstr("0");
          }
                   
          sprintf(buffer, "%2X", command);
          LCD_putstr(buffer);
          
                  
          if(address == 0x00)
          {
              switch(command)
              {
                case 0x18:
                {
                  GPIO_WriteReverse(GPIOA, GPIO_PIN_3);
                  break;
                }
                
                case 0x7A:
                {
                  GPIO_WriteReverse(GPIOA, GPIO_PIN_6);
                  break;
                }
                
                case 0x30:
                {
                  GPIO_WriteReverse(GPIOE, GPIO_PIN_0);
                  break;
                }
                
                case 0x10:
                {
                  GPIO_WriteHigh(GPIOA, GPIO_PIN_3);
                  GPIO_WriteHigh(GPIOA, GPIO_PIN_6);
                  GPIO_WriteHigh(GPIOE, GPIO_PIN_0);                              
                  break;
                }
                
                case 0x68:
                {
                  GPIO_WriteLow(GPIOA, GPIO_PIN_3);
                  GPIO_WriteLow(GPIOA, GPIO_PIN_6);
                  GPIO_WriteLow(GPIOE, GPIO_PIN_0);                              
                  break;
                }
                
              }
          }
                    
          erase_frames();
        }
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
    CLK_PeripheralClockConfig(CLK_PERIPHERAL_UART3, DISABLE);
    CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER1, DISABLE);
    CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER2, DISABLE);
    CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER3, ENABLE);
    CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER4, DISABLE);
}


void GPIO_setup(void)
{
    GPIO_DeInit(GPIOA);
    GPIO_DeInit(GPIOC);
    GPIO_DeInit(GPIOE);
    GPIO_DeInit(GPIOG);  
    GPIO_DeInit(GPIOI); 
    
    GPIO_Init(GPIOA, GPIO_PIN_3, GPIO_MODE_OUT_OD_LOW_FAST);    
    GPIO_Init(GPIOA, GPIO_PIN_6, GPIO_MODE_OUT_OD_LOW_FAST);   

    GPIO_Init(GPIOC, GPIO_PIN_4, GPIO_MODE_IN_PU_IT);    
    EXTI_SetExtIntSensitivity(EXTI_PORT_GPIOC,EXTI_SENSITIVITY_FALL_ONLY);
    
    GPIO_Init(GPIOE, GPIO_PIN_0, GPIO_MODE_OUT_OD_LOW_FAST);   
}


void TIM3_setup(void)
{
    TIM3_TimeBaseInit(TIM3_PRESCALER_16, 60000);  
    TIM3_ITConfig(TIM3_IT_UPDATE , ENABLE);
    TIM3_Cmd(ENABLE);
    enableInterrupts();
}


void setup(void)
{
    CLK_setup();
    GPIO_setup();
    TIM3_setup();
    LCD_init();
}
  
  
void receive_IR(void)
{
    disableInterrupts();

    time_slots[bits] = TIM3_GetCounter();
    bits++;

    if(bits >= 33)
    {
        frame_received = TRUE;
    }

    TIM3_SetCounter(0);
    enableInterrupts();
}


uint8_t decode(uint8_t start_pos, uint8_t end_pos)
{
     uint8_t value = 0;
     
     for(bits = start_pos; bits <= end_pos; bits++)
     {
       value <<= 1;
       if((time_slots[bits] >= one_low) && (time_slots[bits] <= one_high))
       {
           value |= 1;
       }
       else if((time_slots[bits] >= zero_low) && (time_slots[bits] <= zero_high))
       {
           value |= 0;
       }
       else if((time_slots[bits] >= sync_low) && (time_slots[bits] <= sync_high))
       {
           return 0xFF;
       }
     }
     
     return value;
}


void decode_NEC(uint8_t *addr, uint8_t *cmd)
{
    *addr = decode(2, 9);
    *cmd = decode(18, 25);
}


void erase_frames(void)
{
    delay_ms(100);

    for(bits = 0; bits < 33; bits++)
    {
        time_slots[bits] = 0x0000;
    }

    TIM3_SetCounter(0);
    frame_received = FALSE;
    bits = 0;
}