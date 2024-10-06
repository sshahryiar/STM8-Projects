#include "STM8S.h"
#include "I2C.h"


#define RDA5807_I2C_Address         0x22   


#define RDA5807_REG_00H		0x00 
#define RDA5807_REG_02H		0x02  
#define RDA5807_REG_03H		0x03  
#define RDA5807_REG_04H		0x04  
#define RDA5807_REG_05H		0x05  
#define RDA5807_REG_06H		0x06  
#define RDA5807_REG_07H		0x07  
#define RDA5807_REG_0AH		0x0A  
#define RDA5807_REG_0BH		0x0B 
#define RDA5807_REG_0CH		0x0C  
#define RDA5807_REG_0DH		0x0D 
#define RDA5807_REG_0EH		0x0E  
#define RDA5807_REG_0FH		0x0F 

#define SPEAKER_PIN                 GPIO_PIN_0
#define SPEAKER_PORT                GPIOC


extern uint8_t Volume;
extern uint8_t RDA_State;
extern uint16_t Frequency;


void RDA5807_init(void);	
uint16_t RDA5807_read_reg(uint8_t address);
void RDA5807_write_reg(uint8_t address, uint16_t value);
uint16_t RDA5807_get_signal_strength(void);
void RDA5807_seek_direction(uint8_t direction);
uint16_t RDA5807_search_frequency(void);
void RDA5807_set_frequency(uint16_t frequency);
void RDA5807_set_volume(uint8_t value);
void RDA5807_enable(void);
 
      

