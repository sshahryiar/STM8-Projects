#include "STM8S.h"


#define TM1637_PORT                 GPIOA

#define TM1637_CLK_PIN              GPIO_PIN_1
#define TM1637_DAT_PIN              GPIO_PIN_2

#define TM1637_CLK_HIGH             GPIO_WriteHigh(TM1637_PORT, TM1637_CLK_PIN)
#define TM1637_CLK_LOW              GPIO_WriteLow(TM1637_PORT, TM1637_CLK_PIN)

#define TM1637_DAT_HIGH             GPIO_WriteHigh(TM1637_PORT, TM1637_DAT_PIN)
#define TM1637_DAT_LOW              GPIO_WriteLow(TM1637_PORT, TM1637_DAT_PIN)

#define	TM1637_DELAY_US		    4

#define TM1637_BRIGHTNESS_MIN       0
#define TM1637_BRIGHTNESS_1         1
#define TM1637_BRIGHTNESS_2         2
#define TM1637_BRIGHTNESS_3         3
#define TM1637_BRIGHTNESS_4         4
#define TM1637_BRIGHTNESS_5         5
#define TM1637_BRIGHTNESS_6         6
#define	TM1637_BRIGHTNESS_MAX	    7

#define	TM1637_POSITION_MAX	    4

#define	TM1637_CMD_SET_DATA         0x40
#define	TM1637_CMD_SET_ADDR	    0xC0
#define	TM1637_CMD_SET_DSIPLAY	    0x80

#define	TM1637_SET_DATA_WRITE	    0x00
#define	TM1637_SET_DATA_READ	    0x02
#define	TM1637_SET_DATA_A_ADDR	    0x00
#define	TM1637_SET_DATA_F_ADDR	    0x04
#define	TM1637_SET_DATA_M_NORM	    0x00
#define	TM1637_SET_DATA_M_TEST	    0x10
#define	TM1637_SET_DISPLAY_OFF	    0x00 
#define	TM1637_SET_DISPLAY_ON	    0x08 


void TM1637_init(void);
void TM1637_start(void);
void TM1637_stop(void);
unsigned char TM1637_write_byte(unsigned char value);
void TM1637_send_command(unsigned char value);
void TM1637_clear(void);
void TM1637_display_segments(unsigned char position, unsigned char segment_value, unsigned char colon_state);
void TM1637_display_number(unsigned char position, unsigned char value, unsigned char colon_state);

