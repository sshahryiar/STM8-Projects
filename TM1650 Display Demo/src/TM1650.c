#include "TM1650.h"


static const unsigned char segment_code[11] =
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
	0x40	//-
};


void setup_I2C_GPIO(void)
{
	GPIO_DeInit(I2C_PORT);
	GPIO_Init(I2C_PORT, SCL_pin, GPIO_MODE_OUT_OD_HIZ_FAST);
	GPIO_Init(I2C_PORT, SDA_pin, GPIO_MODE_OUT_OD_HIZ_FAST);
	
  setup_I2C();
}


void setup_I2C(void)
{
	I2C_DeInit();
	I2C_Init(100000, 
				  TM1650_CONTROL_MODE, 
				  I2C_DUTYCYCLE_2, 
				  I2C_ACK_CURR, 
				  I2C_ADDMODE_7BIT, 
				  (CLK_GetClockFreq() / 1000000));
	I2C_Cmd(ENABLE);	
}


void TM1650_init(void)
{
	setup_I2C_GPIO();
	TM1650_write(TM1650_CONTROL_MODE, (TM1650_COLON_OFF &(TM1650_TURN_ON_DISPLAY | TM1650_BRIGHTNESS_6)));
	
	TM1650_write(TM1650_SEG1, 0x00);
	TM1650_write(TM1650_SEG2, 0x00);
	TM1650_write(TM1650_SEG3, 0x00);
	TM1650_write(TM1650_SEG4, 0x00);
}



unsigned char TM1650_read(unsigned char address)
{
   unsigned char value = 0x00;
   unsigned char num_of_bytes = 0x01; 

   I2C_GenerateSTART(ENABLE);
   while(!I2C_CheckEvent(I2C_EVENT_MASTER_MODE_SELECT));

   I2C_Send7bitAddress(address, I2C_DIRECTION_RX);
   while(!I2C_CheckEvent(I2C_EVENT_MASTER_RECEIVER_MODE_SELECTED));

   while(num_of_bytes)
   {
		if(I2C_CheckEvent(I2C_EVENT_MASTER_BYTE_RECEIVED))
		{   
			if(num_of_bytes == 0)
			{
				I2C_AcknowledgeConfig(I2C_ACK_NONE);
				I2C_GenerateSTOP(ENABLE);   
			}
			
			value = I2C_ReceiveData();
		
			num_of_bytes--;
		}
   };    
   
   
   return value;
}


void TM1650_write(unsigned char address, unsigned char value)
{
   I2C_GenerateSTART(ENABLE);
   while(!I2C_CheckEvent(I2C_EVENT_MASTER_MODE_SELECT));
   
   I2C_Send7bitAddress(address, I2C_DIRECTION_TX); 
   while(!I2C_CheckEvent(I2C_EVENT_MASTER_TRANSMITTER_MODE_SELECTED));
   
   I2C_SendData(value);
   while(!I2C_CheckEvent(I2C_EVENT_MASTER_BYTE_TRANSMITTED));
   
   I2C_GenerateSTOP(ENABLE);  	
}


void TM1650_display_I(signed int value)
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
	signed long value = 0;
	
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
	
	value = (fvalue * 10);
	
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


unsigned char TM1650_read_keys(void)
{
	return (TM1650_read(TM1650_READ_KEY_MODE));
}