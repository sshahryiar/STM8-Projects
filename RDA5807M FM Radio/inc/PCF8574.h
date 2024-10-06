#include "stm8s.h" 
#include "I2C.h"


#define PCF8574_address             0x4E


uint8_t PCF8574_read(void);
void PCF8574_write(uint8_t data_byte);
