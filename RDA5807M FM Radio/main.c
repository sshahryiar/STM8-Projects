#include "STM8S.h"
#include "stdio.h"
#include "RDA5807.h"
#include "lcd.h"


void setup(void);
void CLK_setup(void);
void GPIO_setup(void);


void main(void)
{
    char buffer[40];
    uint8_t change_vol = 0;
    uint8_t change_freq = 0;
    uint8_t rssi = 0;
      
    setup();
    
    LCD_goto(0, 0);
    LCD_putstr("Freq/MHz:");
    LCD_goto(0, 1);
    LCD_putstr("Vol:");
    LCD_goto(8, 1);
    LCD_putstr("RSSI:");
        
    while(1)
    {       
        if(GPIO_ReadInputPin(GPIOF, GPIO_PIN_7) == RESET)
        {
          Frequency++;
          change_freq = 1;
        }
        
        if(GPIO_ReadInputPin(GPIOC, GPIO_PIN_5) == RESET)
        {
          Frequency--;
          change_freq = 1;
        }
      
        if(change_freq)
        {
          if(Frequency > 1080)
          {
            Frequency = 1080;
          }
          
          if(Frequency < 870)
          {
            Frequency = 870;
          }
          
          RDA5807_set_frequency(Frequency);
          change_freq = 0;
        }
        
        if(GPIO_ReadInputPin(GPIOC, GPIO_PIN_6) == RESET)
        {
          Volume++;
          change_vol = 1;
        }
        
        if(GPIO_ReadInputPin(GPIOC, GPIO_PIN_7) == RESET)
        {
          Volume--;
          change_vol = 1;
        }
      
        if(change_vol)
        {
          if(Volume > 15)
          {
            Volume = 15;
          }
          
          if((Volume <= 0) | (Volume >= 16))
          {
            Volume = 0;
          }
          
          RDA5807_set_volume(Volume);
          change_vol = 0;
        }
      
        rssi = RDA5807_get_signal_strength();
        
        sprintf(buffer, "%3.1f", ((float)Frequency / 10.0));
        LCD_goto(11, 0);
        LCD_putstr(buffer);
        
        sprintf(buffer, "%2d", Volume);
        LCD_goto(5, 1);
        LCD_putstr(buffer);
        
        sprintf(buffer, "%3d", rssi);
        LCD_goto(13, 1);
        LCD_putstr(buffer);
        delay_ms(100);        
    };
}


void CLK_setup(void)
{
    CLK_DeInit();

    CLK_LSICmd(DISABLE);
    CLK_HSECmd(DISABLE);
    CLK_HSICmd(ENABLE);
    while(!CLK_GetFlagStatus(CLK_FLAG_HSIRDY));

    CLK_ClockSwitchCmd(ENABLE);
    CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);
    CLK_SYSCLKConfig(CLK_PRESCALER_CPUDIV1);

    CLK_ClockSwitchConfig(CLK_SWITCHMODE_AUTO, 
                          CLK_SOURCE_HSI, 
                          DISABLE, 
                          CLK_CURRENTCLOCKSTATE_ENABLE);

    CLK_ClockSecuritySystemEnable();

    CLK_PeripheralClockConfig(CLK_PERIPHERAL_CAN, DISABLE);
    CLK_PeripheralClockConfig(CLK_PERIPHERAL_I2C, ENABLE);
    CLK_PeripheralClockConfig(CLK_PERIPHERAL_ADC, DISABLE);
    CLK_PeripheralClockConfig(CLK_PERIPHERAL_SPI, DISABLE);
    CLK_PeripheralClockConfig(CLK_PERIPHERAL_AWU, DISABLE);
    CLK_PeripheralClockConfig(CLK_PERIPHERAL_UART1, DISABLE);
    CLK_PeripheralClockConfig(CLK_PERIPHERAL_UART3, DISABLE);
    CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER1, DISABLE);
    CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER2, DISABLE);
    CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER3, DISABLE);
    CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER4, DISABLE);
}


void GPIO_setup(void)
{
    GPIO_DeInit(GPIOA);
    GPIO_DeInit(GPIOC);
    GPIO_DeInit(GPIOE);
    GPIO_DeInit(GPIOF);
    
    GPIO_Init(GPIOC, GPIO_PIN_5, GPIO_MODE_IN_PU_NO_IT);
    GPIO_Init(GPIOC, GPIO_PIN_6, GPIO_MODE_IN_PU_NO_IT);
    GPIO_Init(GPIOC, GPIO_PIN_7, GPIO_MODE_IN_PU_NO_IT);
    GPIO_Init(GPIOF, GPIO_PIN_7, GPIO_MODE_IN_PU_NO_IT);
}


void setup(void)
{
    CLK_setup();
    GPIO_setup();
    I2C_setup();
    RDA5807_init();
    LCD_init();
}
  
