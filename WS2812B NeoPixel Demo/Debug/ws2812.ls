   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.9 - 08 Feb 2017
   3                     ; Generator (Limited) V4.4.6 - 08 Feb 2017
  43                     ; 7 void WS2812_high(void)
  43                     ; 8 {
  45                     	switch	.text
  46  0000               _WS2812_high:
  50                     ; 9 	SetBit(GPIOC->ODR, 6);
  52  0000 721c500a      	bset	20490,#6
  53                     ; 10 	_asm("nop");
  56  0004 9d            nop
  58                     ; 11 	_asm("nop");
  61  0005 9d            nop
  63                     ; 12 	_asm("nop");
  66  0006 9d            nop
  68                     ; 13 	_asm("nop");
  71  0007 9d            nop
  73                     ; 14 	_asm("nop");
  76  0008 9d            nop
  78                     ; 15 	_asm("nop");
  81  0009 9d            nop
  83                     ; 16 	_asm("nop");
  86  000a 9d            nop
  88                     ; 17 	_asm("nop");
  91  000b 9d            nop
  93                     ; 18 	_asm("nop");
  96  000c 9d            nop
  98                     ; 19 	_asm("nop");
 101  000d 9d            nop
 103                     ; 20 	_asm("nop");
 106  000e 9d            nop
 108                     ; 21 	ClrBit(GPIOC->ODR, 6);
 110  000f 721d500a      	bres	20490,#6
 111                     ; 22 	_asm("nop");
 114  0013 9d            nop
 116                     ; 23 	_asm("nop");
 119  0014 9d            nop
 121                     ; 24 	_asm("nop");
 124  0015 9d            nop
 126                     ; 25 }
 129  0016 81            	ret
 153                     ; 28 void WS2812_low(void)
 153                     ; 29 {
 154                     	switch	.text
 155  0017               _WS2812_low:
 159                     ; 30 	SetBit(GPIOC->ODR, 6);
 161  0017 721c500a      	bset	20490,#6
 162                     ; 31 	_asm("nop");
 165  001b 9d            nop
 167                     ; 32 	_asm("nop");
 170  001c 9d            nop
 172                     ; 33 	_asm("nop");
 175  001d 9d            nop
 177                     ; 35 	ClrBit(GPIOC->ODR, 6);
 179  001e 721d500a      	bres	20490,#6
 180                     ; 36 	_asm("nop");
 183  0022 9d            nop
 185                     ; 37 	_asm("nop");
 188  0023 9d            nop
 190                     ; 38 	_asm("nop");
 193  0024 9d            nop
 195                     ; 39 	_asm("nop");
 198  0025 9d            nop
 200                     ; 40 	_asm("nop");
 203  0026 9d            nop
 205                     ; 41 	_asm("nop");
 208  0027 9d            nop
 210                     ; 42 	_asm("nop");
 213  0028 9d            nop
 215                     ; 43 	_asm("nop");
 218  0029 9d            nop
 220                     ; 44 	_asm("nop");
 223  002a 9d            nop
 225                     ; 45 	_asm("nop");
 228  002b 9d            nop
 230                     ; 46 	_asm("nop");
 233  002c 9d            nop
 235                     ; 47 }
 238  002d 81            	ret
 264                     ; 50 void WS2812_init(void)
 264                     ; 51 {
 265                     	switch	.text
 266  002e               _WS2812_init:
 270                     ; 52    	GPIO_DeInit(GPIOC);
 272  002e ae500a        	ldw	x,#20490
 273  0031 cd0000        	call	_GPIO_DeInit
 275                     ; 53     GPIO_Init(GPIOC, GPIO_PIN_6, GPIO_MODE_OUT_PP_HIGH_FAST);
 277  0034 4bf0          	push	#240
 278  0036 4b40          	push	#64
 279  0038 ae500a        	ldw	x,#20490
 280  003b cd0000        	call	_GPIO_Init
 282  003e 85            	popw	x
 283                     ; 54 	GPIO_WriteLow(GPIOC, GPIO_PIN_6);
 285  003f 4b40          	push	#64
 286  0041 ae500a        	ldw	x,#20490
 287  0044 cd0000        	call	_GPIO_WriteLow
 289  0047 84            	pop	a
 290                     ; 55 }
 293  0048 81            	ret
 317                     ; 58 void WS2812_update(void)
 317                     ; 59 {
 318                     	switch	.text
 319  0049               _WS2812_update:
 323                     ; 60 	delay_us(60);
 325  0049 ae003c        	ldw	x,#60
 326  004c cd0000        	call	_delay_us
 328                     ; 61 }
 331  004f 81            	ret
 376                     ; 64 void WS2812_reset(void)
 376                     ; 65 {
 377                     	switch	.text
 378  0050               _WS2812_reset:
 380  0050 89            	pushw	x
 381       00000002      OFST:	set	2
 384                     ; 66     unsigned char i = 0;
 386                     ; 67 	unsigned char j = 0;
 388                     ; 69 	for(i = 0; i < number_of_LEDs; i++)
 390  0051 0f01          	clr	(OFST-1,sp)
 392  0053               L37:
 393                     ; 71 		for(j = 0; j < 3; j++)
 395  0053 0f02          	clr	(OFST+0,sp)
 397  0055               L101:
 398                     ; 73 			LED_colours[i][j] = 0x00; 
 400  0055 7b01          	ld	a,(OFST-1,sp)
 401  0057 97            	ld	xl,a
 402  0058 a603          	ld	a,#3
 403  005a 42            	mul	x,a
 404  005b 01            	rrwa	x,a
 405  005c 1b02          	add	a,(OFST+0,sp)
 406  005e 2401          	jrnc	L61
 407  0060 5c            	incw	x
 408  0061               L61:
 409  0061 02            	rlwa	x,a
 410  0062 6f00          	clr	(_LED_colours,x)
 411                     ; 71 		for(j = 0; j < 3; j++)
 413  0064 0c02          	inc	(OFST+0,sp)
 417  0066 7b02          	ld	a,(OFST+0,sp)
 418  0068 a103          	cp	a,#3
 419  006a 25e9          	jrult	L101
 420                     ; 69 	for(i = 0; i < number_of_LEDs; i++)
 422  006c 0c01          	inc	(OFST-1,sp)
 426  006e 7b01          	ld	a,(OFST-1,sp)
 427  0070 a108          	cp	a,#8
 428  0072 25df          	jrult	L37
 429                     ; 77 	WS2812_set_common_colour_on_all_LEDs(0, 0, 0);
 431  0074 4b00          	push	#0
 432  0076 5f            	clrw	x
 433  0077 ad03          	call	_WS2812_set_common_colour_on_all_LEDs
 435  0079 84            	pop	a
 436                     ; 78 }
 439  007a 85            	popw	x
 440  007b 81            	ret
 505                     ; 81 void WS2812_set_common_colour_on_all_LEDs(unsigned char r, unsigned char g, unsigned char b)
 505                     ; 82 {
 506                     	switch	.text
 507  007c               _WS2812_set_common_colour_on_all_LEDs:
 509  007c 89            	pushw	x
 510  007d 88            	push	a
 511       00000001      OFST:	set	1
 514                     ; 83     unsigned char n = 0;
 516                     ; 85     for(n = 0; n < number_of_LEDs; n++)
 518  007e 0f01          	clr	(OFST+0,sp)
 520  0080               L141:
 521                     ; 87         LED_colours[n][0] = r;
 523  0080 7b01          	ld	a,(OFST+0,sp)
 524  0082 97            	ld	xl,a
 525  0083 a603          	ld	a,#3
 526  0085 42            	mul	x,a
 527  0086 7b02          	ld	a,(OFST+1,sp)
 528  0088 e700          	ld	(_LED_colours,x),a
 529                     ; 88         LED_colours[n][1] = g;
 531  008a 7b01          	ld	a,(OFST+0,sp)
 532  008c 97            	ld	xl,a
 533  008d a603          	ld	a,#3
 534  008f 42            	mul	x,a
 535  0090 7b03          	ld	a,(OFST+2,sp)
 536  0092 e701          	ld	(_LED_colours+1,x),a
 537                     ; 89         LED_colours[n][2] = b;
 539  0094 7b01          	ld	a,(OFST+0,sp)
 540  0096 97            	ld	xl,a
 541  0097 a603          	ld	a,#3
 542  0099 42            	mul	x,a
 543  009a 7b06          	ld	a,(OFST+5,sp)
 544  009c e702          	ld	(_LED_colours+2,x),a
 545                     ; 91         WS2812_send_data(LED_colours[n][0], LED_colours[n][1], LED_colours[n][2]);
 547  009e 7b01          	ld	a,(OFST+0,sp)
 548  00a0 97            	ld	xl,a
 549  00a1 a603          	ld	a,#3
 550  00a3 42            	mul	x,a
 551  00a4 e602          	ld	a,(_LED_colours+2,x)
 552  00a6 88            	push	a
 553  00a7 7b02          	ld	a,(OFST+1,sp)
 554  00a9 97            	ld	xl,a
 555  00aa a603          	ld	a,#3
 556  00ac 42            	mul	x,a
 557  00ad e601          	ld	a,(_LED_colours+1,x)
 558  00af 97            	ld	xl,a
 559  00b0 89            	pushw	x
 560  00b1 7b04          	ld	a,(OFST+3,sp)
 561  00b3 97            	ld	xl,a
 562  00b4 a603          	ld	a,#3
 563  00b6 42            	mul	x,a
 564  00b7 e600          	ld	a,(_LED_colours,x)
 565  00b9 85            	popw	x
 566  00ba 95            	ld	xh,a
 567  00bb ad5d          	call	_WS2812_send_data
 569  00bd 84            	pop	a
 570                     ; 85     for(n = 0; n < number_of_LEDs; n++)
 572  00be 0c01          	inc	(OFST+0,sp)
 576  00c0 7b01          	ld	a,(OFST+0,sp)
 577  00c2 a108          	cp	a,#8
 578  00c4 25ba          	jrult	L141
 579                     ; 94     WS2812_update();
 581  00c6 ad81          	call	_WS2812_update
 583                     ; 95 }
 586  00c8 5b03          	addw	sp,#3
 587  00ca 81            	ret
 661                     ; 98 void WS2812_set_colour_on_channel(unsigned char channel, unsigned char r, unsigned char g, unsigned char b)
 661                     ; 99 {
 662                     	switch	.text
 663  00cb               _WS2812_set_colour_on_channel:
 665  00cb 89            	pushw	x
 666  00cc 88            	push	a
 667       00000001      OFST:	set	1
 670                     ; 100     unsigned char n = 0;
 672                     ; 102     LED_colours[channel][0] = r;
 674  00cd 9e            	ld	a,xh
 675  00ce 97            	ld	xl,a
 676  00cf a603          	ld	a,#3
 677  00d1 42            	mul	x,a
 678  00d2 7b03          	ld	a,(OFST+2,sp)
 679  00d4 e700          	ld	(_LED_colours,x),a
 680                     ; 103     LED_colours[channel][1] = g;
 682  00d6 7b02          	ld	a,(OFST+1,sp)
 683  00d8 97            	ld	xl,a
 684  00d9 a603          	ld	a,#3
 685  00db 42            	mul	x,a
 686  00dc 7b06          	ld	a,(OFST+5,sp)
 687  00de e701          	ld	(_LED_colours+1,x),a
 688                     ; 104     LED_colours[channel][2] = b;
 690  00e0 7b02          	ld	a,(OFST+1,sp)
 691  00e2 97            	ld	xl,a
 692  00e3 a603          	ld	a,#3
 693  00e5 42            	mul	x,a
 694  00e6 7b07          	ld	a,(OFST+6,sp)
 695  00e8 e702          	ld	(_LED_colours+2,x),a
 696                     ; 106     for(n = 0; n < number_of_LEDs; n++)
 698  00ea 0f01          	clr	(OFST+0,sp)
 700  00ec               L502:
 701                     ; 108         WS2812_send_data(LED_colours[n][0], LED_colours[n][1], LED_colours[n][2]);
 703  00ec 7b01          	ld	a,(OFST+0,sp)
 704  00ee 97            	ld	xl,a
 705  00ef a603          	ld	a,#3
 706  00f1 42            	mul	x,a
 707  00f2 e602          	ld	a,(_LED_colours+2,x)
 708  00f4 88            	push	a
 709  00f5 7b02          	ld	a,(OFST+1,sp)
 710  00f7 97            	ld	xl,a
 711  00f8 a603          	ld	a,#3
 712  00fa 42            	mul	x,a
 713  00fb e601          	ld	a,(_LED_colours+1,x)
 714  00fd 97            	ld	xl,a
 715  00fe 89            	pushw	x
 716  00ff 7b04          	ld	a,(OFST+3,sp)
 717  0101 97            	ld	xl,a
 718  0102 a603          	ld	a,#3
 719  0104 42            	mul	x,a
 720  0105 e600          	ld	a,(_LED_colours,x)
 721  0107 85            	popw	x
 722  0108 95            	ld	xh,a
 723  0109 ad0f          	call	_WS2812_send_data
 725  010b 84            	pop	a
 726                     ; 106     for(n = 0; n < number_of_LEDs; n++)
 728  010c 0c01          	inc	(OFST+0,sp)
 732  010e 7b01          	ld	a,(OFST+0,sp)
 733  0110 a108          	cp	a,#8
 734  0112 25d8          	jrult	L502
 735                     ; 111     WS2812_update();
 737  0114 cd0049        	call	_WS2812_update
 739                     ; 112 }
 742  0117 5b03          	addw	sp,#3
 743  0119 81            	ret
 815                     ; 115 void WS2812_send_data(unsigned char r, unsigned char g, unsigned char b)
 815                     ; 116 {
 816                     	switch	.text
 817  011a               _WS2812_send_data:
 819  011a 89            	pushw	x
 820  011b 520d          	subw	sp,#13
 821       0000000d      OFST:	set	13
 824                     ; 117     unsigned char s = number_of_bits;
 826  011d a618          	ld	a,#24
 827  011f 6b09          	ld	(OFST-4,sp),a
 829                     ; 118     unsigned long temp = 0;
 831                     ; 120 	temp = (((unsigned long)g << 16) | ((unsigned long)r << 8) | ((unsigned long)b));
 833  0121 7b12          	ld	a,(OFST+5,sp)
 834  0123 b703          	ld	c_lreg+3,a
 835  0125 3f02          	clr	c_lreg+2
 836  0127 3f01          	clr	c_lreg+1
 837  0129 3f00          	clr	c_lreg
 838  012b 96            	ldw	x,sp
 839  012c 1c0005        	addw	x,#OFST-8
 840  012f cd0000        	call	c_rtol
 843  0132 7b0e          	ld	a,(OFST+1,sp)
 844  0134 5f            	clrw	x
 845  0135 97            	ld	xl,a
 846  0136 90ae0100      	ldw	y,#256
 847  013a cd0000        	call	c_umul
 849  013d 96            	ldw	x,sp
 850  013e 1c0001        	addw	x,#OFST-12
 851  0141 cd0000        	call	c_rtol
 854  0144 7b0f          	ld	a,(OFST+2,sp)
 855  0146 b703          	ld	c_lreg+3,a
 856  0148 3f02          	clr	c_lreg+2
 857  014a 3f01          	clr	c_lreg+1
 858  014c 3f00          	clr	c_lreg
 859  014e a610          	ld	a,#16
 860  0150 cd0000        	call	c_llsh
 862  0153 96            	ldw	x,sp
 863  0154 1c0001        	addw	x,#OFST-12
 864  0157 cd0000        	call	c_lor
 866  015a 96            	ldw	x,sp
 867  015b 1c0005        	addw	x,#OFST-8
 868  015e cd0000        	call	c_lor
 870  0161 96            	ldw	x,sp
 871  0162 1c000a        	addw	x,#OFST-3
 872  0165 cd0000        	call	c_rtol
 876  0168 2018          	jra	L552
 877  016a               L152:
 878                     ; 124        if((temp & 0x800000) == 0)
 880  016a 7b0b          	ld	a,(OFST-2,sp)
 881  016c a580          	bcp	a,#128
 882  016e 2605          	jrne	L162
 883                     ; 126 			WS2812_low();
 885  0170 cd0017        	call	_WS2812_low
 888  0173 2003          	jra	L362
 889  0175               L162:
 890                     ; 131 		   WS2812_high();
 892  0175 cd0000        	call	_WS2812_high
 894  0178               L362:
 895                     ; 134        temp <<= 1;
 897  0178 080d          	sll	(OFST+0,sp)
 898  017a 090c          	rlc	(OFST-1,sp)
 899  017c 090b          	rlc	(OFST-2,sp)
 900  017e 090a          	rlc	(OFST-3,sp)
 902                     ; 135 	   s--;
 904  0180 0a09          	dec	(OFST-4,sp)
 906  0182               L552:
 907                     ; 122     while(s > 0)
 909  0182 0d09          	tnz	(OFST-4,sp)
 910  0184 26e4          	jrne	L152
 911                     ; 137 }
 914  0186 5b0f          	addw	sp,#15
 915  0188 81            	ret
 941                     	xdef	_WS2812_send_data
 942                     	xdef	_WS2812_set_colour_on_channel
 943                     	xdef	_WS2812_set_common_colour_on_all_LEDs
 944                     	xdef	_WS2812_reset
 945                     	xdef	_WS2812_update
 946                     	xdef	_WS2812_init
 947                     	xdef	_WS2812_low
 948                     	xdef	_WS2812_high
 949                     	switch	.ubsct
 950  0000               _LED_colours:
 951  0000 000000000000  	ds.b	24
 952                     	xdef	_LED_colours
 953                     	xref	_GPIO_WriteLow
 954                     	xref	_GPIO_Init
 955                     	xref	_GPIO_DeInit
 956                     	xref	_delay_us
 957                     	xref.b	c_lreg
 958                     	xref.b	c_x
 959                     	xref.b	c_y
 979                     	xref	c_lor
 980                     	xref	c_rtol
 981                     	xref	c_umul
 982                     	xref	c_llsh
 983                     	end
