#include "lcd.h"


void LCD_GPIO_init(void)
{
  GPIO_Init(LCD_CONTROL_PORT, LCD_RS, GPIO_MODE_OUT_PP_HIGH_FAST);
  GPIO_Init(LCD_CONTROL_PORT, LCD_RW, GPIO_MODE_OUT_PP_HIGH_FAST);
  GPIO_Init(LCD_CONTROL_PORT, LCD_EN, GPIO_MODE_OUT_PP_HIGH_FAST);
  
  GPIO_Init(LCD_DATA_PORT, LCD_DB4, GPIO_MODE_OUT_PP_HIGH_FAST);
  GPIO_Init(LCD_DATA_PORT, LCD_DB5, GPIO_MODE_OUT_PP_HIGH_FAST);
  GPIO_Init(LCD_DATA_PORT, LCD_DB6, GPIO_MODE_OUT_PP_HIGH_FAST);
  GPIO_Init(LCD_DATA_PORT, LCD_DB7, GPIO_MODE_OUT_PP_HIGH_FAST);
  delay_ms(10);  

  GPIO_WriteLow(LCD_CONTROL_PORT, LCD_RW);
  GPIO_WriteLow(LCD_DATA_PORT, LCD_DB0);  
  GPIO_WriteLow(LCD_DATA_PORT, LCD_DB1); 
  GPIO_WriteLow(LCD_DATA_PORT, LCD_DB2); 
  GPIO_WriteLow(LCD_DATA_PORT, LCD_DB3); 
}


void LCD_init(void)
{                                     
  LCD_GPIO_init(); 
  toggle_EN_pin();
          
  LCD_send(0x33, CMD);
  LCD_send(0x32, CMD);

  LCD_send((_4_pin_interface | _2_row_display | _5x7_dots), CMD);
  LCD_send((display_on | cursor_off | blink_off), CMD); 
  LCD_send(clear_display, CMD);         
  LCD_send((cursor_direction_inc | display_no_shift), CMD);
  LCD_clear_home();
}   


void LCD_send(uint8_t value, uint8_t mode)
{                               
  switch(mode)
  {
    case DAT:
    {
      GPIO_WriteHigh(LCD_CONTROL_PORT, LCD_RS);   
      break;
    }
    case CMD:
    {
      GPIO_WriteLow(LCD_CONTROL_PORT, LCD_RS);   
      break;
    }
  }
      
  LCD_4bit_send(value);
}  
    

void LCD_4bit_send(uint8_t lcd_data)       
{
  GPIO_Write(LCD_DATA_PORT, (lcd_data & 0xF0));
  toggle_EN_pin();
  GPIO_Write(LCD_DATA_PORT, ((lcd_data & 0x0F) << 0x04));
  toggle_EN_pin();
}  


void LCD_putstr(char *lcd_string)
{
  do
  {
      LCD_send(*lcd_string++, DAT);
  }while(*lcd_string != '\0');
}


void LCD_putchar(char char_data)
{
  LCD_send(char_data, DAT);
}


void LCD_clear_home(void)
{
  LCD_send(clear_display, CMD);
  LCD_send(goto_home, CMD);
}


void LCD_goto(uint8_t x_pos, uint8_t y_pos)
{                                                   
  switch(y_pos)
  {
     case 1:
     {      
       LCD_send((0x80 | (line_2_y_pos + x_pos)), CMD);      
       break;
     }      
     
     case 2:
     {      
       LCD_send((0x80 | (line_3_y_pos + x_pos)), CMD);      
       break;
     }    
     
     case 3:                                    
     {                 
       LCD_send((0x80 | (line_4_y_pos + x_pos)), CMD);      
       break;
     }                      
     
     default:                                  
     {                  
       LCD_send((0x80 | (line_1_y_pos + x_pos)), CMD);      
       break;
     }                 
  }
}


void toggle_EN_pin(void)
{
  GPIO_WriteHigh(LCD_CONTROL_PORT, LCD_EN);    
  delay_ms(2);
  GPIO_WriteLow(LCD_CONTROL_PORT, LCD_EN);   
}
