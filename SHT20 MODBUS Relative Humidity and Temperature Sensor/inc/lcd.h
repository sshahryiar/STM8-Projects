#include "stm8s.h" 



#define LCD_CONTROL_PORT			GPIOG

#define LCD_RS  				GPIO_PIN_2     
#define LCD_RW  				GPIO_PIN_3  
#define LCD_EN  				GPIO_PIN_5   

#define LCD_DATA_PORT			GPIOI

#define LCD_DB0 				GPIO_PIN_0       
#define LCD_DB1 				GPIO_PIN_1
#define LCD_DB2 				GPIO_PIN_2 
#define LCD_DB3 				GPIO_PIN_3 
#define LCD_DB4 				GPIO_PIN_4       
#define LCD_DB5 				GPIO_PIN_5
#define LCD_DB6 				GPIO_PIN_6 
#define LCD_DB7 				GPIO_PIN_7 

#define clear_display			0x01                
#define goto_home				0x02
         
#define cursor_direction_inc		(0x04 | 0x02)    
#define cursor_direction_dec		(0x04 | 0x00)
#define display_shift			(0x04 | 0x01) 
#define display_no_shift	    		(0x04 | 0x00)

#define display_on			(0x08 | 0x04)
#define display_off             		(0x08 | 0x02) 
#define cursor_on				(0x08 | 0x02)       
#define cursor_off              		(0x08 | 0x00)   
#define blink_on                		(0x08 | 0x01)   
#define blink_off               		(0x08 | 0x00)   
                                    
#define _8_pin_interface			(0x20 | 0x10)   
#define _4_pin_interface			(0x20 | 0x00)      
#define _2_row_display			(0x20 | 0x08) 
#define _1_row_display			(0x20 | 0x00)
#define _5x10_dots			(0x20 | 0x40)      
#define _5x7_dots				(0x20 | 0x00)

#define line_1_y_pos                         0x00
#define line_2_y_pos                         0x40 
#define line_3_y_pos                         0x14
#define line_4_y_pos                         0x54

#define DAT				TRUE
#define CMD				FALSE


void LCD_GPIO_init(void);
void LCD_init(void);  
void LCD_send(uint8_t value, uint8_t mode);
void LCD_4bit_send(uint8_t lcd_data);              
void LCD_putstr(char *lcd_string);               
void LCD_putchar(char char_data);             
void LCD_clear_home(void);            
void LCD_goto(uint8_t x_pos, uint8_t y_pos);
void toggle_EN_pin(void);
