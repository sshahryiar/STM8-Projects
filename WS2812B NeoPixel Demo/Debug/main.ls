   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.9 - 08 Feb 2017
   3                     ; Generator (Limited) V4.4.6 - 08 Feb 2017
  58                     ; 8 void main(void)
  58                     ; 9 {
  60                     	switch	.text
  61  0000               _main:
  63  0000 88            	push	a
  64       00000001      OFST:	set	1
  67                     ; 10 	unsigned char i = 0;
  69                     ; 12 	clock_setup();
  71  0001 cd0781        	call	_clock_setup
  73                     ; 13 	WS2812B_init();
  75  0004 cd0000        	call	_WS2812B_init
  77  0007               L72:
  78                     ; 17 		WS2812B_reset();
  80  0007 cd0000        	call	_WS2812B_reset
  82                     ; 18 		for(i = 0; i < number_of_LEDs; i++)
  84  000a 0f01          	clr	(OFST+0,sp)
  86  000c               L33:
  87                     ; 20 			WS2812B_set_colour_on_channel(i, 255, 0, 0);
  89  000c 4b00          	push	#0
  90  000e 4b00          	push	#0
  91  0010 7b03          	ld	a,(OFST+2,sp)
  92  0012 ae00ff        	ldw	x,#255
  93  0015 95            	ld	xh,a
  94  0016 cd0000        	call	_WS2812B_set_colour_on_channel
  96  0019 85            	popw	x
  97                     ; 21 			delay_ms(160);
  99  001a ae00a0        	ldw	x,#160
 100  001d cd0000        	call	_delay_ms
 102                     ; 18 		for(i = 0; i < number_of_LEDs; i++)
 104  0020 0c01          	inc	(OFST+0,sp)
 108  0022 7b01          	ld	a,(OFST+0,sp)
 109  0024 a108          	cp	a,#8
 110  0026 25e4          	jrult	L33
 111                     ; 24 		WS2812B_reset();
 113  0028 cd0000        	call	_WS2812B_reset
 115                     ; 25 		for(i = 0; i < number_of_LEDs; i++)
 117  002b 0f01          	clr	(OFST+0,sp)
 119  002d               L14:
 120                     ; 27 			WS2812B_set_colour_on_channel(i, 0, 255, 0);
 122  002d 4b00          	push	#0
 123  002f 4bff          	push	#255
 124  0031 7b03          	ld	a,(OFST+2,sp)
 125  0033 5f            	clrw	x
 126  0034 95            	ld	xh,a
 127  0035 cd0000        	call	_WS2812B_set_colour_on_channel
 129  0038 85            	popw	x
 130                     ; 28 			delay_ms(160);
 132  0039 ae00a0        	ldw	x,#160
 133  003c cd0000        	call	_delay_ms
 135                     ; 25 		for(i = 0; i < number_of_LEDs; i++)
 137  003f 0c01          	inc	(OFST+0,sp)
 141  0041 7b01          	ld	a,(OFST+0,sp)
 142  0043 a108          	cp	a,#8
 143  0045 25e6          	jrult	L14
 144                     ; 31 		WS2812B_reset();
 146  0047 cd0000        	call	_WS2812B_reset
 148                     ; 32 		for(i = 0; i < number_of_LEDs; i++)
 150  004a 0f01          	clr	(OFST+0,sp)
 152  004c               L74:
 153                     ; 34 			WS2812B_set_colour_on_channel(i, 0, 0, 255);
 155  004c 4bff          	push	#255
 156  004e 4b00          	push	#0
 157  0050 7b03          	ld	a,(OFST+2,sp)
 158  0052 5f            	clrw	x
 159  0053 95            	ld	xh,a
 160  0054 cd0000        	call	_WS2812B_set_colour_on_channel
 162  0057 85            	popw	x
 163                     ; 35 			delay_ms(160);
 165  0058 ae00a0        	ldw	x,#160
 166  005b cd0000        	call	_delay_ms
 168                     ; 32 		for(i = 0; i < number_of_LEDs; i++)
 170  005e 0c01          	inc	(OFST+0,sp)
 174  0060 7b01          	ld	a,(OFST+0,sp)
 175  0062 a108          	cp	a,#8
 176  0064 25e6          	jrult	L74
 177                     ; 38 		WS2812B_reset();
 179  0066 cd0000        	call	_WS2812B_reset
 181                     ; 39 		for(i = 0; i < number_of_LEDs; i++)
 183  0069 0f01          	clr	(OFST+0,sp)
 185  006b               L55:
 186                     ; 41 			WS2812B_set_colour_on_channel(i, 255, 0, 255);
 188  006b 4bff          	push	#255
 189  006d 4b00          	push	#0
 190  006f 7b03          	ld	a,(OFST+2,sp)
 191  0071 ae00ff        	ldw	x,#255
 192  0074 95            	ld	xh,a
 193  0075 cd0000        	call	_WS2812B_set_colour_on_channel
 195  0078 85            	popw	x
 196                     ; 42 			delay_ms(160);
 198  0079 ae00a0        	ldw	x,#160
 199  007c cd0000        	call	_delay_ms
 201                     ; 39 		for(i = 0; i < number_of_LEDs; i++)
 203  007f 0c01          	inc	(OFST+0,sp)
 207  0081 7b01          	ld	a,(OFST+0,sp)
 208  0083 a108          	cp	a,#8
 209  0085 25e4          	jrult	L55
 210                     ; 45 		WS2812B_reset();
 212  0087 cd0000        	call	_WS2812B_reset
 214                     ; 46 		for(i = 0; i < number_of_LEDs; i++)
 216  008a 0f01          	clr	(OFST+0,sp)
 218  008c               L36:
 219                     ; 48 			WS2812B_set_colour_on_channel(i, 0, 255, 255);
 221  008c 4bff          	push	#255
 222  008e 4bff          	push	#255
 223  0090 7b03          	ld	a,(OFST+2,sp)
 224  0092 5f            	clrw	x
 225  0093 95            	ld	xh,a
 226  0094 cd0000        	call	_WS2812B_set_colour_on_channel
 228  0097 85            	popw	x
 229                     ; 49 		    delay_ms(160);
 231  0098 ae00a0        	ldw	x,#160
 232  009b cd0000        	call	_delay_ms
 234                     ; 46 		for(i = 0; i < number_of_LEDs; i++)
 236  009e 0c01          	inc	(OFST+0,sp)
 240  00a0 7b01          	ld	a,(OFST+0,sp)
 241  00a2 a108          	cp	a,#8
 242  00a4 25e6          	jrult	L36
 243                     ; 52 		WS2812B_reset();
 245  00a6 cd0000        	call	_WS2812B_reset
 247                     ; 53 		for(i = 0; i < number_of_LEDs; i++)
 249  00a9 0f01          	clr	(OFST+0,sp)
 251  00ab               L17:
 252                     ; 55 			WS2812B_set_colour_on_channel(i, 255, 255, 0);
 254  00ab 4b00          	push	#0
 255  00ad 4bff          	push	#255
 256  00af 7b03          	ld	a,(OFST+2,sp)
 257  00b1 ae00ff        	ldw	x,#255
 258  00b4 95            	ld	xh,a
 259  00b5 cd0000        	call	_WS2812B_set_colour_on_channel
 261  00b8 85            	popw	x
 262                     ; 56 			delay_ms(160);
 264  00b9 ae00a0        	ldw	x,#160
 265  00bc cd0000        	call	_delay_ms
 267                     ; 53 		for(i = 0; i < number_of_LEDs; i++)
 269  00bf 0c01          	inc	(OFST+0,sp)
 273  00c1 7b01          	ld	a,(OFST+0,sp)
 274  00c3 a108          	cp	a,#8
 275  00c5 25e4          	jrult	L17
 276                     ; 59 		WS2812B_reset();
 278  00c7 cd0000        	call	_WS2812B_reset
 280                     ; 60 		for(i = 0; i < number_of_LEDs; i++)
 282  00ca 0f01          	clr	(OFST+0,sp)
 284  00cc               L77:
 285                     ; 62 		    WS2812B_set_colour_on_channel(i, 255, 255, 255);
 287  00cc 4bff          	push	#255
 288  00ce 4bff          	push	#255
 289  00d0 7b03          	ld	a,(OFST+2,sp)
 290  00d2 ae00ff        	ldw	x,#255
 291  00d5 95            	ld	xh,a
 292  00d6 cd0000        	call	_WS2812B_set_colour_on_channel
 294  00d9 85            	popw	x
 295                     ; 63 		    delay_ms(160);
 297  00da ae00a0        	ldw	x,#160
 298  00dd cd0000        	call	_delay_ms
 300                     ; 60 		for(i = 0; i < number_of_LEDs; i++)
 302  00e0 0c01          	inc	(OFST+0,sp)
 306  00e2 7b01          	ld	a,(OFST+0,sp)
 307  00e4 a108          	cp	a,#8
 308  00e6 25e4          	jrult	L77
 309                     ; 66 		WS2812B_reset();
 311  00e8 cd0000        	call	_WS2812B_reset
 313                     ; 67 		for(i = 0; i < number_of_LEDs; i++)
 315  00eb 0f01          	clr	(OFST+0,sp)
 317  00ed               L501:
 318                     ; 69 			WS2812B_set_colour_on_channel((i - 1), 0, 0, 0);
 320  00ed 4b00          	push	#0
 321  00ef 4b00          	push	#0
 322  00f1 7b03          	ld	a,(OFST+2,sp)
 323  00f3 4a            	dec	a
 324  00f4 5f            	clrw	x
 325  00f5 95            	ld	xh,a
 326  00f6 cd0000        	call	_WS2812B_set_colour_on_channel
 328  00f9 85            	popw	x
 329                     ; 70 			WS2812B_set_colour_on_channel(i, 255, 0, 0);
 331  00fa 4b00          	push	#0
 332  00fc 4b00          	push	#0
 333  00fe 7b03          	ld	a,(OFST+2,sp)
 334  0100 ae00ff        	ldw	x,#255
 335  0103 95            	ld	xh,a
 336  0104 cd0000        	call	_WS2812B_set_colour_on_channel
 338  0107 85            	popw	x
 339                     ; 71 			delay_ms(160);
 341  0108 ae00a0        	ldw	x,#160
 342  010b cd0000        	call	_delay_ms
 344                     ; 67 		for(i = 0; i < number_of_LEDs; i++)
 346  010e 0c01          	inc	(OFST+0,sp)
 350  0110 7b01          	ld	a,(OFST+0,sp)
 351  0112 a108          	cp	a,#8
 352  0114 25d7          	jrult	L501
 353                     ; 74 		WS2812B_reset();
 355  0116 cd0000        	call	_WS2812B_reset
 357                     ; 75 		for(i = 0; i < number_of_LEDs; i++)
 359  0119 0f01          	clr	(OFST+0,sp)
 361  011b               L311:
 362                     ; 77 			WS2812B_set_colour_on_channel((i - 1), 0, 0, 0);
 364  011b 4b00          	push	#0
 365  011d 4b00          	push	#0
 366  011f 7b03          	ld	a,(OFST+2,sp)
 367  0121 4a            	dec	a
 368  0122 5f            	clrw	x
 369  0123 95            	ld	xh,a
 370  0124 cd0000        	call	_WS2812B_set_colour_on_channel
 372  0127 85            	popw	x
 373                     ; 78 			WS2812B_set_colour_on_channel(i, 0, 255, 0);
 375  0128 4b00          	push	#0
 376  012a 4bff          	push	#255
 377  012c 7b03          	ld	a,(OFST+2,sp)
 378  012e 5f            	clrw	x
 379  012f 95            	ld	xh,a
 380  0130 cd0000        	call	_WS2812B_set_colour_on_channel
 382  0133 85            	popw	x
 383                     ; 79 			delay_ms(160);
 385  0134 ae00a0        	ldw	x,#160
 386  0137 cd0000        	call	_delay_ms
 388                     ; 75 		for(i = 0; i < number_of_LEDs; i++)
 390  013a 0c01          	inc	(OFST+0,sp)
 394  013c 7b01          	ld	a,(OFST+0,sp)
 395  013e a108          	cp	a,#8
 396  0140 25d9          	jrult	L311
 397                     ; 82 		WS2812B_reset();
 399  0142 cd0000        	call	_WS2812B_reset
 401                     ; 83 		for(i = 0; i < number_of_LEDs; i++)
 403  0145 0f01          	clr	(OFST+0,sp)
 405  0147               L121:
 406                     ; 85 			WS2812B_set_colour_on_channel((i - 1), 0, 0, 0);
 408  0147 4b00          	push	#0
 409  0149 4b00          	push	#0
 410  014b 7b03          	ld	a,(OFST+2,sp)
 411  014d 4a            	dec	a
 412  014e 5f            	clrw	x
 413  014f 95            	ld	xh,a
 414  0150 cd0000        	call	_WS2812B_set_colour_on_channel
 416  0153 85            	popw	x
 417                     ; 86 			WS2812B_set_colour_on_channel(i, 0, 0, 255);
 419  0154 4bff          	push	#255
 420  0156 4b00          	push	#0
 421  0158 7b03          	ld	a,(OFST+2,sp)
 422  015a 5f            	clrw	x
 423  015b 95            	ld	xh,a
 424  015c cd0000        	call	_WS2812B_set_colour_on_channel
 426  015f 85            	popw	x
 427                     ; 87 			delay_ms(160);
 429  0160 ae00a0        	ldw	x,#160
 430  0163 cd0000        	call	_delay_ms
 432                     ; 83 		for(i = 0; i < number_of_LEDs; i++)
 434  0166 0c01          	inc	(OFST+0,sp)
 438  0168 7b01          	ld	a,(OFST+0,sp)
 439  016a a108          	cp	a,#8
 440  016c 25d9          	jrult	L121
 441                     ; 90 		WS2812B_reset();
 443  016e cd0000        	call	_WS2812B_reset
 445                     ; 91 		for(i = 0; i < number_of_LEDs; i++)
 447  0171 0f01          	clr	(OFST+0,sp)
 449  0173               L721:
 450                     ; 93 			WS2812B_set_colour_on_channel((i - 1), 0, 0, 0);
 452  0173 4b00          	push	#0
 453  0175 4b00          	push	#0
 454  0177 7b03          	ld	a,(OFST+2,sp)
 455  0179 4a            	dec	a
 456  017a 5f            	clrw	x
 457  017b 95            	ld	xh,a
 458  017c cd0000        	call	_WS2812B_set_colour_on_channel
 460  017f 85            	popw	x
 461                     ; 94 			WS2812B_set_colour_on_channel(i, 255, 0, 255);
 463  0180 4bff          	push	#255
 464  0182 4b00          	push	#0
 465  0184 7b03          	ld	a,(OFST+2,sp)
 466  0186 ae00ff        	ldw	x,#255
 467  0189 95            	ld	xh,a
 468  018a cd0000        	call	_WS2812B_set_colour_on_channel
 470  018d 85            	popw	x
 471                     ; 95 			delay_ms(160);
 473  018e ae00a0        	ldw	x,#160
 474  0191 cd0000        	call	_delay_ms
 476                     ; 91 		for(i = 0; i < number_of_LEDs; i++)
 478  0194 0c01          	inc	(OFST+0,sp)
 482  0196 7b01          	ld	a,(OFST+0,sp)
 483  0198 a108          	cp	a,#8
 484  019a 25d7          	jrult	L721
 485                     ; 98 		WS2812B_reset();
 487  019c cd0000        	call	_WS2812B_reset
 489                     ; 99 		for(i = 0; i < number_of_LEDs; i++)
 491  019f 0f01          	clr	(OFST+0,sp)
 493  01a1               L531:
 494                     ; 101 			WS2812B_set_colour_on_channel((i - 1), 0, 0, 0);
 496  01a1 4b00          	push	#0
 497  01a3 4b00          	push	#0
 498  01a5 7b03          	ld	a,(OFST+2,sp)
 499  01a7 4a            	dec	a
 500  01a8 5f            	clrw	x
 501  01a9 95            	ld	xh,a
 502  01aa cd0000        	call	_WS2812B_set_colour_on_channel
 504  01ad 85            	popw	x
 505                     ; 102 			WS2812B_set_colour_on_channel(i, 0, 255, 255);
 507  01ae 4bff          	push	#255
 508  01b0 4bff          	push	#255
 509  01b2 7b03          	ld	a,(OFST+2,sp)
 510  01b4 5f            	clrw	x
 511  01b5 95            	ld	xh,a
 512  01b6 cd0000        	call	_WS2812B_set_colour_on_channel
 514  01b9 85            	popw	x
 515                     ; 103 		    delay_ms(160);
 517  01ba ae00a0        	ldw	x,#160
 518  01bd cd0000        	call	_delay_ms
 520                     ; 99 		for(i = 0; i < number_of_LEDs; i++)
 522  01c0 0c01          	inc	(OFST+0,sp)
 526  01c2 7b01          	ld	a,(OFST+0,sp)
 527  01c4 a108          	cp	a,#8
 528  01c6 25d9          	jrult	L531
 529                     ; 106 		WS2812B_reset();
 531  01c8 cd0000        	call	_WS2812B_reset
 533                     ; 107 		for(i = 0; i < number_of_LEDs; i++)
 535  01cb 0f01          	clr	(OFST+0,sp)
 537  01cd               L341:
 538                     ; 109 			WS2812B_set_colour_on_channel((i - 1), 0, 0, 0);
 540  01cd 4b00          	push	#0
 541  01cf 4b00          	push	#0
 542  01d1 7b03          	ld	a,(OFST+2,sp)
 543  01d3 4a            	dec	a
 544  01d4 5f            	clrw	x
 545  01d5 95            	ld	xh,a
 546  01d6 cd0000        	call	_WS2812B_set_colour_on_channel
 548  01d9 85            	popw	x
 549                     ; 110 			WS2812B_set_colour_on_channel(i, 255, 255, 0);
 551  01da 4b00          	push	#0
 552  01dc 4bff          	push	#255
 553  01de 7b03          	ld	a,(OFST+2,sp)
 554  01e0 ae00ff        	ldw	x,#255
 555  01e3 95            	ld	xh,a
 556  01e4 cd0000        	call	_WS2812B_set_colour_on_channel
 558  01e7 85            	popw	x
 559                     ; 111 			delay_ms(160);
 561  01e8 ae00a0        	ldw	x,#160
 562  01eb cd0000        	call	_delay_ms
 564                     ; 107 		for(i = 0; i < number_of_LEDs; i++)
 566  01ee 0c01          	inc	(OFST+0,sp)
 570  01f0 7b01          	ld	a,(OFST+0,sp)
 571  01f2 a108          	cp	a,#8
 572  01f4 25d7          	jrult	L341
 573                     ; 114 		WS2812B_reset();
 575  01f6 cd0000        	call	_WS2812B_reset
 577                     ; 115 		for(i = 0; i < number_of_LEDs; i++)
 579  01f9 0f01          	clr	(OFST+0,sp)
 581  01fb               L151:
 582                     ; 117 			WS2812B_set_colour_on_channel((i - 1), 0, 0, 0);
 584  01fb 4b00          	push	#0
 585  01fd 4b00          	push	#0
 586  01ff 7b03          	ld	a,(OFST+2,sp)
 587  0201 4a            	dec	a
 588  0202 5f            	clrw	x
 589  0203 95            	ld	xh,a
 590  0204 cd0000        	call	_WS2812B_set_colour_on_channel
 592  0207 85            	popw	x
 593                     ; 118 		    WS2812B_set_colour_on_channel(i, 255, 255, 255);
 595  0208 4bff          	push	#255
 596  020a 4bff          	push	#255
 597  020c 7b03          	ld	a,(OFST+2,sp)
 598  020e ae00ff        	ldw	x,#255
 599  0211 95            	ld	xh,a
 600  0212 cd0000        	call	_WS2812B_set_colour_on_channel
 602  0215 85            	popw	x
 603                     ; 119 		    delay_ms(160);
 605  0216 ae00a0        	ldw	x,#160
 606  0219 cd0000        	call	_delay_ms
 608                     ; 115 		for(i = 0; i < number_of_LEDs; i++)
 610  021c 0c01          	inc	(OFST+0,sp)
 614  021e 7b01          	ld	a,(OFST+0,sp)
 615  0220 a108          	cp	a,#8
 616  0222 25d7          	jrult	L151
 617                     ; 122 		WS2812B_reset();
 619  0224 cd0000        	call	_WS2812B_reset
 621                     ; 123 		for(i = 0; i < 4; i++)
 623  0227 0f01          	clr	(OFST+0,sp)
 625  0229               L751:
 626                     ; 125 			WS2812B_set_colour_on_channel(0, 0, 0, 200);
 628  0229 4bc8          	push	#200
 629  022b 4b00          	push	#0
 630  022d 5f            	clrw	x
 631  022e cd0000        	call	_WS2812B_set_colour_on_channel
 633  0231 85            	popw	x
 634                     ; 126 			delay_ms(220);
 636  0232 ae00dc        	ldw	x,#220
 637  0235 cd0000        	call	_delay_ms
 639                     ; 127 			WS2812B_set_colour_on_channel(1, 0, 0, 200);
 641  0238 4bc8          	push	#200
 642  023a 4b00          	push	#0
 643  023c ae0100        	ldw	x,#256
 644  023f cd0000        	call	_WS2812B_set_colour_on_channel
 646  0242 85            	popw	x
 647                     ; 128 			WS2812B_set_colour_on_channel(7, 0, 0, 200);
 649  0243 4bc8          	push	#200
 650  0245 4b00          	push	#0
 651  0247 ae0700        	ldw	x,#1792
 652  024a cd0000        	call	_WS2812B_set_colour_on_channel
 654  024d 85            	popw	x
 655                     ; 129 			delay_ms(220);
 657  024e ae00dc        	ldw	x,#220
 658  0251 cd0000        	call	_delay_ms
 660                     ; 130 			WS2812B_set_colour_on_channel(2, 0, 0, 200);
 662  0254 4bc8          	push	#200
 663  0256 4b00          	push	#0
 664  0258 ae0200        	ldw	x,#512
 665  025b cd0000        	call	_WS2812B_set_colour_on_channel
 667  025e 85            	popw	x
 668                     ; 131 			WS2812B_set_colour_on_channel(6, 0, 0, 200);
 670  025f 4bc8          	push	#200
 671  0261 4b00          	push	#0
 672  0263 ae0600        	ldw	x,#1536
 673  0266 cd0000        	call	_WS2812B_set_colour_on_channel
 675  0269 85            	popw	x
 676                     ; 132 			delay_ms(220);
 678  026a ae00dc        	ldw	x,#220
 679  026d cd0000        	call	_delay_ms
 681                     ; 133 			WS2812B_set_colour_on_channel(3, 0, 0, 200);
 683  0270 4bc8          	push	#200
 684  0272 4b00          	push	#0
 685  0274 ae0300        	ldw	x,#768
 686  0277 cd0000        	call	_WS2812B_set_colour_on_channel
 688  027a 85            	popw	x
 689                     ; 134 			WS2812B_set_colour_on_channel(5, 0, 0, 200);
 691  027b 4bc8          	push	#200
 692  027d 4b00          	push	#0
 693  027f ae0500        	ldw	x,#1280
 694  0282 cd0000        	call	_WS2812B_set_colour_on_channel
 696  0285 85            	popw	x
 697                     ; 135 			delay_ms(220);
 699  0286 ae00dc        	ldw	x,#220
 700  0289 cd0000        	call	_delay_ms
 702                     ; 136 			WS2812B_set_colour_on_channel(4, 0, 0, 200);
 704  028c 4bc8          	push	#200
 705  028e 4b00          	push	#0
 706  0290 ae0400        	ldw	x,#1024
 707  0293 cd0000        	call	_WS2812B_set_colour_on_channel
 709  0296 85            	popw	x
 710                     ; 137 			delay_ms(440);
 712  0297 ae01b8        	ldw	x,#440
 713  029a cd0000        	call	_delay_ms
 715                     ; 139 			WS2812B_set_colour_on_channel(4, 0, 200, 0);
 717  029d 4b00          	push	#0
 718  029f 4bc8          	push	#200
 719  02a1 ae0400        	ldw	x,#1024
 720  02a4 cd0000        	call	_WS2812B_set_colour_on_channel
 722  02a7 85            	popw	x
 723                     ; 140 			delay_ms(220);
 725  02a8 ae00dc        	ldw	x,#220
 726  02ab cd0000        	call	_delay_ms
 728                     ; 141 			WS2812B_set_colour_on_channel(3, 0, 200, 0);
 730  02ae 4b00          	push	#0
 731  02b0 4bc8          	push	#200
 732  02b2 ae0300        	ldw	x,#768
 733  02b5 cd0000        	call	_WS2812B_set_colour_on_channel
 735  02b8 85            	popw	x
 736                     ; 142 			WS2812B_set_colour_on_channel(5, 0, 200, 0);
 738  02b9 4b00          	push	#0
 739  02bb 4bc8          	push	#200
 740  02bd ae0500        	ldw	x,#1280
 741  02c0 cd0000        	call	_WS2812B_set_colour_on_channel
 743  02c3 85            	popw	x
 744                     ; 143 			delay_ms(220);
 746  02c4 ae00dc        	ldw	x,#220
 747  02c7 cd0000        	call	_delay_ms
 749                     ; 144 			WS2812B_set_colour_on_channel(2, 0, 200, 0);
 751  02ca 4b00          	push	#0
 752  02cc 4bc8          	push	#200
 753  02ce ae0200        	ldw	x,#512
 754  02d1 cd0000        	call	_WS2812B_set_colour_on_channel
 756  02d4 85            	popw	x
 757                     ; 145 			WS2812B_set_colour_on_channel(6, 0, 200, 0);
 759  02d5 4b00          	push	#0
 760  02d7 4bc8          	push	#200
 761  02d9 ae0600        	ldw	x,#1536
 762  02dc cd0000        	call	_WS2812B_set_colour_on_channel
 764  02df 85            	popw	x
 765                     ; 146 			delay_ms(220);
 767  02e0 ae00dc        	ldw	x,#220
 768  02e3 cd0000        	call	_delay_ms
 770                     ; 147 			WS2812B_set_colour_on_channel(1, 0, 200, 0);
 772  02e6 4b00          	push	#0
 773  02e8 4bc8          	push	#200
 774  02ea ae0100        	ldw	x,#256
 775  02ed cd0000        	call	_WS2812B_set_colour_on_channel
 777  02f0 85            	popw	x
 778                     ; 148 			WS2812B_set_colour_on_channel(7, 0, 200, 0);
 780  02f1 4b00          	push	#0
 781  02f3 4bc8          	push	#200
 782  02f5 ae0700        	ldw	x,#1792
 783  02f8 cd0000        	call	_WS2812B_set_colour_on_channel
 785  02fb 85            	popw	x
 786                     ; 149 			delay_ms(220);
 788  02fc ae00dc        	ldw	x,#220
 789  02ff cd0000        	call	_delay_ms
 791                     ; 150 			WS2812B_set_colour_on_channel(0, 0, 200, 0);
 793  0302 4b00          	push	#0
 794  0304 4bc8          	push	#200
 795  0306 5f            	clrw	x
 796  0307 cd0000        	call	_WS2812B_set_colour_on_channel
 798  030a 85            	popw	x
 799                     ; 151 			delay_ms(440);
 801  030b ae01b8        	ldw	x,#440
 802  030e cd0000        	call	_delay_ms
 804                     ; 153 			WS2812B_set_colour_on_channel(0, 200, 0, 0);
 806  0311 4b00          	push	#0
 807  0313 4b00          	push	#0
 808  0315 ae00c8        	ldw	x,#200
 809  0318 cd0000        	call	_WS2812B_set_colour_on_channel
 811  031b 85            	popw	x
 812                     ; 154 			delay_ms(220);
 814  031c ae00dc        	ldw	x,#220
 815  031f cd0000        	call	_delay_ms
 817                     ; 155 			WS2812B_set_colour_on_channel(1, 200, 0, 0);
 819  0322 4b00          	push	#0
 820  0324 4b00          	push	#0
 821  0326 ae01c8        	ldw	x,#456
 822  0329 cd0000        	call	_WS2812B_set_colour_on_channel
 824  032c 85            	popw	x
 825                     ; 156 			WS2812B_set_colour_on_channel(7, 200, 0,0);
 827  032d 4b00          	push	#0
 828  032f 4b00          	push	#0
 829  0331 ae07c8        	ldw	x,#1992
 830  0334 cd0000        	call	_WS2812B_set_colour_on_channel
 832  0337 85            	popw	x
 833                     ; 157 			delay_ms(220);
 835  0338 ae00dc        	ldw	x,#220
 836  033b cd0000        	call	_delay_ms
 838                     ; 158 			WS2812B_set_colour_on_channel(2, 200, 0, 0);
 840  033e 4b00          	push	#0
 841  0340 4b00          	push	#0
 842  0342 ae02c8        	ldw	x,#712
 843  0345 cd0000        	call	_WS2812B_set_colour_on_channel
 845  0348 85            	popw	x
 846                     ; 159 			WS2812B_set_colour_on_channel(6, 200, 0, 0);
 848  0349 4b00          	push	#0
 849  034b 4b00          	push	#0
 850  034d ae06c8        	ldw	x,#1736
 851  0350 cd0000        	call	_WS2812B_set_colour_on_channel
 853  0353 85            	popw	x
 854                     ; 160 			delay_ms(220);
 856  0354 ae00dc        	ldw	x,#220
 857  0357 cd0000        	call	_delay_ms
 859                     ; 161 			WS2812B_set_colour_on_channel(3, 200, 0, 0);
 861  035a 4b00          	push	#0
 862  035c 4b00          	push	#0
 863  035e ae03c8        	ldw	x,#968
 864  0361 cd0000        	call	_WS2812B_set_colour_on_channel
 866  0364 85            	popw	x
 867                     ; 162 			WS2812B_set_colour_on_channel(5, 200, 0, 0);
 869  0365 4b00          	push	#0
 870  0367 4b00          	push	#0
 871  0369 ae05c8        	ldw	x,#1480
 872  036c cd0000        	call	_WS2812B_set_colour_on_channel
 874  036f 85            	popw	x
 875                     ; 163 			delay_ms(220);
 877  0370 ae00dc        	ldw	x,#220
 878  0373 cd0000        	call	_delay_ms
 880                     ; 164 			WS2812B_set_colour_on_channel(4, 200, 0, 0);
 882  0376 4b00          	push	#0
 883  0378 4b00          	push	#0
 884  037a ae04c8        	ldw	x,#1224
 885  037d cd0000        	call	_WS2812B_set_colour_on_channel
 887  0380 85            	popw	x
 888                     ; 165 			delay_ms(440);
 890  0381 ae01b8        	ldw	x,#440
 891  0384 cd0000        	call	_delay_ms
 893                     ; 167 			WS2812B_set_colour_on_channel(4, 0, 0, 0);
 895  0387 4b00          	push	#0
 896  0389 4b00          	push	#0
 897  038b ae0400        	ldw	x,#1024
 898  038e cd0000        	call	_WS2812B_set_colour_on_channel
 900  0391 85            	popw	x
 901                     ; 168 			delay_ms(220);
 903  0392 ae00dc        	ldw	x,#220
 904  0395 cd0000        	call	_delay_ms
 906                     ; 169 			WS2812B_set_colour_on_channel(3, 0, 0, 0);
 908  0398 4b00          	push	#0
 909  039a 4b00          	push	#0
 910  039c ae0300        	ldw	x,#768
 911  039f cd0000        	call	_WS2812B_set_colour_on_channel
 913  03a2 85            	popw	x
 914                     ; 170 			WS2812B_set_colour_on_channel(5, 0, 0, 0);
 916  03a3 4b00          	push	#0
 917  03a5 4b00          	push	#0
 918  03a7 ae0500        	ldw	x,#1280
 919  03aa cd0000        	call	_WS2812B_set_colour_on_channel
 921  03ad 85            	popw	x
 922                     ; 171 			delay_ms(220);
 924  03ae ae00dc        	ldw	x,#220
 925  03b1 cd0000        	call	_delay_ms
 927                     ; 172 			WS2812B_set_colour_on_channel(2, 0, 0, 0);
 929  03b4 4b00          	push	#0
 930  03b6 4b00          	push	#0
 931  03b8 ae0200        	ldw	x,#512
 932  03bb cd0000        	call	_WS2812B_set_colour_on_channel
 934  03be 85            	popw	x
 935                     ; 173 			WS2812B_set_colour_on_channel(6, 0, 0, 0);
 937  03bf 4b00          	push	#0
 938  03c1 4b00          	push	#0
 939  03c3 ae0600        	ldw	x,#1536
 940  03c6 cd0000        	call	_WS2812B_set_colour_on_channel
 942  03c9 85            	popw	x
 943                     ; 174 			delay_ms(220);
 945  03ca ae00dc        	ldw	x,#220
 946  03cd cd0000        	call	_delay_ms
 948                     ; 175 			WS2812B_set_colour_on_channel(1, 0, 0, 0);
 950  03d0 4b00          	push	#0
 951  03d2 4b00          	push	#0
 952  03d4 ae0100        	ldw	x,#256
 953  03d7 cd0000        	call	_WS2812B_set_colour_on_channel
 955  03da 85            	popw	x
 956                     ; 176 			WS2812B_set_colour_on_channel(7, 0, 0, 0);
 958  03db 4b00          	push	#0
 959  03dd 4b00          	push	#0
 960  03df ae0700        	ldw	x,#1792
 961  03e2 cd0000        	call	_WS2812B_set_colour_on_channel
 963  03e5 85            	popw	x
 964                     ; 177 			delay_ms(220);
 966  03e6 ae00dc        	ldw	x,#220
 967  03e9 cd0000        	call	_delay_ms
 969                     ; 178 			WS2812B_set_colour_on_channel(0, 0, 0, 0);
 971  03ec 4b00          	push	#0
 972  03ee 4b00          	push	#0
 973  03f0 5f            	clrw	x
 974  03f1 cd0000        	call	_WS2812B_set_colour_on_channel
 976  03f4 85            	popw	x
 977                     ; 179 			delay_ms(440);
 979  03f5 ae01b8        	ldw	x,#440
 980  03f8 cd0000        	call	_delay_ms
 982                     ; 123 		for(i = 0; i < 4; i++)
 984  03fb 0c01          	inc	(OFST+0,sp)
 988  03fd 7b01          	ld	a,(OFST+0,sp)
 989  03ff a104          	cp	a,#4
 990  0401 2403          	jruge	L6
 991  0403 cc0229        	jp	L751
 992  0406               L6:
 993                     ; 182 		WS2812B_reset();
 995  0406 cd0000        	call	_WS2812B_reset
 997                     ; 183 		for(i = 0; i < 4; i++)
 999  0409 0f01          	clr	(OFST+0,sp)
1001  040b               L561:
1002                     ; 185 			WS2812B_set_colour_on_channel(0, 0, 200, 200);
1004  040b 4bc8          	push	#200
1005  040d 4bc8          	push	#200
1006  040f 5f            	clrw	x
1007  0410 cd0000        	call	_WS2812B_set_colour_on_channel
1009  0413 85            	popw	x
1010                     ; 186 			delay_ms(220);
1012  0414 ae00dc        	ldw	x,#220
1013  0417 cd0000        	call	_delay_ms
1015                     ; 187 			WS2812B_set_colour_on_channel(0, 0, 0, 0);
1017  041a 4b00          	push	#0
1018  041c 4b00          	push	#0
1019  041e 5f            	clrw	x
1020  041f cd0000        	call	_WS2812B_set_colour_on_channel
1022  0422 85            	popw	x
1023                     ; 188 			WS2812B_set_colour_on_channel(1, 0, 200, 200);
1025  0423 4bc8          	push	#200
1026  0425 4bc8          	push	#200
1027  0427 ae0100        	ldw	x,#256
1028  042a cd0000        	call	_WS2812B_set_colour_on_channel
1030  042d 85            	popw	x
1031                     ; 189 			WS2812B_set_colour_on_channel(7, 0, 200, 200);
1033  042e 4bc8          	push	#200
1034  0430 4bc8          	push	#200
1035  0432 ae0700        	ldw	x,#1792
1036  0435 cd0000        	call	_WS2812B_set_colour_on_channel
1038  0438 85            	popw	x
1039                     ; 190 			delay_ms(220);
1041  0439 ae00dc        	ldw	x,#220
1042  043c cd0000        	call	_delay_ms
1044                     ; 191 			WS2812B_set_colour_on_channel(1, 0, 0, 0);
1046  043f 4b00          	push	#0
1047  0441 4b00          	push	#0
1048  0443 ae0100        	ldw	x,#256
1049  0446 cd0000        	call	_WS2812B_set_colour_on_channel
1051  0449 85            	popw	x
1052                     ; 192 			WS2812B_set_colour_on_channel(7, 0, 0, 0);
1054  044a 4b00          	push	#0
1055  044c 4b00          	push	#0
1056  044e ae0700        	ldw	x,#1792
1057  0451 cd0000        	call	_WS2812B_set_colour_on_channel
1059  0454 85            	popw	x
1060                     ; 193 			WS2812B_set_colour_on_channel(2, 0, 200, 200);
1062  0455 4bc8          	push	#200
1063  0457 4bc8          	push	#200
1064  0459 ae0200        	ldw	x,#512
1065  045c cd0000        	call	_WS2812B_set_colour_on_channel
1067  045f 85            	popw	x
1068                     ; 194 			WS2812B_set_colour_on_channel(6, 0, 200, 200);
1070  0460 4bc8          	push	#200
1071  0462 4bc8          	push	#200
1072  0464 ae0600        	ldw	x,#1536
1073  0467 cd0000        	call	_WS2812B_set_colour_on_channel
1075  046a 85            	popw	x
1076                     ; 195 			delay_ms(220);
1078  046b ae00dc        	ldw	x,#220
1079  046e cd0000        	call	_delay_ms
1081                     ; 196 			WS2812B_set_colour_on_channel(2, 0, 0, 0);
1083  0471 4b00          	push	#0
1084  0473 4b00          	push	#0
1085  0475 ae0200        	ldw	x,#512
1086  0478 cd0000        	call	_WS2812B_set_colour_on_channel
1088  047b 85            	popw	x
1089                     ; 197 			WS2812B_set_colour_on_channel(6, 0, 0, 0);
1091  047c 4b00          	push	#0
1092  047e 4b00          	push	#0
1093  0480 ae0600        	ldw	x,#1536
1094  0483 cd0000        	call	_WS2812B_set_colour_on_channel
1096  0486 85            	popw	x
1097                     ; 198 			WS2812B_set_colour_on_channel(3, 0, 200, 200);
1099  0487 4bc8          	push	#200
1100  0489 4bc8          	push	#200
1101  048b ae0300        	ldw	x,#768
1102  048e cd0000        	call	_WS2812B_set_colour_on_channel
1104  0491 85            	popw	x
1105                     ; 199 			WS2812B_set_colour_on_channel(5, 0, 200, 200);
1107  0492 4bc8          	push	#200
1108  0494 4bc8          	push	#200
1109  0496 ae0500        	ldw	x,#1280
1110  0499 cd0000        	call	_WS2812B_set_colour_on_channel
1112  049c 85            	popw	x
1113                     ; 200 			delay_ms(220);
1115  049d ae00dc        	ldw	x,#220
1116  04a0 cd0000        	call	_delay_ms
1118                     ; 201 			WS2812B_set_colour_on_channel(3, 0, 0, 0);
1120  04a3 4b00          	push	#0
1121  04a5 4b00          	push	#0
1122  04a7 ae0300        	ldw	x,#768
1123  04aa cd0000        	call	_WS2812B_set_colour_on_channel
1125  04ad 85            	popw	x
1126                     ; 202 			WS2812B_set_colour_on_channel(5, 0, 0, 0);
1128  04ae 4b00          	push	#0
1129  04b0 4b00          	push	#0
1130  04b2 ae0500        	ldw	x,#1280
1131  04b5 cd0000        	call	_WS2812B_set_colour_on_channel
1133  04b8 85            	popw	x
1134                     ; 203 			WS2812B_set_colour_on_channel(4, 0, 200, 200);
1136  04b9 4bc8          	push	#200
1137  04bb 4bc8          	push	#200
1138  04bd ae0400        	ldw	x,#1024
1139  04c0 cd0000        	call	_WS2812B_set_colour_on_channel
1141  04c3 85            	popw	x
1142                     ; 204 			delay_ms(440);
1144  04c4 ae01b8        	ldw	x,#440
1145  04c7 cd0000        	call	_delay_ms
1147                     ; 206 			WS2812B_set_colour_on_channel(4, 200, 200, 0);
1149  04ca 4b00          	push	#0
1150  04cc 4bc8          	push	#200
1151  04ce ae04c8        	ldw	x,#1224
1152  04d1 cd0000        	call	_WS2812B_set_colour_on_channel
1154  04d4 85            	popw	x
1155                     ; 207 			delay_ms(220);
1157  04d5 ae00dc        	ldw	x,#220
1158  04d8 cd0000        	call	_delay_ms
1160                     ; 208 			WS2812B_set_colour_on_channel(4,0, 0, 0);
1162  04db 4b00          	push	#0
1163  04dd 4b00          	push	#0
1164  04df ae0400        	ldw	x,#1024
1165  04e2 cd0000        	call	_WS2812B_set_colour_on_channel
1167  04e5 85            	popw	x
1168                     ; 209 			WS2812B_set_colour_on_channel(3, 200, 200, 0);
1170  04e6 4b00          	push	#0
1171  04e8 4bc8          	push	#200
1172  04ea ae03c8        	ldw	x,#968
1173  04ed cd0000        	call	_WS2812B_set_colour_on_channel
1175  04f0 85            	popw	x
1176                     ; 210 			WS2812B_set_colour_on_channel(5, 200, 200, 0);
1178  04f1 4b00          	push	#0
1179  04f3 4bc8          	push	#200
1180  04f5 ae05c8        	ldw	x,#1480
1181  04f8 cd0000        	call	_WS2812B_set_colour_on_channel
1183  04fb 85            	popw	x
1184                     ; 211 			delay_ms(220);
1186  04fc ae00dc        	ldw	x,#220
1187  04ff cd0000        	call	_delay_ms
1189                     ; 212 			WS2812B_set_colour_on_channel(3, 0, 0, 0);
1191  0502 4b00          	push	#0
1192  0504 4b00          	push	#0
1193  0506 ae0300        	ldw	x,#768
1194  0509 cd0000        	call	_WS2812B_set_colour_on_channel
1196  050c 85            	popw	x
1197                     ; 213 			WS2812B_set_colour_on_channel(5, 0, 0, 0);
1199  050d 4b00          	push	#0
1200  050f 4b00          	push	#0
1201  0511 ae0500        	ldw	x,#1280
1202  0514 cd0000        	call	_WS2812B_set_colour_on_channel
1204  0517 85            	popw	x
1205                     ; 214 			WS2812B_set_colour_on_channel(2, 200, 200, 0);
1207  0518 4b00          	push	#0
1208  051a 4bc8          	push	#200
1209  051c ae02c8        	ldw	x,#712
1210  051f cd0000        	call	_WS2812B_set_colour_on_channel
1212  0522 85            	popw	x
1213                     ; 215 			WS2812B_set_colour_on_channel(6, 200, 200, 0);
1215  0523 4b00          	push	#0
1216  0525 4bc8          	push	#200
1217  0527 ae06c8        	ldw	x,#1736
1218  052a cd0000        	call	_WS2812B_set_colour_on_channel
1220  052d 85            	popw	x
1221                     ; 216 			delay_ms(220);
1223  052e ae00dc        	ldw	x,#220
1224  0531 cd0000        	call	_delay_ms
1226                     ; 217 			WS2812B_set_colour_on_channel(2, 0, 0, 0);
1228  0534 4b00          	push	#0
1229  0536 4b00          	push	#0
1230  0538 ae0200        	ldw	x,#512
1231  053b cd0000        	call	_WS2812B_set_colour_on_channel
1233  053e 85            	popw	x
1234                     ; 218 			WS2812B_set_colour_on_channel(6, 0, 0, 0);
1236  053f 4b00          	push	#0
1237  0541 4b00          	push	#0
1238  0543 ae0600        	ldw	x,#1536
1239  0546 cd0000        	call	_WS2812B_set_colour_on_channel
1241  0549 85            	popw	x
1242                     ; 219 			WS2812B_set_colour_on_channel(1, 200, 200, 0);
1244  054a 4b00          	push	#0
1245  054c 4bc8          	push	#200
1246  054e ae01c8        	ldw	x,#456
1247  0551 cd0000        	call	_WS2812B_set_colour_on_channel
1249  0554 85            	popw	x
1250                     ; 220 			WS2812B_set_colour_on_channel(7, 200, 200, 0);
1252  0555 4b00          	push	#0
1253  0557 4bc8          	push	#200
1254  0559 ae07c8        	ldw	x,#1992
1255  055c cd0000        	call	_WS2812B_set_colour_on_channel
1257  055f 85            	popw	x
1258                     ; 221 			delay_ms(220);
1260  0560 ae00dc        	ldw	x,#220
1261  0563 cd0000        	call	_delay_ms
1263                     ; 222 			WS2812B_set_colour_on_channel(1, 0, 0, 0);
1265  0566 4b00          	push	#0
1266  0568 4b00          	push	#0
1267  056a ae0100        	ldw	x,#256
1268  056d cd0000        	call	_WS2812B_set_colour_on_channel
1270  0570 85            	popw	x
1271                     ; 223 			WS2812B_set_colour_on_channel(7, 0, 0, 0);
1273  0571 4b00          	push	#0
1274  0573 4b00          	push	#0
1275  0575 ae0700        	ldw	x,#1792
1276  0578 cd0000        	call	_WS2812B_set_colour_on_channel
1278  057b 85            	popw	x
1279                     ; 224 			WS2812B_set_colour_on_channel(0, 200, 200, 0);
1281  057c 4b00          	push	#0
1282  057e 4bc8          	push	#200
1283  0580 ae00c8        	ldw	x,#200
1284  0583 cd0000        	call	_WS2812B_set_colour_on_channel
1286  0586 85            	popw	x
1287                     ; 225 			delay_ms(440);
1289  0587 ae01b8        	ldw	x,#440
1290  058a cd0000        	call	_delay_ms
1292                     ; 227 			WS2812B_set_colour_on_channel(0, 200, 0, 200);
1294  058d 4bc8          	push	#200
1295  058f 4b00          	push	#0
1296  0591 ae00c8        	ldw	x,#200
1297  0594 cd0000        	call	_WS2812B_set_colour_on_channel
1299  0597 85            	popw	x
1300                     ; 228 			delay_ms(220);
1302  0598 ae00dc        	ldw	x,#220
1303  059b cd0000        	call	_delay_ms
1305                     ; 229 			WS2812B_set_colour_on_channel(0, 0, 0, 0);
1307  059e 4b00          	push	#0
1308  05a0 4b00          	push	#0
1309  05a2 5f            	clrw	x
1310  05a3 cd0000        	call	_WS2812B_set_colour_on_channel
1312  05a6 85            	popw	x
1313                     ; 230 			WS2812B_set_colour_on_channel(1, 200, 0, 200);
1315  05a7 4bc8          	push	#200
1316  05a9 4b00          	push	#0
1317  05ab ae01c8        	ldw	x,#456
1318  05ae cd0000        	call	_WS2812B_set_colour_on_channel
1320  05b1 85            	popw	x
1321                     ; 231 			WS2812B_set_colour_on_channel(7, 200, 0, 200);
1323  05b2 4bc8          	push	#200
1324  05b4 4b00          	push	#0
1325  05b6 ae07c8        	ldw	x,#1992
1326  05b9 cd0000        	call	_WS2812B_set_colour_on_channel
1328  05bc 85            	popw	x
1329                     ; 232 			delay_ms(220);
1331  05bd ae00dc        	ldw	x,#220
1332  05c0 cd0000        	call	_delay_ms
1334                     ; 233 			WS2812B_set_colour_on_channel(1, 0, 0, 0);
1336  05c3 4b00          	push	#0
1337  05c5 4b00          	push	#0
1338  05c7 ae0100        	ldw	x,#256
1339  05ca cd0000        	call	_WS2812B_set_colour_on_channel
1341  05cd 85            	popw	x
1342                     ; 234 			WS2812B_set_colour_on_channel(7, 0, 0, 0);
1344  05ce 4b00          	push	#0
1345  05d0 4b00          	push	#0
1346  05d2 ae0700        	ldw	x,#1792
1347  05d5 cd0000        	call	_WS2812B_set_colour_on_channel
1349  05d8 85            	popw	x
1350                     ; 235 			WS2812B_set_colour_on_channel(2, 200, 0, 200);
1352  05d9 4bc8          	push	#200
1353  05db 4b00          	push	#0
1354  05dd ae02c8        	ldw	x,#712
1355  05e0 cd0000        	call	_WS2812B_set_colour_on_channel
1357  05e3 85            	popw	x
1358                     ; 236 			WS2812B_set_colour_on_channel(6, 200, 0, 200);
1360  05e4 4bc8          	push	#200
1361  05e6 4b00          	push	#0
1362  05e8 ae06c8        	ldw	x,#1736
1363  05eb cd0000        	call	_WS2812B_set_colour_on_channel
1365  05ee 85            	popw	x
1366                     ; 237 			delay_ms(220);
1368  05ef ae00dc        	ldw	x,#220
1369  05f2 cd0000        	call	_delay_ms
1371                     ; 238 			WS2812B_set_colour_on_channel(2, 0, 0, 0);
1373  05f5 4b00          	push	#0
1374  05f7 4b00          	push	#0
1375  05f9 ae0200        	ldw	x,#512
1376  05fc cd0000        	call	_WS2812B_set_colour_on_channel
1378  05ff 85            	popw	x
1379                     ; 239 			WS2812B_set_colour_on_channel(6, 0, 0, 0);
1381  0600 4b00          	push	#0
1382  0602 4b00          	push	#0
1383  0604 ae0600        	ldw	x,#1536
1384  0607 cd0000        	call	_WS2812B_set_colour_on_channel
1386  060a 85            	popw	x
1387                     ; 240 			WS2812B_set_colour_on_channel(3, 200, 0, 200);
1389  060b 4bc8          	push	#200
1390  060d 4b00          	push	#0
1391  060f ae03c8        	ldw	x,#968
1392  0612 cd0000        	call	_WS2812B_set_colour_on_channel
1394  0615 85            	popw	x
1395                     ; 241 			WS2812B_set_colour_on_channel(5, 200, 0, 200);
1397  0616 4bc8          	push	#200
1398  0618 4b00          	push	#0
1399  061a ae05c8        	ldw	x,#1480
1400  061d cd0000        	call	_WS2812B_set_colour_on_channel
1402  0620 85            	popw	x
1403                     ; 242 			delay_ms(220);
1405  0621 ae00dc        	ldw	x,#220
1406  0624 cd0000        	call	_delay_ms
1408                     ; 243 			WS2812B_set_colour_on_channel(3, 0, 0, 0);
1410  0627 4b00          	push	#0
1411  0629 4b00          	push	#0
1412  062b ae0300        	ldw	x,#768
1413  062e cd0000        	call	_WS2812B_set_colour_on_channel
1415  0631 85            	popw	x
1416                     ; 244 			WS2812B_set_colour_on_channel(5, 0, 0, 0);
1418  0632 4b00          	push	#0
1419  0634 4b00          	push	#0
1420  0636 ae0500        	ldw	x,#1280
1421  0639 cd0000        	call	_WS2812B_set_colour_on_channel
1423  063c 85            	popw	x
1424                     ; 245 			WS2812B_set_colour_on_channel(4, 200, 0, 200);
1426  063d 4bc8          	push	#200
1427  063f 4b00          	push	#0
1428  0641 ae04c8        	ldw	x,#1224
1429  0644 cd0000        	call	_WS2812B_set_colour_on_channel
1431  0647 85            	popw	x
1432                     ; 246 			delay_ms(440);
1434  0648 ae01b8        	ldw	x,#440
1435  064b cd0000        	call	_delay_ms
1437                     ; 248 			WS2812B_set_colour_on_channel(4, 160, 160, 160);
1439  064e 4ba0          	push	#160
1440  0650 4ba0          	push	#160
1441  0652 ae04a0        	ldw	x,#1184
1442  0655 cd0000        	call	_WS2812B_set_colour_on_channel
1444  0658 85            	popw	x
1445                     ; 249 			delay_ms(220);
1447  0659 ae00dc        	ldw	x,#220
1448  065c cd0000        	call	_delay_ms
1450                     ; 250 			WS2812B_set_colour_on_channel(4,0, 0, 0);
1452  065f 4b00          	push	#0
1453  0661 4b00          	push	#0
1454  0663 ae0400        	ldw	x,#1024
1455  0666 cd0000        	call	_WS2812B_set_colour_on_channel
1457  0669 85            	popw	x
1458                     ; 251 			WS2812B_set_colour_on_channel(3, 160, 160, 160);
1460  066a 4ba0          	push	#160
1461  066c 4ba0          	push	#160
1462  066e ae03a0        	ldw	x,#928
1463  0671 cd0000        	call	_WS2812B_set_colour_on_channel
1465  0674 85            	popw	x
1466                     ; 252 			WS2812B_set_colour_on_channel(5, 160, 160, 160);
1468  0675 4ba0          	push	#160
1469  0677 4ba0          	push	#160
1470  0679 ae05a0        	ldw	x,#1440
1471  067c cd0000        	call	_WS2812B_set_colour_on_channel
1473  067f 85            	popw	x
1474                     ; 253 			delay_ms(220);
1476  0680 ae00dc        	ldw	x,#220
1477  0683 cd0000        	call	_delay_ms
1479                     ; 254 			WS2812B_set_colour_on_channel(3, 0, 0, 0);
1481  0686 4b00          	push	#0
1482  0688 4b00          	push	#0
1483  068a ae0300        	ldw	x,#768
1484  068d cd0000        	call	_WS2812B_set_colour_on_channel
1486  0690 85            	popw	x
1487                     ; 255 			WS2812B_set_colour_on_channel(5, 0, 0, 0);
1489  0691 4b00          	push	#0
1490  0693 4b00          	push	#0
1491  0695 ae0500        	ldw	x,#1280
1492  0698 cd0000        	call	_WS2812B_set_colour_on_channel
1494  069b 85            	popw	x
1495                     ; 256 			WS2812B_set_colour_on_channel(2, 160, 160, 160);
1497  069c 4ba0          	push	#160
1498  069e 4ba0          	push	#160
1499  06a0 ae02a0        	ldw	x,#672
1500  06a3 cd0000        	call	_WS2812B_set_colour_on_channel
1502  06a6 85            	popw	x
1503                     ; 257 			WS2812B_set_colour_on_channel(6, 160, 160, 160);
1505  06a7 4ba0          	push	#160
1506  06a9 4ba0          	push	#160
1507  06ab ae06a0        	ldw	x,#1696
1508  06ae cd0000        	call	_WS2812B_set_colour_on_channel
1510  06b1 85            	popw	x
1511                     ; 258 			delay_ms(220);
1513  06b2 ae00dc        	ldw	x,#220
1514  06b5 cd0000        	call	_delay_ms
1516                     ; 259 			WS2812B_set_colour_on_channel(2, 0, 0, 0);
1518  06b8 4b00          	push	#0
1519  06ba 4b00          	push	#0
1520  06bc ae0200        	ldw	x,#512
1521  06bf cd0000        	call	_WS2812B_set_colour_on_channel
1523  06c2 85            	popw	x
1524                     ; 260 			WS2812B_set_colour_on_channel(6, 0, 0, 0);
1526  06c3 4b00          	push	#0
1527  06c5 4b00          	push	#0
1528  06c7 ae0600        	ldw	x,#1536
1529  06ca cd0000        	call	_WS2812B_set_colour_on_channel
1531  06cd 85            	popw	x
1532                     ; 261 			WS2812B_set_colour_on_channel(1, 160, 160, 160);
1534  06ce 4ba0          	push	#160
1535  06d0 4ba0          	push	#160
1536  06d2 ae01a0        	ldw	x,#416
1537  06d5 cd0000        	call	_WS2812B_set_colour_on_channel
1539  06d8 85            	popw	x
1540                     ; 262 			WS2812B_set_colour_on_channel(7, 160, 160, 160);
1542  06d9 4ba0          	push	#160
1543  06db 4ba0          	push	#160
1544  06dd ae07a0        	ldw	x,#1952
1545  06e0 cd0000        	call	_WS2812B_set_colour_on_channel
1547  06e3 85            	popw	x
1548                     ; 263 			delay_ms(220);
1550  06e4 ae00dc        	ldw	x,#220
1551  06e7 cd0000        	call	_delay_ms
1553                     ; 264 			WS2812B_set_colour_on_channel(1, 0, 0, 0);
1555  06ea 4b00          	push	#0
1556  06ec 4b00          	push	#0
1557  06ee ae0100        	ldw	x,#256
1558  06f1 cd0000        	call	_WS2812B_set_colour_on_channel
1560  06f4 85            	popw	x
1561                     ; 265 			WS2812B_set_colour_on_channel(7, 0, 0, 0);
1563  06f5 4b00          	push	#0
1564  06f7 4b00          	push	#0
1565  06f9 ae0700        	ldw	x,#1792
1566  06fc cd0000        	call	_WS2812B_set_colour_on_channel
1568  06ff 85            	popw	x
1569                     ; 266 			WS2812B_set_colour_on_channel(0, 160, 160, 160);
1571  0700 4ba0          	push	#160
1572  0702 4ba0          	push	#160
1573  0704 ae00a0        	ldw	x,#160
1574  0707 cd0000        	call	_WS2812B_set_colour_on_channel
1576  070a 85            	popw	x
1577                     ; 267 			delay_ms(440);
1579  070b ae01b8        	ldw	x,#440
1580  070e cd0000        	call	_delay_ms
1582                     ; 183 		for(i = 0; i < 4; i++)
1584  0711 0c01          	inc	(OFST+0,sp)
1588  0713 7b01          	ld	a,(OFST+0,sp)
1589  0715 a104          	cp	a,#4
1590  0717 2403          	jruge	L01
1591  0719 cc040b        	jp	L561
1592  071c               L01:
1593                     ; 270 		WS2812B_reset();
1595  071c cd0000        	call	_WS2812B_reset
1597                     ; 271 		WS2812B_set_colour_on_channel(0, 160, 0, 0);
1599  071f 4b00          	push	#0
1600  0721 4b00          	push	#0
1601  0723 ae00a0        	ldw	x,#160
1602  0726 cd0000        	call	_WS2812B_set_colour_on_channel
1604  0729 85            	popw	x
1605                     ; 272 		WS2812B_set_colour_on_channel(1, 160,160, 0);
1607  072a 4b00          	push	#0
1608  072c 4ba0          	push	#160
1609  072e ae01a0        	ldw	x,#416
1610  0731 cd0000        	call	_WS2812B_set_colour_on_channel
1612  0734 85            	popw	x
1613                     ; 273 		WS2812B_set_colour_on_channel(2, 0, 160, 160);
1615  0735 4ba0          	push	#160
1616  0737 4ba0          	push	#160
1617  0739 ae0200        	ldw	x,#512
1618  073c cd0000        	call	_WS2812B_set_colour_on_channel
1620  073f 85            	popw	x
1621                     ; 274 		WS2812B_set_colour_on_channel(3, 0, 0, 160);
1623  0740 4ba0          	push	#160
1624  0742 4b00          	push	#0
1625  0744 ae0300        	ldw	x,#768
1626  0747 cd0000        	call	_WS2812B_set_colour_on_channel
1628  074a 85            	popw	x
1629                     ; 275 		WS2812B_set_colour_on_channel(4, 160, 0, 160);
1631  074b 4ba0          	push	#160
1632  074d 4b00          	push	#0
1633  074f ae04a0        	ldw	x,#1184
1634  0752 cd0000        	call	_WS2812B_set_colour_on_channel
1636  0755 85            	popw	x
1637                     ; 276 		WS2812B_set_colour_on_channel(5, 0, 160, 160);
1639  0756 4ba0          	push	#160
1640  0758 4ba0          	push	#160
1641  075a ae0500        	ldw	x,#1280
1642  075d cd0000        	call	_WS2812B_set_colour_on_channel
1644  0760 85            	popw	x
1645                     ; 277 		WS2812B_set_colour_on_channel(6, 0, 160, 0);
1647  0761 4b00          	push	#0
1648  0763 4ba0          	push	#160
1649  0765 ae0600        	ldw	x,#1536
1650  0768 cd0000        	call	_WS2812B_set_colour_on_channel
1652  076b 85            	popw	x
1653                     ; 278 		WS2812B_set_colour_on_channel(7, 160, 160, 160);	
1655  076c 4ba0          	push	#160
1656  076e 4ba0          	push	#160
1657  0770 ae07a0        	ldw	x,#1952
1658  0773 cd0000        	call	_WS2812B_set_colour_on_channel
1660  0776 85            	popw	x
1661                     ; 279 		delay_ms(6000);
1663  0777 ae1770        	ldw	x,#6000
1664  077a cd0000        	call	_delay_ms
1667  077d ac070007      	jpf	L72
1700                     ; 284 void clock_setup(void)
1700                     ; 285 {
1701                     	switch	.text
1702  0781               _clock_setup:
1706                     ; 286 	CLK_DeInit();
1708  0781 cd0000        	call	_CLK_DeInit
1710                     ; 288 	CLK_HSECmd(DISABLE);
1712  0784 4f            	clr	a
1713  0785 cd0000        	call	_CLK_HSECmd
1715                     ; 289 	CLK_LSICmd(DISABLE);
1717  0788 4f            	clr	a
1718  0789 cd0000        	call	_CLK_LSICmd
1720                     ; 290 	CLK_HSICmd(ENABLE);
1722  078c a601          	ld	a,#1
1723  078e cd0000        	call	_CLK_HSICmd
1726  0791               L502:
1727                     ; 291 	while(CLK_GetFlagStatus(CLK_FLAG_HSIRDY) == FALSE);
1729  0791 ae0102        	ldw	x,#258
1730  0794 cd0000        	call	_CLK_GetFlagStatus
1732  0797 4d            	tnz	a
1733  0798 27f7          	jreq	L502
1734                     ; 293 	CLK_ClockSwitchCmd(ENABLE);
1736  079a a601          	ld	a,#1
1737  079c cd0000        	call	_CLK_ClockSwitchCmd
1739                     ; 294 	CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);
1741  079f 4f            	clr	a
1742  07a0 cd0000        	call	_CLK_HSIPrescalerConfig
1744                     ; 295 	CLK_SYSCLKConfig(CLK_PRESCALER_CPUDIV1);
1746  07a3 a680          	ld	a,#128
1747  07a5 cd0000        	call	_CLK_SYSCLKConfig
1749                     ; 297 	CLK_ClockSwitchConfig(CLK_SWITCHMODE_AUTO, CLK_SOURCE_HSI, 
1749                     ; 298 	DISABLE, CLK_CURRENTCLOCKSTATE_ENABLE);
1751  07a8 4b01          	push	#1
1752  07aa 4b00          	push	#0
1753  07ac ae01e1        	ldw	x,#481
1754  07af cd0000        	call	_CLK_ClockSwitchConfig
1756  07b2 85            	popw	x
1757                     ; 300 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_SPI, DISABLE);
1759  07b3 ae0100        	ldw	x,#256
1760  07b6 cd0000        	call	_CLK_PeripheralClockConfig
1762                     ; 301 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_I2C, DISABLE);
1764  07b9 5f            	clrw	x
1765  07ba cd0000        	call	_CLK_PeripheralClockConfig
1767                     ; 302 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_ADC, DISABLE);
1769  07bd ae1300        	ldw	x,#4864
1770  07c0 cd0000        	call	_CLK_PeripheralClockConfig
1772                     ; 303 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_AWU, DISABLE);
1774  07c3 ae1200        	ldw	x,#4608
1775  07c6 cd0000        	call	_CLK_PeripheralClockConfig
1777                     ; 304 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_UART1, DISABLE);
1779  07c9 ae0300        	ldw	x,#768
1780  07cc cd0000        	call	_CLK_PeripheralClockConfig
1782                     ; 305 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER1, DISABLE);
1784  07cf ae0700        	ldw	x,#1792
1785  07d2 cd0000        	call	_CLK_PeripheralClockConfig
1787                     ; 306 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER2, DISABLE);
1789  07d5 ae0500        	ldw	x,#1280
1790  07d8 cd0000        	call	_CLK_PeripheralClockConfig
1792                     ; 307 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER4, DISABLE);
1794  07db ae0400        	ldw	x,#1024
1795  07de cd0000        	call	_CLK_PeripheralClockConfig
1797                     ; 308 }
1800  07e1 81            	ret
1813                     	xdef	_main
1814                     	xdef	_clock_setup
1815                     	xref	_WS2812B_set_colour_on_channel
1816                     	xref	_WS2812B_reset
1817                     	xref	_WS2812B_init
1818                     	xref	_CLK_GetFlagStatus
1819                     	xref	_CLK_SYSCLKConfig
1820                     	xref	_CLK_HSIPrescalerConfig
1821                     	xref	_CLK_ClockSwitchConfig
1822                     	xref	_CLK_PeripheralClockConfig
1823                     	xref	_CLK_ClockSwitchCmd
1824                     	xref	_CLK_LSICmd
1825                     	xref	_CLK_HSICmd
1826                     	xref	_CLK_HSECmd
1827                     	xref	_CLK_DeInit
1828                     	xref	_delay_ms
1847                     	end
