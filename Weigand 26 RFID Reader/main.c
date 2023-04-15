#include "stm8s.h"


unsigned char count;
unsigned long card_raw ;


void GPIO_setup(void);
void EXTI_setup(void);
void clock_setup(void);
void print_C(unsigned char x_pos, unsigned char y_pos, unsigned int value);
void print_I(unsigned char x_pos, unsigned char y_pos, unsigned long value);


void main(void)
{
	unsigned char facility_code = 120;
	unsigned int card_number = 12340;
	
	count =60;
	card_raw = 0;
	
	GPIO_setup();
	EXTI_setup();
	clock_setup();
	
	LCD_init();  
	LCD_clear_home(); 
	
	LCD_goto(0, 0);
	LCD_putstr("Facility:");

	LCD_goto(0, 1);
	LCD_putstr("Card I.D:");

	while (TRUE)
	{
		if(count >= 25)
		{
			card_number = (card_raw & 0xFFFF);
			facility_code = (0xFF & (card_raw >> 16));
			print_C(13, 0, facility_code);
			print_I(11, 1, card_number);
			card_raw = 0;
			count = 0;
		}
	};
}


void GPIO_setup(void)
{
	GPIO_DeInit(GPIOB);    
	GPIO_Init(GPIOB, GPIO_PIN_0, GPIO_MODE_IN_PU_IT);
	GPIO_Init(GPIOB, GPIO_PIN_1, GPIO_MODE_IN_PU_IT);
}


void EXTI_setup(void)
{
	ITC_DeInit();
	ITC_SetSoftwarePriority(ITC_IRQ_PORTB, ITC_PRIORITYLEVEL_0);
	
	EXTI_DeInit();
	EXTI_SetExtIntSensitivity(EXTI_PORT_GPIOB, EXTI_SENSITIVITY_FALL_ONLY);
	EXTI_SetTLISensitivity(EXTI_TLISENSITIVITY_FALL_ONLY);
	
	enableInterrupts();
}


void clock_setup(void)
{
	CLK_DeInit();
	
	CLK_HSECmd(DISABLE);
	CLK_LSICmd(DISABLE);
	CLK_HSICmd(ENABLE);
	while(CLK_GetFlagStatus(CLK_FLAG_HSIRDY) == FALSE);
	
	CLK_ClockSwitchCmd(ENABLE);
	CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV4);
	CLK_SYSCLKConfig(CLK_PRESCALER_CPUDIV1);
	
	CLK_ClockSwitchConfig(CLK_SWITCHMODE_AUTO, CLK_SOURCE_HSI, 
	DISABLE, CLK_CURRENTCLOCKSTATE_ENABLE);
	
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_SPI, DISABLE);
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_I2C, DISABLE);
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_ADC, DISABLE);
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_AWU, DISABLE);
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_UART1, DISABLE);
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER1, DISABLE);
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER2, DISABLE);
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER4, DISABLE);
}


void print_C(unsigned char x_pos, unsigned char y_pos, unsigned int value)
{
     unsigned char ch = 0;

     if((value > 99) && (value <= 999))
     {
        ch = ((value / 100) + 0x30);
		LCD_goto(x_pos, y_pos);
		LCD_putchar(ch);
		 
        ch = (((value % 100) / 10) + 0x30);
		LCD_goto((x_pos + 1), y_pos);
		LCD_putchar(ch);
		 
        ch = ((value % 10) + 0x30);
		LCD_goto((x_pos + 2), y_pos);
		LCD_putchar(ch);
     }
     else if((value > 9) && (value <= 99))
     {
        ch = 0x20;
		LCD_goto(x_pos, y_pos);
		LCD_putchar(ch);
	   
	    ch = (((value % 100) / 10) + 0x30);
		LCD_goto((x_pos + 1), y_pos);
        LCD_putchar(ch);
		
		ch = ((value % 10) + 0x30);
        LCD_goto((x_pos + 2), y_pos);
		LCD_putchar(ch);
     }
     else if((value >= 0) && (value <= 9))
     {
        ch = 0x20;
		LCD_goto(x_pos , y_pos);
		LCD_putchar(ch);
         
		ch = 0x20;
		LCD_goto((x_pos + 1), y_pos);
		LCD_putchar(ch);
		
		ch = ((value % 10) + 0x30);
		LCD_goto((x_pos + 2), y_pos);
        LCD_putchar(ch);
     }
}


