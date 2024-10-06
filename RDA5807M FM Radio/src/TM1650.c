#include "TM1650.h"


static const uint8_t segment_code[11] =
{
    0x3F,	//0
    0x06,	//1
    0x5B,	//2
    0x4F,	//3	
    0x66,	//4
    0x6D,	//5
    0x7D,	//6
    0x07,	//7
    0x7F,	//8
    0x6F,	//9
    0x40	         //-
};


void TM1650_init(void)
{
    TM1650_write(TM1650_CONTROL_MODE, 
                 (TM1650_COLON_OFF & (TM1650_TURN_ON_DISPLAY | TM1650_BRIGHTNESS_4)));

    TM1650_write(TM1650_SEG1, 0x00);
    TM1650_write(TM1650_SEG2, 0x00);
    TM1650_write(TM1650_SEG3, 0x00);
    TM1650_write(TM1650_SEG4, 0x00);
}


void TM1650_write(uint8_t address, uint8_t value)
{
    uint8_t temp[1] = value;
    /*
    SW_I2C_start();
    SW_I2C_write(address);
    SW_I2C_wait_ACK();
    SW_I2C_write(value);
    SW_I2C_wait_ACK();
    SW_I2C_stop();
    */
  
    I2C_write(address, temp, 1);
}


uint8_t TM1650_read(uint8_t address)
{
    uint8_t value = 0;
    /*
    SW_I2C_start();
    SW_I2C_write(address);
    SW_I2C_wait_ACK();
    value = SW_I2C_read(I2C_NACK);
    SW_I2C_stop();
    */
    
    value = I2C_read(address, 1);
    
    return value;
}


void TM1650_display_I(int16_t value)
{
    if(value < 0)
    {
      TM1650_write(TM1650_SEG1, segment_code[10]);
      value = -value;
    }
    else
    {
      TM1650_write(TM1650_SEG1, 0x00);
    }

    if((value > 99) && (value <= 999))
    {
      TM1650_write(TM1650_SEG2, segment_code[(value / 100)]);
      TM1650_write(TM1650_SEG3, segment_code[((value / 10) % 10)]);
      TM1650_write(TM1650_SEG4, segment_code[(value % 10)]);
    }

    else if((value > 9) && (value <= 99))
    {
      TM1650_write(TM1650_SEG2, 0x00);
      TM1650_write(TM1650_SEG3, segment_code[(value / 10)]);
      TM1650_write(TM1650_SEG4, segment_code[(value % 10)]);
    }

    else if((value >= 0) && (value <= 9))
    {
      TM1650_write(TM1650_SEG2, 0x00);
      TM1650_write(TM1650_SEG3, 0x00);
      TM1650_write(TM1650_SEG4, segment_code[(value % 10)]);
    }
}


void TM1650_display_F(float fvalue)
{
    int32_t value = 0;

    if(fvalue > 99.9)
    {
      fvalue = 99.9;
    }
    if(fvalue < -99.9)
    {
      fvalue = -99.9;
    }

    if(fvalue < 0)
    {
      TM1650_write(TM1650_SEG1, segment_code[10]);
      fvalue = -fvalue;
    }
    else
    {
      TM1650_write(TM1650_SEG1, 0x00);
    }

    value = ((int32_t)(fvalue * 10));

    if((value > 99) && (value <= 999))
    {
      TM1650_write(TM1650_SEG2, segment_code[(value / 100)]);
      TM1650_write(TM1650_SEG3, (segment_code[((value / 10) % 10)] | 0x80));
      TM1650_write(TM1650_SEG4, segment_code[(value % 10)]);
    }

    else if((value > 9) && (value <= 99))
    {
      TM1650_write(TM1650_SEG2, 0x00);
      TM1650_write(TM1650_SEG3, (segment_code[(value / 10)] | 0x80));
      TM1650_write(TM1650_SEG4, segment_code[(value % 10)]);
    }

    else if((value >= 0) && (value <= 9))
    {
      TM1650_write(TM1650_SEG2, 0x00);
      TM1650_write(TM1650_SEG3, (segment_code[0] | 0x80));
      TM1650_write(TM1650_SEG4, segment_code[(value % 10)]);
    }
}


uint8_t TM1650_read_keys(void)
{
    return (TM1650_read(TM1650_READ_KEY_MODE));
}