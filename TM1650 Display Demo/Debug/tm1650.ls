   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.12 - 20 Jun 2018
   3                     ; Generator (Limited) V4.4.8 - 20 Jun 2018
  14                     .const:	section	.text
  15  0000               L3_segment_code:
  16  0000 3f            	dc.b	63
  17  0001 06            	dc.b	6
  18  0002 5b            	dc.b	91
  19  0003 4f            	dc.b	79
  20  0004 66            	dc.b	102
  21  0005 6d            	dc.b	109
  22  0006 7d            	dc.b	125
  23  0007 07            	dc.b	7
  24  0008 7f            	dc.b	127
  25  0009 6f            	dc.b	111
  26  000a 40            	dc.b	64
  58                     ; 20 void setup_I2C_GPIO(void)
  58                     ; 21 {
  60                     	switch	.text
  61  0000               _setup_I2C_GPIO:
  65                     ; 22 	GPIO_DeInit(I2C_PORT);
  67  0000 ae5014        	ldw	x,#20500
  68  0003 cd0000        	call	_GPIO_DeInit
  70                     ; 23 	GPIO_Init(I2C_PORT, SCL_pin, GPIO_MODE_OUT_OD_HIZ_FAST);
  72  0006 4bb0          	push	#176
  73  0008 4b02          	push	#2
  74  000a ae5014        	ldw	x,#20500
  75  000d cd0000        	call	_GPIO_Init
  77  0010 85            	popw	x
  78                     ; 24 	GPIO_Init(I2C_PORT, SDA_pin, GPIO_MODE_OUT_OD_HIZ_FAST);
  80  0011 4bb0          	push	#176
  81  0013 4b04          	push	#4
  82  0015 ae5014        	ldw	x,#20500
  83  0018 cd0000        	call	_GPIO_Init
  85  001b 85            	popw	x
  86                     ; 26   setup_I2C();
  88  001c ad01          	call	_setup_I2C
  90                     ; 27 }
  93  001e 81            	ret
 120                     	switch	.const
 121  000b               L01:
 122  000b 000f4240      	dc.l	1000000
 123                     ; 30 void setup_I2C(void)
 123                     ; 31 {
 124                     	switch	.text
 125  001f               _setup_I2C:
 129                     ; 32 	I2C_DeInit();
 131  001f cd0000        	call	_I2C_DeInit
 133                     ; 33 	I2C_Init(100000, 
 133                     ; 34 				  TM1650_CONTROL_MODE, 
 133                     ; 35 				  I2C_DUTYCYCLE_2, 
 133                     ; 36 				  I2C_ACK_CURR, 
 133                     ; 37 				  I2C_ADDMODE_7BIT, 
 133                     ; 38 				  (CLK_GetClockFreq() / 1000000));
 135  0022 cd0000        	call	_CLK_GetClockFreq
 137  0025 ae000b        	ldw	x,#L01
 138  0028 cd0000        	call	c_ludv
 140  002b b603          	ld	a,c_lreg+3
 141  002d 88            	push	a
 142  002e 4b00          	push	#0
 143  0030 4b01          	push	#1
 144  0032 4b00          	push	#0
 145  0034 ae0048        	ldw	x,#72
 146  0037 89            	pushw	x
 147  0038 ae86a0        	ldw	x,#34464
 148  003b 89            	pushw	x
 149  003c ae0001        	ldw	x,#1
 150  003f 89            	pushw	x
 151  0040 cd0000        	call	_I2C_Init
 153  0043 5b0a          	addw	sp,#10
 154                     ; 39 	I2C_Cmd(ENABLE);	
 156  0045 a601          	ld	a,#1
 157  0047 cd0000        	call	_I2C_Cmd
 159                     ; 40 }
 162  004a 81            	ret
 187                     ; 43 void TM1650_init(void)
 187                     ; 44 {
 188                     	switch	.text
 189  004b               _TM1650_init:
 193                     ; 45 	setup_I2C_GPIO();
 195  004b adb3          	call	_setup_I2C_GPIO
 197                     ; 46 	TM1650_write(TM1650_CONTROL_MODE, (TM1650_COLON_OFF &(TM1650_TURN_ON_DISPLAY | TM1650_BRIGHTNESS_6)));
 199  004d ae48e7        	ldw	x,#18663
 200  0050 ad65          	call	_TM1650_write
 202                     ; 48 	TM1650_write(TM1650_SEG1, 0x00);
 204  0052 ae6800        	ldw	x,#26624
 205  0055 ad60          	call	_TM1650_write
 207                     ; 49 	TM1650_write(TM1650_SEG2, 0x00);
 209  0057 ae6a00        	ldw	x,#27136
 210  005a ad5b          	call	_TM1650_write
 212                     ; 50 	TM1650_write(TM1650_SEG3, 0x00);
 214  005c ae6c00        	ldw	x,#27648
 215  005f ad56          	call	_TM1650_write
 217                     ; 51 	TM1650_write(TM1650_SEG4, 0x00);
 219  0061 ae6e00        	ldw	x,#28160
 220  0064 ad51          	call	_TM1650_write
 222                     ; 52 }
 225  0066 81            	ret
 283                     ; 56 unsigned char TM1650_read(unsigned char address)
 283                     ; 57 {
 284                     	switch	.text
 285  0067               _TM1650_read:
 287  0067 88            	push	a
 288  0068 89            	pushw	x
 289       00000002      OFST:	set	2
 292                     ; 58    unsigned char value = 0x00;
 294  0069 0f01          	clr	(OFST-1,sp)
 296                     ; 59    unsigned char num_of_bytes = 0x01; 
 298  006b a601          	ld	a,#1
 299  006d 6b02          	ld	(OFST+0,sp),a
 301                     ; 61    I2C_GenerateSTART(ENABLE);
 303  006f a601          	ld	a,#1
 304  0071 cd0000        	call	_I2C_GenerateSTART
 307  0074               L37:
 308                     ; 62    while(!I2C_CheckEvent(I2C_EVENT_MASTER_MODE_SELECT));
 310  0074 ae0301        	ldw	x,#769
 311  0077 cd0000        	call	_I2C_CheckEvent
 313  007a 4d            	tnz	a
 314  007b 27f7          	jreq	L37
 315                     ; 64    I2C_Send7bitAddress(address, I2C_DIRECTION_RX);
 317  007d 7b03          	ld	a,(OFST+1,sp)
 318  007f ae0001        	ldw	x,#1
 319  0082 95            	ld	xh,a
 320  0083 cd0000        	call	_I2C_Send7bitAddress
 323  0086               L101:
 324                     ; 65    while(!I2C_CheckEvent(I2C_EVENT_MASTER_RECEIVER_MODE_SELECTED));
 326  0086 ae0302        	ldw	x,#770
 327  0089 cd0000        	call	_I2C_CheckEvent
 329  008c 4d            	tnz	a
 330  008d 27f7          	jreq	L101
 332  008f 201d          	jra	L701
 333  0091               L501:
 334                     ; 69 		if(I2C_CheckEvent(I2C_EVENT_MASTER_BYTE_RECEIVED))
 336  0091 ae0340        	ldw	x,#832
 337  0094 cd0000        	call	_I2C_CheckEvent
 339  0097 4d            	tnz	a
 340  0098 2714          	jreq	L701
 341                     ; 71 			if(num_of_bytes == 0)
 343  009a 0d02          	tnz	(OFST+0,sp)
 344  009c 2609          	jrne	L511
 345                     ; 73 				I2C_AcknowledgeConfig(I2C_ACK_NONE);
 347  009e 4f            	clr	a
 348  009f cd0000        	call	_I2C_AcknowledgeConfig
 350                     ; 74 				I2C_GenerateSTOP(ENABLE);   
 352  00a2 a601          	ld	a,#1
 353  00a4 cd0000        	call	_I2C_GenerateSTOP
 355  00a7               L511:
 356                     ; 77 			value = I2C_ReceiveData();
 358  00a7 cd0000        	call	_I2C_ReceiveData
 360  00aa 6b01          	ld	(OFST-1,sp),a
 362                     ; 79 			num_of_bytes--;
 364  00ac 0a02          	dec	(OFST+0,sp)
 366  00ae               L701:
 367                     ; 67    while(num_of_bytes)
 369  00ae 0d02          	tnz	(OFST+0,sp)
 370  00b0 26df          	jrne	L501
 371                     ; 84    return value;
 374  00b2 7b01          	ld	a,(OFST-1,sp)
 377  00b4 5b03          	addw	sp,#3
 378  00b6 81            	ret
 426                     ; 88 void TM1650_write(unsigned char address, unsigned char value)
 426                     ; 89 {
 427                     	switch	.text
 428  00b7               _TM1650_write:
 430  00b7 89            	pushw	x
 431       00000000      OFST:	set	0
 434                     ; 90    I2C_GenerateSTART(ENABLE);
 436  00b8 a601          	ld	a,#1
 437  00ba cd0000        	call	_I2C_GenerateSTART
 440  00bd               L341:
 441                     ; 91    while(!I2C_CheckEvent(I2C_EVENT_MASTER_MODE_SELECT));
 443  00bd ae0301        	ldw	x,#769
 444  00c0 cd0000        	call	_I2C_CheckEvent
 446  00c3 4d            	tnz	a
 447  00c4 27f7          	jreq	L341
 448                     ; 93    I2C_Send7bitAddress(address, I2C_DIRECTION_TX); 
 450  00c6 7b01          	ld	a,(OFST+1,sp)
 451  00c8 5f            	clrw	x
 452  00c9 95            	ld	xh,a
 453  00ca cd0000        	call	_I2C_Send7bitAddress
 456  00cd               L151:
 457                     ; 94    while(!I2C_CheckEvent(I2C_EVENT_MASTER_TRANSMITTER_MODE_SELECTED));
 459  00cd ae0782        	ldw	x,#1922
 460  00d0 cd0000        	call	_I2C_CheckEvent
 462  00d3 4d            	tnz	a
 463  00d4 27f7          	jreq	L151
 464                     ; 96    I2C_SendData(value);
 466  00d6 7b02          	ld	a,(OFST+2,sp)
 467  00d8 cd0000        	call	_I2C_SendData
 470  00db               L751:
 471                     ; 97    while(!I2C_CheckEvent(I2C_EVENT_MASTER_BYTE_TRANSMITTED));
 473  00db ae0784        	ldw	x,#1924
 474  00de cd0000        	call	_I2C_CheckEvent
 476  00e1 4d            	tnz	a
 477  00e2 27f7          	jreq	L751
 478                     ; 99    I2C_GenerateSTOP(ENABLE);  	
 480  00e4 a601          	ld	a,#1
 481  00e6 cd0000        	call	_I2C_GenerateSTOP
 483                     ; 100 }
 486  00e9 85            	popw	x
 487  00ea 81            	ret
 523                     ; 103 void TM1650_display_I(signed int value)
 523                     ; 104 {
 524                     	switch	.text
 525  00eb               _TM1650_display_I:
 527  00eb 89            	pushw	x
 528       00000000      OFST:	set	0
 531                     ; 105 	if(value < 0)
 533  00ec 9c            	rvf
 534  00ed a30000        	cpw	x,#0
 535  00f0 2e0c          	jrsge	L102
 536                     ; 107 		TM1650_write(TM1650_SEG1, segment_code[10]);
 538  00f2 ae6840        	ldw	x,#26688
 539  00f5 adc0          	call	_TM1650_write
 541                     ; 108 		value = -value;
 543  00f7 1e01          	ldw	x,(OFST+1,sp)
 544  00f9 50            	negw	x
 545  00fa 1f01          	ldw	(OFST+1,sp),x
 547  00fc 2005          	jra	L302
 548  00fe               L102:
 549                     ; 112 		TM1650_write(TM1650_SEG1, 0x00);
 551  00fe ae6800        	ldw	x,#26624
 552  0101 adb4          	call	_TM1650_write
 554  0103               L302:
 555                     ; 115 	if((value > 99) && (value <= 999))
 557  0103 9c            	rvf
 558  0104 1e01          	ldw	x,(OFST+1,sp)
 559  0106 a30064        	cpw	x,#100
 560  0109 2f41          	jrslt	L502
 562  010b 9c            	rvf
 563  010c 1e01          	ldw	x,(OFST+1,sp)
 564  010e a303e8        	cpw	x,#1000
 565  0111 2e39          	jrsge	L502
 566                     ; 117 		TM1650_write(TM1650_SEG2, segment_code[(value / 100)]);
 568  0113 1e01          	ldw	x,(OFST+1,sp)
 569  0115 a664          	ld	a,#100
 570  0117 cd0000        	call	c_sdivx
 572  011a d60000        	ld	a,(L3_segment_code,x)
 573  011d ae6a00        	ldw	x,#27136
 574  0120 97            	ld	xl,a
 575  0121 ad94          	call	_TM1650_write
 577                     ; 118 		TM1650_write(TM1650_SEG3, segment_code[((value / 10) % 10)]);
 579  0123 1e01          	ldw	x,(OFST+1,sp)
 580  0125 a60a          	ld	a,#10
 581  0127 cd0000        	call	c_sdivx
 583  012a a60a          	ld	a,#10
 584  012c cd0000        	call	c_smodx
 586  012f d60000        	ld	a,(L3_segment_code,x)
 587  0132 ae6c00        	ldw	x,#27648
 588  0135 97            	ld	xl,a
 589  0136 cd00b7        	call	_TM1650_write
 591                     ; 119 		TM1650_write(TM1650_SEG4, segment_code[(value % 10)]);
 593  0139 1e01          	ldw	x,(OFST+1,sp)
 594  013b a60a          	ld	a,#10
 595  013d cd0000        	call	c_smodx
 597  0140 d60000        	ld	a,(L3_segment_code,x)
 598  0143 ae6e00        	ldw	x,#28160
 599  0146 97            	ld	xl,a
 600  0147 cd00b7        	call	_TM1650_write
 603  014a 2064          	jra	L702
 604  014c               L502:
 605                     ; 122 	else if((value > 9) && (value <= 99))
 607  014c 9c            	rvf
 608  014d 1e01          	ldw	x,(OFST+1,sp)
 609  014f a3000a        	cpw	x,#10
 610  0152 2f32          	jrslt	L112
 612  0154 9c            	rvf
 613  0155 1e01          	ldw	x,(OFST+1,sp)
 614  0157 a30064        	cpw	x,#100
 615  015a 2e2a          	jrsge	L112
 616                     ; 124 		TM1650_write(TM1650_SEG2, 0x00);
 618  015c ae6a00        	ldw	x,#27136
 619  015f cd00b7        	call	_TM1650_write
 621                     ; 125 		TM1650_write(TM1650_SEG3, segment_code[(value / 10)]);
 623  0162 1e01          	ldw	x,(OFST+1,sp)
 624  0164 a60a          	ld	a,#10
 625  0166 cd0000        	call	c_sdivx
 627  0169 d60000        	ld	a,(L3_segment_code,x)
 628  016c ae6c00        	ldw	x,#27648
 629  016f 97            	ld	xl,a
 630  0170 cd00b7        	call	_TM1650_write
 632                     ; 126 		TM1650_write(TM1650_SEG4, segment_code[(value % 10)]);
 634  0173 1e01          	ldw	x,(OFST+1,sp)
 635  0175 a60a          	ld	a,#10
 636  0177 cd0000        	call	c_smodx
 638  017a d60000        	ld	a,(L3_segment_code,x)
 639  017d ae6e00        	ldw	x,#28160
 640  0180 97            	ld	xl,a
 641  0181 cd00b7        	call	_TM1650_write
 644  0184 202a          	jra	L702
 645  0186               L112:
 646                     ; 129 	else if((value >= 0) && (value <= 9))
 648  0186 9c            	rvf
 649  0187 1e01          	ldw	x,(OFST+1,sp)
 650  0189 2f25          	jrslt	L702
 652  018b 9c            	rvf
 653  018c 1e01          	ldw	x,(OFST+1,sp)
 654  018e a3000a        	cpw	x,#10
 655  0191 2e1d          	jrsge	L702
 656                     ; 131 		TM1650_write(TM1650_SEG2, 0x00);
 658  0193 ae6a00        	ldw	x,#27136
 659  0196 cd00b7        	call	_TM1650_write
 661                     ; 132 		TM1650_write(TM1650_SEG3, 0x00);
 663  0199 ae6c00        	ldw	x,#27648
 664  019c cd00b7        	call	_TM1650_write
 666                     ; 133 		TM1650_write(TM1650_SEG4, segment_code[(value % 10)]);
 668  019f 1e01          	ldw	x,(OFST+1,sp)
 669  01a1 a60a          	ld	a,#10
 670  01a3 cd0000        	call	c_smodx
 672  01a6 d60000        	ld	a,(L3_segment_code,x)
 673  01a9 ae6e00        	ldw	x,#28160
 674  01ac 97            	ld	xl,a
 675  01ad cd00b7        	call	_TM1650_write
 677  01b0               L702:
 678                     ; 135 }
 681  01b0 85            	popw	x
 682  01b1 81            	ret
 727                     	switch	.const
 728  000f               L42:
 729  000f 00000064      	dc.l	100
 730  0013               L62:
 731  0013 000003e8      	dc.l	1000
 732  0017               L03:
 733  0017 0000000a      	dc.l	10
 734                     ; 138 void TM1650_display_F(float fvalue)
 734                     ; 139 {
 735                     	switch	.text
 736  01b2               _TM1650_display_F:
 738  01b2 5208          	subw	sp,#8
 739       00000008      OFST:	set	8
 742                     ; 140 	signed long value = 0;
 744                     ; 142 	if(fvalue > 99.9)
 746  01b4 9c            	rvf
 747  01b5 96            	ldw	x,sp
 748  01b6 1c000b        	addw	x,#OFST+3
 749  01b9 cd0000        	call	c_ltor
 751  01bc ae0023        	ldw	x,#L742
 752  01bf cd0000        	call	c_fcmp
 754  01c2 2d0a          	jrsle	L142
 755                     ; 144 		fvalue = 99.9;
 757  01c4 ce0025        	ldw	x,L742+2
 758  01c7 1f0d          	ldw	(OFST+5,sp),x
 759  01c9 ce0023        	ldw	x,L742
 760  01cc 1f0b          	ldw	(OFST+3,sp),x
 761  01ce               L142:
 762                     ; 146 	if(fvalue < -99.9)
 764  01ce 9c            	rvf
 765  01cf 96            	ldw	x,sp
 766  01d0 1c000b        	addw	x,#OFST+3
 767  01d3 cd0000        	call	c_ltor
 769  01d6 ae001f        	ldw	x,#L162
 770  01d9 cd0000        	call	c_fcmp
 772  01dc 2e0a          	jrsge	L352
 773                     ; 148 		fvalue = -99.9;
 775  01de ce0021        	ldw	x,L162+2
 776  01e1 1f0d          	ldw	(OFST+5,sp),x
 777  01e3 ce001f        	ldw	x,L162
 778  01e6 1f0b          	ldw	(OFST+3,sp),x
 779  01e8               L352:
 780                     ; 151 	if(fvalue < 0)
 782  01e8 9c            	rvf
 783  01e9 9c            	rvf
 784  01ea 0d0b          	tnz	(OFST+3,sp)
 785  01ec 2e0f          	jrsge	L562
 786                     ; 153 		TM1650_write(TM1650_SEG1, segment_code[10]);
 788  01ee ae6840        	ldw	x,#26688
 789  01f1 cd00b7        	call	_TM1650_write
 791                     ; 154 		fvalue = -fvalue;
 793  01f4 96            	ldw	x,sp
 794  01f5 1c000b        	addw	x,#OFST+3
 795  01f8 cd0000        	call	c_fgneg
 798  01fb 2006          	jra	L762
 799  01fd               L562:
 800                     ; 158 		TM1650_write(TM1650_SEG1, 0x00);
 802  01fd ae6800        	ldw	x,#26624
 803  0200 cd00b7        	call	_TM1650_write
 805  0203               L762:
 806                     ; 161 	value = (fvalue * 10);
 808  0203 96            	ldw	x,sp
 809  0204 1c000b        	addw	x,#OFST+3
 810  0207 cd0000        	call	c_ltor
 812  020a ae001b        	ldw	x,#L572
 813  020d cd0000        	call	c_fmul
 815  0210 cd0000        	call	c_ftol
 817  0213 96            	ldw	x,sp
 818  0214 1c0005        	addw	x,#OFST-3
 819  0217 cd0000        	call	c_rtol
 822                     ; 163 	if((value > 99) && (value <= 999))
 824  021a 9c            	rvf
 825  021b 96            	ldw	x,sp
 826  021c 1c0005        	addw	x,#OFST-3
 827  021f cd0000        	call	c_ltor
 829  0222 ae000f        	ldw	x,#L42
 830  0225 cd0000        	call	c_lcmp
 832  0228 2e03          	jrsge	L23
 833  022a cc02cd        	jp	L103
 834  022d               L23:
 836  022d 9c            	rvf
 837  022e 96            	ldw	x,sp
 838  022f 1c0005        	addw	x,#OFST-3
 839  0232 cd0000        	call	c_ltor
 841  0235 ae0013        	ldw	x,#L62
 842  0238 cd0000        	call	c_lcmp
 844  023b 2f03          	jrslt	L43
 845  023d cc02cd        	jp	L103
 846  0240               L43:
 847                     ; 165 		TM1650_write(TM1650_SEG2, segment_code[(value / 100)]);
 849  0240 ae0000        	ldw	x,#L3_segment_code
 850  0243 cd0000        	call	c_uitolx
 852  0246 96            	ldw	x,sp
 853  0247 1c0001        	addw	x,#OFST-7
 854  024a cd0000        	call	c_rtol
 857  024d 96            	ldw	x,sp
 858  024e 1c0005        	addw	x,#OFST-3
 859  0251 cd0000        	call	c_ltor
 861  0254 ae000f        	ldw	x,#L42
 862  0257 cd0000        	call	c_ldiv
 864  025a 96            	ldw	x,sp
 865  025b 1c0001        	addw	x,#OFST-7
 866  025e cd0000        	call	c_ladd
 868  0261 be02          	ldw	x,c_lreg+2
 869  0263 f6            	ld	a,(x)
 870  0264 ae6a00        	ldw	x,#27136
 871  0267 97            	ld	xl,a
 872  0268 cd00b7        	call	_TM1650_write
 874                     ; 166 		TM1650_write(TM1650_SEG3, (segment_code[((value / 10) % 10)] | 0x80));
 876  026b ae0000        	ldw	x,#L3_segment_code
 877  026e cd0000        	call	c_uitolx
 879  0271 96            	ldw	x,sp
 880  0272 1c0001        	addw	x,#OFST-7
 881  0275 cd0000        	call	c_rtol
 884  0278 96            	ldw	x,sp
 885  0279 1c0005        	addw	x,#OFST-3
 886  027c cd0000        	call	c_ltor
 888  027f ae0017        	ldw	x,#L03
 889  0282 cd0000        	call	c_ldiv
 891  0285 ae0017        	ldw	x,#L03
 892  0288 cd0000        	call	c_lmod
 894  028b 96            	ldw	x,sp
 895  028c 1c0001        	addw	x,#OFST-7
 896  028f cd0000        	call	c_ladd
 898  0292 be02          	ldw	x,c_lreg+2
 899  0294 f6            	ld	a,(x)
 900  0295 aa80          	or	a,#128
 901  0297 ae6c00        	ldw	x,#27648
 902  029a 97            	ld	xl,a
 903  029b cd00b7        	call	_TM1650_write
 905                     ; 167 		TM1650_write(TM1650_SEG4, segment_code[(value % 10)]);
 907  029e ae0000        	ldw	x,#L3_segment_code
 908  02a1 cd0000        	call	c_uitolx
 910  02a4 96            	ldw	x,sp
 911  02a5 1c0001        	addw	x,#OFST-7
 912  02a8 cd0000        	call	c_rtol
 915  02ab 96            	ldw	x,sp
 916  02ac 1c0005        	addw	x,#OFST-3
 917  02af cd0000        	call	c_ltor
 919  02b2 ae0017        	ldw	x,#L03
 920  02b5 cd0000        	call	c_lmod
 922  02b8 96            	ldw	x,sp
 923  02b9 1c0001        	addw	x,#OFST-7
 924  02bc cd0000        	call	c_ladd
 926  02bf be02          	ldw	x,c_lreg+2
 927  02c1 f6            	ld	a,(x)
 928  02c2 ae6e00        	ldw	x,#28160
 929  02c5 97            	ld	xl,a
 930  02c6 cd00b7        	call	_TM1650_write
 933  02c9 ac9c039c      	jpf	L303
 934  02cd               L103:
 935                     ; 170 	else if((value > 9) && (value <= 99))
 937  02cd 9c            	rvf
 938  02ce 96            	ldw	x,sp
 939  02cf 1c0005        	addw	x,#OFST-3
 940  02d2 cd0000        	call	c_ltor
 942  02d5 ae0017        	ldw	x,#L03
 943  02d8 cd0000        	call	c_lcmp
 945  02db 2e02          	jrsge	L63
 946  02dd 2070          	jp	L503
 947  02df               L63:
 949  02df 9c            	rvf
 950  02e0 96            	ldw	x,sp
 951  02e1 1c0005        	addw	x,#OFST-3
 952  02e4 cd0000        	call	c_ltor
 954  02e7 ae000f        	ldw	x,#L42
 955  02ea cd0000        	call	c_lcmp
 957  02ed 2e60          	jrsge	L503
 958                     ; 172 		TM1650_write(TM1650_SEG2, 0x00);
 960  02ef ae6a00        	ldw	x,#27136
 961  02f2 cd00b7        	call	_TM1650_write
 963                     ; 173 		TM1650_write(TM1650_SEG3, (segment_code[(value / 10)] | 0x80));
 965  02f5 ae0000        	ldw	x,#L3_segment_code
 966  02f8 cd0000        	call	c_uitolx
 968  02fb 96            	ldw	x,sp
 969  02fc 1c0001        	addw	x,#OFST-7
 970  02ff cd0000        	call	c_rtol
 973  0302 96            	ldw	x,sp
 974  0303 1c0005        	addw	x,#OFST-3
 975  0306 cd0000        	call	c_ltor
 977  0309 ae0017        	ldw	x,#L03
 978  030c cd0000        	call	c_ldiv
 980  030f 96            	ldw	x,sp
 981  0310 1c0001        	addw	x,#OFST-7
 982  0313 cd0000        	call	c_ladd
 984  0316 be02          	ldw	x,c_lreg+2
 985  0318 f6            	ld	a,(x)
 986  0319 aa80          	or	a,#128
 987  031b ae6c00        	ldw	x,#27648
 988  031e 97            	ld	xl,a
 989  031f cd00b7        	call	_TM1650_write
 991                     ; 174 		TM1650_write(TM1650_SEG4, segment_code[(value % 10)]);
 993  0322 ae0000        	ldw	x,#L3_segment_code
 994  0325 cd0000        	call	c_uitolx
 996  0328 96            	ldw	x,sp
 997  0329 1c0001        	addw	x,#OFST-7
 998  032c cd0000        	call	c_rtol
1001  032f 96            	ldw	x,sp
1002  0330 1c0005        	addw	x,#OFST-3
1003  0333 cd0000        	call	c_ltor
1005  0336 ae0017        	ldw	x,#L03
1006  0339 cd0000        	call	c_lmod
1008  033c 96            	ldw	x,sp
1009  033d 1c0001        	addw	x,#OFST-7
1010  0340 cd0000        	call	c_ladd
1012  0343 be02          	ldw	x,c_lreg+2
1013  0345 f6            	ld	a,(x)
1014  0346 ae6e00        	ldw	x,#28160
1015  0349 97            	ld	xl,a
1016  034a cd00b7        	call	_TM1650_write
1019  034d 204d          	jra	L303
1020  034f               L503:
1021                     ; 177 	else if((value >= 0) && (value <= 9))
1023  034f 9c            	rvf
1024  0350 9c            	rvf
1025  0351 0d05          	tnz	(OFST-3,sp)
1026  0353 2f47          	jrslt	L303
1028  0355 9c            	rvf
1029  0356 96            	ldw	x,sp
1030  0357 1c0005        	addw	x,#OFST-3
1031  035a cd0000        	call	c_ltor
1033  035d ae0017        	ldw	x,#L03
1034  0360 cd0000        	call	c_lcmp
1036  0363 2e37          	jrsge	L303
1037                     ; 179 		TM1650_write(TM1650_SEG2, 0x00);
1039  0365 ae6a00        	ldw	x,#27136
1040  0368 cd00b7        	call	_TM1650_write
1042                     ; 180 		TM1650_write(TM1650_SEG3, (segment_code[0] | 0x80));
1044  036b ae6cbf        	ldw	x,#27839
1045  036e cd00b7        	call	_TM1650_write
1047                     ; 181 		TM1650_write(TM1650_SEG4, segment_code[(value % 10)]);
1049  0371 ae0000        	ldw	x,#L3_segment_code
1050  0374 cd0000        	call	c_uitolx
1052  0377 96            	ldw	x,sp
1053  0378 1c0001        	addw	x,#OFST-7
1054  037b cd0000        	call	c_rtol
1057  037e 96            	ldw	x,sp
1058  037f 1c0005        	addw	x,#OFST-3
1059  0382 cd0000        	call	c_ltor
1061  0385 ae0017        	ldw	x,#L03
1062  0388 cd0000        	call	c_lmod
1064  038b 96            	ldw	x,sp
1065  038c 1c0001        	addw	x,#OFST-7
1066  038f cd0000        	call	c_ladd
1068  0392 be02          	ldw	x,c_lreg+2
1069  0394 f6            	ld	a,(x)
1070  0395 ae6e00        	ldw	x,#28160
1071  0398 97            	ld	xl,a
1072  0399 cd00b7        	call	_TM1650_write
1074  039c               L303:
1075                     ; 183 }
1078  039c 5b08          	addw	sp,#8
1079  039e 81            	ret
1103                     ; 186 unsigned char TM1650_read_keys(void)
1103                     ; 187 {
1104                     	switch	.text
1105  039f               _TM1650_read_keys:
1109                     ; 188 	return (TM1650_read(TM1650_READ_KEY_MODE));
1111  039f a649          	ld	a,#73
1112  03a1 cd0067        	call	_TM1650_read
1116  03a4 81            	ret
1141                     	xdef	_TM1650_read_keys
1142                     	xdef	_TM1650_display_F
1143                     	xdef	_TM1650_display_I
1144                     	xdef	_TM1650_write
1145                     	xdef	_TM1650_read
1146                     	xdef	_TM1650_init
1147                     	xdef	_setup_I2C
1148                     	xdef	_setup_I2C_GPIO
1149                     	xref	_I2C_CheckEvent
1150                     	xref	_I2C_SendData
1151                     	xref	_I2C_Send7bitAddress
1152                     	xref	_I2C_ReceiveData
1153                     	xref	_I2C_AcknowledgeConfig
1154                     	xref	_I2C_GenerateSTOP
1155                     	xref	_I2C_GenerateSTART
1156                     	xref	_I2C_Cmd
1157                     	xref	_I2C_Init
1158                     	xref	_I2C_DeInit
1159                     	xref	_GPIO_Init
1160                     	xref	_GPIO_DeInit
1161                     	xref	_CLK_GetClockFreq
1162                     	switch	.const
1163  001b               L572:
1164  001b 41200000      	dc.w	16672,0
1165  001f               L162:
1166  001f c2c7cccc      	dc.w	-15673,-13108
1167  0023               L742:
1168  0023 42c7cccc      	dc.w	17095,-13108
1169                     	xref.b	c_lreg
1170                     	xref.b	c_x
1190                     	xref	c_lmod
1191                     	xref	c_ladd
1192                     	xref	c_uitolx
1193                     	xref	c_ldiv
1194                     	xref	c_lcmp
1195                     	xref	c_rtol
1196                     	xref	c_ftol
1197                     	xref	c_fmul
1198                     	xref	c_fgneg
1199                     	xref	c_fcmp
1200                     	xref	c_ltor
1201                     	xref	c_smodx
1202                     	xref	c_sdivx
1203                     	xref	c_ludv
1204                     	end