void print_I(unsigned char x_pos, unsigned char y_pos, unsigned long value)
{
    unsigned char ch = 0;

    if(value > 9999)
    {
        ch = ((value / 10000) + 0x30);
		LCD_goto(x_pos, y_pos);
        LCD_putchar(ch);
		
		ch = (((value % 10000)/ 1000) + 0x30);
		LCD_goto((x_pos + 1), y_pos);
        LCD_putchar(ch);
		
		ch = (((value % 1000) / 100) + 0x30);
        LCD_goto((x_pos + 2), y_pos);
		LCD_putchar(ch);
		
		ch = (((value % 100) / 10) + 0x30);
        LCD_goto((x_pos + 3), y_pos);
		LCD_putchar(ch);
		
		ch = ((value % 10) + 0x30);
		LCD_goto((x_pos + 4), y_pos);
		LCD_putchar(ch);
    }

    else if((value > 999) && (value <= 9999))
    {
        ch = 0x20;
		LCD_goto(x_pos, y_pos);
		LCD_putchar(ch);
		
		ch = (((value % 10000)/ 1000) + 0x30);
		LCD_goto((x_pos + 1), y_pos);
		LCD_putchar(ch);
		
        ch = (((value % 1000) / 100) + 0x30);
		LCD_goto((x_pos + 2), y_pos);
		LCD_putchar(ch);
		
        ch = (((value % 100) / 10) + 0x30);
		LCD_goto((x_pos + 3), y_pos);
		LCD_putchar(ch);
		
        ch = ((value % 10) + 0x30);
		LCD_goto((x_pos + 4), y_pos);
		LCD_putchar(ch);
    }
    else if((value > 99) && (value <= 999))
    {
        
        ch = 0x20;
		LCD_goto(x_pos, y_pos);
		LCD_putchar(ch);
		
        ch = 0x20;
		LCD_goto((x_pos + 1), y_pos);
		LCD_putchar(ch);
		
		ch = (((value % 1000) / 100) + 0x30);
		LCD_goto((x_pos + 2), y_pos);
		LCD_putchar(ch);
		
        ch = (((value % 100) / 10) + 0x30);
		LCD_goto((x_pos + 3), y_pos);
		LCD_putchar(ch);
		
        ch = ((value % 10) + 0x30);
		LCD_goto((x_pos + 4), y_pos);
		LCD_putchar(ch);
    }
    else if((value > 9) && (value <= 99))
    {
        ch = 0x20;
		LCD_goto(x_pos, y_pos);
		LCD_putchar(ch);
		
        ch = 0x20;
		LCD_goto((x_pos + 1), y_pos);
		LCD_putchar(ch);
		
        ch = 0x20;
		LCD_goto((x_pos + 2), y_pos);
		LCD_putchar(ch);		
		
		ch = (((value % 100) / 10) + 0x30);
		LCD_goto((x_pos  + 3), y_pos);
		LCD_putchar(ch);
		
        ch = ((value % 10) + 0x30);
		LCD_goto((x_pos + 4), y_pos);
		LCD_putchar(ch);
    }
    else
    {
		ch = 0x20;
		LCD_goto(x_pos, y_pos);
		LCD_putchar(ch);
       
	    ch = 0x20;
		LCD_goto((x_pos + 1), y_pos);
		LCD_putchar(ch);
       
	    ch = 0x20;
		LCD_goto((x_pos + 2), y_pos);
		LCD_putchar(ch);
        
		ch = 0x20;
		LCD_goto((x_pos + 3), y_pos);
		LCD_putchar(ch);
		
        ch = ((value % 10) + 0x30);
		LCD_goto((x_pos + 4), y_pos);
		LCD_putchar(ch);
    }
}

