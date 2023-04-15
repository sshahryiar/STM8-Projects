   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.9 - 08 Feb 2017
   3                     ; Generator (Limited) V4.4.6 - 08 Feb 2017
  44                     ; 4 void LCD_GPIO_init(void)
  44                     ; 5 {
  46                     	switch	.text
  47  0000               _LCD_GPIO_init:
  51                     ; 6 	GPIO_Init(LCD_PORT, LCD_RS, GPIO_MODE_OUT_PP_HIGH_FAST);
  53  0000 4bf0          	push	#240
  54  0002 4b04          	push	#4
  55  0004 ae500a        	ldw	x,#20490
  56  0007 cd0000        	call	_GPIO_Init
  58  000a 85            	popw	x
  59                     ; 7 	GPIO_Init(LCD_PORT, LCD_EN, GPIO_MODE_OUT_PP_HIGH_FAST);
  61  000b 4bf0          	push	#240
  62  000d 4b08          	push	#8
  63  000f ae500a        	ldw	x,#20490
  64  0012 cd0000        	call	_GPIO_Init
  66  0015 85            	popw	x
  67                     ; 8 	GPIO_Init(LCD_PORT, LCD_DB4, GPIO_MODE_OUT_PP_HIGH_FAST);
  69  0016 4bf0          	push	#240
  70  0018 4b10          	push	#16
  71  001a ae500a        	ldw	x,#20490
  72  001d cd0000        	call	_GPIO_Init
  74  0020 85            	popw	x
  75                     ; 9 	GPIO_Init(LCD_PORT, LCD_DB5, GPIO_MODE_OUT_PP_HIGH_FAST);
  77  0021 4bf0          	push	#240
  78  0023 4b20          	push	#32
  79  0025 ae500a        	ldw	x,#20490
  80  0028 cd0000        	call	_GPIO_Init
  82  002b 85            	popw	x
  83                     ; 10 	GPIO_Init(LCD_PORT, LCD_DB6, GPIO_MODE_OUT_PP_HIGH_FAST);
  85  002c 4bf0          	push	#240
  86  002e 4b40          	push	#64
  87  0030 ae500a        	ldw	x,#20490
  88  0033 cd0000        	call	_GPIO_Init
  90  0036 85            	popw	x
  91                     ; 11 	GPIO_Init(LCD_PORT, LCD_DB7, GPIO_MODE_OUT_PP_HIGH_FAST);
  93  0037 4bf0          	push	#240
  94  0039 4b80          	push	#128
  95  003b ae500a        	ldw	x,#20490
  96  003e cd0000        	call	_GPIO_Init
  98  0041 85            	popw	x
  99                     ; 12 	delay_ms(10);    
 101  0042 ae000a        	ldw	x,#10
 102  0045 cd0000        	call	_delay_ms
 104                     ; 13 }
 107  0048 81            	ret
 135                     ; 16 void LCD_init(void)
 135                     ; 17 {                                     
 136                     	switch	.text
 137  0049               _LCD_init:
 141                     ; 18 	LCD_GPIO_init();    
 143  0049 adb5          	call	_LCD_GPIO_init
 145                     ; 19     toggle_EN_pin();
 147  004b cd01d3        	call	_toggle_EN_pin
 149                     ; 21     GPIO_WriteLow(LCD_PORT, LCD_RS);            
 151  004e 4b04          	push	#4
 152  0050 ae500a        	ldw	x,#20490
 153  0053 cd0000        	call	_GPIO_WriteLow
 155  0056 84            	pop	a
 156                     ; 22     GPIO_WriteLow(LCD_PORT, LCD_DB7);   
 158  0057 4b80          	push	#128
 159  0059 ae500a        	ldw	x,#20490
 160  005c cd0000        	call	_GPIO_WriteLow
 162  005f 84            	pop	a
 163                     ; 23     GPIO_WriteLow(LCD_PORT, LCD_DB6);   
 165  0060 4b40          	push	#64
 166  0062 ae500a        	ldw	x,#20490
 167  0065 cd0000        	call	_GPIO_WriteLow
 169  0068 84            	pop	a
 170                     ; 24     GPIO_WriteHigh(LCD_PORT, LCD_DB5);   
 172  0069 4b20          	push	#32
 173  006b ae500a        	ldw	x,#20490
 174  006e cd0000        	call	_GPIO_WriteHigh
 176  0071 84            	pop	a
 177                     ; 25     GPIO_WriteHigh(LCD_PORT, LCD_DB4);                      
 179  0072 4b10          	push	#16
 180  0074 ae500a        	ldw	x,#20490
 181  0077 cd0000        	call	_GPIO_WriteHigh
 183  007a 84            	pop	a
 184                     ; 26 	toggle_EN_pin();
 186  007b cd01d3        	call	_toggle_EN_pin
 188                     ; 28     GPIO_WriteLow(LCD_PORT, LCD_DB7);   
 190  007e 4b80          	push	#128
 191  0080 ae500a        	ldw	x,#20490
 192  0083 cd0000        	call	_GPIO_WriteLow
 194  0086 84            	pop	a
 195                     ; 29     GPIO_WriteLow(LCD_PORT, LCD_DB6);   
 197  0087 4b40          	push	#64
 198  0089 ae500a        	ldw	x,#20490
 199  008c cd0000        	call	_GPIO_WriteLow
 201  008f 84            	pop	a
 202                     ; 30     GPIO_WriteHigh(LCD_PORT, LCD_DB5);   
 204  0090 4b20          	push	#32
 205  0092 ae500a        	ldw	x,#20490
 206  0095 cd0000        	call	_GPIO_WriteHigh
 208  0098 84            	pop	a
 209                     ; 31     GPIO_WriteHigh(LCD_PORT, LCD_DB4);  
 211  0099 4b10          	push	#16
 212  009b ae500a        	ldw	x,#20490
 213  009e cd0000        	call	_GPIO_WriteHigh
 215  00a1 84            	pop	a
 216                     ; 32     toggle_EN_pin();
 218  00a2 cd01d3        	call	_toggle_EN_pin
 220                     ; 34     GPIO_WriteLow(LCD_PORT, LCD_DB7);   
 222  00a5 4b80          	push	#128
 223  00a7 ae500a        	ldw	x,#20490
 224  00aa cd0000        	call	_GPIO_WriteLow
 226  00ad 84            	pop	a
 227                     ; 35     GPIO_WriteLow(LCD_PORT, LCD_DB6);   
 229  00ae 4b40          	push	#64
 230  00b0 ae500a        	ldw	x,#20490
 231  00b3 cd0000        	call	_GPIO_WriteLow
 233  00b6 84            	pop	a
 234                     ; 36     GPIO_WriteHigh(LCD_PORT, LCD_DB5);   
 236  00b7 4b20          	push	#32
 237  00b9 ae500a        	ldw	x,#20490
 238  00bc cd0000        	call	_GPIO_WriteHigh
 240  00bf 84            	pop	a
 241                     ; 37     GPIO_WriteHigh(LCD_PORT, LCD_DB4);  
 243  00c0 4b10          	push	#16
 244  00c2 ae500a        	ldw	x,#20490
 245  00c5 cd0000        	call	_GPIO_WriteHigh
 247  00c8 84            	pop	a
 248                     ; 38     toggle_EN_pin();                  
 250  00c9 cd01d3        	call	_toggle_EN_pin
 252                     ; 40     GPIO_WriteLow(LCD_PORT, LCD_DB7);   
 254  00cc 4b80          	push	#128
 255  00ce ae500a        	ldw	x,#20490
 256  00d1 cd0000        	call	_GPIO_WriteLow
 258  00d4 84            	pop	a
 259                     ; 41     GPIO_WriteLow(LCD_PORT, LCD_DB6);   
 261  00d5 4b40          	push	#64
 262  00d7 ae500a        	ldw	x,#20490
 263  00da cd0000        	call	_GPIO_WriteLow
 265  00dd 84            	pop	a
 266                     ; 42     GPIO_WriteHigh(LCD_PORT, LCD_DB5);        
 268  00de 4b20          	push	#32
 269  00e0 ae500a        	ldw	x,#20490
 270  00e3 cd0000        	call	_GPIO_WriteHigh
 272  00e6 84            	pop	a
 273                     ; 43     GPIO_WriteLow(LCD_PORT, LCD_DB4);  
 275  00e7 4b10          	push	#16
 276  00e9 ae500a        	ldw	x,#20490
 277  00ec cd0000        	call	_GPIO_WriteLow
 279  00ef 84            	pop	a
 280                     ; 44     toggle_EN_pin();
 282  00f0 cd01d3        	call	_toggle_EN_pin
 284                     ; 46     LCD_send((_4_pin_interface | _2_row_display | _5x7_dots), CMD);
 286  00f3 ae2800        	ldw	x,#10240
 287  00f6 ad10          	call	_LCD_send
 289                     ; 47     LCD_send((display_on | cursor_off | blink_off), CMD); 
 291  00f8 ae0c00        	ldw	x,#3072
 292  00fb ad0b          	call	_LCD_send
 294                     ; 48     LCD_send(clear_display, CMD);         
 296  00fd ae0100        	ldw	x,#256
 297  0100 ad06          	call	_LCD_send
 299                     ; 49     LCD_send((cursor_direction_inc | display_no_shift), CMD);
 301  0102 ae0600        	ldw	x,#1536
 302  0105 ad01          	call	_LCD_send
 304                     ; 50 }   
 307  0107 81            	ret
 353                     ; 53 void LCD_send(unsigned char value, unsigned char mode)
 353                     ; 54 {                               
 354                     	switch	.text
 355  0108               _LCD_send:
 357  0108 89            	pushw	x
 358       00000000      OFST:	set	0
 361                     ; 55     switch(mode)
 363  0109 9f            	ld	a,xl
 365                     ; 65 			break;
 366  010a 4d            	tnz	a
 367  010b 270e          	jreq	L33
 368  010d 4a            	dec	a
 369  010e 2614          	jrne	L16
 370                     ; 59 			GPIO_WriteHigh(LCD_PORT, LCD_RS);   
 372  0110 4b04          	push	#4
 373  0112 ae500a        	ldw	x,#20490
 374  0115 cd0000        	call	_GPIO_WriteHigh
 376  0118 84            	pop	a
 377                     ; 60 			break;
 379  0119 2009          	jra	L16
 380  011b               L33:
 381                     ; 64 			GPIO_WriteLow(LCD_PORT, LCD_RS);   
 383  011b 4b04          	push	#4
 384  011d ae500a        	ldw	x,#20490
 385  0120 cd0000        	call	_GPIO_WriteLow
 387  0123 84            	pop	a
 388                     ; 65 			break;
 390  0124               L16:
 391                     ; 69     LCD_4bit_send(value);
 393  0124 7b01          	ld	a,(OFST+1,sp)
 394  0126 ad02          	call	_LCD_4bit_send
 396                     ; 70 }  
 399  0128 85            	popw	x
 400  0129 81            	ret
 436                     ; 73 void LCD_4bit_send(unsigned char lcd_data)       
 436                     ; 74 {
 437                     	switch	.text
 438  012a               _LCD_4bit_send:
 440  012a 88            	push	a
 441       00000000      OFST:	set	0
 444                     ; 75 	toggle_io(lcd_data, 7, LCD_DB7);
 446  012b 4b80          	push	#128
 447  012d ae0007        	ldw	x,#7
 448  0130 95            	ld	xh,a
 449  0131 cd01ec        	call	_toggle_io
 451  0134 84            	pop	a
 452                     ; 76 	toggle_io(lcd_data, 6, LCD_DB6);
 454  0135 4b40          	push	#64
 455  0137 7b02          	ld	a,(OFST+2,sp)
 456  0139 ae0006        	ldw	x,#6
 457  013c 95            	ld	xh,a
 458  013d cd01ec        	call	_toggle_io
 460  0140 84            	pop	a
 461                     ; 77 	toggle_io(lcd_data, 5, LCD_DB5);
 463  0141 4b20          	push	#32
 464  0143 7b02          	ld	a,(OFST+2,sp)
 465  0145 ae0005        	ldw	x,#5
 466  0148 95            	ld	xh,a
 467  0149 cd01ec        	call	_toggle_io
 469  014c 84            	pop	a
 470                     ; 78 	toggle_io(lcd_data, 4, LCD_DB4);
 472  014d 4b10          	push	#16
 473  014f 7b02          	ld	a,(OFST+2,sp)
 474  0151 ae0004        	ldw	x,#4
 475  0154 95            	ld	xh,a
 476  0155 cd01ec        	call	_toggle_io
 478  0158 84            	pop	a
 479                     ; 79     toggle_EN_pin();
 481  0159 ad78          	call	_toggle_EN_pin
 483                     ; 80 	toggle_io(lcd_data, 3, LCD_DB7);
 485  015b 4b80          	push	#128
 486  015d 7b02          	ld	a,(OFST+2,sp)
 487  015f ae0003        	ldw	x,#3
 488  0162 95            	ld	xh,a
 489  0163 cd01ec        	call	_toggle_io
 491  0166 84            	pop	a
 492                     ; 81 	toggle_io(lcd_data, 2, LCD_DB6);
 494  0167 4b40          	push	#64
 495  0169 7b02          	ld	a,(OFST+2,sp)
 496  016b ae0002        	ldw	x,#2
 497  016e 95            	ld	xh,a
 498  016f ad7b          	call	_toggle_io
 500  0171 84            	pop	a
 501                     ; 82 	toggle_io(lcd_data, 1, LCD_DB5);
 503  0172 4b20          	push	#32
 504  0174 7b02          	ld	a,(OFST+2,sp)
 505  0176 ae0001        	ldw	x,#1
 506  0179 95            	ld	xh,a
 507  017a ad70          	call	_toggle_io
 509  017c 84            	pop	a
 510                     ; 83 	toggle_io(lcd_data, 0, LCD_DB4);
 512  017d 4b10          	push	#16
 513  017f 7b02          	ld	a,(OFST+2,sp)
 514  0181 5f            	clrw	x
 515  0182 95            	ld	xh,a
 516  0183 ad67          	call	_toggle_io
 518  0185 84            	pop	a
 519                     ; 84 	toggle_EN_pin();
 521  0186 ad4b          	call	_toggle_EN_pin
 523                     ; 85 }  
 526  0188 84            	pop	a
 527  0189 81            	ret
 563                     ; 88 void LCD_putstr(char *lcd_string)
 563                     ; 89 {
 564                     	switch	.text
 565  018a               _LCD_putstr:
 567  018a 89            	pushw	x
 568       00000000      OFST:	set	0
 571  018b               L711:
 572                     ; 92         LCD_send(*lcd_string++, DAT);
 574  018b 1e01          	ldw	x,(OFST+1,sp)
 575  018d 1c0001        	addw	x,#1
 576  0190 1f01          	ldw	(OFST+1,sp),x
 577  0192 1d0001        	subw	x,#1
 578  0195 f6            	ld	a,(x)
 579  0196 ae0001        	ldw	x,#1
 580  0199 95            	ld	xh,a
 581  019a cd0108        	call	_LCD_send
 583                     ; 93     }while(*lcd_string != '\0');
 585  019d 1e01          	ldw	x,(OFST+1,sp)
 586  019f 7d            	tnz	(x)
 587  01a0 26e9          	jrne	L711
 588                     ; 94 }
 591  01a2 85            	popw	x
 592  01a3 81            	ret
 627                     ; 97 void LCD_putchar(char char_data)
 627                     ; 98 {
 628                     	switch	.text
 629  01a4               _LCD_putchar:
 633                     ; 99     LCD_send(char_data, DAT);
 635  01a4 ae0001        	ldw	x,#1
 636  01a7 95            	ld	xh,a
 637  01a8 cd0108        	call	_LCD_send
 639                     ; 100 }
 642  01ab 81            	ret
 666                     ; 103 void LCD_clear_home(void)
 666                     ; 104 {
 667                     	switch	.text
 668  01ac               _LCD_clear_home:
 672                     ; 105     LCD_send(clear_display, CMD);
 674  01ac ae0100        	ldw	x,#256
 675  01af cd0108        	call	_LCD_send
 677                     ; 106     LCD_send(goto_home, CMD);
 679  01b2 ae0200        	ldw	x,#512
 680  01b5 cd0108        	call	_LCD_send
 682                     ; 107 }
 685  01b8 81            	ret
 729                     ; 110 void LCD_goto(unsigned char  x_pos, unsigned char  y_pos)
 729                     ; 111 {                                                   
 730                     	switch	.text
 731  01b9               _LCD_goto:
 733  01b9 89            	pushw	x
 734       00000000      OFST:	set	0
 737                     ; 112 	if(y_pos == 0)    
 739  01ba 9f            	ld	a,xl
 740  01bb 4d            	tnz	a
 741  01bc 260a          	jrne	L571
 742                     ; 114         LCD_send((0x80 | x_pos), CMD);
 744  01be 9e            	ld	a,xh
 745  01bf aa80          	or	a,#128
 746  01c1 5f            	clrw	x
 747  01c2 95            	ld	xh,a
 748  01c3 cd0108        	call	_LCD_send
 751  01c6 2009          	jra	L771
 752  01c8               L571:
 753                     ; 118         LCD_send((0x80 | 0x40 | x_pos), CMD); 
 755  01c8 7b01          	ld	a,(OFST+1,sp)
 756  01ca aac0          	or	a,#192
 757  01cc 5f            	clrw	x
 758  01cd 95            	ld	xh,a
 759  01ce cd0108        	call	_LCD_send
 761  01d1               L771:
 762                     ; 120 }
 765  01d1 85            	popw	x
 766  01d2 81            	ret
 792                     ; 123 void toggle_EN_pin(void)
 792                     ; 124 {
 793                     	switch	.text
 794  01d3               _toggle_EN_pin:
 798                     ; 125 	GPIO_WriteHigh(LCD_PORT, LCD_EN);    
 800  01d3 4b08          	push	#8
 801  01d5 ae500a        	ldw	x,#20490
 802  01d8 cd0000        	call	_GPIO_WriteHigh
 804  01db 84            	pop	a
 805                     ; 126     delay_ms(1);
 807  01dc ae0001        	ldw	x,#1
 808  01df cd0000        	call	_delay_ms
 810                     ; 127     GPIO_WriteLow(LCD_PORT,LCD_EN);   
 812  01e2 4b08          	push	#8
 813  01e4 ae500a        	ldw	x,#20490
 814  01e7 cd0000        	call	_GPIO_WriteLow
 816  01ea 84            	pop	a
 817                     ; 128 }
 820  01eb 81            	ret
 904                     ; 131 void toggle_io(unsigned char lcd_data, unsigned char bit_pos, unsigned char pin_num)
 904                     ; 132 {
 905                     	switch	.text
 906  01ec               _toggle_io:
 908  01ec 89            	pushw	x
 909  01ed 88            	push	a
 910       00000001      OFST:	set	1
 913                     ; 133 	bool temp = FALSE;
 915                     ; 135     temp = (0x01 & (lcd_data >> bit_pos));
 917  01ee 9f            	ld	a,xl
 918  01ef 5f            	clrw	x
 919  01f0 97            	ld	xl,a
 920  01f1 7b02          	ld	a,(OFST+1,sp)
 921  01f3 5d            	tnzw	x
 922  01f4 2704          	jreq	L03
 923  01f6               L23:
 924  01f6 44            	srl	a
 925  01f7 5a            	decw	x
 926  01f8 26fc          	jrne	L23
 927  01fa               L03:
 928  01fa a401          	and	a,#1
 929  01fc 6b01          	ld	(OFST+0,sp),a
 931                     ; 137 	switch(temp)
 933  01fe 7b01          	ld	a,(OFST+0,sp)
 934  0200 a101          	cp	a,#1
 935  0202 260c          	jrne	L312
 938  0204               L112:
 939                     ; 141 			GPIO_WriteHigh(LCD_PORT, pin_num);   
 941  0204 7b06          	ld	a,(OFST+5,sp)
 942  0206 88            	push	a
 943  0207 ae500a        	ldw	x,#20490
 944  020a cd0000        	call	_GPIO_WriteHigh
 946  020d 84            	pop	a
 947                     ; 142 			break;
 949  020e 200a          	jra	L162
 950  0210               L312:
 951                     ; 146 			GPIO_WriteLow(LCD_PORT, pin_num);   
 953  0210 7b06          	ld	a,(OFST+5,sp)
 954  0212 88            	push	a
 955  0213 ae500a        	ldw	x,#20490
 956  0216 cd0000        	call	_GPIO_WriteLow
 958  0219 84            	pop	a
 959                     ; 147 			break;
 960  021a               L162:
 961                     ; 150 }
 964  021a 5b03          	addw	sp,#3
 965  021c 81            	ret
 978                     	xdef	_toggle_io
 979                     	xdef	_toggle_EN_pin
 980                     	xdef	_LCD_goto
 981                     	xdef	_LCD_clear_home
 982                     	xdef	_LCD_putchar
 983                     	xdef	_LCD_putstr
 984                     	xdef	_LCD_4bit_send
 985                     	xdef	_LCD_send
 986                     	xdef	_LCD_init
 987                     	xdef	_LCD_GPIO_init
 988                     	xref	_GPIO_WriteLow
 989                     	xref	_GPIO_WriteHigh
 990                     	xref	_GPIO_Init
 991                     	xref	_delay_ms
1010                     	end
