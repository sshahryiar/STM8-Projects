   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.9 - 08 Feb 2017
   3                     ; Generator (Limited) V4.4.6 - 08 Feb 2017
  73                     ; 15 void main(void)
  73                     ; 16 {
  75                     	switch	.text
  76  0000               _main:
  78  0000 5203          	subw	sp,#3
  79       00000003      OFST:	set	3
  82                     ; 17 	unsigned char facility_code = 120;
  84                     ; 18 	unsigned int card_number = 12340;
  86                     ; 20 	count =60;
  88  0002 353c0004      	mov	_count,#60
  89                     ; 21 	card_raw = 0;
  91  0006 ae0000        	ldw	x,#0
  92  0009 bf02          	ldw	_card_raw+2,x
  93  000b ae0000        	ldw	x,#0
  94  000e bf00          	ldw	_card_raw,x
  95                     ; 23 	GPIO_setup();
  97  0010 ad66          	call	_GPIO_setup
  99                     ; 24 	EXTI_setup();
 101  0012 cd0095        	call	_EXTI_setup
 103                     ; 25 	clock_setup();
 105  0015 cd00ad        	call	_clock_setup
 107                     ; 27 	LCD_init();  
 109  0018 cd0000        	call	_LCD_init
 111                     ; 28 	LCD_clear_home(); 
 113  001b cd0000        	call	_LCD_clear_home
 115                     ; 30 	LCD_goto(0, 0);
 117  001e 5f            	clrw	x
 118  001f cd0000        	call	_LCD_goto
 120                     ; 31 	LCD_putstr("Facility:");
 122  0022 ae001a        	ldw	x,#L33
 123  0025 cd0000        	call	_LCD_putstr
 125                     ; 33 	LCD_goto(0, 1);
 127  0028 ae0001        	ldw	x,#1
 128  002b cd0000        	call	_LCD_goto
 130                     ; 34 	LCD_putstr("Card I.D:");
 132  002e ae0010        	ldw	x,#L53
 133  0031 cd0000        	call	_LCD_putstr
 135  0034               L73:
 136                     ; 38 		if(count >= 25)
 138  0034 b604          	ld	a,_count
 139  0036 a119          	cp	a,#25
 140  0038 25fa          	jrult	L73
 141                     ; 40 			card_number = (card_raw & 0xFFFF);
 143  003a be02          	ldw	x,_card_raw+2
 144  003c 01            	rrwa	x,a
 145  003d a4ff          	and	a,#255
 146  003f 01            	rrwa	x,a
 147  0040 a4ff          	and	a,#255
 148  0042 01            	rrwa	x,a
 149  0043 1f02          	ldw	(OFST-1,sp),x
 151                     ; 41 			facility_code = (0xFF & (card_raw >> 16));
 153  0045 b601          	ld	a,_card_raw+1
 154  0047 a4ff          	and	a,#255
 155  0049 6b01          	ld	(OFST-2,sp),a
 157                     ; 42 			print_C(13, 0, facility_code);
 159  004b 7b01          	ld	a,(OFST-2,sp)
 160  004d 5f            	clrw	x
 161  004e 97            	ld	xl,a
 162  004f 89            	pushw	x
 163  0050 ae0d00        	ldw	x,#3328
 164  0053 cd010f        	call	_print_C
 166  0056 85            	popw	x
 167                     ; 43 			print_I(11, 1, card_number);
 169  0057 1e02          	ldw	x,(OFST-1,sp)
 170  0059 cd0000        	call	c_uitolx
 172  005c be02          	ldw	x,c_lreg+2
 173  005e 89            	pushw	x
 174  005f be00          	ldw	x,c_lreg
 175  0061 89            	pushw	x
 176  0062 ae0b01        	ldw	x,#2817
 177  0065 cd0228        	call	_print_I
 179  0068 5b04          	addw	sp,#4
 180                     ; 44 			card_raw = 0;
 182  006a ae0000        	ldw	x,#0
 183  006d bf02          	ldw	_card_raw+2,x
 184  006f ae0000        	ldw	x,#0
 185  0072 bf00          	ldw	_card_raw,x
 186                     ; 45 			count = 0;
 188  0074 3f04          	clr	_count
 189  0076 20bc          	jra	L73
 214                     ; 51 void GPIO_setup(void)
 214                     ; 52 {
 215                     	switch	.text
 216  0078               _GPIO_setup:
 220                     ; 53 	GPIO_DeInit(GPIOB);    
 222  0078 ae5005        	ldw	x,#20485
 223  007b cd0000        	call	_GPIO_DeInit
 225                     ; 54 	GPIO_Init(GPIOB, GPIO_PIN_0, GPIO_MODE_IN_PU_IT);
 227  007e 4b60          	push	#96
 228  0080 4b01          	push	#1
 229  0082 ae5005        	ldw	x,#20485
 230  0085 cd0000        	call	_GPIO_Init
 232  0088 85            	popw	x
 233                     ; 55 	GPIO_Init(GPIOB, GPIO_PIN_1, GPIO_MODE_IN_PU_IT);
 235  0089 4b60          	push	#96
 236  008b 4b02          	push	#2
 237  008d ae5005        	ldw	x,#20485
 238  0090 cd0000        	call	_GPIO_Init
 240  0093 85            	popw	x
 241                     ; 56 }
 244  0094 81            	ret
 273                     ; 59 void EXTI_setup(void)
 273                     ; 60 {
 274                     	switch	.text
 275  0095               _EXTI_setup:
 279                     ; 61 	ITC_DeInit();
 281  0095 cd0000        	call	_ITC_DeInit
 283                     ; 62 	ITC_SetSoftwarePriority(ITC_IRQ_PORTB, ITC_PRIORITYLEVEL_0);
 285  0098 ae0402        	ldw	x,#1026
 286  009b cd0000        	call	_ITC_SetSoftwarePriority
 288                     ; 64 	EXTI_DeInit();
 290  009e cd0000        	call	_EXTI_DeInit
 292                     ; 65 	EXTI_SetExtIntSensitivity(EXTI_PORT_GPIOB, EXTI_SENSITIVITY_FALL_ONLY);
 294  00a1 ae0102        	ldw	x,#258
 295  00a4 cd0000        	call	_EXTI_SetExtIntSensitivity
 297                     ; 66 	EXTI_SetTLISensitivity(EXTI_TLISENSITIVITY_FALL_ONLY);
 299  00a7 4f            	clr	a
 300  00a8 cd0000        	call	_EXTI_SetTLISensitivity
 302                     ; 68 	enableInterrupts();
 305  00ab 9a            rim
 307                     ; 69 }
 311  00ac 81            	ret
 344                     ; 72 void clock_setup(void)
 344                     ; 73 {
 345                     	switch	.text
 346  00ad               _clock_setup:
 350                     ; 74 	CLK_DeInit();
 352  00ad cd0000        	call	_CLK_DeInit
 354                     ; 76 	CLK_HSECmd(DISABLE);
 356  00b0 4f            	clr	a
 357  00b1 cd0000        	call	_CLK_HSECmd
 359                     ; 77 	CLK_LSICmd(DISABLE);
 361  00b4 4f            	clr	a
 362  00b5 cd0000        	call	_CLK_LSICmd
 364                     ; 78 	CLK_HSICmd(ENABLE);
 366  00b8 a601          	ld	a,#1
 367  00ba cd0000        	call	_CLK_HSICmd
 370  00bd               L77:
 371                     ; 79 	while(CLK_GetFlagStatus(CLK_FLAG_HSIRDY) == FALSE);
 373  00bd ae0102        	ldw	x,#258
 374  00c0 cd0000        	call	_CLK_GetFlagStatus
 376  00c3 4d            	tnz	a
 377  00c4 27f7          	jreq	L77
 378                     ; 81 	CLK_ClockSwitchCmd(ENABLE);
 380  00c6 a601          	ld	a,#1
 381  00c8 cd0000        	call	_CLK_ClockSwitchCmd
 383                     ; 82 	CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV4);
 385  00cb a610          	ld	a,#16
 386  00cd cd0000        	call	_CLK_HSIPrescalerConfig
 388                     ; 83 	CLK_SYSCLKConfig(CLK_PRESCALER_CPUDIV1);
 390  00d0 a680          	ld	a,#128
 391  00d2 cd0000        	call	_CLK_SYSCLKConfig
 393                     ; 85 	CLK_ClockSwitchConfig(CLK_SWITCHMODE_AUTO, CLK_SOURCE_HSI, 
 393                     ; 86 	DISABLE, CLK_CURRENTCLOCKSTATE_ENABLE);
 395  00d5 4b01          	push	#1
 396  00d7 4b00          	push	#0
 397  00d9 ae01e1        	ldw	x,#481
 398  00dc cd0000        	call	_CLK_ClockSwitchConfig
 400  00df 85            	popw	x
 401                     ; 88 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_SPI, DISABLE);
 403  00e0 ae0100        	ldw	x,#256
 404  00e3 cd0000        	call	_CLK_PeripheralClockConfig
 406                     ; 89 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_I2C, DISABLE);
 408  00e6 5f            	clrw	x
 409  00e7 cd0000        	call	_CLK_PeripheralClockConfig
 411                     ; 90 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_ADC, DISABLE);
 413  00ea ae1300        	ldw	x,#4864
 414  00ed cd0000        	call	_CLK_PeripheralClockConfig
 416                     ; 91 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_AWU, DISABLE);
 418  00f0 ae1200        	ldw	x,#4608
 419  00f3 cd0000        	call	_CLK_PeripheralClockConfig
 421                     ; 92 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_UART1, DISABLE);
 423  00f6 ae0300        	ldw	x,#768
 424  00f9 cd0000        	call	_CLK_PeripheralClockConfig
 426                     ; 93 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER1, DISABLE);
 428  00fc ae0700        	ldw	x,#1792
 429  00ff cd0000        	call	_CLK_PeripheralClockConfig
 431                     ; 94 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER2, DISABLE);
 433  0102 ae0500        	ldw	x,#1280
 434  0105 cd0000        	call	_CLK_PeripheralClockConfig
 436                     ; 95 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER4, DISABLE);
 438  0108 ae0400        	ldw	x,#1024
 439  010b cd0000        	call	_CLK_PeripheralClockConfig
 441                     ; 96 }
 444  010e 81            	ret
 507                     ; 99 void print_C(unsigned char x_pos, unsigned char y_pos, unsigned int value)
 507                     ; 100 {
 508                     	switch	.text
 509  010f               _print_C:
 511  010f 89            	pushw	x
 512  0110 88            	push	a
 513       00000001      OFST:	set	1
 516                     ; 101      unsigned char ch = 0;
 518                     ; 103      if((value > 99) && (value <= 999))
 520  0111 1e06          	ldw	x,(OFST+5,sp)
 521  0113 a30064        	cpw	x,#100
 522  0116 2563          	jrult	L531
 524  0118 1e06          	ldw	x,(OFST+5,sp)
 525  011a a303e8        	cpw	x,#1000
 526  011d 245c          	jruge	L531
 527                     ; 105         ch = ((value / 100) + 0x30);
 529  011f 1e06          	ldw	x,(OFST+5,sp)
 530  0121 a664          	ld	a,#100
 531  0123 62            	div	x,a
 532  0124 1c0030        	addw	x,#48
 533  0127 01            	rrwa	x,a
 534  0128 6b01          	ld	(OFST+0,sp),a
 535  012a 02            	rlwa	x,a
 537                     ; 106 		LCD_goto(x_pos, y_pos);
 539  012b 7b03          	ld	a,(OFST+2,sp)
 540  012d 97            	ld	xl,a
 541  012e 7b02          	ld	a,(OFST+1,sp)
 542  0130 95            	ld	xh,a
 543  0131 cd0000        	call	_LCD_goto
 545                     ; 107 		LCD_putchar(ch);
 547  0134 7b01          	ld	a,(OFST+0,sp)
 548  0136 cd0000        	call	_LCD_putchar
 550                     ; 109         ch = (((value % 100) / 10) + 0x30);
 552  0139 1e06          	ldw	x,(OFST+5,sp)
 553  013b a664          	ld	a,#100
 554  013d 62            	div	x,a
 555  013e 5f            	clrw	x
 556  013f 97            	ld	xl,a
 557  0140 a60a          	ld	a,#10
 558  0142 62            	div	x,a
 559  0143 1c0030        	addw	x,#48
 560  0146 01            	rrwa	x,a
 561  0147 6b01          	ld	(OFST+0,sp),a
 562  0149 02            	rlwa	x,a
 564                     ; 110 		LCD_goto((x_pos + 1), y_pos);
 566  014a 7b03          	ld	a,(OFST+2,sp)
 567  014c 97            	ld	xl,a
 568  014d 7b02          	ld	a,(OFST+1,sp)
 569  014f 4c            	inc	a
 570  0150 95            	ld	xh,a
 571  0151 cd0000        	call	_LCD_goto
 573                     ; 111 		LCD_putchar(ch);
 575  0154 7b01          	ld	a,(OFST+0,sp)
 576  0156 cd0000        	call	_LCD_putchar
 578                     ; 113         ch = ((value % 10) + 0x30);
 580  0159 1e06          	ldw	x,(OFST+5,sp)
 581  015b a60a          	ld	a,#10
 582  015d 62            	div	x,a
 583  015e 5f            	clrw	x
 584  015f 97            	ld	xl,a
 585  0160 1c0030        	addw	x,#48
 586  0163 01            	rrwa	x,a
 587  0164 6b01          	ld	(OFST+0,sp),a
 588  0166 02            	rlwa	x,a
 590                     ; 114 		LCD_goto((x_pos + 2), y_pos);
 592  0167 7b03          	ld	a,(OFST+2,sp)
 593  0169 97            	ld	xl,a
 594  016a 7b02          	ld	a,(OFST+1,sp)
 595  016c ab02          	add	a,#2
 596  016e 95            	ld	xh,a
 597  016f cd0000        	call	_LCD_goto
 599                     ; 115 		LCD_putchar(ch);
 601  0172 7b01          	ld	a,(OFST+0,sp)
 602  0174 cd0000        	call	_LCD_putchar
 605  0177 ac250225      	jpf	L731
 606  017b               L531:
 607                     ; 117      else if((value > 9) && (value <= 99))
 609  017b 1e06          	ldw	x,(OFST+5,sp)
 610  017d a3000a        	cpw	x,#10
 611  0180 2559          	jrult	L141
 613  0182 1e06          	ldw	x,(OFST+5,sp)
 614  0184 a30064        	cpw	x,#100
 615  0187 2452          	jruge	L141
 616                     ; 119         ch = 0x20;
 618  0189 a620          	ld	a,#32
 619  018b 6b01          	ld	(OFST+0,sp),a
 621                     ; 120 		LCD_goto(x_pos, y_pos);
 623  018d 7b03          	ld	a,(OFST+2,sp)
 624  018f 97            	ld	xl,a
 625  0190 7b02          	ld	a,(OFST+1,sp)
 626  0192 95            	ld	xh,a
 627  0193 cd0000        	call	_LCD_goto
 629                     ; 121 		LCD_putchar(ch);
 631  0196 7b01          	ld	a,(OFST+0,sp)
 632  0198 cd0000        	call	_LCD_putchar
 634                     ; 123 	    ch = (((value % 100) / 10) + 0x30);
 636  019b 1e06          	ldw	x,(OFST+5,sp)
 637  019d a664          	ld	a,#100
 638  019f 62            	div	x,a
 639  01a0 5f            	clrw	x
 640  01a1 97            	ld	xl,a
 641  01a2 a60a          	ld	a,#10
 642  01a4 62            	div	x,a
 643  01a5 1c0030        	addw	x,#48
 644  01a8 01            	rrwa	x,a
 645  01a9 6b01          	ld	(OFST+0,sp),a
 646  01ab 02            	rlwa	x,a
 648                     ; 124 		LCD_goto((x_pos + 1), y_pos);
 650  01ac 7b03          	ld	a,(OFST+2,sp)
 651  01ae 97            	ld	xl,a
 652  01af 7b02          	ld	a,(OFST+1,sp)
 653  01b1 4c            	inc	a
 654  01b2 95            	ld	xh,a
 655  01b3 cd0000        	call	_LCD_goto
 657                     ; 125         LCD_putchar(ch);
 659  01b6 7b01          	ld	a,(OFST+0,sp)
 660  01b8 cd0000        	call	_LCD_putchar
 662                     ; 127 		ch = ((value % 10) + 0x30);
 664  01bb 1e06          	ldw	x,(OFST+5,sp)
 665  01bd a60a          	ld	a,#10
 666  01bf 62            	div	x,a
 667  01c0 5f            	clrw	x
 668  01c1 97            	ld	xl,a
 669  01c2 1c0030        	addw	x,#48
 670  01c5 01            	rrwa	x,a
 671  01c6 6b01          	ld	(OFST+0,sp),a
 672  01c8 02            	rlwa	x,a
 674                     ; 128         LCD_goto((x_pos + 2), y_pos);
 676  01c9 7b03          	ld	a,(OFST+2,sp)
 677  01cb 97            	ld	xl,a
 678  01cc 7b02          	ld	a,(OFST+1,sp)
 679  01ce ab02          	add	a,#2
 680  01d0 95            	ld	xh,a
 681  01d1 cd0000        	call	_LCD_goto
 683                     ; 129 		LCD_putchar(ch);
 685  01d4 7b01          	ld	a,(OFST+0,sp)
 686  01d6 cd0000        	call	_LCD_putchar
 689  01d9 204a          	jra	L731
 690  01db               L141:
 691                     ; 131      else if((value >= 0) && (value <= 9))
 693  01db 1e06          	ldw	x,(OFST+5,sp)
 694  01dd a3000a        	cpw	x,#10
 695  01e0 2443          	jruge	L731
 696                     ; 133         ch = 0x20;
 698  01e2 a620          	ld	a,#32
 699  01e4 6b01          	ld	(OFST+0,sp),a
 701                     ; 134 		LCD_goto(x_pos , y_pos);
 703  01e6 7b03          	ld	a,(OFST+2,sp)
 704  01e8 97            	ld	xl,a
 705  01e9 7b02          	ld	a,(OFST+1,sp)
 706  01eb 95            	ld	xh,a
 707  01ec cd0000        	call	_LCD_goto
 709                     ; 135 		LCD_putchar(ch);
 711  01ef 7b01          	ld	a,(OFST+0,sp)
 712  01f1 cd0000        	call	_LCD_putchar
 714                     ; 137 		ch = 0x20;
 716  01f4 a620          	ld	a,#32
 717  01f6 6b01          	ld	(OFST+0,sp),a
 719                     ; 138 		LCD_goto((x_pos + 1), y_pos);
 721  01f8 7b03          	ld	a,(OFST+2,sp)
 722  01fa 97            	ld	xl,a
 723  01fb 7b02          	ld	a,(OFST+1,sp)
 724  01fd 4c            	inc	a
 725  01fe 95            	ld	xh,a
 726  01ff cd0000        	call	_LCD_goto
 728                     ; 139 		LCD_putchar(ch);
 730  0202 7b01          	ld	a,(OFST+0,sp)
 731  0204 cd0000        	call	_LCD_putchar
 733                     ; 141 		ch = ((value % 10) + 0x30);
 735  0207 1e06          	ldw	x,(OFST+5,sp)
 736  0209 a60a          	ld	a,#10
 737  020b 62            	div	x,a
 738  020c 5f            	clrw	x
 739  020d 97            	ld	xl,a
 740  020e 1c0030        	addw	x,#48
 741  0211 01            	rrwa	x,a
 742  0212 6b01          	ld	(OFST+0,sp),a
 743  0214 02            	rlwa	x,a
 745                     ; 142 		LCD_goto((x_pos + 2), y_pos);
 747  0215 7b03          	ld	a,(OFST+2,sp)
 748  0217 97            	ld	xl,a
 749  0218 7b02          	ld	a,(OFST+1,sp)
 750  021a ab02          	add	a,#2
 751  021c 95            	ld	xh,a
 752  021d cd0000        	call	_LCD_goto
 754                     ; 143         LCD_putchar(ch);
 756  0220 7b01          	ld	a,(OFST+0,sp)
 757  0222 cd0000        	call	_LCD_putchar
 759  0225               L731:
 760                     ; 145 }
 763  0225 5b03          	addw	sp,#3
 764  0227 81            	ret
 827                     .const:	section	.text
 828  0000               L02:
 829  0000 00002710      	dc.l	10000
 830  0004               L22:
 831  0004 000003e8      	dc.l	1000
 832  0008               L42:
 833  0008 00000064      	dc.l	100
 834  000c               L62:
 835  000c 0000000a      	dc.l	10
 836                     ; 148 void print_I(unsigned char x_pos, unsigned char y_pos, unsigned long value)
 836                     ; 149 {
 837                     	switch	.text
 838  0228               _print_I:
 840  0228 89            	pushw	x
 841  0229 88            	push	a
 842       00000001      OFST:	set	1
 845                     ; 150     unsigned char ch = 0;
 847                     ; 152     if(value > 9999)
 849  022a 96            	ldw	x,sp
 850  022b 1c0006        	addw	x,#OFST+5
 851  022e cd0000        	call	c_ltor
 853  0231 ae0000        	ldw	x,#L02
 854  0234 cd0000        	call	c_lcmp
 856  0237 2403          	jruge	L03
 857  0239 cc030d        	jp	L102
 858  023c               L03:
 859                     ; 154         ch = ((value / 10000) + 0x30);
 861  023c 96            	ldw	x,sp
 862  023d 1c0006        	addw	x,#OFST+5
 863  0240 cd0000        	call	c_ltor
 865  0243 ae0000        	ldw	x,#L02
 866  0246 cd0000        	call	c_ludv
 868  0249 a630          	ld	a,#48
 869  024b cd0000        	call	c_ladc
 871  024e b603          	ld	a,c_lreg+3
 872  0250 6b01          	ld	(OFST+0,sp),a
 874                     ; 155 		LCD_goto(x_pos, y_pos);
 876  0252 7b03          	ld	a,(OFST+2,sp)
 877  0254 97            	ld	xl,a
 878  0255 7b02          	ld	a,(OFST+1,sp)
 879  0257 95            	ld	xh,a
 880  0258 cd0000        	call	_LCD_goto
 882                     ; 156         LCD_putchar(ch);
 884  025b 7b01          	ld	a,(OFST+0,sp)
 885  025d cd0000        	call	_LCD_putchar
 887                     ; 158 		ch = (((value % 10000)/ 1000) + 0x30);
 889  0260 96            	ldw	x,sp
 890  0261 1c0006        	addw	x,#OFST+5
 891  0264 cd0000        	call	c_ltor
 893  0267 ae0000        	ldw	x,#L02
 894  026a cd0000        	call	c_lumd
 896  026d ae0004        	ldw	x,#L22
 897  0270 cd0000        	call	c_ludv
 899  0273 a630          	ld	a,#48
 900  0275 cd0000        	call	c_ladc
 902  0278 b603          	ld	a,c_lreg+3
 903  027a 6b01          	ld	(OFST+0,sp),a
 905                     ; 159 		LCD_goto((x_pos + 1), y_pos);
 907  027c 7b03          	ld	a,(OFST+2,sp)
 908  027e 97            	ld	xl,a
 909  027f 7b02          	ld	a,(OFST+1,sp)
 910  0281 4c            	inc	a
 911  0282 95            	ld	xh,a
 912  0283 cd0000        	call	_LCD_goto
 914                     ; 160         LCD_putchar(ch);
 916  0286 7b01          	ld	a,(OFST+0,sp)
 917  0288 cd0000        	call	_LCD_putchar
 919                     ; 162 		ch = (((value % 1000) / 100) + 0x30);
 921  028b 96            	ldw	x,sp
 922  028c 1c0006        	addw	x,#OFST+5
 923  028f cd0000        	call	c_ltor
 925  0292 ae0004        	ldw	x,#L22
 926  0295 cd0000        	call	c_lumd
 928  0298 ae0008        	ldw	x,#L42
 929  029b cd0000        	call	c_ludv
 931  029e a630          	ld	a,#48
 932  02a0 cd0000        	call	c_ladc
 934  02a3 b603          	ld	a,c_lreg+3
 935  02a5 6b01          	ld	(OFST+0,sp),a
 937                     ; 163         LCD_goto((x_pos + 2), y_pos);
 939  02a7 7b03          	ld	a,(OFST+2,sp)
 940  02a9 97            	ld	xl,a
 941  02aa 7b02          	ld	a,(OFST+1,sp)
 942  02ac ab02          	add	a,#2
 943  02ae 95            	ld	xh,a
 944  02af cd0000        	call	_LCD_goto
 946                     ; 164 		LCD_putchar(ch);
 948  02b2 7b01          	ld	a,(OFST+0,sp)
 949  02b4 cd0000        	call	_LCD_putchar
 951                     ; 166 		ch = (((value % 100) / 10) + 0x30);
 953  02b7 96            	ldw	x,sp
 954  02b8 1c0006        	addw	x,#OFST+5
 955  02bb cd0000        	call	c_ltor
 957  02be ae0008        	ldw	x,#L42
 958  02c1 cd0000        	call	c_lumd
 960  02c4 ae000c        	ldw	x,#L62
 961  02c7 cd0000        	call	c_ludv
 963  02ca a630          	ld	a,#48
 964  02cc cd0000        	call	c_ladc
 966  02cf b603          	ld	a,c_lreg+3
 967  02d1 6b01          	ld	(OFST+0,sp),a
 969                     ; 167         LCD_goto((x_pos + 3), y_pos);
 971  02d3 7b03          	ld	a,(OFST+2,sp)
 972  02d5 97            	ld	xl,a
 973  02d6 7b02          	ld	a,(OFST+1,sp)
 974  02d8 ab03          	add	a,#3
 975  02da 95            	ld	xh,a
 976  02db cd0000        	call	_LCD_goto
 978                     ; 168 		LCD_putchar(ch);
 980  02de 7b01          	ld	a,(OFST+0,sp)
 981  02e0 cd0000        	call	_LCD_putchar
 983                     ; 170 		ch = ((value % 10) + 0x30);
 985  02e3 96            	ldw	x,sp
 986  02e4 1c0006        	addw	x,#OFST+5
 987  02e7 cd0000        	call	c_ltor
 989  02ea ae000c        	ldw	x,#L62
 990  02ed cd0000        	call	c_lumd
 992  02f0 a630          	ld	a,#48
 993  02f2 cd0000        	call	c_ladc
 995  02f5 b603          	ld	a,c_lreg+3
 996  02f7 6b01          	ld	(OFST+0,sp),a
 998                     ; 171 		LCD_goto((x_pos + 4), y_pos);
1000  02f9 7b03          	ld	a,(OFST+2,sp)
1001  02fb 97            	ld	xl,a
1002  02fc 7b02          	ld	a,(OFST+1,sp)
1003  02fe ab04          	add	a,#4
1004  0300 95            	ld	xh,a
1005  0301 cd0000        	call	_LCD_goto
1007                     ; 172 		LCD_putchar(ch);
1009  0304 7b01          	ld	a,(OFST+0,sp)
1010  0306 cd0000        	call	_LCD_putchar
1013  0309 acdf05df      	jpf	L302
1014  030d               L102:
1015                     ; 175     else if((value > 999) && (value <= 9999))
1017  030d 96            	ldw	x,sp
1018  030e 1c0006        	addw	x,#OFST+5
1019  0311 cd0000        	call	c_ltor
1021  0314 ae0004        	ldw	x,#L22
1022  0317 cd0000        	call	c_lcmp
1024  031a 2403          	jruge	L23
1025  031c cc03f0        	jp	L502
1026  031f               L23:
1028  031f 96            	ldw	x,sp
1029  0320 1c0006        	addw	x,#OFST+5
1030  0323 cd0000        	call	c_ltor
1032  0326 ae0000        	ldw	x,#L02
1033  0329 cd0000        	call	c_lcmp
1035  032c 2503          	jrult	L43
1036  032e cc03f0        	jp	L502
1037  0331               L43:
1038                     ; 177         ch = 0x20;
1040  0331 a620          	ld	a,#32
1041  0333 6b01          	ld	(OFST+0,sp),a
1043                     ; 178 		LCD_goto(x_pos, y_pos);
1045  0335 7b03          	ld	a,(OFST+2,sp)
1046  0337 97            	ld	xl,a
1047  0338 7b02          	ld	a,(OFST+1,sp)
1048  033a 95            	ld	xh,a
1049  033b cd0000        	call	_LCD_goto
1051                     ; 179 		LCD_putchar(ch);
1053  033e 7b01          	ld	a,(OFST+0,sp)
1054  0340 cd0000        	call	_LCD_putchar
1056                     ; 181 		ch = (((value % 10000)/ 1000) + 0x30);
1058  0343 96            	ldw	x,sp
1059  0344 1c0006        	addw	x,#OFST+5
1060  0347 cd0000        	call	c_ltor
1062  034a ae0000        	ldw	x,#L02
1063  034d cd0000        	call	c_lumd
1065  0350 ae0004        	ldw	x,#L22
1066  0353 cd0000        	call	c_ludv
1068  0356 a630          	ld	a,#48
1069  0358 cd0000        	call	c_ladc
1071  035b b603          	ld	a,c_lreg+3
1072  035d 6b01          	ld	(OFST+0,sp),a
1074                     ; 182 		LCD_goto((x_pos + 1), y_pos);
1076  035f 7b03          	ld	a,(OFST+2,sp)
1077  0361 97            	ld	xl,a
1078  0362 7b02          	ld	a,(OFST+1,sp)
1079  0364 4c            	inc	a
1080  0365 95            	ld	xh,a
1081  0366 cd0000        	call	_LCD_goto
1083                     ; 183 		LCD_putchar(ch);
1085  0369 7b01          	ld	a,(OFST+0,sp)
1086  036b cd0000        	call	_LCD_putchar
1088                     ; 185         ch = (((value % 1000) / 100) + 0x30);
1090  036e 96            	ldw	x,sp
1091  036f 1c0006        	addw	x,#OFST+5
1092  0372 cd0000        	call	c_ltor
1094  0375 ae0004        	ldw	x,#L22
1095  0378 cd0000        	call	c_lumd
1097  037b ae0008        	ldw	x,#L42
1098  037e cd0000        	call	c_ludv
1100  0381 a630          	ld	a,#48
1101  0383 cd0000        	call	c_ladc
1103  0386 b603          	ld	a,c_lreg+3
1104  0388 6b01          	ld	(OFST+0,sp),a
1106                     ; 186 		LCD_goto((x_pos + 2), y_pos);
1108  038a 7b03          	ld	a,(OFST+2,sp)
1109  038c 97            	ld	xl,a
1110  038d 7b02          	ld	a,(OFST+1,sp)
1111  038f ab02          	add	a,#2
1112  0391 95            	ld	xh,a
1113  0392 cd0000        	call	_LCD_goto
1115                     ; 187 		LCD_putchar(ch);
1117  0395 7b01          	ld	a,(OFST+0,sp)
1118  0397 cd0000        	call	_LCD_putchar
1120                     ; 189         ch = (((value % 100) / 10) + 0x30);
1122  039a 96            	ldw	x,sp
1123  039b 1c0006        	addw	x,#OFST+5
1124  039e cd0000        	call	c_ltor
1126  03a1 ae0008        	ldw	x,#L42
1127  03a4 cd0000        	call	c_lumd
1129  03a7 ae000c        	ldw	x,#L62
1130  03aa cd0000        	call	c_ludv
1132  03ad a630          	ld	a,#48
1133  03af cd0000        	call	c_ladc
1135  03b2 b603          	ld	a,c_lreg+3
1136  03b4 6b01          	ld	(OFST+0,sp),a
1138                     ; 190 		LCD_goto((x_pos + 3), y_pos);
1140  03b6 7b03          	ld	a,(OFST+2,sp)
1141  03b8 97            	ld	xl,a
1142  03b9 7b02          	ld	a,(OFST+1,sp)
1143  03bb ab03          	add	a,#3
1144  03bd 95            	ld	xh,a
1145  03be cd0000        	call	_LCD_goto
1147                     ; 191 		LCD_putchar(ch);
1149  03c1 7b01          	ld	a,(OFST+0,sp)
1150  03c3 cd0000        	call	_LCD_putchar
1152                     ; 193         ch = ((value % 10) + 0x30);
1154  03c6 96            	ldw	x,sp
1155  03c7 1c0006        	addw	x,#OFST+5
1156  03ca cd0000        	call	c_ltor
1158  03cd ae000c        	ldw	x,#L62
1159  03d0 cd0000        	call	c_lumd
1161  03d3 a630          	ld	a,#48
1162  03d5 cd0000        	call	c_ladc
1164  03d8 b603          	ld	a,c_lreg+3
1165  03da 6b01          	ld	(OFST+0,sp),a
1167                     ; 194 		LCD_goto((x_pos + 4), y_pos);
1169  03dc 7b03          	ld	a,(OFST+2,sp)
1170  03de 97            	ld	xl,a
1171  03df 7b02          	ld	a,(OFST+1,sp)
1172  03e1 ab04          	add	a,#4
1173  03e3 95            	ld	xh,a
1174  03e4 cd0000        	call	_LCD_goto
1176                     ; 195 		LCD_putchar(ch);
1178  03e7 7b01          	ld	a,(OFST+0,sp)
1179  03e9 cd0000        	call	_LCD_putchar
1182  03ec acdf05df      	jpf	L302
1183  03f0               L502:
1184                     ; 197     else if((value > 99) && (value <= 999))
1186  03f0 96            	ldw	x,sp
1187  03f1 1c0006        	addw	x,#OFST+5
1188  03f4 cd0000        	call	c_ltor
1190  03f7 ae0008        	ldw	x,#L42
1191  03fa cd0000        	call	c_lcmp
1193  03fd 2403          	jruge	L63
1194  03ff cc04bb        	jp	L112
1195  0402               L63:
1197  0402 96            	ldw	x,sp
1198  0403 1c0006        	addw	x,#OFST+5
1199  0406 cd0000        	call	c_ltor
1201  0409 ae0004        	ldw	x,#L22
1202  040c cd0000        	call	c_lcmp
1204  040f 2503          	jrult	L04
1205  0411 cc04bb        	jp	L112
1206  0414               L04:
1207                     ; 200         ch = 0x20;
1209  0414 a620          	ld	a,#32
1210  0416 6b01          	ld	(OFST+0,sp),a
1212                     ; 201 		LCD_goto(x_pos, y_pos);
1214  0418 7b03          	ld	a,(OFST+2,sp)
1215  041a 97            	ld	xl,a
1216  041b 7b02          	ld	a,(OFST+1,sp)
1217  041d 95            	ld	xh,a
1218  041e cd0000        	call	_LCD_goto
1220                     ; 202 		LCD_putchar(ch);
1222  0421 7b01          	ld	a,(OFST+0,sp)
1223  0423 cd0000        	call	_LCD_putchar
1225                     ; 204         ch = 0x20;
1227  0426 a620          	ld	a,#32
1228  0428 6b01          	ld	(OFST+0,sp),a
1230                     ; 205 		LCD_goto((x_pos + 1), y_pos);
1232  042a 7b03          	ld	a,(OFST+2,sp)
1233  042c 97            	ld	xl,a
1234  042d 7b02          	ld	a,(OFST+1,sp)
1235  042f 4c            	inc	a
1236  0430 95            	ld	xh,a
1237  0431 cd0000        	call	_LCD_goto
1239                     ; 206 		LCD_putchar(ch);
1241  0434 7b01          	ld	a,(OFST+0,sp)
1242  0436 cd0000        	call	_LCD_putchar
1244                     ; 208 		ch = (((value % 1000) / 100) + 0x30);
1246  0439 96            	ldw	x,sp
1247  043a 1c0006        	addw	x,#OFST+5
1248  043d cd0000        	call	c_ltor
1250  0440 ae0004        	ldw	x,#L22
1251  0443 cd0000        	call	c_lumd
1253  0446 ae0008        	ldw	x,#L42
1254  0449 cd0000        	call	c_ludv
1256  044c a630          	ld	a,#48
1257  044e cd0000        	call	c_ladc
1259  0451 b603          	ld	a,c_lreg+3
1260  0453 6b01          	ld	(OFST+0,sp),a
1262                     ; 209 		LCD_goto((x_pos + 2), y_pos);
1264  0455 7b03          	ld	a,(OFST+2,sp)
1265  0457 97            	ld	xl,a
1266  0458 7b02          	ld	a,(OFST+1,sp)
1267  045a ab02          	add	a,#2
1268  045c 95            	ld	xh,a
1269  045d cd0000        	call	_LCD_goto
1271                     ; 210 		LCD_putchar(ch);
1273  0460 7b01          	ld	a,(OFST+0,sp)
1274  0462 cd0000        	call	_LCD_putchar
1276                     ; 212         ch = (((value % 100) / 10) + 0x30);
1278  0465 96            	ldw	x,sp
1279  0466 1c0006        	addw	x,#OFST+5
1280  0469 cd0000        	call	c_ltor
1282  046c ae0008        	ldw	x,#L42
1283  046f cd0000        	call	c_lumd
1285  0472 ae000c        	ldw	x,#L62
1286  0475 cd0000        	call	c_ludv
1288  0478 a630          	ld	a,#48
1289  047a cd0000        	call	c_ladc
1291  047d b603          	ld	a,c_lreg+3
1292  047f 6b01          	ld	(OFST+0,sp),a
1294                     ; 213 		LCD_goto((x_pos + 3), y_pos);
1296  0481 7b03          	ld	a,(OFST+2,sp)
1297  0483 97            	ld	xl,a
1298  0484 7b02          	ld	a,(OFST+1,sp)
1299  0486 ab03          	add	a,#3
1300  0488 95            	ld	xh,a
1301  0489 cd0000        	call	_LCD_goto
1303                     ; 214 		LCD_putchar(ch);
1305  048c 7b01          	ld	a,(OFST+0,sp)
1306  048e cd0000        	call	_LCD_putchar
1308                     ; 216         ch = ((value % 10) + 0x30);
1310  0491 96            	ldw	x,sp
1311  0492 1c0006        	addw	x,#OFST+5
1312  0495 cd0000        	call	c_ltor
1314  0498 ae000c        	ldw	x,#L62
1315  049b cd0000        	call	c_lumd
1317  049e a630          	ld	a,#48
1318  04a0 cd0000        	call	c_ladc
1320  04a3 b603          	ld	a,c_lreg+3
1321  04a5 6b01          	ld	(OFST+0,sp),a
1323                     ; 217 		LCD_goto((x_pos + 4), y_pos);
1325  04a7 7b03          	ld	a,(OFST+2,sp)
1326  04a9 97            	ld	xl,a
1327  04aa 7b02          	ld	a,(OFST+1,sp)
1328  04ac ab04          	add	a,#4
1329  04ae 95            	ld	xh,a
1330  04af cd0000        	call	_LCD_goto
1332                     ; 218 		LCD_putchar(ch);
1334  04b2 7b01          	ld	a,(OFST+0,sp)
1335  04b4 cd0000        	call	_LCD_putchar
1338  04b7 acdf05df      	jpf	L302
1339  04bb               L112:
1340                     ; 220     else if((value > 9) && (value <= 99))
1342  04bb 96            	ldw	x,sp
1343  04bc 1c0006        	addw	x,#OFST+5
1344  04bf cd0000        	call	c_ltor
1346  04c2 ae000c        	ldw	x,#L62
1347  04c5 cd0000        	call	c_lcmp
1349  04c8 2403          	jruge	L24
1350  04ca cc056c        	jp	L512
1351  04cd               L24:
1353  04cd 96            	ldw	x,sp
1354  04ce 1c0006        	addw	x,#OFST+5
1355  04d1 cd0000        	call	c_ltor
1357  04d4 ae0008        	ldw	x,#L42
1358  04d7 cd0000        	call	c_lcmp
1360  04da 2503          	jrult	L44
1361  04dc cc056c        	jp	L512
1362  04df               L44:
1363                     ; 222         ch = 0x20;
1365  04df a620          	ld	a,#32
1366  04e1 6b01          	ld	(OFST+0,sp),a
1368                     ; 223 		LCD_goto(x_pos, y_pos);
1370  04e3 7b03          	ld	a,(OFST+2,sp)
1371  04e5 97            	ld	xl,a
1372  04e6 7b02          	ld	a,(OFST+1,sp)
1373  04e8 95            	ld	xh,a
1374  04e9 cd0000        	call	_LCD_goto
1376                     ; 224 		LCD_putchar(ch);
1378  04ec 7b01          	ld	a,(OFST+0,sp)
1379  04ee cd0000        	call	_LCD_putchar
1381                     ; 226         ch = 0x20;
1383  04f1 a620          	ld	a,#32
1384  04f3 6b01          	ld	(OFST+0,sp),a
1386                     ; 227 		LCD_goto((x_pos + 1), y_pos);
1388  04f5 7b03          	ld	a,(OFST+2,sp)
1389  04f7 97            	ld	xl,a
1390  04f8 7b02          	ld	a,(OFST+1,sp)
1391  04fa 4c            	inc	a
1392  04fb 95            	ld	xh,a
1393  04fc cd0000        	call	_LCD_goto
1395                     ; 228 		LCD_putchar(ch);
1397  04ff 7b01          	ld	a,(OFST+0,sp)
1398  0501 cd0000        	call	_LCD_putchar
1400                     ; 230         ch = 0x20;
1402  0504 a620          	ld	a,#32
1403  0506 6b01          	ld	(OFST+0,sp),a
1405                     ; 231 		LCD_goto((x_pos + 2), y_pos);
1407  0508 7b03          	ld	a,(OFST+2,sp)
1408  050a 97            	ld	xl,a
1409  050b 7b02          	ld	a,(OFST+1,sp)
1410  050d ab02          	add	a,#2
1411  050f 95            	ld	xh,a
1412  0510 cd0000        	call	_LCD_goto
1414                     ; 232 		LCD_putchar(ch);		
1416  0513 7b01          	ld	a,(OFST+0,sp)
1417  0515 cd0000        	call	_LCD_putchar
1419                     ; 234 		ch = (((value % 100) / 10) + 0x30);
1421  0518 96            	ldw	x,sp
1422  0519 1c0006        	addw	x,#OFST+5
1423  051c cd0000        	call	c_ltor
1425  051f ae0008        	ldw	x,#L42
1426  0522 cd0000        	call	c_lumd
1428  0525 ae000c        	ldw	x,#L62
1429  0528 cd0000        	call	c_ludv
1431  052b a630          	ld	a,#48
1432  052d cd0000        	call	c_ladc
1434  0530 b603          	ld	a,c_lreg+3
1435  0532 6b01          	ld	(OFST+0,sp),a
1437                     ; 235 		LCD_goto((x_pos  + 3), y_pos);
1439  0534 7b03          	ld	a,(OFST+2,sp)
1440  0536 97            	ld	xl,a
1441  0537 7b02          	ld	a,(OFST+1,sp)
1442  0539 ab03          	add	a,#3
1443  053b 95            	ld	xh,a
1444  053c cd0000        	call	_LCD_goto
1446                     ; 236 		LCD_putchar(ch);
1448  053f 7b01          	ld	a,(OFST+0,sp)
1449  0541 cd0000        	call	_LCD_putchar
1451                     ; 238         ch = ((value % 10) + 0x30);
1453  0544 96            	ldw	x,sp
1454  0545 1c0006        	addw	x,#OFST+5
1455  0548 cd0000        	call	c_ltor
1457  054b ae000c        	ldw	x,#L62
1458  054e cd0000        	call	c_lumd
1460  0551 a630          	ld	a,#48
1461  0553 cd0000        	call	c_ladc
1463  0556 b603          	ld	a,c_lreg+3
1464  0558 6b01          	ld	(OFST+0,sp),a
1466                     ; 239 		LCD_goto((x_pos + 4), y_pos);
1468  055a 7b03          	ld	a,(OFST+2,sp)
1469  055c 97            	ld	xl,a
1470  055d 7b02          	ld	a,(OFST+1,sp)
1471  055f ab04          	add	a,#4
1472  0561 95            	ld	xh,a
1473  0562 cd0000        	call	_LCD_goto
1475                     ; 240 		LCD_putchar(ch);
1477  0565 7b01          	ld	a,(OFST+0,sp)
1478  0567 cd0000        	call	_LCD_putchar
1481  056a 2073          	jra	L302
1482  056c               L512:
1483                     ; 244 		ch = 0x20;
1485  056c a620          	ld	a,#32
1486  056e 6b01          	ld	(OFST+0,sp),a
1488                     ; 245 		LCD_goto(x_pos, y_pos);
1490  0570 7b03          	ld	a,(OFST+2,sp)
1491  0572 97            	ld	xl,a
1492  0573 7b02          	ld	a,(OFST+1,sp)
1493  0575 95            	ld	xh,a
1494  0576 cd0000        	call	_LCD_goto
1496                     ; 246 		LCD_putchar(ch);
1498  0579 7b01          	ld	a,(OFST+0,sp)
1499  057b cd0000        	call	_LCD_putchar
1501                     ; 248 	    ch = 0x20;
1503  057e a620          	ld	a,#32
1504  0580 6b01          	ld	(OFST+0,sp),a
1506                     ; 249 		LCD_goto((x_pos + 1), y_pos);
1508  0582 7b03          	ld	a,(OFST+2,sp)
1509  0584 97            	ld	xl,a
1510  0585 7b02          	ld	a,(OFST+1,sp)
1511  0587 4c            	inc	a
1512  0588 95            	ld	xh,a
1513  0589 cd0000        	call	_LCD_goto
1515                     ; 250 		LCD_putchar(ch);
1517  058c 7b01          	ld	a,(OFST+0,sp)
1518  058e cd0000        	call	_LCD_putchar
1520                     ; 252 	    ch = 0x20;
1522  0591 a620          	ld	a,#32
1523  0593 6b01          	ld	(OFST+0,sp),a
1525                     ; 253 		LCD_goto((x_pos + 2), y_pos);
1527  0595 7b03          	ld	a,(OFST+2,sp)
1528  0597 97            	ld	xl,a
1529  0598 7b02          	ld	a,(OFST+1,sp)
1530  059a ab02          	add	a,#2
1531  059c 95            	ld	xh,a
1532  059d cd0000        	call	_LCD_goto
1534                     ; 254 		LCD_putchar(ch);
1536  05a0 7b01          	ld	a,(OFST+0,sp)
1537  05a2 cd0000        	call	_LCD_putchar
1539                     ; 256 		ch = 0x20;
1541  05a5 a620          	ld	a,#32
1542  05a7 6b01          	ld	(OFST+0,sp),a
1544                     ; 257 		LCD_goto((x_pos + 3), y_pos);
1546  05a9 7b03          	ld	a,(OFST+2,sp)
1547  05ab 97            	ld	xl,a
1548  05ac 7b02          	ld	a,(OFST+1,sp)
1549  05ae ab03          	add	a,#3
1550  05b0 95            	ld	xh,a
1551  05b1 cd0000        	call	_LCD_goto
1553                     ; 258 		LCD_putchar(ch);
1555  05b4 7b01          	ld	a,(OFST+0,sp)
1556  05b6 cd0000        	call	_LCD_putchar
1558                     ; 260         ch = ((value % 10) + 0x30);
1560  05b9 96            	ldw	x,sp
1561  05ba 1c0006        	addw	x,#OFST+5
1562  05bd cd0000        	call	c_ltor
1564  05c0 ae000c        	ldw	x,#L62
1565  05c3 cd0000        	call	c_lumd
1567  05c6 a630          	ld	a,#48
1568  05c8 cd0000        	call	c_ladc
1570  05cb b603          	ld	a,c_lreg+3
1571  05cd 6b01          	ld	(OFST+0,sp),a
1573                     ; 261 		LCD_goto((x_pos + 4), y_pos);
1575  05cf 7b03          	ld	a,(OFST+2,sp)
1576  05d1 97            	ld	xl,a
1577  05d2 7b02          	ld	a,(OFST+1,sp)
1578  05d4 ab04          	add	a,#4
1579  05d6 95            	ld	xh,a
1580  05d7 cd0000        	call	_LCD_goto
1582                     ; 262 		LCD_putchar(ch);
1584  05da 7b01          	ld	a,(OFST+0,sp)
1585  05dc cd0000        	call	_LCD_putchar
1587  05df               L302:
1588                     ; 264 }
1591  05df 5b03          	addw	sp,#3
1592  05e1 81            	ret
1625                     	xdef	_main
1626                     	xdef	_print_I
1627                     	xdef	_print_C
1628                     	xdef	_clock_setup
1629                     	xdef	_EXTI_setup
1630                     	xdef	_GPIO_setup
1631                     	switch	.ubsct
1632  0000               _card_raw:
1633  0000 00000000      	ds.b	4
1634                     	xdef	_card_raw
1635  0004               _count:
1636  0004 00            	ds.b	1
1637                     	xdef	_count
1638                     	xref	_LCD_goto
1639                     	xref	_LCD_clear_home
1640                     	xref	_LCD_putchar
1641                     	xref	_LCD_putstr
1642                     	xref	_LCD_init
1643                     	xref	_ITC_SetSoftwarePriority
1644                     	xref	_ITC_DeInit
1645                     	xref	_GPIO_Init
1646                     	xref	_GPIO_DeInit
1647                     	xref	_EXTI_SetTLISensitivity
1648                     	xref	_EXTI_SetExtIntSensitivity
1649                     	xref	_EXTI_DeInit
1650                     	xref	_CLK_GetFlagStatus
1651                     	xref	_CLK_SYSCLKConfig
1652                     	xref	_CLK_HSIPrescalerConfig
1653                     	xref	_CLK_ClockSwitchConfig
1654                     	xref	_CLK_PeripheralClockConfig
1655                     	xref	_CLK_ClockSwitchCmd
1656                     	xref	_CLK_LSICmd
1657                     	xref	_CLK_HSICmd
1658                     	xref	_CLK_HSECmd
1659                     	xref	_CLK_DeInit
1660                     	switch	.const
1661  0010               L53:
1662  0010 436172642049  	dc.b	"Card I.D:",0
1663  001a               L33:
1664  001a 466163696c69  	dc.b	"Facility:",0
1665                     	xref.b	c_lreg
1666                     	xref.b	c_x
1686                     	xref	c_lumd
1687                     	xref	c_ladc
1688                     	xref	c_ludv
1689                     	xref	c_lcmp
1690                     	xref	c_ltor
1691                     	xref	c_uitolx
1692                     	end
