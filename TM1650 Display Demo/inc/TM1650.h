#include "STM8S.h"


#define I2C_PORT								 	GPIOE

#define SCL_pin									  GPIO_PIN_1
#define SDA_pin                   GPIO_PIN_2

#define TM1650_CONTROL_MODE				0x48	
#define TM1650_READ_KEY_MODE			0x49

#define TM1650_SEG1								0x68
#define TM1650_SEG2								0x6A
#define TM1650_SEG3								0x6C
#define TM1650_SEG4								0x6E

#define TM1650_NUM_DIGITS					4	

#define TM1650_BRIGHTNESS_1				0x9F
#define TM1650_BRIGHTNESS_2				0xAF
#define TM1650_BRIGHTNESS_3				0xBF
#define TM1650_BRIGHTNESS_4				0xCF
#define TM1650_BRIGHTNESS_5				0xDF
#define TM1650_BRIGHTNESS_6				0xEF
#define TM1650_BRIGHTNESS_7				0xFF
#define TM1650_BRIGHTNESS_8				0x8F

#define TM1650_TURN_ON_DISPLAY		0x01
#define TM1650_TURN_OFF_DISPLAY		0xFE

#define TM1650_COLON_ON						0x08
#define TM1650_COLON_OFF					0xF7

#define DIG1_A_KI1								0x44
#define DIG2_A_KI1								0x45
#define DIG3_A_KI1								0x46
#define DIG4_A_KI1								0x47
#define DIG1_B_KI2								0x4C
#define DIG2_B_KI2								0x4D
#define DIG3_B_KI2								0x4E
#define DIG4_B_KI2								0x4F
#define DIG1_C_KI3								0x54
#define DIG2_C_KI3								0x55
#define DIG3_C_KI3								0x56
#define DIG4_C_KI3								0x57
#define DIG1_D_KI4								0x5C
#define DIG2_D_KI4								0x5D
#define DIG3_D_KI4								0x5E
#define DIG4_D_KI4								0x5F
#define DIG1_E_KI5								0x64
#define DIG2_E_KI5								0x65
#define DIG3_E_KI5								0x66
#define DIG4_E_KI5								0x67
#define DIG1_F_KI6								0x6C
#define DIG2_F_KI6								0x6D
#define DIG3_F_KI6								0x6E
#define DIG4_F_KI6								0x6F
#define DIG1_G_KI7								0x74
#define DIG2_G_KI7								0x75
#define DIG3_G_KI7								0x76
#define DIG4_G_KI7								0x77


void setup_I2C_GPIO(void);
void setup_I2C(void);
void TM1650_init(void);
unsigned char TM1650_read(unsigned char address);
void TM1650_write(unsigned char address, unsigned char value);
void TM1650_display_I(signed int value);
void TM1650_display_F(float fvalue);
unsigned char TM1650_read_keys(void);