#include "STM8S.h"
#include "WS2812B.h"


void clock_setup(void);


void main(void)
{
	unsigned char i = 0;

	clock_setup();
	WS2812B_init();
	
	while(1)
	{
		WS2812B_reset();
		for(i = 0; i < number_of_LEDs; i++)
		{
			WS2812B_set_colour_on_channel(i, 255, 0, 0);
			delay_ms(160);
		}
		 
		WS2812B_reset();
		for(i = 0; i < number_of_LEDs; i++)
		{
			WS2812B_set_colour_on_channel(i, 0, 255, 0);
			delay_ms(160);
		}
		 
		WS2812B_reset();
		for(i = 0; i < number_of_LEDs; i++)
		{
			WS2812B_set_colour_on_channel(i, 0, 0, 255);
			delay_ms(160);
		}
		 
		WS2812B_reset();
		for(i = 0; i < number_of_LEDs; i++)
		{
			WS2812B_set_colour_on_channel(i, 255, 0, 255);
			delay_ms(160);
		}
		 
		WS2812B_reset();
		for(i = 0; i < number_of_LEDs; i++)
		{
			WS2812B_set_colour_on_channel(i, 0, 255, 255);
		    delay_ms(160);
		}
		
		WS2812B_reset();
		for(i = 0; i < number_of_LEDs; i++)
		{
			WS2812B_set_colour_on_channel(i, 255, 255, 0);
			delay_ms(160);
		}
		
		WS2812B_reset();
		for(i = 0; i < number_of_LEDs; i++)
		{
		    WS2812B_set_colour_on_channel(i, 255, 255, 255);
		    delay_ms(160);
		}
		
		WS2812B_reset();
		for(i = 0; i < number_of_LEDs; i++)
		{
			WS2812B_set_colour_on_channel((i - 1), 0, 0, 0);
			WS2812B_set_colour_on_channel(i, 255, 0, 0);
			delay_ms(160);
		}
		 
		WS2812B_reset();
		for(i = 0; i < number_of_LEDs; i++)
		{
			WS2812B_set_colour_on_channel((i - 1), 0, 0, 0);
			WS2812B_set_colour_on_channel(i, 0, 255, 0);
			delay_ms(160);
		}
		 
		WS2812B_reset();
		for(i = 0; i < number_of_LEDs; i++)
		{
			WS2812B_set_colour_on_channel((i - 1), 0, 0, 0);
			WS2812B_set_colour_on_channel(i, 0, 0, 255);
			delay_ms(160);
		}
		 
		WS2812B_reset();
		for(i = 0; i < number_of_LEDs; i++)
		{
			WS2812B_set_colour_on_channel((i - 1), 0, 0, 0);
			WS2812B_set_colour_on_channel(i, 255, 0, 255);
			delay_ms(160);
		}
		 
		WS2812B_reset();
		for(i = 0; i < number_of_LEDs; i++)
		{
			WS2812B_set_colour_on_channel((i - 1), 0, 0, 0);
			WS2812B_set_colour_on_channel(i, 0, 255, 255);
		    delay_ms(160);
		}
		
		WS2812B_reset();
		for(i = 0; i < number_of_LEDs; i++)
		{
			WS2812B_set_colour_on_channel((i - 1), 0, 0, 0);
			WS2812B_set_colour_on_channel(i, 255, 255, 0);
			delay_ms(160);
		}
		
		WS2812B_reset();
		for(i = 0; i < number_of_LEDs; i++)
		{
			WS2812B_set_colour_on_channel((i - 1), 0, 0, 0);
		    WS2812B_set_colour_on_channel(i, 255, 255, 255);
		    delay_ms(160);
		}
		
		WS2812B_reset();
		for(i = 0; i < 4; i++)
		{
			WS2812B_set_colour_on_channel(0, 0, 0, 200);
			delay_ms(220);
			WS2812B_set_colour_on_channel(1, 0, 0, 200);
			WS2812B_set_colour_on_channel(7, 0, 0, 200);
			delay_ms(220);
			WS2812B_set_colour_on_channel(2, 0, 0, 200);
			WS2812B_set_colour_on_channel(6, 0, 0, 200);
			delay_ms(220);
			WS2812B_set_colour_on_channel(3, 0, 0, 200);
			WS2812B_set_colour_on_channel(5, 0, 0, 200);
			delay_ms(220);
			WS2812B_set_colour_on_channel(4, 0, 0, 200);
			delay_ms(440);
			
			WS2812B_set_colour_on_channel(4, 0, 200, 0);
			delay_ms(220);
			WS2812B_set_colour_on_channel(3, 0, 200, 0);
			WS2812B_set_colour_on_channel(5, 0, 200, 0);
			delay_ms(220);
			WS2812B_set_colour_on_channel(2, 0, 200, 0);
			WS2812B_set_colour_on_channel(6, 0, 200, 0);
			delay_ms(220);
			WS2812B_set_colour_on_channel(1, 0, 200, 0);
			WS2812B_set_colour_on_channel(7, 0, 200, 0);
			delay_ms(220);
			WS2812B_set_colour_on_channel(0, 0, 200, 0);
			delay_ms(440);
			
			WS2812B_set_colour_on_channel(0, 200, 0, 0);
			delay_ms(220);
			WS2812B_set_colour_on_channel(1, 200, 0, 0);
			WS2812B_set_colour_on_channel(7, 200, 0,0);
			delay_ms(220);
			WS2812B_set_colour_on_channel(2, 200, 0, 0);
			WS2812B_set_colour_on_channel(6, 200, 0, 0);
			delay_ms(220);
			WS2812B_set_colour_on_channel(3, 200, 0, 0);
			WS2812B_set_colour_on_channel(5, 200, 0, 0);
			delay_ms(220);
			WS2812B_set_colour_on_channel(4, 200, 0, 0);
			delay_ms(440);
			
			WS2812B_set_colour_on_channel(4, 0, 0, 0);
			delay_ms(220);
			WS2812B_set_colour_on_channel(3, 0, 0, 0);
			WS2812B_set_colour_on_channel(5, 0, 0, 0);
			delay_ms(220);
			WS2812B_set_colour_on_channel(2, 0, 0, 0);
			WS2812B_set_colour_on_channel(6, 0, 0, 0);
			delay_ms(220);
			WS2812B_set_colour_on_channel(1, 0, 0, 0);
			WS2812B_set_colour_on_channel(7, 0, 0, 0);
			delay_ms(220);
			WS2812B_set_colour_on_channel(0, 0, 0, 0);
			delay_ms(440);
		}
		
		WS2812B_reset();
		for(i = 0; i < 4; i++)
		{
			WS2812B_set_colour_on_channel(0, 0, 200, 200);
			delay_ms(220);
			WS2812B_set_colour_on_channel(0, 0, 0, 0);
			WS2812B_set_colour_on_channel(1, 0, 200, 200);
			WS2812B_set_colour_on_channel(7, 0, 200, 200);
			delay_ms(220);
			WS2812B_set_colour_on_channel(1, 0, 0, 0);
			WS2812B_set_colour_on_channel(7, 0, 0, 0);
			WS2812B_set_colour_on_channel(2, 0, 200, 200);
			WS2812B_set_colour_on_channel(6, 0, 200, 200);
			delay_ms(220);
			WS2812B_set_colour_on_channel(2, 0, 0, 0);
			WS2812B_set_colour_on_channel(6, 0, 0, 0);
			WS2812B_set_colour_on_channel(3, 0, 200, 200);
			WS2812B_set_colour_on_channel(5, 0, 200, 200);
			delay_ms(220);
			WS2812B_set_colour_on_channel(3, 0, 0, 0);
			WS2812B_set_colour_on_channel(5, 0, 0, 0);
			WS2812B_set_colour_on_channel(4, 0, 200, 200);
			delay_ms(440);
			
			WS2812B_set_colour_on_channel(4, 200, 200, 0);
			delay_ms(220);
			WS2812B_set_colour_on_channel(4,0, 0, 0);
			WS2812B_set_colour_on_channel(3, 200, 200, 0);
			WS2812B_set_colour_on_channel(5, 200, 200, 0);
			delay_ms(220);
			WS2812B_set_colour_on_channel(3, 0, 0, 0);
			WS2812B_set_colour_on_channel(5, 0, 0, 0);
			WS2812B_set_colour_on_channel(2, 200, 200, 0);
			WS2812B_set_colour_on_channel(6, 200, 200, 0);
			delay_ms(220);
			WS2812B_set_colour_on_channel(2, 0, 0, 0);
			WS2812B_set_colour_on_channel(6, 0, 0, 0);
			WS2812B_set_colour_on_channel(1, 200, 200, 0);
			WS2812B_set_colour_on_channel(7, 200, 200, 0);
			delay_ms(220);
			WS2812B_set_colour_on_channel(1, 0, 0, 0);
			WS2812B_set_colour_on_channel(7, 0, 0, 0);
			WS2812B_set_colour_on_channel(0, 200, 200, 0);
			delay_ms(440);
			
			WS2812B_set_colour_on_channel(0, 200, 0, 200);
			delay_ms(220);
			WS2812B_set_colour_on_channel(0, 0, 0, 0);
			WS2812B_set_colour_on_channel(1, 200, 0, 200);
			WS2812B_set_colour_on_channel(7, 200, 0, 200);
			delay_ms(220);
			WS2812B_set_colour_on_channel(1, 0, 0, 0);
			WS2812B_set_colour_on_channel(7, 0, 0, 0);
			WS2812B_set_colour_on_channel(2, 200, 0, 200);
			WS2812B_set_colour_on_channel(6, 200, 0, 200);
			delay_ms(220);
			WS2812B_set_colour_on_channel(2, 0, 0, 0);
			WS2812B_set_colour_on_channel(6, 0, 0, 0);
			WS2812B_set_colour_on_channel(3, 200, 0, 200);
			WS2812B_set_colour_on_channel(5, 200, 0, 200);
			delay_ms(220);
			WS2812B_set_colour_on_channel(3, 0, 0, 0);
			WS2812B_set_colour_on_channel(5, 0, 0, 0);
			WS2812B_set_colour_on_channel(4, 200, 0, 200);
			delay_ms(440);
			
			WS2812B_set_colour_on_channel(4, 160, 160, 160);
			delay_ms(220);
			WS2812B_set_colour_on_channel(4,0, 0, 0);
			WS2812B_set_colour_on_channel(3, 160, 160, 160);
			WS2812B_set_colour_on_channel(5, 160, 160, 160);
			delay_ms(220);
			WS2812B_set_colour_on_channel(3, 0, 0, 0);
			WS2812B_set_colour_on_channel(5, 0, 0, 0);
			WS2812B_set_colour_on_channel(2, 160, 160, 160);
			WS2812B_set_colour_on_channel(6, 160, 160, 160);
			delay_ms(220);
			WS2812B_set_colour_on_channel(2, 0, 0, 0);
			WS2812B_set_colour_on_channel(6, 0, 0, 0);
			WS2812B_set_colour_on_channel(1, 160, 160, 160);
			WS2812B_set_colour_on_channel(7, 160, 160, 160);
			delay_ms(220);
			WS2812B_set_colour_on_channel(1, 0, 0, 0);
			WS2812B_set_colour_on_channel(7, 0, 0, 0);
			WS2812B_set_colour_on_channel(0, 160, 160, 160);
			delay_ms(440);
		}
		
		WS2812B_reset();
		WS2812B_set_colour_on_channel(0, 160, 0, 0);
		WS2812B_set_colour_on_channel(1, 160,160, 0);
		WS2812B_set_colour_on_channel(2, 0, 160, 160);
		WS2812B_set_colour_on_channel(3, 0, 0, 160);
		WS2812B_set_colour_on_channel(4, 160, 0, 160);
		WS2812B_set_colour_on_channel(5, 0, 160, 160);
		WS2812B_set_colour_on_channel(6, 0, 160, 0);
		WS2812B_set_colour_on_channel(7, 160, 160, 160);	
		delay_ms(6000);
	};
}


void clock_setup(void)
{
	CLK_DeInit();
	
	CLK_HSECmd(DISABLE);
	CLK_LSICmd(DISABLE);
	CLK_HSICmd(ENABLE);
	while(CLK_GetFlagStatus(CLK_FLAG_HSIRDY) == FALSE);
	
	CLK_ClockSwitchCmd(ENABLE);
	CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);
	CLK_SYSCLKConfig(CLK_PRESCALER_CPUDIV1);
	
	CLK_ClockSwitchConfig(CLK_SWITCHMODE_AUTO, CLK_SOURCE_HSI, 
	DISABLE, CLK_CURRENTCLOCKSTATE_ENABLE);
	
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_SPI, DISABLE);
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_I2C, DISABLE);
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_ADC, DISABLE);
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_AWU, DISABLE);
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_UART1, DISABLE);
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER1, DISABLE);
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER2, DISABLE);
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER4, DISABLE);
}
