#include "WS2812B.h"


unsigned char LED_colours[number_of_LEDs][3];


void WS2812B_init(void)
{
   	GPIO_DeInit(GPIOC);
    GPIO_Init(GPIOC, GPIO_PIN_6, GPIO_MODE_OUT_PP_HIGH_FAST);
	GPIO_WriteLow(GPIOC, GPIO_PIN_6);
}


void WS2812B_high(void)
{
	SetBit(GPIOC->ODR, 6);
	_asm("nop");
	_asm("nop");
	_asm("nop");
	_asm("nop");
	_asm("nop");
	_asm("nop");
	_asm("nop");
	_asm("nop");
	_asm("nop");
	_asm("nop");
	_asm("nop");
	ClrBit(GPIOC->ODR, 6);
	_asm("nop");
	_asm("nop");
	_asm("nop");
}


void WS2812B_low(void)
{
	SetBit(GPIOC->ODR, 6);
	_asm("nop");
	_asm("nop");
	_asm("nop");
	
	ClrBit(GPIOC->ODR, 6);
	_asm("nop");
	_asm("nop");
	_asm("nop");
	_asm("nop");
	_asm("nop");
	_asm("nop");
	_asm("nop");
	_asm("nop");
	_asm("nop");
	_asm("nop");
	_asm("nop");
}


void WS2812B_update(void)
{
	delay_us(60);
}


void WS2812B_reset(void)
{
    unsigned char i = 0;
	unsigned char j = 0;
	
	for(i = 0; i < number_of_LEDs; i++)
    {
		for(j = 0; j < 3; j++)
		{
			LED_colours[i][j] = 0x00; 
		}
	}
	
	WS2812B_set_common_colour_on_all_LEDs(0, 0, 0);
}


void WS2812B_set_common_colour_on_all_LEDs(unsigned char r, unsigned char g, unsigned char b)
{
    unsigned char n = 0;

    for(n = 0; n < number_of_LEDs; n++)
    {
        LED_colours[n][0] = r;
        LED_colours[n][1] = g;
        LED_colours[n][2] = b;
		
        WS2812B_send_data(LED_colours[n][0], LED_colours[n][1], LED_colours[n][2]);
    }

    WS2812B_update();
}


void WS2812B_set_colour_on_channel(unsigned char channel, unsigned char r, unsigned char g, unsigned char b)
{
    unsigned char n = 0;

    LED_colours[channel][0] = r;
    LED_colours[channel][1] = g;
    LED_colours[channel][2] = b;
    
    for(n = 0; n < number_of_LEDs; n++)
    {
        WS2812B_send_data(LED_colours[n][0], LED_colours[n][1], LED_colours[n][2]);
    }

    WS2812B_update();
}


void WS2812B_send_data(unsigned char r, unsigned char g, unsigned char b)
{
    unsigned char s = number_of_bits;
    unsigned long temp = 0;
	
	temp = (((unsigned long)g << 16) | ((unsigned long)r << 8) | ((unsigned long)b));

    while(s > 0)
    {
       if((temp & 0x800000) == 0)
       {
			WS2812B_low();
       }
	   
	   else
       {
		   WS2812B_high();
       }
	   
       temp <<= 1;
	   s--;
    }
}