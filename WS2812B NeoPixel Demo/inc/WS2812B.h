#include "stm8s.h" 


#define number_of_LEDs                          8
#define number_of_bits                          24

#define HIGH                                    		  1
#define LOW                                               0


extern unsigned char LED_colours[number_of_LEDs][3];


void WS2812B_init(void);
void WS2812B_high(void);
void WS2812B_low(void);
void WS2812B_update(void);
void WS2812B_reset(void);
void WS2812B_set_common_colour_on_all_LEDs(unsigned char r, unsigned char g, unsigned char b);
void WS2812B_set_colour_on_channel(unsigned char channel, unsigned char r, unsigned char g, unsigned char b);
void WS2812B_send_data(unsigned char r, unsigned char g, unsigned char b);