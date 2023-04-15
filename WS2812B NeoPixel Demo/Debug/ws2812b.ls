   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.9 - 08 Feb 2017
   3                     ; Generator (Limited) V4.4.6 - 08 Feb 2017
  45                     ; 7 void WS2812B_init(void)
  45                     ; 8 {
  47                     	switch	.text
  48  0000               _WS2812B_init:
  52                     ; 9    	GPIO_DeInit(GPIOC);
  54  0000 ae500a        	ldw	x,#20490
  55  0003 cd0000        	call	_GPIO_DeInit
  57                     ; 10     GPIO_Init(GPIOC, GPIO_PIN_6, GPIO_MODE_OUT_PP_HIGH_FAST);
  59  0006 4bf0          	push	#240
  60  0008 4b40          	push	#64
  61  000a ae500a        	ldw	x,#20490
  62  000d cd0000        	call	_GPIO_Init
  64  0010 85            	popw	x
  65                     ; 11 	GPIO_WriteLow(GPIOC, GPIO_PIN_6);
  67  0011 4b40          	push	#64
  68  0013 ae500a        	ldw	x,#20490
  69  0016 cd0000        	call	_GPIO_WriteLow
  71  0019 84            	pop	a
  72                     ; 12 }
  75  001a 81            	ret
  99                     ; 15 void WS2812B_high(void)
  99                     ; 16 {
 100                     	switch	.text
 101  001b               _WS2812B_high:
 105                     ; 17 	SetBit(GPIOC->ODR, 6);
 107  001b 721c500a      	bset	20490,#6
 108                     ; 18 	_asm("nop");
 111  001f 9d            nop
 113                     ; 19 	_asm("nop");
 116  0020 9d            nop
 118                     ; 20 	_asm("nop");
 121  0021 9d            nop
 123                     ; 21 	_asm("nop");
 126  0022 9d            nop
 128                     ; 22 	_asm("nop");
 131  0023 9d            nop
 133                     ; 23 	_asm("nop");
 136  0024 9d            nop
 138                     ; 24 	_asm("nop");
 141  0025 9d            nop
 143                     ; 25 	_asm("nop");
 146  0026 9d            nop
 148                     ; 26 	_asm("nop");
 151  0027 9d            nop
 153                     ; 27 	_asm("nop");
 156  0028 9d            nop
 158                     ; 28 	_asm("nop");
 161  0029 9d            nop
 163                     ; 29 	ClrBit(GPIOC->ODR, 6);
 165  002a 721d500a      	bres	20490,#6
 166                     ; 30 	_asm("nop");
 169  002e 9d            nop
 171                     ; 31 	_asm("nop");
 174  002f 9d            nop
 176                     ; 32 	_asm("nop");
 179  0030 9d            nop
 181                     ; 33 }
 184  0031 81            	ret
 208                     ; 36 void WS2812B_low(void)
 208                     ; 37 {
 209                     	switch	.text
 210  0032               _WS2812B_low:
 214                     ; 38 	SetBit(GPIOC->ODR, 6);
 216  0032 721c500a      	bset	20490,#6
 217                     ; 39 	_asm("nop");
 220  0036 9d            nop
 222                     ; 40 	_asm("nop");
 225  0037 9d            nop
 227                     ; 41 	_asm("nop");
 230  0038 9d            nop
 232                     ; 43 	ClrBit(GPIOC->ODR, 6);
 234  0039 721d500a      	bres	20490,#6
 235                     ; 44 	_asm("nop");
 238  003d 9d            nop
 240                     ; 45 	_asm("nop");
 243  003e 9d            nop
 245                     ; 46 	_asm("nop");
 248  003f 9d            nop
 250                     ; 47 	_asm("nop");
 253  0040 9d            nop
 255                     ; 48 	_asm("nop");
 258  0041 9d            nop
 260                     ; 49 	_asm("nop");
 263  0042 9d            nop
 265                     ; 50 	_asm("nop");
 268  0043 9d            nop
 270                     ; 51 	_asm("nop");
 273  0044 9d            nop
 275                     ; 52 	_asm("nop");
 278  0045 9d            nop
 280                     ; 53 	_asm("nop");
 283  0046 9d            nop
 285                     ; 54 	_asm("nop");
 288  0047 9d            nop
 290                     ; 55 }
 293  0048 81            	ret
 317                     ; 58 void WS2812B_update(void)
 317                     ; 59 {
 318                     	switch	.text
 319  0049               _WS2812B_update:
 323                     ; 60 	delay_us(60);
 325  0049 ae003c        	ldw	x,#60
 326  004c cd0000        	call	_delay_us
 328                     ; 61 }
 331  004f 81            	ret
 376                     ; 64 void WS2812B_reset(void)
 376                     ; 65 {
 377                     	switch	.text
 378  0050               _WS2812B_reset:
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
 429                     ; 77 	WS2812B_set_common_colour_on_all_LEDs(0, 0, 0);
 431  0074 4b00          	push	#0
 432  0076 5f            	clrw	x
 433  0077 ad03          	call	_WS2812B_set_common_colour_on_all_LEDs
 435  0079 84            	pop	a
 436                     ; 78 }
 439  007a 85            	popw	x
 440  007b 81            	ret
 506                     ; 81 void WS2812B_set_common_colour_on_all_LEDs(unsigned char r, unsigned char g, unsigned char b)
 506                     ; 82 {
 507                     	switch	.text
 508  007c               _WS2812B_set_common_colour_on_all_LEDs:
 510  007c 89            	pushw	x
 511  007d 88            	push	a
 512       00000001      OFST:	set	1
 515                     ; 83     unsigned char n = 0;
 517                     ; 85     for(n = 0; n < number_of_LEDs; n++)
 519  007e 0f01          	clr	(OFST+0,sp)
 521  0080               L141:
 522                     ; 87         LED_colours[n][0] = r;
 524  0080 7b01          	ld	a,(OFST+0,sp)
 525  0082 97            	ld	xl,a
 526  0083 a603          	ld	a,#3
 527  0085 42            	mul	x,a
 528  0086 7b02          	ld	a,(OFST+1,sp)
 529  0088 e700          	ld	(_LED_colours,x),a
 530                     ; 88         LED_colours[n][1] = g;
 532  008a 7b01          	ld	a,(OFST+0,sp)
 533  008c 97            	ld	xl,a
 534  008d a603          	ld	a,#3
 535  008f 42            	mul	x,a
 536  0090 7b03          	ld	a,(OFST+2,sp)
 537  0092 e701          	ld	(_LED_colours+1,x),a
 538                     ; 89         LED_colours[n][2] = b;
 540  0094 7b01          	ld	a,(OFST+0,sp)
 541  0096 97            	ld	xl,a
 542  0097 a603          	ld	a,#3
 543  0099 42            	mul	x,a
 544  009a 7b06          	ld	a,(OFST+5,sp)
 545  009c e702          	ld	(_LED_colours+2,x),a
 546                     ; 91         WS2812B_send_data(LED_colours[n][0], LED_colours[n][1], LED_colours[n][2]);
 548  009e 7b01          	ld	a,(OFST+0,sp)
 549  00a0 97            	ld	xl,a
 550  00a1 a603          	ld	a,#3
 551  00a3 42            	mul	x,a
 552  00a4 e602          	ld	a,(_LED_colours+2,x)
 553  00a6 88            	push	a
 554  00a7 7b02          	ld	a,(OFST+1,sp)
 555  00a9 97            	ld	xl,a
 556  00aa a603          	ld	a,#3
 557  00ac 42            	mul	x,a
 558  00ad e601          	ld	a,(_LED_colours+1,x)
 559  00af 97            	ld	xl,a
 560  00b0 89            	pushw	x
 561  00b1 7b04          	ld	a,(OFST+3,sp)
 562  00b3 97            	ld	xl,a
 563  00b4 a603          	ld	a,#3
 564  00b6 42            	mul	x,a
 565  00b7 e600          	ld	a,(_LED_colours,x)
 566  00b9 85            	popw	x
 567  00ba 95            	ld	xh,a
 568  00bb ad5d          	call	_WS2812B_send_data
 570  00bd 84            	pop	a
 571                     ; 85     for(n = 0; n < number_of_LEDs; n++)
 573  00be 0c01          	inc	(OFST+0,sp)
 577  00c0 7b01          	ld	a,(OFST+0,sp)
 578  00c2 a108          	cp	a,#8
 579  00c4 25ba          	jrult	L141
 580                     ; 94     WS2812B_update();
 582  00c6 ad81          	call	_WS2812B_update
 584                     ; 95 }
 587  00c8 5b03          	addw	sp,#3
 588  00ca 81            	ret
 662                     ; 98 void WS2812B_set_colour_on_channel(unsigned char channel, unsigned char r, unsigned char g, unsigned char b)
 662                     ; 99 {
 663                     	switch	.text
 664  00cb               _WS2812B_set_colour_on_channel:
 666  00cb 89            	pushw	x
 667  00cc 88            	push	a
 668       00000001      OFST:	set	1
 671                     ; 100     unsigned char n = 0;
 673                     ; 102     LED_colours[channel][0] = r;
 675  00cd 9e            	ld	a,xh
 676  00ce 97            	ld	xl,a
 677  00cf a603          	ld	a,#3
 678  00d1 42            	mul	x,a
 679  00d2 7b03          	ld	a,(OFST+2,sp)
 680  00d4 e700          	ld	(_LED_colours,x),a
 681                     ; 103     LED_colours[channel][1] = g;
 683  00d6 7b02          	ld	a,(OFST+1,sp)
 684  00d8 97            	ld	xl,a
 685  00d9 a603          	ld	a,#3
 686  00db 42            	mul	x,a
 687  00dc 7b06          	ld	a,(OFST+5,sp)
 688  00de e701          	ld	(_LED_colours+1,x),a
 689                     ; 104     LED_colours[channel][2] = b;
 691  00e0 7b02          	ld	a,(OFST+1,sp)
 692  00e2 97            	ld	xl,a
 693  00e3 a603          	ld	a,#3
 694  00e5 42            	mul	x,a
 695  00e6 7b07          	ld	a,(OFST+6,sp)
 696  00e8 e702          	ld	(_LED_colours+2,x),a
 697                     ; 106     for(n = 0; n < number_of_LEDs; n++)
 699  00ea 0f01          	clr	(OFST+0,sp)
 701  00ec               L502:
 702                     ; 108         WS2812B_send_data(LED_colours[n][0], LED_colours[n][1], LED_colours[n][2]);
 704  00ec 7b01          	ld	a,(OFST+0,sp)
 705  00ee 97            	ld	xl,a
 706  00ef a603          	ld	a,#3
 707  00f1 42            	mul	x,a
 708  00f2 e602          	ld	a,(_LED_colours+2,x)
 709  00f4 88            	push	a
 710  00f5 7b02          	ld	a,(OFST+1,sp)
 711  00f7 97            	ld	xl,a
 712  00f8 a603          	ld	a,#3
 713  00fa 42            	mul	x,a
 714  00fb e601          	ld	a,(_LED_colours+1,x)
 715  00fd 97            	ld	xl,a
 716  00fe 89            	pushw	x
 717  00ff 7b04          	ld	a,(OFST+3,sp)
 718  0101 97            	ld	xl,a
 719  0102 a603          	ld	a,#3
 720  0104 42            	mul	x,a
 721  0105 e600          	ld	a,(_LED_colours,x)
 722  0107 85            	popw	x
 723  0108 95            	ld	xh,a
 724  0109 ad0f          	call	_WS2812B_send_data
 726  010b 84            	pop	a
 727                     ; 106     for(n = 0; n < number_of_LEDs; n++)
 729  010c 0c01          	inc	(OFST+0,sp)
 733  010e 7b01          	ld	a,(OFST+0,sp)
 734  0110 a108          	cp	a,#8
 735  0112 25d8          	jrult	L502
 736                     ; 111     WS2812B_update();
 738  0114 cd0049        	call	_WS2812B_update
 740                     ; 112 }
 743  0117 5b03          	addw	sp,#3
 744  0119 81            	ret
 816                     ; 115 void WS2812B_send_data(unsigned char r, unsigned char g, unsigned char b)
 816                     ; 116 {
 817                     	switch	.text
 818  011a               _WS2812B_send_data:
 820  011a 89            	pushw	x
 821  011b 520d          	subw	sp,#13
 822       0000000d      OFST:	set	13
 825                     ; 117     unsigned char s = number_of_bits;
 827  011d a618          	ld	a,#24
 828  011f 6b09          	ld	(OFST-4,sp),a
 830                     ; 118     unsigned long temp = 0;
 832                     ; 120 	temp = (((unsigned long)g << 16) | ((unsigned long)r << 8) | ((unsigned long)b));
 834  0121 7b12          	ld	a,(OFST+5,sp)
 835  0123 b703          	ld	c_lreg+3,a
 836  0125 3f02          	clr	c_lreg+2
 837  0127 3f01          	clr	c_lreg+1
 838  0129 3f00          	clr	c_lreg
 839  012b 96            	ldw	x,sp
 840  012c 1c0005        	addw	x,#OFST-8
 841  012f cd0000        	call	c_rtol
 844  0132 7b0e          	ld	a,(OFST+1,sp)
 845  0134 5f            	clrw	x
 846  0135 97            	ld	xl,a
 847  0136 90ae0100      	ldw	y,#256
 848  013a cd0000        	call	c_umul
 850  013d 96            	ldw	x,sp
 851  013e 1c0001        	addw	x,#OFST-12
 852  0141 cd0000        	call	c_rtol
 855  0144 7b0f          	ld	a,(OFST+2,sp)
 856  0146 b703          	ld	c_lreg+3,a
 857  0148 3f02          	clr	c_lreg+2
 858  014a 3f01          	clr	c_lreg+1
 859  014c 3f00          	clr	c_lreg
 860  014e a610          	ld	a,#16
 861  0150 cd0000        	call	c_llsh
 863  0153 96            	ldw	x,sp
 864  0154 1c0001        	addw	x,#OFST-12
 865  0157 cd0000        	call	c_lor
 867  015a 96            	ldw	x,sp
 868  015b 1c0005        	addw	x,#OFST-8
 869  015e cd0000        	call	c_lor
 871  0161 96            	ldw	x,sp
 872  0162 1c000a        	addw	x,#OFST-3
 873  0165 cd0000        	call	c_rtol
 877  0168 2018          	jra	L552
 878  016a               L152:
 879                     ; 124        if((temp & 0x800000) == 0)
 881  016a 7b0b          	ld	a,(OFST-2,sp)
 882  016c a580          	bcp	a,#128
 883  016e 2605          	jrne	L162
 884                     ; 126 			WS2812B_low();
 886  0170 cd0032        	call	_WS2812B_low
 889  0173 2003          	jra	L362
 890  0175               L162:
 891                     ; 131 		   WS2812B_high();
 893  0175 cd001b        	call	_WS2812B_high
 895  0178               L362:
 896                     ; 134        temp <<= 1;
 898  0178 080d          	sll	(OFST+0,sp)
 899  017a 090c          	rlc	(OFST-1,sp)
 900  017c 090b          	rlc	(OFST-2,sp)
 901  017e 090a          	rlc	(OFST-3,sp)
 903                     ; 135 	   s--;
 905  0180 0a09          	dec	(OFST-4,sp)
 907  0182               L552:
 908                     ; 122     while(s > 0)
 910  0182 0d09          	tnz	(OFST-4,sp)
 911  0184 26e4          	jrne	L152
 912                     ; 137 }
 915  0186 5b0f          	addw	sp,#15
 916  0188 81            	ret
 942                     	xdef	_WS2812B_send_data
 943                     	xdef	_WS2812B_set_colour_on_channel
 944                     	xdef	_WS2812B_set_common_colour_on_all_LEDs
 945                     	xdef	_WS2812B_reset
 946                     	xdef	_WS2812B_update
 947                     	xdef	_WS2812B_low
 948                     	xdef	_WS2812B_high
 949                     	xdef	_WS2812B_init
 950                     	switch	.ubsct
 951  0000               _LED_colours:
 952  0000 000000000000  	ds.b	24
 953                     	xdef	_LED_colours
 954                     	xref	_GPIO_WriteLow
 955                     	xref	_GPIO_Init
 956                     	xref	_GPIO_DeInit
 957                     	xref	_delay_us
 958                     	xref.b	c_lreg
 959                     	xref.b	c_x
 960                     	xref.b	c_y
 980                     	xref	c_lor
 981                     	xref	c_rtol
 982                     	xref	c_umul
 983                     	xref	c_llsh
 984                     	end
