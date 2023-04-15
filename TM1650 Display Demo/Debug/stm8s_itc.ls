   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.12 - 20 Jun 2018
   3                     ; Generator (Limited) V4.4.8 - 20 Jun 2018
  42                     ; 50 uint8_t ITC_GetCPUCC(void)
  42                     ; 51 {
  44                     	switch	.text
  45  0000               _ITC_GetCPUCC:
  49                     ; 53   _asm("push cc");
  52  0000 8a            push cc
  54                     ; 54   _asm("pop a");
  57  0001 84            pop a
  59                     ; 55   return; /* Ignore compiler warning, the returned value is in A register */
  62  0002 81            	ret
  85                     ; 80 void ITC_DeInit(void)
  85                     ; 81 {
  86                     	switch	.text
  87  0003               _ITC_DeInit:
  91                     ; 82   ITC->ISPR1 = ITC_SPRX_RESET_VALUE;
  93  0003 35ff7f70      	mov	32624,#255
  94                     ; 83   ITC->ISPR2 = ITC_SPRX_RESET_VALUE;
  96  0007 35ff7f71      	mov	32625,#255
  97                     ; 84   ITC->ISPR3 = ITC_SPRX_RESET_VALUE;
  99  000b 35ff7f72      	mov	32626,#255
 100                     ; 85   ITC->ISPR4 = ITC_SPRX_RESET_VALUE;
 102  000f 35ff7f73      	mov	32627,#255
 103                     ; 86   ITC->ISPR5 = ITC_SPRX_RESET_VALUE;
 105  0013 35ff7f74      	mov	32628,#255
 106                     ; 87   ITC->ISPR6 = ITC_SPRX_RESET_VALUE;
 108  0017 35ff7f75      	mov	32629,#255
 109                     ; 88   ITC->ISPR7 = ITC_SPRX_RESET_VALUE;
 111  001b 35ff7f76      	mov	32630,#255
 112                     ; 89   ITC->ISPR8 = ITC_SPRX_RESET_VALUE;
 114  001f 35ff7f77      	mov	32631,#255
 115                     ; 90 }
 118  0023 81            	ret
 143                     ; 97 uint8_t ITC_GetSoftIntStatus(void)
 143                     ; 98 {
 144                     	switch	.text
 145  0024               _ITC_GetSoftIntStatus:
 149                     ; 99   return (uint8_t)(ITC_GetCPUCC() & CPU_CC_I1I0);
 151  0024 adda          	call	_ITC_GetCPUCC
 153  0026 a428          	and	a,#40
 156  0028 81            	ret
 433                     .const:	section	.text
 434  0000               L22:
 435  0000 004c          	dc.w	L14
 436  0002 004c          	dc.w	L14
 437  0004 004c          	dc.w	L14
 438  0006 004c          	dc.w	L14
 439  0008 0055          	dc.w	L34
 440  000a 0055          	dc.w	L34
 441  000c 0055          	dc.w	L34
 442  000e 0055          	dc.w	L34
 443  0010 005e          	dc.w	L54
 444  0012 005e          	dc.w	L54
 445  0014 005e          	dc.w	L54
 446  0016 005e          	dc.w	L54
 447  0018 0067          	dc.w	L74
 448  001a 0067          	dc.w	L74
 449  001c 0067          	dc.w	L74
 450  001e 0067          	dc.w	L74
 451  0020 0070          	dc.w	L15
 452  0022 0070          	dc.w	L15
 453  0024 0070          	dc.w	L15
 454  0026 0070          	dc.w	L15
 455  0028 0079          	dc.w	L35
 456  002a 0079          	dc.w	L35
 457  002c 0079          	dc.w	L35
 458  002e 0079          	dc.w	L35
 459  0030 0082          	dc.w	L55
 460                     ; 107 ITC_PriorityLevel_TypeDef ITC_GetSoftwarePriority(ITC_Irq_TypeDef IrqNum)
 460                     ; 108 {
 461                     	switch	.text
 462  0029               _ITC_GetSoftwarePriority:
 464  0029 88            	push	a
 465  002a 89            	pushw	x
 466       00000002      OFST:	set	2
 469                     ; 109   uint8_t Value = 0;
 471  002b 0f02          	clr	(OFST+0,sp)
 473                     ; 110   uint8_t Mask = 0;
 475                     ; 113   assert_param(IS_ITC_IRQ_OK((uint8_t)IrqNum));
 477                     ; 116   Mask = (uint8_t)(0x03U << (((uint8_t)IrqNum % 4U) * 2U));
 479  002d a403          	and	a,#3
 480  002f 48            	sll	a
 481  0030 5f            	clrw	x
 482  0031 97            	ld	xl,a
 483  0032 a603          	ld	a,#3
 484  0034 5d            	tnzw	x
 485  0035 2704          	jreq	L41
 486  0037               L61:
 487  0037 48            	sll	a
 488  0038 5a            	decw	x
 489  0039 26fc          	jrne	L61
 490  003b               L41:
 491  003b 6b01          	ld	(OFST-1,sp),a
 493                     ; 118   switch (IrqNum)
 495  003d 7b03          	ld	a,(OFST+1,sp)
 497                     ; 198   default:
 497                     ; 199     break;
 498  003f a119          	cp	a,#25
 499  0041 2407          	jruge	L02
 500  0043 5f            	clrw	x
 501  0044 97            	ld	xl,a
 502  0045 58            	sllw	x
 503  0046 de0000        	ldw	x,(L22,x)
 504  0049 fc            	jp	(x)
 505  004a               L02:
 506  004a 203d          	jra	L312
 507  004c               L14:
 508                     ; 120   case ITC_IRQ_TLI: /* TLI software priority can be read but has no meaning */
 508                     ; 121   case ITC_IRQ_AWU:
 508                     ; 122   case ITC_IRQ_CLK:
 508                     ; 123   case ITC_IRQ_PORTA:
 508                     ; 124     Value = (uint8_t)(ITC->ISPR1 & Mask); /* Read software priority */
 510  004c c67f70        	ld	a,32624
 511  004f 1401          	and	a,(OFST-1,sp)
 512  0051 6b02          	ld	(OFST+0,sp),a
 514                     ; 125     break;
 516  0053 2034          	jra	L312
 517  0055               L34:
 518                     ; 127   case ITC_IRQ_PORTB:
 518                     ; 128   case ITC_IRQ_PORTC:
 518                     ; 129   case ITC_IRQ_PORTD:
 518                     ; 130   case ITC_IRQ_PORTE:
 518                     ; 131     Value = (uint8_t)(ITC->ISPR2 & Mask); /* Read software priority */
 520  0055 c67f71        	ld	a,32625
 521  0058 1401          	and	a,(OFST-1,sp)
 522  005a 6b02          	ld	(OFST+0,sp),a
 524                     ; 132     break;
 526  005c 202b          	jra	L312
 527  005e               L54:
 528                     ; 135   case ITC_IRQ_CAN_RX:
 528                     ; 136   case ITC_IRQ_CAN_TX:
 528                     ; 137 #endif /*STM8S208 or STM8AF52Ax */
 528                     ; 138 #if defined(STM8S903) || defined(STM8AF622x)
 528                     ; 139   case ITC_IRQ_PORTF:
 528                     ; 140 #endif /*STM8S903 or STM8AF622x */
 528                     ; 141   case ITC_IRQ_SPI:
 528                     ; 142   case ITC_IRQ_TIM1_OVF:
 528                     ; 143     Value = (uint8_t)(ITC->ISPR3 & Mask); /* Read software priority */
 530  005e c67f72        	ld	a,32626
 531  0061 1401          	and	a,(OFST-1,sp)
 532  0063 6b02          	ld	(OFST+0,sp),a
 534                     ; 144     break;
 536  0065 2022          	jra	L312
 537  0067               L74:
 538                     ; 146   case ITC_IRQ_TIM1_CAPCOM:
 538                     ; 147 #if defined (STM8S903) || defined (STM8AF622x)
 538                     ; 148   case ITC_IRQ_TIM5_OVFTRI:
 538                     ; 149   case ITC_IRQ_TIM5_CAPCOM:
 538                     ; 150 #else
 538                     ; 151   case ITC_IRQ_TIM2_OVF:
 538                     ; 152   case ITC_IRQ_TIM2_CAPCOM:
 538                     ; 153 #endif /* STM8S903 or STM8AF622x*/
 538                     ; 154   case ITC_IRQ_TIM3_OVF:
 538                     ; 155     Value = (uint8_t)(ITC->ISPR4 & Mask); /* Read software priority */
 540  0067 c67f73        	ld	a,32627
 541  006a 1401          	and	a,(OFST-1,sp)
 542  006c 6b02          	ld	(OFST+0,sp),a
 544                     ; 156     break;
 546  006e 2019          	jra	L312
 547  0070               L15:
 548                     ; 158   case ITC_IRQ_TIM3_CAPCOM:
 548                     ; 159 #if defined(STM8S208) ||defined(STM8S207) || defined (STM8S007) || defined(STM8S103) || \
 548                     ; 160     defined(STM8S003) ||defined(STM8S001) || defined (STM8S903) || defined (STM8AF52Ax) || defined (STM8AF62Ax)
 548                     ; 161   case ITC_IRQ_UART1_TX:
 548                     ; 162   case ITC_IRQ_UART1_RX:
 548                     ; 163 #endif /*STM8S208 or STM8S207 or STM8S007 or STM8S103 or STM8S003 or STM8S001 or STM8S903 or STM8AF52Ax or STM8AF62Ax */ 
 548                     ; 164 #if defined(STM8AF622x)
 548                     ; 165   case ITC_IRQ_UART4_TX:
 548                     ; 166   case ITC_IRQ_UART4_RX:
 548                     ; 167 #endif /*STM8AF622x */
 548                     ; 168   case ITC_IRQ_I2C:
 548                     ; 169     Value = (uint8_t)(ITC->ISPR5 & Mask); /* Read software priority */
 550  0070 c67f74        	ld	a,32628
 551  0073 1401          	and	a,(OFST-1,sp)
 552  0075 6b02          	ld	(OFST+0,sp),a
 554                     ; 170     break;
 556  0077 2010          	jra	L312
 557  0079               L35:
 558                     ; 178   case ITC_IRQ_UART3_TX:
 558                     ; 179   case ITC_IRQ_UART3_RX:
 558                     ; 180   case ITC_IRQ_ADC2:
 558                     ; 181 #endif /*STM8S208 or STM8S207 or STM8AF52Ax or STM8AF62Ax */
 558                     ; 182 #if defined(STM8S105) || defined(STM8S005) || defined(STM8S103) || defined(STM8S003) || \
 558                     ; 183     defined(STM8S001) || defined(STM8S903) || defined(STM8AF626x) || defined(STM8AF622x)
 558                     ; 184   case ITC_IRQ_ADC1:
 558                     ; 185 #endif /*STM8S105, STM8S005, STM8S103 or STM8S003 or STM8S001 or STM8S903 or STM8AF626x or STM8AF622x */
 558                     ; 186 #if defined (STM8S903) || defined (STM8AF622x)
 558                     ; 187   case ITC_IRQ_TIM6_OVFTRI:
 558                     ; 188 #else
 558                     ; 189   case ITC_IRQ_TIM4_OVF:
 558                     ; 190 #endif /*STM8S903 or STM8AF622x */
 558                     ; 191     Value = (uint8_t)(ITC->ISPR6 & Mask); /* Read software priority */
 560  0079 c67f75        	ld	a,32629
 561  007c 1401          	and	a,(OFST-1,sp)
 562  007e 6b02          	ld	(OFST+0,sp),a
 564                     ; 192     break;
 566  0080 2007          	jra	L312
 567  0082               L55:
 568                     ; 194   case ITC_IRQ_EEPROM_EEC:
 568                     ; 195     Value = (uint8_t)(ITC->ISPR7 & Mask); /* Read software priority */
 570  0082 c67f76        	ld	a,32630
 571  0085 1401          	and	a,(OFST-1,sp)
 572  0087 6b02          	ld	(OFST+0,sp),a
 574                     ; 196     break;
 576  0089               L75:
 577                     ; 198   default:
 577                     ; 199     break;
 579  0089               L312:
 580                     ; 202   Value >>= (uint8_t)(((uint8_t)IrqNum % 4u) * 2u);
 582  0089 7b03          	ld	a,(OFST+1,sp)
 583  008b a403          	and	a,#3
 584  008d 48            	sll	a
 585  008e 5f            	clrw	x
 586  008f 97            	ld	xl,a
 587  0090 7b02          	ld	a,(OFST+0,sp)
 588  0092 5d            	tnzw	x
 589  0093 2704          	jreq	L42
 590  0095               L62:
 591  0095 44            	srl	a
 592  0096 5a            	decw	x
 593  0097 26fc          	jrne	L62
 594  0099               L42:
 595  0099 6b02          	ld	(OFST+0,sp),a
 597                     ; 204   return((ITC_PriorityLevel_TypeDef)Value);
 599  009b 7b02          	ld	a,(OFST+0,sp)
 602  009d 5b03          	addw	sp,#3
 603  009f 81            	ret
 667                     	switch	.const
 668  0032               L44:
 669  0032 00d5          	dc.w	L512
 670  0034 00d5          	dc.w	L512
 671  0036 00d5          	dc.w	L512
 672  0038 00d5          	dc.w	L512
 673  003a 00e7          	dc.w	L712
 674  003c 00e7          	dc.w	L712
 675  003e 00e7          	dc.w	L712
 676  0040 00e7          	dc.w	L712
 677  0042 00f9          	dc.w	L122
 678  0044 00f9          	dc.w	L122
 679  0046 00f9          	dc.w	L122
 680  0048 00f9          	dc.w	L122
 681  004a 010b          	dc.w	L322
 682  004c 010b          	dc.w	L322
 683  004e 010b          	dc.w	L322
 684  0050 010b          	dc.w	L322
 685  0052 011d          	dc.w	L522
 686  0054 011d          	dc.w	L522
 687  0056 011d          	dc.w	L522
 688  0058 011d          	dc.w	L522
 689  005a 012f          	dc.w	L722
 690  005c 012f          	dc.w	L722
 691  005e 012f          	dc.w	L722
 692  0060 012f          	dc.w	L722
 693  0062 0141          	dc.w	L132
 694                     ; 220 void ITC_SetSoftwarePriority(ITC_Irq_TypeDef IrqNum, ITC_PriorityLevel_TypeDef PriorityValue)
 694                     ; 221 {
 695                     	switch	.text
 696  00a0               _ITC_SetSoftwarePriority:
 698  00a0 89            	pushw	x
 699  00a1 89            	pushw	x
 700       00000002      OFST:	set	2
 703                     ; 222   uint8_t Mask = 0;
 705                     ; 223   uint8_t NewPriority = 0;
 707                     ; 226   assert_param(IS_ITC_IRQ_OK((uint8_t)IrqNum));
 709                     ; 227   assert_param(IS_ITC_PRIORITY_OK(PriorityValue));
 711                     ; 230   assert_param(IS_ITC_INTERRUPTS_DISABLED);
 713                     ; 234   Mask = (uint8_t)(~(uint8_t)(0x03U << (((uint8_t)IrqNum % 4U) * 2U)));
 715  00a2 9e            	ld	a,xh
 716  00a3 a403          	and	a,#3
 717  00a5 48            	sll	a
 718  00a6 5f            	clrw	x
 719  00a7 97            	ld	xl,a
 720  00a8 a603          	ld	a,#3
 721  00aa 5d            	tnzw	x
 722  00ab 2704          	jreq	L23
 723  00ad               L43:
 724  00ad 48            	sll	a
 725  00ae 5a            	decw	x
 726  00af 26fc          	jrne	L43
 727  00b1               L23:
 728  00b1 43            	cpl	a
 729  00b2 6b01          	ld	(OFST-1,sp),a
 731                     ; 237   NewPriority = (uint8_t)((uint8_t)(PriorityValue) << (((uint8_t)IrqNum % 4U) * 2U));
 733  00b4 7b03          	ld	a,(OFST+1,sp)
 734  00b6 a403          	and	a,#3
 735  00b8 48            	sll	a
 736  00b9 5f            	clrw	x
 737  00ba 97            	ld	xl,a
 738  00bb 7b04          	ld	a,(OFST+2,sp)
 739  00bd 5d            	tnzw	x
 740  00be 2704          	jreq	L63
 741  00c0               L04:
 742  00c0 48            	sll	a
 743  00c1 5a            	decw	x
 744  00c2 26fc          	jrne	L04
 745  00c4               L63:
 746  00c4 6b02          	ld	(OFST+0,sp),a
 748                     ; 239   switch (IrqNum)
 750  00c6 7b03          	ld	a,(OFST+1,sp)
 752                     ; 329   default:
 752                     ; 330     break;
 753  00c8 a119          	cp	a,#25
 754  00ca 2407          	jruge	L24
 755  00cc 5f            	clrw	x
 756  00cd 97            	ld	xl,a
 757  00ce 58            	sllw	x
 758  00cf de0032        	ldw	x,(L44,x)
 759  00d2 fc            	jp	(x)
 760  00d3               L24:
 761  00d3 207c          	jra	L172
 762  00d5               L512:
 763                     ; 241   case ITC_IRQ_TLI: /* TLI software priority can be written but has no meaning */
 763                     ; 242   case ITC_IRQ_AWU:
 763                     ; 243   case ITC_IRQ_CLK:
 763                     ; 244   case ITC_IRQ_PORTA:
 763                     ; 245     ITC->ISPR1 &= Mask;
 765  00d5 c67f70        	ld	a,32624
 766  00d8 1401          	and	a,(OFST-1,sp)
 767  00da c77f70        	ld	32624,a
 768                     ; 246     ITC->ISPR1 |= NewPriority;
 770  00dd c67f70        	ld	a,32624
 771  00e0 1a02          	or	a,(OFST+0,sp)
 772  00e2 c77f70        	ld	32624,a
 773                     ; 247     break;
 775  00e5 206a          	jra	L172
 776  00e7               L712:
 777                     ; 249   case ITC_IRQ_PORTB:
 777                     ; 250   case ITC_IRQ_PORTC:
 777                     ; 251   case ITC_IRQ_PORTD:
 777                     ; 252   case ITC_IRQ_PORTE:
 777                     ; 253     ITC->ISPR2 &= Mask;
 779  00e7 c67f71        	ld	a,32625
 780  00ea 1401          	and	a,(OFST-1,sp)
 781  00ec c77f71        	ld	32625,a
 782                     ; 254     ITC->ISPR2 |= NewPriority;
 784  00ef c67f71        	ld	a,32625
 785  00f2 1a02          	or	a,(OFST+0,sp)
 786  00f4 c77f71        	ld	32625,a
 787                     ; 255     break;
 789  00f7 2058          	jra	L172
 790  00f9               L122:
 791                     ; 258   case ITC_IRQ_CAN_RX:
 791                     ; 259   case ITC_IRQ_CAN_TX:
 791                     ; 260 #endif /*STM8S208 or STM8AF52Ax */
 791                     ; 261 #if defined(STM8S903) || defined(STM8AF622x)
 791                     ; 262   case ITC_IRQ_PORTF:
 791                     ; 263 #endif /*STM8S903 or STM8AF622x */
 791                     ; 264   case ITC_IRQ_SPI:
 791                     ; 265   case ITC_IRQ_TIM1_OVF:
 791                     ; 266     ITC->ISPR3 &= Mask;
 793  00f9 c67f72        	ld	a,32626
 794  00fc 1401          	and	a,(OFST-1,sp)
 795  00fe c77f72        	ld	32626,a
 796                     ; 267     ITC->ISPR3 |= NewPriority;
 798  0101 c67f72        	ld	a,32626
 799  0104 1a02          	or	a,(OFST+0,sp)
 800  0106 c77f72        	ld	32626,a
 801                     ; 268     break;
 803  0109 2046          	jra	L172
 804  010b               L322:
 805                     ; 270   case ITC_IRQ_TIM1_CAPCOM:
 805                     ; 271 #if defined(STM8S903) || defined(STM8AF622x) 
 805                     ; 272   case ITC_IRQ_TIM5_OVFTRI:
 805                     ; 273   case ITC_IRQ_TIM5_CAPCOM:
 805                     ; 274 #else
 805                     ; 275   case ITC_IRQ_TIM2_OVF:
 805                     ; 276   case ITC_IRQ_TIM2_CAPCOM:
 805                     ; 277 #endif /*STM8S903 or STM8AF622x */
 805                     ; 278   case ITC_IRQ_TIM3_OVF:
 805                     ; 279     ITC->ISPR4 &= Mask;
 807  010b c67f73        	ld	a,32627
 808  010e 1401          	and	a,(OFST-1,sp)
 809  0110 c77f73        	ld	32627,a
 810                     ; 280     ITC->ISPR4 |= NewPriority;
 812  0113 c67f73        	ld	a,32627
 813  0116 1a02          	or	a,(OFST+0,sp)
 814  0118 c77f73        	ld	32627,a
 815                     ; 281     break;
 817  011b 2034          	jra	L172
 818  011d               L522:
 819                     ; 283   case ITC_IRQ_TIM3_CAPCOM:
 819                     ; 284 #if defined(STM8S208) ||defined(STM8S207) || defined (STM8S007) || defined(STM8S103) || \
 819                     ; 285     defined(STM8S001) ||defined(STM8S003) ||defined(STM8S903) || defined (STM8AF52Ax) || defined (STM8AF62Ax)
 819                     ; 286   case ITC_IRQ_UART1_TX:
 819                     ; 287   case ITC_IRQ_UART1_RX:
 819                     ; 288 #endif /*STM8S208 or STM8S207 or STM8S007 or STM8S103 or STM8S003 or STM8S001 or STM8S903 or STM8AF52Ax or STM8AF62Ax */ 
 819                     ; 289 #if defined(STM8AF622x)
 819                     ; 290   case ITC_IRQ_UART4_TX:
 819                     ; 291   case ITC_IRQ_UART4_RX:
 819                     ; 292 #endif /*STM8AF622x */
 819                     ; 293   case ITC_IRQ_I2C:
 819                     ; 294     ITC->ISPR5 &= Mask;
 821  011d c67f74        	ld	a,32628
 822  0120 1401          	and	a,(OFST-1,sp)
 823  0122 c77f74        	ld	32628,a
 824                     ; 295     ITC->ISPR5 |= NewPriority;
 826  0125 c67f74        	ld	a,32628
 827  0128 1a02          	or	a,(OFST+0,sp)
 828  012a c77f74        	ld	32628,a
 829                     ; 296     break;
 831  012d 2022          	jra	L172
 832  012f               L722:
 833                     ; 305   case ITC_IRQ_UART3_TX:
 833                     ; 306   case ITC_IRQ_UART3_RX:
 833                     ; 307   case ITC_IRQ_ADC2:
 833                     ; 308 #endif /*STM8S208 or STM8S207 or STM8AF52Ax or STM8AF62Ax */
 833                     ; 309     
 833                     ; 310 #if defined(STM8S105) || defined(STM8S005) || defined(STM8S103) || defined(STM8S003) || \
 833                     ; 311     defined(STM8S001) || defined(STM8S903) || defined(STM8AF626x) || defined (STM8AF622x)
 833                     ; 312   case ITC_IRQ_ADC1:
 833                     ; 313 #endif /*STM8S105, STM8S005, STM8S103 or STM8S003 or STM8S001 or STM8S903 or STM8AF626x or STM8AF622x */
 833                     ; 314     
 833                     ; 315 #if defined (STM8S903) || defined (STM8AF622x)
 833                     ; 316   case ITC_IRQ_TIM6_OVFTRI:
 833                     ; 317 #else
 833                     ; 318   case ITC_IRQ_TIM4_OVF:
 833                     ; 319 #endif /* STM8S903 or STM8AF622x */
 833                     ; 320     ITC->ISPR6 &= Mask;
 835  012f c67f75        	ld	a,32629
 836  0132 1401          	and	a,(OFST-1,sp)
 837  0134 c77f75        	ld	32629,a
 838                     ; 321     ITC->ISPR6 |= NewPriority;
 840  0137 c67f75        	ld	a,32629
 841  013a 1a02          	or	a,(OFST+0,sp)
 842  013c c77f75        	ld	32629,a
 843                     ; 322     break;
 845  013f 2010          	jra	L172
 846  0141               L132:
 847                     ; 324   case ITC_IRQ_EEPROM_EEC:
 847                     ; 325     ITC->ISPR7 &= Mask;
 849  0141 c67f76        	ld	a,32630
 850  0144 1401          	and	a,(OFST-1,sp)
 851  0146 c77f76        	ld	32630,a
 852                     ; 326     ITC->ISPR7 |= NewPriority;
 854  0149 c67f76        	ld	a,32630
 855  014c 1a02          	or	a,(OFST+0,sp)
 856  014e c77f76        	ld	32630,a
 857                     ; 327     break;
 859  0151               L332:
 860                     ; 329   default:
 860                     ; 330     break;
 862  0151               L172:
 863                     ; 332 }
 866  0151 5b04          	addw	sp,#4
 867  0153 81            	ret
 880                     	xdef	_ITC_GetSoftwarePriority
 881                     	xdef	_ITC_SetSoftwarePriority
 882                     	xdef	_ITC_GetSoftIntStatus
 883                     	xdef	_ITC_DeInit
 884                     	xdef	_ITC_GetCPUCC
 903                     	end
