#include "PCF8574.h"


uint8_t PCF8574_read(void)
{
    uint8_t value = 0;
    
    value = (uint8_t)I2C_read(PCF8574_address, 1);
    
    return value;
}


void PCF8574_write(uint8_t value)
{
    uint8_t temp[1];
    
    temp[0] = value;
        
    I2C_write(PCF8574_address, temp, 1);
}
