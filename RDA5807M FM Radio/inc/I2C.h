#include "STM8S.h"


#define I2C_SCL_PIN        GPIO_PIN_1 
#define I2C_SDA_PIN        GPIO_PIN_2  

#define I2C_PORT           GPIOE  


void I2C_setup(void);
uint16_t I2C_read(uint8_t address, uint8_t bytes_to_read);
void I2C_write(uint8_t address, uint8_t *value, uint8_t bytes_to_write);
