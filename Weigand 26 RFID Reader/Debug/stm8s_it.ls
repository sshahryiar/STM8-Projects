   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.9 - 08 Feb 2017
   3                     ; Generator (Limited) V4.4.6 - 08 Feb 2017
  45                     ; 47 void EXTI1_IRQHandler(void) 
  45                     ; 48 {
  46                     	switch	.text
  47  0000               f_EXTI1_IRQHandler:
  49  0000 8a            	push	cc
  50  0001 84            	pop	a
  51  0002 a4bf          	and	a,#191
  52  0004 88            	push	a
  53  0005 86            	pop	cc
  54  0006 3b0002        	push	c_x+2
  55  0009 be00          	ldw	x,c_x
  56  000b 89            	pushw	x
  57  000c 3b0002        	push	c_y+2
  58  000f be00          	ldw	x,c_y
  59  0011 89            	pushw	x
  62                     ; 49     card_raw <<= 1;
  64  0012 3803          	sll	_card_raw+3
  65  0014 3902          	rlc	_card_raw+2
  66  0016 3901          	rlc	_card_raw+1
  67  0018 3900          	rlc	_card_raw
  68                     ; 55 	if(GPIO_ReadInputPin(RFID_PORT, D1) == LOW)
  70  001a 4b02          	push	#2
  71  001c ae5005        	ldw	x,#20485
  72  001f cd0000        	call	_GPIO_ReadInputPin
  74  0022 5b01          	addw	sp,#1
  75  0024 4d            	tnz	a
  76  0025 2604          	jrne	L12
  77                     ; 57 		card_raw |= 1;
  79  0027 72100003      	bset	_card_raw+3,#0
  80  002b               L12:
  81                     ; 60 	count++;
  83  002b 3c00          	inc	_count
  84                     ; 61 }
  87  002d 85            	popw	x
  88  002e bf00          	ldw	c_y,x
  89  0030 320002        	pop	c_y+2
  90  0033 85            	popw	x
  91  0034 bf00          	ldw	c_x,x
  92  0036 320002        	pop	c_x+2
  93  0039 80            	iret
 116                     ; 83 INTERRUPT_HANDLER(NonHandledInterrupt, 25)
 116                     ; 84 {
 117                     	switch	.text
 118  003a               f_NonHandledInterrupt:
 122                     ; 88 }
 125  003a 80            	iret
 147                     ; 96 INTERRUPT_HANDLER_TRAP(TRAP_IRQHandler)
 147                     ; 97 {
 148                     	switch	.text
 149  003b               f_TRAP_IRQHandler:
 153                     ; 101 }
 156  003b 80            	iret
 178                     ; 108 INTERRUPT_HANDLER(TLI_IRQHandler, 0)
 178                     ; 109 
 178                     ; 110 {
 179                     	switch	.text
 180  003c               f_TLI_IRQHandler:
 184                     ; 114 }
 187  003c 80            	iret
 209                     ; 121 INTERRUPT_HANDLER(AWU_IRQHandler, 1)
 209                     ; 122 {
 210                     	switch	.text
 211  003d               f_AWU_IRQHandler:
 215                     ; 126 }
 218  003d 80            	iret
 240                     ; 133 INTERRUPT_HANDLER(CLK_IRQHandler, 2)
 240                     ; 134 {
 241                     	switch	.text
 242  003e               f_CLK_IRQHandler:
 246                     ; 138 }
 249  003e 80            	iret
 272                     ; 145 INTERRUPT_HANDLER(EXTI_PORTA_IRQHandler, 3)
 272                     ; 146 {
 273                     	switch	.text
 274  003f               f_EXTI_PORTA_IRQHandler:
 278                     ; 150 }
 281  003f 80            	iret
 304                     ; 157 INTERRUPT_HANDLER(EXTI_PORTB_IRQHandler, 4)
 304                     ; 158 {
 305                     	switch	.text
 306  0040               f_EXTI_PORTB_IRQHandler:
 310                     ; 162 }
 313  0040 80            	iret
 336                     ; 169 INTERRUPT_HANDLER(EXTI_PORTC_IRQHandler, 5)
 336                     ; 170 {
 337                     	switch	.text
 338  0041               f_EXTI_PORTC_IRQHandler:
 342                     ; 174 }
 345  0041 80            	iret
 368                     ; 181 INTERRUPT_HANDLER(EXTI_PORTD_IRQHandler, 6)
 368                     ; 182 {
 369                     	switch	.text
 370  0042               f_EXTI_PORTD_IRQHandler:
 374                     ; 186 }
 377  0042 80            	iret
 400                     ; 193 INTERRUPT_HANDLER(EXTI_PORTE_IRQHandler, 7)
 400                     ; 194 {
 401                     	switch	.text
 402  0043               f_EXTI_PORTE_IRQHandler:
 406                     ; 198 }
 409  0043 80            	iret
 431                     ; 245 INTERRUPT_HANDLER(SPI_IRQHandler, 10)
 431                     ; 246 {
 432                     	switch	.text
 433  0044               f_SPI_IRQHandler:
 437                     ; 250 }
 440  0044 80            	iret
 463                     ; 257 INTERRUPT_HANDLER(TIM1_UPD_OVF_TRG_BRK_IRQHandler, 11)
 463                     ; 258 {
 464                     	switch	.text
 465  0045               f_TIM1_UPD_OVF_TRG_BRK_IRQHandler:
 469                     ; 262 }
 472  0045 80            	iret
 495                     ; 269 INTERRUPT_HANDLER(TIM1_CAP_COM_IRQHandler, 12)
 495                     ; 270 {
 496                     	switch	.text
 497  0046               f_TIM1_CAP_COM_IRQHandler:
 501                     ; 274 }
 504  0046 80            	iret
 527                     ; 307  INTERRUPT_HANDLER(TIM2_UPD_OVF_BRK_IRQHandler, 13)
 527                     ; 308  {
 528                     	switch	.text
 529  0047               f_TIM2_UPD_OVF_BRK_IRQHandler:
 533                     ; 312  }
 536  0047 80            	iret
 559                     ; 319  INTERRUPT_HANDLER(TIM2_CAP_COM_IRQHandler, 14)
 559                     ; 320  {
 560                     	switch	.text
 561  0048               f_TIM2_CAP_COM_IRQHandler:
 565                     ; 324  }
 568  0048 80            	iret
 591                     ; 361  INTERRUPT_HANDLER(UART1_TX_IRQHandler, 17)
 591                     ; 362  {
 592                     	switch	.text
 593  0049               f_UART1_TX_IRQHandler:
 597                     ; 366  }
 600  0049 80            	iret
 623                     ; 373  INTERRUPT_HANDLER(UART1_RX_IRQHandler, 18)
 623                     ; 374  {
 624                     	switch	.text
 625  004a               f_UART1_RX_IRQHandler:
 629                     ; 378  }
 632  004a 80            	iret
 654                     ; 412 INTERRUPT_HANDLER(I2C_IRQHandler, 19)
 654                     ; 413 {
 655                     	switch	.text
 656  004b               f_I2C_IRQHandler:
 660                     ; 417 }
 663  004b 80            	iret
 685                     ; 491  INTERRUPT_HANDLER(ADC1_IRQHandler, 22)
 685                     ; 492  {
 686                     	switch	.text
 687  004c               f_ADC1_IRQHandler:
 691                     ; 496  }
 694  004c 80            	iret
 717                     ; 517  INTERRUPT_HANDLER(TIM4_UPD_OVF_IRQHandler, 23)
 717                     ; 518  {
 718                     	switch	.text
 719  004d               f_TIM4_UPD_OVF_IRQHandler:
 723                     ; 522  }
 726  004d 80            	iret
 749                     ; 530 INTERRUPT_HANDLER(EEPROM_EEC_IRQHandler, 24)
 749                     ; 531 {
 750                     	switch	.text
 751  004e               f_EEPROM_EEC_IRQHandler:
 755                     ; 535 }
 758  004e 80            	iret
 770                     	xref.b	_card_raw
 771                     	xref.b	_count
 772                     	xdef	f_EEPROM_EEC_IRQHandler
 773                     	xdef	f_TIM4_UPD_OVF_IRQHandler
 774                     	xdef	f_ADC1_IRQHandler
 775                     	xdef	f_I2C_IRQHandler
 776                     	xdef	f_UART1_RX_IRQHandler
 777                     	xdef	f_UART1_TX_IRQHandler
 778                     	xdef	f_TIM2_CAP_COM_IRQHandler
 779                     	xdef	f_TIM2_UPD_OVF_BRK_IRQHandler
 780                     	xdef	f_TIM1_UPD_OVF_TRG_BRK_IRQHandler
 781                     	xdef	f_TIM1_CAP_COM_IRQHandler
 782                     	xdef	f_SPI_IRQHandler
 783                     	xdef	f_EXTI_PORTE_IRQHandler
 784                     	xdef	f_EXTI_PORTD_IRQHandler
 785                     	xdef	f_EXTI_PORTC_IRQHandler
 786                     	xdef	f_EXTI_PORTB_IRQHandler
 787                     	xdef	f_EXTI_PORTA_IRQHandler
 788                     	xdef	f_CLK_IRQHandler
 789                     	xdef	f_AWU_IRQHandler
 790                     	xdef	f_TLI_IRQHandler
 791                     	xdef	f_TRAP_IRQHandler
 792                     	xdef	f_NonHandledInterrupt
 793                     	xdef	f_EXTI1_IRQHandler
 794                     	xref	_GPIO_ReadInputPin
 795                     	xref.b	c_x
 796                     	xref.b	c_y
 815                     	end
