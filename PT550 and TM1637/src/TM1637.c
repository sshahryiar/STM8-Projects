#include "TM1637.h"


static const unsigned char seg_data[10] =
{
    0x3F, // 0
    0x06, // 1
    0x5B, // 2
    0x4F, // 3
    0x66, // 4
    0x6D, // 5
    0x7D, // 6
    0x07, // 7
    0x7F, // 8
    0x6F  // 9
};


void TM1637_init(void)
{
  GPIO_DeInit(TM1637_PORT);
  GPIO_Init(TM1637_PORT, 
            ((GPIO_Pin_TypeDef)(TM1637_CLK_PIN | TM1637_DAT_PIN)), 
            GPIO_MODE_OUT_PP_HIGH_FAST);
  
  TM1637_send_command(TM1637_CMD_SET_DSIPLAY | TM1637_BRIGHTNESS_4 | TM1637_SET_DISPLAY_ON);
  TM1637_clear();
}


void TM1637_start(void)
{
  TM1637_CLK_HIGH;
  TM1637_DAT_HIGH;  
  delay_us(TM1637_DELAY_US);
  TM1637_DAT_LOW;
}


void TM1637_stop(void)
{
  TM1637_CLK_LOW;
  delay_us(TM1637_DELAY_US);

  TM1637_DAT_LOW;
  delay_us(TM1637_DELAY_US);

  TM1637_CLK_HIGH;
  delay_us(TM1637_DELAY_US);

  TM1637_DAT_HIGH;
}


unsigned char TM1637_write_byte(unsigned char value)
{
  unsigned char i = 0x08;
  unsigned char ack = 0x00;

  while(i)
  {
    TM1637_CLK_LOW;
    delay_us(TM1637_DELAY_US);

    if(value & 0x01)
    {
        TM1637_DAT_HIGH;
    } 

    else 
    {
        TM1637_DAT_LOW;
    }

    TM1637_CLK_HIGH;
    delay_us(TM1637_DELAY_US);

    value >>= 1;
    i--;
  };

  TM1637_CLK_LOW;
  delay_us(TM1637_DELAY_US);

  GPIO_DeInit(TM1637_PORT);
  GPIO_Init(TM1637_PORT, TM1637_CLK_PIN, GPIO_MODE_OUT_PP_HIGH_FAST);
  GPIO_Init(TM1637_PORT, TM1637_DAT_PIN, GPIO_MODE_IN_FL_NO_IT);
  
  ack = GPIO_ReadInputPin(TM1637_PORT, TM1637_DAT_PIN); 

  GPIO_DeInit(TM1637_PORT);
  GPIO_Init(TM1637_PORT, 
            ((GPIO_Pin_TypeDef)(TM1637_CLK_PIN | TM1637_DAT_PIN)), 
            GPIO_MODE_OUT_PP_HIGH_FAST);
  
  if(ack != 0)
  {
    TM1637_DAT_LOW;
  }

  delay_us(TM1637_DELAY_US);

  TM1637_CLK_HIGH;
  delay_us(TM1637_DELAY_US);

  TM1637_CLK_LOW;
  delay_us(TM1637_DELAY_US);

  return ack;
}


void TM1637_send_command(unsigned char value)
{
  TM1637_start();
  TM1637_write_byte(value);
  TM1637_stop();
}


void TM1637_clear(void)
{
  signed char i = (TM1637_POSITION_MAX - 1);

  while(i > -1)
  {
      TM1637_display_segments(i, 0x00, 0x00);
      i--;
  };
}



void TM1637_display_segments(unsigned char position, unsigned char segment_value, unsigned char colon_state)
{
  if(position == 1)
  {
    switch(colon_state)
    {
      case 1:
      {
        segment_value |= 0x80;
        break;
      }

      default:
      {
        segment_value &= 0x7F;
        break;
      }
    }
  }

  TM1637_send_command(TM1637_CMD_SET_DATA | TM1637_SET_DATA_F_ADDR);
  TM1637_start();
  TM1637_write_byte(TM1637_CMD_SET_ADDR | (position & (TM1637_POSITION_MAX - 1)));
  TM1637_write_byte(segment_value);
  TM1637_stop();
}


void TM1637_display_number(unsigned char position, unsigned char value, unsigned char colon_state)
{
  TM1637_display_segments(position, seg_data[value], colon_state);
}
