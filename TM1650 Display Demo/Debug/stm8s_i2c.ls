   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.12 - 20 Jun 2018
   3                     ; Generator (Limited) V4.4.8 - 20 Jun 2018
  42                     ; 67 void I2C_DeInit(void)
  42                     ; 68 {
  44                     	switch	.text
  45  0000               _I2C_DeInit:
  49                     ; 69   I2C->CR1 = I2C_CR1_RESET_VALUE;
  51  0000 725f5210      	clr	21008
  52                     ; 70   I2C->CR2 = I2C_CR2_RESET_VALUE;
  54  0004 725f5211      	clr	21009
  55                     ; 71   I2C->FREQR = I2C_FREQR_RESET_VALUE;
  57  0008 725f5212      	clr	21010
  58                     ; 72   I2C->OARL = I2C_OARL_RESET_VALUE;
  60  000c 725f5213      	clr	21011
  61                     ; 73   I2C->OARH = I2C_OARH_RESET_VALUE;
  63  0010 725f5214      	clr	21012
  64                     ; 74   I2C->ITR = I2C_ITR_RESET_VALUE;
  66  0014 725f521a      	clr	21018
  67                     ; 75   I2C->CCRL = I2C_CCRL_RESET_VALUE;
  69  0018 725f521b      	clr	21019
  70                     ; 76   I2C->CCRH = I2C_CCRH_RESET_VALUE;
  72  001c 725f521c      	clr	21020
  73                     ; 77   I2C->TRISER = I2C_TRISER_RESET_VALUE;
  75  0020 3502521d      	mov	21021,#2
  76                     ; 78 }
  79  0024 81            	ret
 258                     .const:	section	.text
 259  0000               L01:
 260  0000 000186a1      	dc.l	100001
 261                     ; 96 void I2C_Init(uint32_t OutputClockFrequencyHz, uint16_t OwnAddress, 
 261                     ; 97               I2C_DutyCycle_TypeDef I2C_DutyCycle, I2C_Ack_TypeDef Ack, 
 261                     ; 98               I2C_AddMode_TypeDef AddMode, uint8_t InputClockFrequencyMHz )
 261                     ; 99 {
 262                     	switch	.text
 263  0025               _I2C_Init:
 265  0025 520d          	subw	sp,#13
 266       0000000d      OFST:	set	13
 269                     ; 100   uint16_t result = 0x0004;
 271                     ; 101   uint16_t tmpval = 0;
 273                     ; 102   uint8_t tmpccrh = 0;
 275  0027 0f0b          	clr	(OFST-2,sp)
 277                     ; 105   assert_param(IS_I2C_ACK_OK(Ack));
 279                     ; 106   assert_param(IS_I2C_ADDMODE_OK(AddMode));
 281                     ; 107   assert_param(IS_I2C_OWN_ADDRESS_OK(OwnAddress));
 283                     ; 108   assert_param(IS_I2C_DUTYCYCLE_OK(I2C_DutyCycle));  
 285                     ; 109   assert_param(IS_I2C_INPUT_CLOCK_FREQ_OK(InputClockFrequencyMHz));
 287                     ; 110   assert_param(IS_I2C_OUTPUT_CLOCK_FREQ_OK(OutputClockFrequencyHz));
 289                     ; 115   I2C->FREQR &= (uint8_t)(~I2C_FREQR_FREQ);
 291  0029 c65212        	ld	a,21010
 292  002c a4c0          	and	a,#192
 293  002e c75212        	ld	21010,a
 294                     ; 117   I2C->FREQR |= InputClockFrequencyMHz;
 296  0031 c65212        	ld	a,21010
 297  0034 1a19          	or	a,(OFST+12,sp)
 298  0036 c75212        	ld	21010,a
 299                     ; 121   I2C->CR1 &= (uint8_t)(~I2C_CR1_PE);
 301  0039 72115210      	bres	21008,#0
 302                     ; 124   I2C->CCRH &= (uint8_t)(~(I2C_CCRH_FS | I2C_CCRH_DUTY | I2C_CCRH_CCR));
 304  003d c6521c        	ld	a,21020
 305  0040 a430          	and	a,#48
 306  0042 c7521c        	ld	21020,a
 307                     ; 125   I2C->CCRL &= (uint8_t)(~I2C_CCRL_CCR);
 309  0045 725f521b      	clr	21019
 310                     ; 128   if (OutputClockFrequencyHz > I2C_MAX_STANDARD_FREQ) /* FAST MODE */
 312  0049 96            	ldw	x,sp
 313  004a 1c0010        	addw	x,#OFST+3
 314  004d cd0000        	call	c_ltor
 316  0050 ae0000        	ldw	x,#L01
 317  0053 cd0000        	call	c_lcmp
 319  0056 2403          	jruge	L21
 320  0058 cc010b        	jp	L131
 321  005b               L21:
 322                     ; 131     tmpccrh = I2C_CCRH_FS;
 324  005b a680          	ld	a,#128
 325  005d 6b0b          	ld	(OFST-2,sp),a
 327                     ; 133     if (I2C_DutyCycle == I2C_DUTYCYCLE_2)
 329  005f 0d16          	tnz	(OFST+9,sp)
 330  0061 2642          	jrne	L331
 331                     ; 136       result = (uint16_t) ((InputClockFrequencyMHz * 1000000) / (OutputClockFrequencyHz * 3));
 333  0063 96            	ldw	x,sp
 334  0064 1c0010        	addw	x,#OFST+3
 335  0067 cd0000        	call	c_ltor
 337  006a a603          	ld	a,#3
 338  006c cd0000        	call	c_smul
 340  006f 96            	ldw	x,sp
 341  0070 1c0005        	addw	x,#OFST-8
 342  0073 cd0000        	call	c_rtol
 345  0076 7b19          	ld	a,(OFST+12,sp)
 346  0078 b703          	ld	c_lreg+3,a
 347  007a 3f02          	clr	c_lreg+2
 348  007c 3f01          	clr	c_lreg+1
 349  007e 3f00          	clr	c_lreg
 350  0080 96            	ldw	x,sp
 351  0081 1c0001        	addw	x,#OFST-12
 352  0084 cd0000        	call	c_rtol
 355  0087 ae4240        	ldw	x,#16960
 356  008a bf02          	ldw	c_lreg+2,x
 357  008c ae000f        	ldw	x,#15
 358  008f bf00          	ldw	c_lreg,x
 359  0091 96            	ldw	x,sp
 360  0092 1c0001        	addw	x,#OFST-12
 361  0095 cd0000        	call	c_lmul
 363  0098 96            	ldw	x,sp
 364  0099 1c0005        	addw	x,#OFST-8
 365  009c cd0000        	call	c_ludv
 367  009f be02          	ldw	x,c_lreg+2
 368  00a1 1f0c          	ldw	(OFST-1,sp),x
 371  00a3 2046          	jra	L531
 372  00a5               L331:
 373                     ; 141       result = (uint16_t) ((InputClockFrequencyMHz * 1000000) / (OutputClockFrequencyHz * 25));
 375  00a5 96            	ldw	x,sp
 376  00a6 1c0010        	addw	x,#OFST+3
 377  00a9 cd0000        	call	c_ltor
 379  00ac a619          	ld	a,#25
 380  00ae cd0000        	call	c_smul
 382  00b1 96            	ldw	x,sp
 383  00b2 1c0005        	addw	x,#OFST-8
 384  00b5 cd0000        	call	c_rtol
 387  00b8 7b19          	ld	a,(OFST+12,sp)
 388  00ba b703          	ld	c_lreg+3,a
 389  00bc 3f02          	clr	c_lreg+2
 390  00be 3f01          	clr	c_lreg+1
 391  00c0 3f00          	clr	c_lreg
 392  00c2 96            	ldw	x,sp
 393  00c3 1c0001        	addw	x,#OFST-12
 394  00c6 cd0000        	call	c_rtol
 397  00c9 ae4240        	ldw	x,#16960
 398  00cc bf02          	ldw	c_lreg+2,x
 399  00ce ae000f        	ldw	x,#15
 400  00d1 bf00          	ldw	c_lreg,x
 401  00d3 96            	ldw	x,sp
 402  00d4 1c0001        	addw	x,#OFST-12
 403  00d7 cd0000        	call	c_lmul
 405  00da 96            	ldw	x,sp
 406  00db 1c0005        	addw	x,#OFST-8
 407  00de cd0000        	call	c_ludv
 409  00e1 be02          	ldw	x,c_lreg+2
 410  00e3 1f0c          	ldw	(OFST-1,sp),x
 412                     ; 143       tmpccrh |= I2C_CCRH_DUTY;
 414  00e5 7b0b          	ld	a,(OFST-2,sp)
 415  00e7 aa40          	or	a,#64
 416  00e9 6b0b          	ld	(OFST-2,sp),a
 418  00eb               L531:
 419                     ; 147     if (result < (uint16_t)0x01)
 421  00eb 1e0c          	ldw	x,(OFST-1,sp)
 422  00ed 2605          	jrne	L731
 423                     ; 150       result = (uint16_t)0x0001;
 425  00ef ae0001        	ldw	x,#1
 426  00f2 1f0c          	ldw	(OFST-1,sp),x
 428  00f4               L731:
 429                     ; 156     tmpval = ((InputClockFrequencyMHz * 3) / 10) + 1;
 431  00f4 ae0003        	ldw	x,#3
 432  00f7 7b19          	ld	a,(OFST+12,sp)
 433  00f9 cd0000        	call	c_bmulx
 435  00fc a60a          	ld	a,#10
 436  00fe cd0000        	call	c_sdivx
 438  0101 5c            	incw	x
 439  0102 1f09          	ldw	(OFST-4,sp),x
 441                     ; 157     I2C->TRISER = (uint8_t)tmpval;
 443  0104 7b0a          	ld	a,(OFST-3,sp)
 444  0106 c7521d        	ld	21021,a
 446  0109 2055          	jra	L141
 447  010b               L131:
 448                     ; 164     result = (uint16_t)((InputClockFrequencyMHz * 1000000) / (OutputClockFrequencyHz << (uint8_t)1));
 450  010b 96            	ldw	x,sp
 451  010c 1c0010        	addw	x,#OFST+3
 452  010f cd0000        	call	c_ltor
 454  0112 3803          	sll	c_lreg+3
 455  0114 3902          	rlc	c_lreg+2
 456  0116 3901          	rlc	c_lreg+1
 457  0118 3900          	rlc	c_lreg
 458  011a 96            	ldw	x,sp
 459  011b 1c0005        	addw	x,#OFST-8
 460  011e cd0000        	call	c_rtol
 463  0121 7b19          	ld	a,(OFST+12,sp)
 464  0123 b703          	ld	c_lreg+3,a
 465  0125 3f02          	clr	c_lreg+2
 466  0127 3f01          	clr	c_lreg+1
 467  0129 3f00          	clr	c_lreg
 468  012b 96            	ldw	x,sp
 469  012c 1c0001        	addw	x,#OFST-12
 470  012f cd0000        	call	c_rtol
 473  0132 ae4240        	ldw	x,#16960
 474  0135 bf02          	ldw	c_lreg+2,x
 475  0137 ae000f        	ldw	x,#15
 476  013a bf00          	ldw	c_lreg,x
 477  013c 96            	ldw	x,sp
 478  013d 1c0001        	addw	x,#OFST-12
 479  0140 cd0000        	call	c_lmul
 481  0143 96            	ldw	x,sp
 482  0144 1c0005        	addw	x,#OFST-8
 483  0147 cd0000        	call	c_ludv
 485  014a be02          	ldw	x,c_lreg+2
 486  014c 1f0c          	ldw	(OFST-1,sp),x
 488                     ; 167     if (result < (uint16_t)0x0004)
 490  014e 1e0c          	ldw	x,(OFST-1,sp)
 491  0150 a30004        	cpw	x,#4
 492  0153 2405          	jruge	L341
 493                     ; 170       result = (uint16_t)0x0004;
 495  0155 ae0004        	ldw	x,#4
 496  0158 1f0c          	ldw	(OFST-1,sp),x
 498  015a               L341:
 499                     ; 176     I2C->TRISER = (uint8_t)(InputClockFrequencyMHz + (uint8_t)1);
 501  015a 7b19          	ld	a,(OFST+12,sp)
 502  015c 4c            	inc	a
 503  015d c7521d        	ld	21021,a
 504  0160               L141:
 505                     ; 181   I2C->CCRL = (uint8_t)result;
 507  0160 7b0d          	ld	a,(OFST+0,sp)
 508  0162 c7521b        	ld	21019,a
 509                     ; 182   I2C->CCRH = (uint8_t)((uint8_t)((uint8_t)(result >> 8) & I2C_CCRH_CCR) | tmpccrh);
 511  0165 7b0c          	ld	a,(OFST-1,sp)
 512  0167 a40f          	and	a,#15
 513  0169 1a0b          	or	a,(OFST-2,sp)
 514  016b c7521c        	ld	21020,a
 515                     ; 185   I2C->CR1 |= I2C_CR1_PE;
 517  016e 72105210      	bset	21008,#0
 518                     ; 188   I2C_AcknowledgeConfig(Ack);
 520  0172 7b17          	ld	a,(OFST+10,sp)
 521  0174 ad71          	call	_I2C_AcknowledgeConfig
 523                     ; 191   I2C->OARL = (uint8_t)(OwnAddress);
 525  0176 7b15          	ld	a,(OFST+8,sp)
 526  0178 c75213        	ld	21011,a
 527                     ; 192   I2C->OARH = (uint8_t)((uint8_t)(AddMode | I2C_OARH_ADDCONF) |
 527                     ; 193                    (uint8_t)((OwnAddress & (uint16_t)0x0300) >> (uint8_t)7));
 529  017b 1e14          	ldw	x,(OFST+7,sp)
 530  017d 4f            	clr	a
 531  017e 01            	rrwa	x,a
 532  017f 48            	sll	a
 533  0180 59            	rlcw	x
 534  0181 01            	rrwa	x,a
 535  0182 a406          	and	a,#6
 536  0184 5f            	clrw	x
 537  0185 6b08          	ld	(OFST-5,sp),a
 539  0187 7b18          	ld	a,(OFST+11,sp)
 540  0189 aa40          	or	a,#64
 541  018b 1a08          	or	a,(OFST-5,sp)
 542  018d c75214        	ld	21012,a
 543                     ; 194 }
 546  0190 5b0d          	addw	sp,#13
 547  0192 81            	ret
 602                     ; 202 void I2C_Cmd(FunctionalState NewState)
 602                     ; 203 {
 603                     	switch	.text
 604  0193               _I2C_Cmd:
 608                     ; 205   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 610                     ; 207   if (NewState != DISABLE)
 612  0193 4d            	tnz	a
 613  0194 2706          	jreq	L371
 614                     ; 210     I2C->CR1 |= I2C_CR1_PE;
 616  0196 72105210      	bset	21008,#0
 618  019a 2004          	jra	L571
 619  019c               L371:
 620                     ; 215     I2C->CR1 &= (uint8_t)(~I2C_CR1_PE);
 622  019c 72115210      	bres	21008,#0
 623  01a0               L571:
 624                     ; 217 }
 627  01a0 81            	ret
 662                     ; 225 void I2C_GeneralCallCmd(FunctionalState NewState)
 662                     ; 226 {
 663                     	switch	.text
 664  01a1               _I2C_GeneralCallCmd:
 668                     ; 228   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 670                     ; 230   if (NewState != DISABLE)
 672  01a1 4d            	tnz	a
 673  01a2 2706          	jreq	L512
 674                     ; 233     I2C->CR1 |= I2C_CR1_ENGC;
 676  01a4 721c5210      	bset	21008,#6
 678  01a8 2004          	jra	L712
 679  01aa               L512:
 680                     ; 238     I2C->CR1 &= (uint8_t)(~I2C_CR1_ENGC);
 682  01aa 721d5210      	bres	21008,#6
 683  01ae               L712:
 684                     ; 240 }
 687  01ae 81            	ret
 722                     ; 250 void I2C_GenerateSTART(FunctionalState NewState)
 722                     ; 251 {
 723                     	switch	.text
 724  01af               _I2C_GenerateSTART:
 728                     ; 253   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 730                     ; 255   if (NewState != DISABLE)
 732  01af 4d            	tnz	a
 733  01b0 2706          	jreq	L732
 734                     ; 258     I2C->CR2 |= I2C_CR2_START;
 736  01b2 72105211      	bset	21009,#0
 738  01b6 2004          	jra	L142
 739  01b8               L732:
 740                     ; 263     I2C->CR2 &= (uint8_t)(~I2C_CR2_START);
 742  01b8 72115211      	bres	21009,#0
 743  01bc               L142:
 744                     ; 265 }
 747  01bc 81            	ret
 782                     ; 273 void I2C_GenerateSTOP(FunctionalState NewState)
 782                     ; 274 {
 783                     	switch	.text
 784  01bd               _I2C_GenerateSTOP:
 788                     ; 276   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 790                     ; 278   if (NewState != DISABLE)
 792  01bd 4d            	tnz	a
 793  01be 2706          	jreq	L162
 794                     ; 281     I2C->CR2 |= I2C_CR2_STOP;
 796  01c0 72125211      	bset	21009,#1
 798  01c4 2004          	jra	L362
 799  01c6               L162:
 800                     ; 286     I2C->CR2 &= (uint8_t)(~I2C_CR2_STOP);
 802  01c6 72135211      	bres	21009,#1
 803  01ca               L362:
 804                     ; 288 }
 807  01ca 81            	ret
 843                     ; 296 void I2C_SoftwareResetCmd(FunctionalState NewState)
 843                     ; 297 {
 844                     	switch	.text
 845  01cb               _I2C_SoftwareResetCmd:
 849                     ; 299   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 851                     ; 301   if (NewState != DISABLE)
 853  01cb 4d            	tnz	a
 854  01cc 2706          	jreq	L303
 855                     ; 304     I2C->CR2 |= I2C_CR2_SWRST;
 857  01ce 721e5211      	bset	21009,#7
 859  01d2 2004          	jra	L503
 860  01d4               L303:
 861                     ; 309     I2C->CR2 &= (uint8_t)(~I2C_CR2_SWRST);
 863  01d4 721f5211      	bres	21009,#7
 864  01d8               L503:
 865                     ; 311 }
 868  01d8 81            	ret
 904                     ; 320 void I2C_StretchClockCmd(FunctionalState NewState)
 904                     ; 321 {
 905                     	switch	.text
 906  01d9               _I2C_StretchClockCmd:
 910                     ; 323   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 912                     ; 325   if (NewState != DISABLE)
 914  01d9 4d            	tnz	a
 915  01da 2706          	jreq	L523
 916                     ; 328     I2C->CR1 &= (uint8_t)(~I2C_CR1_NOSTRETCH);
 918  01dc 721f5210      	bres	21008,#7
 920  01e0 2004          	jra	L723
 921  01e2               L523:
 922                     ; 334     I2C->CR1 |= I2C_CR1_NOSTRETCH;
 924  01e2 721e5210      	bset	21008,#7
 925  01e6               L723:
 926                     ; 336 }
 929  01e6 81            	ret
 965                     ; 345 void I2C_AcknowledgeConfig(I2C_Ack_TypeDef Ack)
 965                     ; 346 {
 966                     	switch	.text
 967  01e7               _I2C_AcknowledgeConfig:
 969  01e7 88            	push	a
 970       00000000      OFST:	set	0
 973                     ; 348   assert_param(IS_I2C_ACK_OK(Ack));
 975                     ; 350   if (Ack == I2C_ACK_NONE)
 977  01e8 4d            	tnz	a
 978  01e9 2606          	jrne	L743
 979                     ; 353     I2C->CR2 &= (uint8_t)(~I2C_CR2_ACK);
 981  01eb 72155211      	bres	21009,#2
 983  01ef 2014          	jra	L153
 984  01f1               L743:
 985                     ; 358     I2C->CR2 |= I2C_CR2_ACK;
 987  01f1 72145211      	bset	21009,#2
 988                     ; 360     if (Ack == I2C_ACK_CURR)
 990  01f5 7b01          	ld	a,(OFST+1,sp)
 991  01f7 a101          	cp	a,#1
 992  01f9 2606          	jrne	L353
 993                     ; 363       I2C->CR2 &= (uint8_t)(~I2C_CR2_POS);
 995  01fb 72175211      	bres	21009,#3
 997  01ff 2004          	jra	L153
 998  0201               L353:
 999                     ; 368       I2C->CR2 |= I2C_CR2_POS;
1001  0201 72165211      	bset	21009,#3
1002  0205               L153:
1003                     ; 371 }
1006  0205 84            	pop	a
1007  0206 81            	ret
1079                     ; 381 void I2C_ITConfig(I2C_IT_TypeDef I2C_IT, FunctionalState NewState)
1079                     ; 382 {
1080                     	switch	.text
1081  0207               _I2C_ITConfig:
1083  0207 89            	pushw	x
1084       00000000      OFST:	set	0
1087                     ; 384   assert_param(IS_I2C_INTERRUPT_OK(I2C_IT));
1089                     ; 385   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1091                     ; 387   if (NewState != DISABLE)
1093  0208 9f            	ld	a,xl
1094  0209 4d            	tnz	a
1095  020a 2709          	jreq	L314
1096                     ; 390     I2C->ITR |= (uint8_t)I2C_IT;
1098  020c 9e            	ld	a,xh
1099  020d ca521a        	or	a,21018
1100  0210 c7521a        	ld	21018,a
1102  0213 2009          	jra	L514
1103  0215               L314:
1104                     ; 395     I2C->ITR &= (uint8_t)(~(uint8_t)I2C_IT);
1106  0215 7b01          	ld	a,(OFST+1,sp)
1107  0217 43            	cpl	a
1108  0218 c4521a        	and	a,21018
1109  021b c7521a        	ld	21018,a
1110  021e               L514:
1111                     ; 397 }
1114  021e 85            	popw	x
1115  021f 81            	ret
1151                     ; 405 void I2C_FastModeDutyCycleConfig(I2C_DutyCycle_TypeDef I2C_DutyCycle)
1151                     ; 406 {
1152                     	switch	.text
1153  0220               _I2C_FastModeDutyCycleConfig:
1157                     ; 408   assert_param(IS_I2C_DUTYCYCLE_OK(I2C_DutyCycle));
1159                     ; 410   if (I2C_DutyCycle == I2C_DUTYCYCLE_16_9)
1161  0220 a140          	cp	a,#64
1162  0222 2606          	jrne	L534
1163                     ; 413     I2C->CCRH |= I2C_CCRH_DUTY;
1165  0224 721c521c      	bset	21020,#6
1167  0228 2004          	jra	L734
1168  022a               L534:
1169                     ; 418     I2C->CCRH &= (uint8_t)(~I2C_CCRH_DUTY);
1171  022a 721d521c      	bres	21020,#6
1172  022e               L734:
1173                     ; 420 }
1176  022e 81            	ret
1199                     ; 427 uint8_t I2C_ReceiveData(void)
1199                     ; 428 {
1200                     	switch	.text
1201  022f               _I2C_ReceiveData:
1205                     ; 430   return ((uint8_t)I2C->DR);
1207  022f c65216        	ld	a,21014
1210  0232 81            	ret
1275                     ; 440 void I2C_Send7bitAddress(uint8_t Address, I2C_Direction_TypeDef Direction)
1275                     ; 441 {
1276                     	switch	.text
1277  0233               _I2C_Send7bitAddress:
1279  0233 89            	pushw	x
1280       00000000      OFST:	set	0
1283                     ; 443   assert_param(IS_I2C_ADDRESS_OK(Address));
1285                     ; 444   assert_param(IS_I2C_DIRECTION_OK(Direction));
1287                     ; 447   Address &= (uint8_t)0xFE;
1289  0234 7b01          	ld	a,(OFST+1,sp)
1290  0236 a4fe          	and	a,#254
1291  0238 6b01          	ld	(OFST+1,sp),a
1292                     ; 450   I2C->DR = (uint8_t)(Address | (uint8_t)Direction);
1294  023a 7b01          	ld	a,(OFST+1,sp)
1295  023c 1a02          	or	a,(OFST+2,sp)
1296  023e c75216        	ld	21014,a
1297                     ; 451 }
1300  0241 85            	popw	x
1301  0242 81            	ret
1335                     ; 458 void I2C_SendData(uint8_t Data)
1335                     ; 459 {
1336                     	switch	.text
1337  0243               _I2C_SendData:
1341                     ; 461   I2C->DR = Data;
1343  0243 c75216        	ld	21014,a
1344                     ; 462 }
1347  0246 81            	ret
1571                     ; 578 ErrorStatus I2C_CheckEvent(I2C_Event_TypeDef I2C_Event)
1571                     ; 579 {
1572                     	switch	.text
1573  0247               _I2C_CheckEvent:
1575  0247 89            	pushw	x
1576  0248 5206          	subw	sp,#6
1577       00000006      OFST:	set	6
1580                     ; 580   __IO uint16_t lastevent = 0x00;
1582  024a 5f            	clrw	x
1583  024b 1f04          	ldw	(OFST-2,sp),x
1585                     ; 581   uint8_t flag1 = 0x00 ;
1587                     ; 582   uint8_t flag2 = 0x00;
1589                     ; 583   ErrorStatus status = ERROR;
1591                     ; 586   assert_param(IS_I2C_EVENT_OK(I2C_Event));
1593                     ; 588   if (I2C_Event == I2C_EVENT_SLAVE_ACK_FAILURE)
1595  024d 1e07          	ldw	x,(OFST+1,sp)
1596  024f a30004        	cpw	x,#4
1597  0252 260b          	jrne	L136
1598                     ; 590     lastevent = I2C->SR2 & I2C_SR2_AF;
1600  0254 c65218        	ld	a,21016
1601  0257 a404          	and	a,#4
1602  0259 5f            	clrw	x
1603  025a 97            	ld	xl,a
1604  025b 1f04          	ldw	(OFST-2,sp),x
1607  025d 201f          	jra	L336
1608  025f               L136:
1609                     ; 594     flag1 = I2C->SR1;
1611  025f c65217        	ld	a,21015
1612  0262 6b03          	ld	(OFST-3,sp),a
1614                     ; 595     flag2 = I2C->SR3;
1616  0264 c65219        	ld	a,21017
1617  0267 6b06          	ld	(OFST+0,sp),a
1619                     ; 596     lastevent = ((uint16_t)((uint16_t)flag2 << (uint16_t)8) | (uint16_t)flag1);
1621  0269 7b03          	ld	a,(OFST-3,sp)
1622  026b 5f            	clrw	x
1623  026c 97            	ld	xl,a
1624  026d 1f01          	ldw	(OFST-5,sp),x
1626  026f 7b06          	ld	a,(OFST+0,sp)
1627  0271 5f            	clrw	x
1628  0272 97            	ld	xl,a
1629  0273 4f            	clr	a
1630  0274 02            	rlwa	x,a
1631  0275 01            	rrwa	x,a
1632  0276 1a02          	or	a,(OFST-4,sp)
1633  0278 01            	rrwa	x,a
1634  0279 1a01          	or	a,(OFST-5,sp)
1635  027b 01            	rrwa	x,a
1636  027c 1f04          	ldw	(OFST-2,sp),x
1638  027e               L336:
1639                     ; 599   if (((uint16_t)lastevent & (uint16_t)I2C_Event) == (uint16_t)I2C_Event)
1641  027e 1e04          	ldw	x,(OFST-2,sp)
1642  0280 01            	rrwa	x,a
1643  0281 1408          	and	a,(OFST+2,sp)
1644  0283 01            	rrwa	x,a
1645  0284 1407          	and	a,(OFST+1,sp)
1646  0286 01            	rrwa	x,a
1647  0287 1307          	cpw	x,(OFST+1,sp)
1648  0289 2606          	jrne	L536
1649                     ; 602     status = SUCCESS;
1651  028b a601          	ld	a,#1
1652  028d 6b06          	ld	(OFST+0,sp),a
1655  028f 2002          	jra	L736
1656  0291               L536:
1657                     ; 607     status = ERROR;
1659  0291 0f06          	clr	(OFST+0,sp)
1661  0293               L736:
1662                     ; 611   return status;
1664  0293 7b06          	ld	a,(OFST+0,sp)
1667  0295 5b08          	addw	sp,#8
1668  0297 81            	ret
1721                     ; 628 I2C_Event_TypeDef I2C_GetLastEvent(void)
1721                     ; 629 {
1722                     	switch	.text
1723  0298               _I2C_GetLastEvent:
1725  0298 5206          	subw	sp,#6
1726       00000006      OFST:	set	6
1729                     ; 630   __IO uint16_t lastevent = 0;
1731  029a 5f            	clrw	x
1732  029b 1f05          	ldw	(OFST-1,sp),x
1734                     ; 631   uint16_t flag1 = 0;
1736                     ; 632   uint16_t flag2 = 0;
1738                     ; 634   if ((I2C->SR2 & I2C_SR2_AF) != 0x00)
1740  029d c65218        	ld	a,21016
1741  02a0 a504          	bcp	a,#4
1742  02a2 2707          	jreq	L766
1743                     ; 636     lastevent = I2C_EVENT_SLAVE_ACK_FAILURE;
1745  02a4 ae0004        	ldw	x,#4
1746  02a7 1f05          	ldw	(OFST-1,sp),x
1749  02a9 201b          	jra	L176
1750  02ab               L766:
1751                     ; 641     flag1 = I2C->SR1;
1753  02ab c65217        	ld	a,21015
1754  02ae 5f            	clrw	x
1755  02af 97            	ld	xl,a
1756  02b0 1f01          	ldw	(OFST-5,sp),x
1758                     ; 642     flag2 = I2C->SR3;
1760  02b2 c65219        	ld	a,21017
1761  02b5 5f            	clrw	x
1762  02b6 97            	ld	xl,a
1763  02b7 1f03          	ldw	(OFST-3,sp),x
1765                     ; 645     lastevent = ((uint16_t)((uint16_t)flag2 << 8) | (uint16_t)flag1);
1767  02b9 1e03          	ldw	x,(OFST-3,sp)
1768  02bb 4f            	clr	a
1769  02bc 02            	rlwa	x,a
1770  02bd 01            	rrwa	x,a
1771  02be 1a02          	or	a,(OFST-4,sp)
1772  02c0 01            	rrwa	x,a
1773  02c1 1a01          	or	a,(OFST-5,sp)
1774  02c3 01            	rrwa	x,a
1775  02c4 1f05          	ldw	(OFST-1,sp),x
1777  02c6               L176:
1778                     ; 648   return (I2C_Event_TypeDef)lastevent;
1780  02c6 1e05          	ldw	x,(OFST-1,sp)
1783  02c8 5b06          	addw	sp,#6
1784  02ca 81            	ret
1999                     ; 679 FlagStatus I2C_GetFlagStatus(I2C_Flag_TypeDef I2C_Flag)
1999                     ; 680 {
2000                     	switch	.text
2001  02cb               _I2C_GetFlagStatus:
2003  02cb 89            	pushw	x
2004  02cc 89            	pushw	x
2005       00000002      OFST:	set	2
2008                     ; 681   uint8_t tempreg = 0;
2010  02cd 0f02          	clr	(OFST+0,sp)
2012                     ; 682   uint8_t regindex = 0;
2014                     ; 683   FlagStatus bitstatus = RESET;
2016                     ; 686   assert_param(IS_I2C_FLAG_OK(I2C_Flag));
2018                     ; 689   regindex = (uint8_t)((uint16_t)I2C_Flag >> 8);
2020  02cf 9e            	ld	a,xh
2021  02d0 6b01          	ld	(OFST-1,sp),a
2023                     ; 691   switch (regindex)
2025  02d2 7b01          	ld	a,(OFST-1,sp)
2027                     ; 708     default:
2027                     ; 709       break;
2028  02d4 4a            	dec	a
2029  02d5 2708          	jreq	L376
2030  02d7 4a            	dec	a
2031  02d8 270c          	jreq	L576
2032  02da 4a            	dec	a
2033  02db 2710          	jreq	L776
2034  02dd 2013          	jra	L3101
2035  02df               L376:
2036                     ; 694     case 0x01:
2036                     ; 695       tempreg = (uint8_t)I2C->SR1;
2038  02df c65217        	ld	a,21015
2039  02e2 6b02          	ld	(OFST+0,sp),a
2041                     ; 696       break;
2043  02e4 200c          	jra	L3101
2044  02e6               L576:
2045                     ; 699     case 0x02:
2045                     ; 700       tempreg = (uint8_t)I2C->SR2;
2047  02e6 c65218        	ld	a,21016
2048  02e9 6b02          	ld	(OFST+0,sp),a
2050                     ; 701       break;
2052  02eb 2005          	jra	L3101
2053  02ed               L776:
2054                     ; 704     case 0x03:
2054                     ; 705       tempreg = (uint8_t)I2C->SR3;
2056  02ed c65219        	ld	a,21017
2057  02f0 6b02          	ld	(OFST+0,sp),a
2059                     ; 706       break;
2061  02f2               L107:
2062                     ; 708     default:
2062                     ; 709       break;
2064  02f2               L3101:
2065                     ; 713   if ((tempreg & (uint8_t)I2C_Flag ) != 0)
2067  02f2 7b04          	ld	a,(OFST+2,sp)
2068  02f4 1502          	bcp	a,(OFST+0,sp)
2069  02f6 2706          	jreq	L5101
2070                     ; 716     bitstatus = SET;
2072  02f8 a601          	ld	a,#1
2073  02fa 6b02          	ld	(OFST+0,sp),a
2076  02fc 2002          	jra	L7101
2077  02fe               L5101:
2078                     ; 721     bitstatus = RESET;
2080  02fe 0f02          	clr	(OFST+0,sp)
2082  0300               L7101:
2083                     ; 724   return bitstatus;
2085  0300 7b02          	ld	a,(OFST+0,sp)
2088  0302 5b04          	addw	sp,#4
2089  0304 81            	ret
2133                     ; 759 void I2C_ClearFlag(I2C_Flag_TypeDef I2C_FLAG)
2133                     ; 760 {
2134                     	switch	.text
2135  0305               _I2C_ClearFlag:
2137  0305 89            	pushw	x
2138       00000002      OFST:	set	2
2141                     ; 761   uint16_t flagpos = 0;
2143                     ; 763   assert_param(IS_I2C_CLEAR_FLAG_OK(I2C_FLAG));
2145                     ; 766   flagpos = (uint16_t)I2C_FLAG & FLAG_Mask;
2147  0306 01            	rrwa	x,a
2148  0307 a4ff          	and	a,#255
2149  0309 5f            	clrw	x
2150  030a 02            	rlwa	x,a
2151  030b 1f01          	ldw	(OFST-1,sp),x
2152  030d 01            	rrwa	x,a
2154                     ; 768   I2C->SR2 = (uint8_t)((uint16_t)(~flagpos));
2156  030e 7b02          	ld	a,(OFST+0,sp)
2157  0310 43            	cpl	a
2158  0311 c75218        	ld	21016,a
2159                     ; 769 }
2162  0314 85            	popw	x
2163  0315 81            	ret
2329                     ; 791 ITStatus I2C_GetITStatus(I2C_ITPendingBit_TypeDef I2C_ITPendingBit)
2329                     ; 792 {
2330                     	switch	.text
2331  0316               _I2C_GetITStatus:
2333  0316 89            	pushw	x
2334  0317 5204          	subw	sp,#4
2335       00000004      OFST:	set	4
2338                     ; 793   ITStatus bitstatus = RESET;
2340                     ; 794   __IO uint8_t enablestatus = 0;
2342  0319 0f03          	clr	(OFST-1,sp)
2344                     ; 795   uint16_t tempregister = 0;
2346                     ; 798     assert_param(IS_I2C_ITPENDINGBIT_OK(I2C_ITPendingBit));
2348                     ; 800   tempregister = (uint8_t)( ((uint16_t)((uint16_t)I2C_ITPendingBit & ITEN_Mask)) >> 8);
2350  031b 9e            	ld	a,xh
2351  031c a407          	and	a,#7
2352  031e 5f            	clrw	x
2353  031f 97            	ld	xl,a
2354  0320 1f01          	ldw	(OFST-3,sp),x
2356                     ; 803   enablestatus = (uint8_t)(I2C->ITR & ( uint8_t)tempregister);
2358  0322 c6521a        	ld	a,21018
2359  0325 1402          	and	a,(OFST-2,sp)
2360  0327 6b03          	ld	(OFST-1,sp),a
2362                     ; 805   if ((uint16_t)((uint16_t)I2C_ITPendingBit & REGISTER_Mask) == REGISTER_SR1_Index)
2364  0329 7b05          	ld	a,(OFST+1,sp)
2365  032b 97            	ld	xl,a
2366  032c 7b06          	ld	a,(OFST+2,sp)
2367  032e 9f            	ld	a,xl
2368  032f a430          	and	a,#48
2369  0331 97            	ld	xl,a
2370  0332 4f            	clr	a
2371  0333 02            	rlwa	x,a
2372  0334 a30100        	cpw	x,#256
2373  0337 2615          	jrne	L1311
2374                     ; 808     if (((I2C->SR1 & (uint8_t)I2C_ITPendingBit) != RESET) && enablestatus)
2376  0339 c65217        	ld	a,21015
2377  033c 1506          	bcp	a,(OFST+2,sp)
2378  033e 270a          	jreq	L3311
2380  0340 0d03          	tnz	(OFST-1,sp)
2381  0342 2706          	jreq	L3311
2382                     ; 811       bitstatus = SET;
2384  0344 a601          	ld	a,#1
2385  0346 6b04          	ld	(OFST+0,sp),a
2388  0348 2017          	jra	L7311
2389  034a               L3311:
2390                     ; 816       bitstatus = RESET;
2392  034a 0f04          	clr	(OFST+0,sp)
2394  034c 2013          	jra	L7311
2395  034e               L1311:
2396                     ; 822     if (((I2C->SR2 & (uint8_t)I2C_ITPendingBit) != RESET) && enablestatus)
2398  034e c65218        	ld	a,21016
2399  0351 1506          	bcp	a,(OFST+2,sp)
2400  0353 270a          	jreq	L1411
2402  0355 0d03          	tnz	(OFST-1,sp)
2403  0357 2706          	jreq	L1411
2404                     ; 825       bitstatus = SET;
2406  0359 a601          	ld	a,#1
2407  035b 6b04          	ld	(OFST+0,sp),a
2410  035d 2002          	jra	L7311
2411  035f               L1411:
2412                     ; 830       bitstatus = RESET;
2414  035f 0f04          	clr	(OFST+0,sp)
2416  0361               L7311:
2417                     ; 834   return  bitstatus;
2419  0361 7b04          	ld	a,(OFST+0,sp)
2422  0363 5b06          	addw	sp,#6
2423  0365 81            	ret
2468                     ; 871 void I2C_ClearITPendingBit(I2C_ITPendingBit_TypeDef I2C_ITPendingBit)
2468                     ; 872 {
2469                     	switch	.text
2470  0366               _I2C_ClearITPendingBit:
2472  0366 89            	pushw	x
2473       00000002      OFST:	set	2
2476                     ; 873   uint16_t flagpos = 0;
2478                     ; 876   assert_param(IS_I2C_CLEAR_ITPENDINGBIT_OK(I2C_ITPendingBit));
2480                     ; 879   flagpos = (uint16_t)I2C_ITPendingBit & FLAG_Mask;
2482  0367 01            	rrwa	x,a
2483  0368 a4ff          	and	a,#255
2484  036a 5f            	clrw	x
2485  036b 02            	rlwa	x,a
2486  036c 1f01          	ldw	(OFST-1,sp),x
2487  036e 01            	rrwa	x,a
2489                     ; 882   I2C->SR2 = (uint8_t)((uint16_t)~flagpos);
2491  036f 7b02          	ld	a,(OFST+0,sp)
2492  0371 43            	cpl	a
2493  0372 c75218        	ld	21016,a
2494                     ; 883 }
2497  0375 85            	popw	x
2498  0376 81            	ret
2511                     	xdef	_I2C_ClearITPendingBit
2512                     	xdef	_I2C_GetITStatus
2513                     	xdef	_I2C_ClearFlag
2514                     	xdef	_I2C_GetFlagStatus
2515                     	xdef	_I2C_GetLastEvent
2516                     	xdef	_I2C_CheckEvent
2517                     	xdef	_I2C_SendData
2518                     	xdef	_I2C_Send7bitAddress
2519                     	xdef	_I2C_ReceiveData
2520                     	xdef	_I2C_ITConfig
2521                     	xdef	_I2C_FastModeDutyCycleConfig
2522                     	xdef	_I2C_AcknowledgeConfig
2523                     	xdef	_I2C_StretchClockCmd
2524                     	xdef	_I2C_SoftwareResetCmd
2525                     	xdef	_I2C_GenerateSTOP
2526                     	xdef	_I2C_GenerateSTART
2527                     	xdef	_I2C_GeneralCallCmd
2528                     	xdef	_I2C_Cmd
2529                     	xdef	_I2C_Init
2530                     	xdef	_I2C_DeInit
2531                     	xref.b	c_lreg
2532                     	xref.b	c_x
2551                     	xref	c_sdivx
2552                     	xref	c_bmulx
2553                     	xref	c_ludv
2554                     	xref	c_smul
2555                     	xref	c_lmul
2556                     	xref	c_rtol
2557                     	xref	c_lcmp
2558                     	xref	c_ltor
2559                     	end
