#include "STM8S.h"
#include "DS18B20.h"
#include "TM1650.h"


void setup_clock(void);


void main(void)
{
	unsigned char display_state = 0;
	
	float t = 0;
	
	setup_clock();
	
	TM1650_init();
	DS18B20_init();
	
	while(1)
	{
		if(TM1650_read_keys() == DIG1_B_KI2)
		{
			delay_ms(400);
			display_state++;
			
			if(display_state > 2)
			{
				display_state = 0;
			}
		}
		
		t = DS18B20_get_temperature();
		
		switch(display_state)
		{
			case 1:
			{
				TM1650_display_F(((t * 1.8) + 32.0));
				break;
			}
			
			case 2:
			{
				TM1650_display_I((t + 273));
				break;
			}
			
			default:
			{
				TM1650_display_F(t);
				break;
			}
		}
		
		
		delay_ms(400);
	};
}


void setup_clock(void)
{
	CLK_DeInit();
	
	CLK_LSICmd(DISABLE);
	CLK_HSECmd(DISABLE);
	CLK_HSICmd(ENABLE);
	while(CLK_GetFlagStatus(CLK_FLAG_HSIRDY) == FALSE);
	
	CLK_ClockSwitchCmd(ENABLE);
	CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);
	CLK_SYSCLKConfig(CLK_PRESCALER_CPUDIV1);
	
	CLK_ClockSwitchConfig(CLK_SWITCHMODE_AUTO, 
											 CLK_SOURCE_HSI, 
											 DISABLE, CLK_CURRENTCLOCKSTATE_ENABLE);
	
	CLK_ClockSecuritySystemEnable();

	CLK_PeripheralClockConfig(CLK_PERIPHERAL_CAN, DISABLE);
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_I2C, ENABLE);
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_SPI, DISABLE);
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_ADC, DISABLE);
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_AWU, DISABLE);
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_UART1, DISABLE);
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_UART3, DISABLE);
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER1, DISABLE);
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER2, DISABLE);
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER3, DISABLE);
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER4, DISABLE);
}