#include "stm8s_delay.h"


void delay_us(uint16_t value)
{
  uint16_t loops = ((uint16_t)(dly_const * value));

  while(loops)
  {
    asm ("nop");
    loops--;
  };
}


void delay_ms(uint16_t value)
{
  while(value--)
  {
    delay_us(1000);
  };
}