#include "STM8S.h"
#include "TM1637.h"


void clock_setup(void);
void GPIO_setup(void);
void ADC1_setup(void);
unsigned int adc_avg(void);
unsigned int get_lux(unsigned int value);

void main(void)
{
  unsigned int lux = 0x0000;

  clock_setup();
  GPIO_setup();
  ADC1_setup();
  TM1637_init();
      
  while(1)
  {
    lux = adc_avg();
    lux = get_lux(lux); 
    
    TM1637_display_number(0, (unsigned char)(lux / 1000), 0);
    TM1637_display_number(1, (unsigned char)((lux % 1000) / 100), 0);   
    TM1637_display_number(2, (unsigned char)((lux % 100) / 10), 0);   
    TM1637_display_number(3, (unsigned char)(lux % 10), 0);
    
    delay_ms(400);    
  };
}


void clock_setup(void)
{
  CLK_DeInit();

  CLK_HSECmd(DISABLE);
  CLK_LSICmd(DISABLE);
  CLK_HSICmd(ENABLE);
  while(!CLK_GetFlagStatus(CLK_FLAG_HSIRDY));

  CLK_ClockSwitchCmd(ENABLE);
  CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);
  CLK_SYSCLKConfig(CLK_PRESCALER_CPUDIV1);

  CLK_ClockSwitchConfig(CLK_SWITCHMODE_AUTO, CLK_SOURCE_HSI, 
  DISABLE, CLK_CURRENTCLOCKSTATE_ENABLE);

  CLK_PeripheralClockConfig(CLK_PERIPHERAL_I2C, ENABLE);
  CLK_PeripheralClockConfig(CLK_PERIPHERAL_ADC, ENABLE);
  CLK_PeripheralClockConfig(CLK_PERIPHERAL_SPI, DISABLE);
  CLK_PeripheralClockConfig(CLK_PERIPHERAL_AWU, DISABLE);
  CLK_PeripheralClockConfig(CLK_PERIPHERAL_UART1, DISABLE);
  CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER1, DISABLE);
  CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER2, DISABLE);
  CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER4, DISABLE);
}


void GPIO_setup(void)
{
  GPIO_DeInit(GPIOB);
  GPIO_Init(GPIOB, GPIO_PIN_5, GPIO_MODE_OUT_OD_LOW_FAST);
  
  GPIO_DeInit(GPIOC);
  GPIO_Init(GPIOC, GPIO_PIN_4, GPIO_MODE_IN_FL_NO_IT);
}


void ADC1_setup(void)
{
  ADC1_DeInit();	

  ADC1_Init(ADC1_CONVERSIONMODE_CONTINUOUS, 
            ADC1_CHANNEL_2,
            ADC1_PRESSEL_FCPU_D18, 
            ADC1_EXTTRIG_GPIO, 
            DISABLE, 
            ADC1_ALIGN_RIGHT, 
            ADC1_SCHMITTTRIG_CHANNEL2, 
            DISABLE);
  
  ADC1_Cmd(ENABLE);
}


unsigned int adc_avg(void)
{
  unsigned char s = 16;
  unsigned int value = 0x0000;
  
  while(s > 0)
  {
    GPIO_WriteLow(GPIOB, GPIO_PIN_5);
    ADC1_StartConversion();
    while(ADC1_GetFlagStatus(ADC1_FLAG_EOC) == 0);
    value += ADC1_GetConversionValue();
    ADC1_ClearFlag(ADC1_FLAG_EOC);
    ADC1_ClearFlag(ADC1_FLAG_AWS2);
    s--;
    GPIO_WriteHigh(GPIOB, GPIO_PIN_5);
  };
  
  value >>= 4;
  
  return value;
}


unsigned int get_lux(unsigned int value)
{
  value *= 6;
  
  return value;
}
