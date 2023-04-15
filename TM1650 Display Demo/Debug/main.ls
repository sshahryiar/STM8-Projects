   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.12 - 20 Jun 2018
   3                     ; Generator (Limited) V4.4.8 - 20 Jun 2018
  70                     ; 9 void main(void)
  70                     ; 10 {
  72                     	switch	.text
  73  0000               _main:
  75  0000 5205          	subw	sp,#5
  76       00000005      OFST:	set	5
  79                     ; 11 	unsigned char display_state = 0;
  81  0002 0f01          	clr	(OFST-4,sp)
  83                     ; 13 	float t = 0;
  85                     ; 15 	setup_clock();
  87  0004 ad77          	call	_setup_clock
  89                     ; 17 	TM1650_init();
  91  0006 cd0000        	call	_TM1650_init
  93                     ; 18 	DS18B20_init();
  95  0009 cd0000        	call	_DS18B20_init
  97  000c               L14:
  98                     ; 22 		if(TM1650_read_keys() == DIG1_B_KI2)
 100  000c cd0000        	call	_TM1650_read_keys
 102  000f a14c          	cp	a,#76
 103  0011 2610          	jrne	L54
 104                     ; 24 			delay_ms(400);
 106  0013 ae0190        	ldw	x,#400
 107  0016 cd0000        	call	_delay_ms
 109                     ; 25 			display_state++;
 111  0019 0c01          	inc	(OFST-4,sp)
 113                     ; 27 			if(display_state > 2)
 115  001b 7b01          	ld	a,(OFST-4,sp)
 116  001d a103          	cp	a,#3
 117  001f 2502          	jrult	L54
 118                     ; 29 				display_state = 0;
 120  0021 0f01          	clr	(OFST-4,sp)
 122  0023               L54:
 123                     ; 33 		t = DS18B20_get_temperature();
 125  0023 cd0000        	call	_DS18B20_get_temperature
 127  0026 96            	ldw	x,sp
 128  0027 1c0002        	addw	x,#OFST-3
 129  002a cd0000        	call	c_rtol
 132                     ; 35 		switch(display_state)
 134  002d 7b01          	ld	a,(OFST-4,sp)
 136                     ; 52 				break;
 137  002f 4a            	dec	a
 138  0030 2710          	jreq	L3
 139  0032 4a            	dec	a
 140  0033 272d          	jreq	L5
 141  0035               L7:
 142                     ; 51 				TM1650_display_F(t);
 144  0035 1e04          	ldw	x,(OFST-1,sp)
 145  0037 89            	pushw	x
 146  0038 1e04          	ldw	x,(OFST-1,sp)
 147  003a 89            	pushw	x
 148  003b cd0000        	call	_TM1650_display_F
 150  003e 5b04          	addw	sp,#4
 151                     ; 52 				break;
 153  0040 2033          	jra	L35
 154  0042               L3:
 155                     ; 39 				TM1650_display_F(((t * 1.8) + 32.0));
 157  0042 96            	ldw	x,sp
 158  0043 1c0002        	addw	x,#OFST-3
 159  0046 cd0000        	call	c_ltor
 161  0049 ae0008        	ldw	x,#L16
 162  004c cd0000        	call	c_fmul
 164  004f ae0004        	ldw	x,#L17
 165  0052 cd0000        	call	c_fadd
 167  0055 be02          	ldw	x,c_lreg+2
 168  0057 89            	pushw	x
 169  0058 be00          	ldw	x,c_lreg
 170  005a 89            	pushw	x
 171  005b cd0000        	call	_TM1650_display_F
 173  005e 5b04          	addw	sp,#4
 174                     ; 40 				break;
 176  0060 2013          	jra	L35
 177  0062               L5:
 178                     ; 45 				TM1650_display_I((t + 273));
 180  0062 96            	ldw	x,sp
 181  0063 1c0002        	addw	x,#OFST-3
 182  0066 cd0000        	call	c_ltor
 184  0069 ae0000        	ldw	x,#L101
 185  006c cd0000        	call	c_fadd
 187  006f cd0000        	call	c_ftoi
 189  0072 cd0000        	call	_TM1650_display_I
 191                     ; 46 				break;
 193  0075               L35:
 194                     ; 57 		delay_ms(400);
 196  0075 ae0190        	ldw	x,#400
 197  0078 cd0000        	call	_delay_ms
 200  007b 208f          	jra	L14
 234                     ; 62 void setup_clock(void)
 234                     ; 63 {
 235                     	switch	.text
 236  007d               _setup_clock:
 240                     ; 64 	CLK_DeInit();
 242  007d cd0000        	call	_CLK_DeInit
 244                     ; 66 	CLK_LSICmd(DISABLE);
 246  0080 4f            	clr	a
 247  0081 cd0000        	call	_CLK_LSICmd
 249                     ; 67 	CLK_HSECmd(DISABLE);
 251  0084 4f            	clr	a
 252  0085 cd0000        	call	_CLK_HSECmd
 254                     ; 68 	CLK_HSICmd(ENABLE);
 256  0088 a601          	ld	a,#1
 257  008a cd0000        	call	_CLK_HSICmd
 260  008d               L711:
 261                     ; 69 	while(CLK_GetFlagStatus(CLK_FLAG_HSIRDY) == FALSE);
 263  008d ae0102        	ldw	x,#258
 264  0090 cd0000        	call	_CLK_GetFlagStatus
 266  0093 4d            	tnz	a
 267  0094 27f7          	jreq	L711
 268                     ; 71 	CLK_ClockSwitchCmd(ENABLE);
 270  0096 a601          	ld	a,#1
 271  0098 cd0000        	call	_CLK_ClockSwitchCmd
 273                     ; 72 	CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);
 275  009b 4f            	clr	a
 276  009c cd0000        	call	_CLK_HSIPrescalerConfig
 278                     ; 73 	CLK_SYSCLKConfig(CLK_PRESCALER_CPUDIV1);
 280  009f a680          	ld	a,#128
 281  00a1 cd0000        	call	_CLK_SYSCLKConfig
 283                     ; 75 	CLK_ClockSwitchConfig(CLK_SWITCHMODE_AUTO, 
 283                     ; 76 											 CLK_SOURCE_HSI, 
 283                     ; 77 											 DISABLE, CLK_CURRENTCLOCKSTATE_ENABLE);
 285  00a4 4b01          	push	#1
 286  00a6 4b00          	push	#0
 287  00a8 ae01e1        	ldw	x,#481
 288  00ab cd0000        	call	_CLK_ClockSwitchConfig
 290  00ae 85            	popw	x
 291                     ; 79 	CLK_ClockSecuritySystemEnable();
 293  00af cd0000        	call	_CLK_ClockSecuritySystemEnable
 295                     ; 81 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_CAN, DISABLE);
 297  00b2 ae1700        	ldw	x,#5888
 298  00b5 cd0000        	call	_CLK_PeripheralClockConfig
 300                     ; 82 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_I2C, ENABLE);
 302  00b8 ae0001        	ldw	x,#1
 303  00bb cd0000        	call	_CLK_PeripheralClockConfig
 305                     ; 83 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_SPI, DISABLE);
 307  00be ae0100        	ldw	x,#256
 308  00c1 cd0000        	call	_CLK_PeripheralClockConfig
 310                     ; 84 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_ADC, DISABLE);
 312  00c4 ae1300        	ldw	x,#4864
 313  00c7 cd0000        	call	_CLK_PeripheralClockConfig
 315                     ; 85 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_AWU, DISABLE);
 317  00ca ae1200        	ldw	x,#4608
 318  00cd cd0000        	call	_CLK_PeripheralClockConfig
 320                     ; 86 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_UART1, DISABLE);
 322  00d0 ae0200        	ldw	x,#512
 323  00d3 cd0000        	call	_CLK_PeripheralClockConfig
 325                     ; 87 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_UART3, DISABLE);
 327  00d6 ae0300        	ldw	x,#768
 328  00d9 cd0000        	call	_CLK_PeripheralClockConfig
 330                     ; 88 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER1, DISABLE);
 332  00dc ae0700        	ldw	x,#1792
 333  00df cd0000        	call	_CLK_PeripheralClockConfig
 335                     ; 89 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER2, DISABLE);
 337  00e2 ae0500        	ldw	x,#1280
 338  00e5 cd0000        	call	_CLK_PeripheralClockConfig
 340                     ; 90 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER3, DISABLE);
 342  00e8 ae0600        	ldw	x,#1536
 343  00eb cd0000        	call	_CLK_PeripheralClockConfig
 345                     ; 91 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER4, DISABLE);
 347  00ee ae0400        	ldw	x,#1024
 348  00f1 cd0000        	call	_CLK_PeripheralClockConfig
 350                     ; 92 }
 353  00f4 81            	ret
 366                     	xdef	_main
 367                     	xdef	_setup_clock
 368                     	xref	_TM1650_read_keys
 369                     	xref	_TM1650_display_F
 370                     	xref	_TM1650_display_I
 371                     	xref	_TM1650_init
 372                     	xref	_DS18B20_get_temperature
 373                     	xref	_DS18B20_init
 374                     	xref	_delay_ms
 375                     	xref	_CLK_GetFlagStatus
 376                     	xref	_CLK_ClockSecuritySystemEnable
 377                     	xref	_CLK_SYSCLKConfig
 378                     	xref	_CLK_HSIPrescalerConfig
 379                     	xref	_CLK_ClockSwitchConfig
 380                     	xref	_CLK_PeripheralClockConfig
 381                     	xref	_CLK_ClockSwitchCmd
 382                     	xref	_CLK_LSICmd
 383                     	xref	_CLK_HSICmd
 384                     	xref	_CLK_HSECmd
 385                     	xref	_CLK_DeInit
 386                     .const:	section	.text
 387  0000               L101:
 388  0000 43888000      	dc.w	17288,-32768
 389  0004               L17:
 390  0004 42000000      	dc.w	16896,0
 391  0008               L16:
 392  0008 3fe66666      	dc.w	16358,26214
 393                     	xref.b	c_lreg
 394                     	xref.b	c_x
 414                     	xref	c_ftoi
 415                     	xref	c_fadd
 416                     	xref	c_fmul
 417                     	xref	c_ltor
 418                     	xref	c_rtol
 419                     	end
