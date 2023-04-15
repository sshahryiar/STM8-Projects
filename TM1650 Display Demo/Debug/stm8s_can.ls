   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.12 - 20 Jun 2018
   3                     ; Generator (Limited) V4.4.8 - 20 Jun 2018
  14                     	bsct
  15  0000               __Id:
  16  0000 00000000      	dc.l	0
  17  0004               __IDE:
  18  0004 00            	dc.b	0
  19  0005               __RTR:
  20  0005 00            	dc.b	0
  21  0006               __DLC:
  22  0006 00            	dc.b	0
  23  0007               __Data:
  24  0007 00            	dc.b	0
  25  0008 000000000000  	ds.b	7
  26  000f               __FMI:
  27  000f 00            	dc.b	0
  57                     ; 62 void CAN_DeInit(void)
  57                     ; 63 {
  59                     	switch	.text
  60  0000               _CAN_DeInit:
  64                     ; 65   CAN->MCR = CAN_MCR_INRQ;
  66  0000 35015420      	mov	21536,#1
  67                     ; 66   CAN->PSR = CAN_Page_Config;
  69  0004 35065427      	mov	21543,#6
  70                     ; 67   CAN_OperatingModeRequest(CAN_OperatingMode_Initialization);
  72  0008 4f            	clr	a
  73  0009 cd0883        	call	_CAN_OperatingModeRequest
  75                     ; 68   CAN->Page.Config.ESR = CAN_ESR_RESET_VALUE;
  77  000c 725f5428      	clr	21544
  78                     ; 69   CAN->Page.Config.EIER = CAN_EIER_RESET_VALUE;
  80  0010 725f5429      	clr	21545
  81                     ; 70   CAN->Page.Config.BTR1 = CAN_BTR1_RESET_VALUE;
  83  0014 3540542c      	mov	21548,#64
  84                     ; 71   CAN->Page.Config.BTR2 = CAN_BTR2_RESET_VALUE;
  86  0018 3523542d      	mov	21549,#35
  87                     ; 72   CAN->Page.Config.FMR1 = CAN_FMR1_RESET_VALUE;
  89  001c 725f5430      	clr	21552
  90                     ; 73   CAN->Page.Config.FMR2 = CAN_FMR2_RESET_VALUE;
  92  0020 725f5431      	clr	21553
  93                     ; 74   CAN->Page.Config.FCR1 = CAN_FCR_RESET_VALUE;
  95  0024 725f5432      	clr	21554
  96                     ; 75   CAN->Page.Config.FCR2 = CAN_FCR_RESET_VALUE;
  98  0028 725f5433      	clr	21555
  99                     ; 76   CAN->Page.Config.FCR3 = CAN_FCR_RESET_VALUE;
 101  002c 725f5434      	clr	21556
 102                     ; 77   CAN_OperatingModeRequest(CAN_OperatingMode_Normal);
 104  0030 a601          	ld	a,#1
 105  0032 cd0883        	call	_CAN_OperatingModeRequest
 107                     ; 78   CAN->PSR = CAN_Page_RxFifo;
 109  0035 35075427      	mov	21543,#7
 110                     ; 79   CAN->Page.RxFIFO.MDLCR = CAN_MDLC_RESET_VALUE;
 112  0039 725f5429      	clr	21545
 113                     ; 80   CAN->PSR = CAN_Page_TxMailBox0;
 115  003d 725f5427      	clr	21543
 116                     ; 81   CAN->Page.TxMailbox.MDLCR = CAN_MDLC_RESET_VALUE;
 118  0041 725f5429      	clr	21545
 119                     ; 82   CAN->PSR = CAN_Page_TxMailBox1;
 121  0045 35015427      	mov	21543,#1
 122                     ; 83   CAN->Page.TxMailbox.MDLCR = CAN_MDLC_RESET_VALUE;
 124  0049 725f5429      	clr	21545
 125                     ; 84   CAN->PSR = CAN_Page_TxMailBox2;
 127  004d 35055427      	mov	21543,#5
 128                     ; 85   CAN->Page.TxMailbox.MDLCR = CAN_MDLC_RESET_VALUE;
 130  0051 725f5429      	clr	21545
 131                     ; 87   CAN->MCR = CAN_MCR_RESET_VALUE;
 133  0055 35025420      	mov	21536,#2
 134                     ; 88   CAN->MSR = (uint8_t)(~CAN_MSR_RESET_VALUE);/* rc_w1 */
 136  0059 35fd5421      	mov	21537,#253
 137                     ; 89   CAN->TSR = (uint8_t)(~CAN_TSR_RESET_VALUE);/* rc_w1 */
 139  005d 35ff5422      	mov	21538,#255
 140                     ; 90   CAN->RFR = (uint8_t)(~CAN_RFR_RESET_VALUE);/* rc_w1 */
 142  0061 35ff5424      	mov	21540,#255
 143                     ; 91   CAN->IER = CAN_IER_RESET_VALUE;
 145  0065 725f5425      	clr	21541
 146                     ; 92   CAN->DGR = CAN_DGR_RESET_VALUE;
 148  0069 350c5426      	mov	21542,#12
 149                     ; 93   CAN->PSR = CAN_PSR_RESET_VALUE;
 151  006d 725f5427      	clr	21543
 152                     ; 94 }
 155  0071 81            	ret
 705                     ; 106 CAN_InitStatus_TypeDef CAN_Init(CAN_MasterCtrl_TypeDef CAN_MasterCtrl,
 705                     ; 107                                 CAN_Mode_TypeDef CAN_Mode,
 705                     ; 108                                 CAN_SynJumpWidth_TypeDef CAN_SynJumpWidth,
 705                     ; 109                                 CAN_BitSeg1_TypeDef CAN_BitSeg1,
 705                     ; 110                                 CAN_BitSeg2_TypeDef CAN_BitSeg2,
 705                     ; 111                                 uint8_t CAN_Prescaler)
 705                     ; 112 {
 706                     	switch	.text
 707  0072               _CAN_Init:
 709  0072 89            	pushw	x
 710  0073 5204          	subw	sp,#4
 711       00000004      OFST:	set	4
 714                     ; 113   CAN_InitStatus_TypeDef InitStatus =  CAN_InitStatus_Failed;
 716                     ; 114   uint16_t timeout = CAN_ACKNOWLEDGE_TIMEOUT;
 718  0075 aeffff        	ldw	x,#65535
 719  0078 1f03          	ldw	(OFST-1,sp),x
 721                     ; 115   CAN_Page_TypeDef can_page = CAN_GetSelectedPage();
 723  007a cd0c3d        	call	_CAN_GetSelectedPage
 725  007d 6b01          	ld	(OFST-3,sp),a
 727                     ; 119   assert_param(IS_CAN_MASTERCTRL_OK(CAN_MasterCtrl));
 729                     ; 120   assert_param(IS_CAN_MODE_OK(CAN_Mode));
 731                     ; 121   assert_param(IS_CAN_SYNJUMPWIDTH_OK(CAN_SynJumpWidth));
 733                     ; 122   assert_param(IS_CAN_BITSEG1_OK(CAN_BitSeg1));
 735                     ; 123   assert_param(IS_CAN_BITSEG2_OK(CAN_BitSeg2));
 737                     ; 124   assert_param(IS_CAN_PRESCALER_OK(CAN_Prescaler));
 739                     ; 127   CAN->MCR = CAN_MCR_INRQ;
 741  007f 35015420      	mov	21536,#1
 743  0083 2007          	jra	L503
 744  0085               L103:
 745                     ; 131     timeout--;
 747  0085 1e03          	ldw	x,(OFST-1,sp)
 748  0087 1d0001        	subw	x,#1
 749  008a 1f03          	ldw	(OFST-1,sp),x
 751  008c               L503:
 752                     ; 129   while (((uint8_t)(CAN->MSR & CAN_MSR_INAK) != 0x01) && ((uint16_t)timeout != 0))
 754  008c c65421        	ld	a,21537
 755  008f a401          	and	a,#1
 756  0091 a101          	cp	a,#1
 757  0093 2704          	jreq	L113
 759  0095 1e03          	ldw	x,(OFST-1,sp)
 760  0097 26ec          	jrne	L103
 761  0099               L113:
 762                     ; 135   if ((CAN->MSR & CAN_MSR_INAK) != CAN_MSR_INAK)
 764  0099 c65421        	ld	a,21537
 765  009c a401          	and	a,#1
 766  009e a101          	cp	a,#1
 767  00a0 270c          	jreq	L313
 768                     ; 138     InitStatus =  CAN_InitStatus_Failed;
 770  00a2 0f02          	clr	(OFST-2,sp)
 773  00a4               L513:
 774                     ; 172   CAN_SelectPage(can_page);
 776  00a4 7b01          	ld	a,(OFST-3,sp)
 777  00a6 cd0c41        	call	_CAN_SelectPage
 779                     ; 175   return (CAN_InitStatus_TypeDef)InitStatus;
 781  00a9 7b02          	ld	a,(OFST-2,sp)
 784  00ab 5b06          	addw	sp,#6
 785  00ad 81            	ret
 786  00ae               L313:
 787                     ; 145     CAN->MCR |= (uint8_t)CAN_MasterCtrl;
 789  00ae c65420        	ld	a,21536
 790  00b1 1a05          	or	a,(OFST+1,sp)
 791  00b3 c75420        	ld	21536,a
 792                     ; 148     CAN->DGR |= (uint8_t)CAN_Mode ;
 794  00b6 c65426        	ld	a,21542
 795  00b9 1a06          	or	a,(OFST+2,sp)
 796  00bb c75426        	ld	21542,a
 797                     ; 149     CAN->PSR = CAN_Page_Config;
 799  00be 35065427      	mov	21543,#6
 800                     ; 150     CAN->Page.Config.BTR1 = (uint8_t)((uint8_t)(CAN_Prescaler - (uint8_t)1) | CAN_SynJumpWidth);
 802  00c2 7b0c          	ld	a,(OFST+8,sp)
 803  00c4 4a            	dec	a
 804  00c5 1a09          	or	a,(OFST+5,sp)
 805  00c7 c7542c        	ld	21548,a
 806                     ; 151     CAN->Page.Config.BTR2 = (uint8_t)(CAN_BitSeg1 | (uint8_t)CAN_BitSeg2);
 808  00ca 7b0a          	ld	a,(OFST+6,sp)
 809  00cc 1a0b          	or	a,(OFST+7,sp)
 810  00ce c7542d        	ld	21549,a
 811                     ; 154     CAN->MCR &= (uint8_t)(~CAN_MCR_INRQ);
 813  00d1 72115420      	bres	21536,#0
 814                     ; 156     timeout = 0xFFFF;
 816  00d5 aeffff        	ldw	x,#65535
 817  00d8 1f03          	ldw	(OFST-1,sp),x
 820  00da 2007          	jra	L323
 821  00dc               L713:
 822                     ; 159       timeout--;
 824  00dc 1e03          	ldw	x,(OFST-1,sp)
 825  00de 1d0001        	subw	x,#1
 826  00e1 1f03          	ldw	(OFST-1,sp),x
 828  00e3               L323:
 829                     ; 157     while ((((uint8_t)(CAN->MSR & CAN_MSR_INAK) == 0x01))&&(timeout != 0))
 829                     ; 158     {
 829                     ; 159       timeout--;
 831  00e3 c65421        	ld	a,21537
 832  00e6 a401          	and	a,#1
 833  00e8 a101          	cp	a,#1
 834  00ea 2604          	jrne	L723
 836  00ec 1e03          	ldw	x,(OFST-1,sp)
 837  00ee 26ec          	jrne	L713
 838  00f0               L723:
 839                     ; 162     if ((CAN->MSR & CAN_MSR_INAK) == CAN_MSR_INAK)
 841  00f0 c65421        	ld	a,21537
 842  00f3 a401          	and	a,#1
 843  00f5 a101          	cp	a,#1
 844  00f7 2604          	jrne	L133
 845                     ; 164       InitStatus = CAN_InitStatus_Failed;
 847  00f9 0f02          	clr	(OFST-2,sp)
 850  00fb 20a7          	jra	L513
 851  00fd               L133:
 852                     ; 168       InitStatus = CAN_InitStatus_Success;
 854  00fd a601          	ld	a,#1
 855  00ff 6b02          	ld	(OFST-2,sp),a
 857  0101 20a1          	jra	L513
1189                     ; 194 void CAN_FilterInit(CAN_FilterNumber_TypeDef CAN_FilterNumber,
1189                     ; 195                     FunctionalState CAN_FilterActivation,
1189                     ; 196                     CAN_FilterMode_TypeDef CAN_FilterMode,
1189                     ; 197                     CAN_FilterScale_TypeDef CAN_FilterScale,
1189                     ; 198                     uint8_t CAN_FilterID1,
1189                     ; 199                     uint8_t CAN_FilterID2,
1189                     ; 200                     uint8_t CAN_FilterID3,
1189                     ; 201                     uint8_t CAN_FilterID4,
1189                     ; 202                     uint8_t CAN_FilterIDMask1,
1189                     ; 203                     uint8_t CAN_FilterIDMask2,
1189                     ; 204                     uint8_t CAN_FilterIDMask3,
1189                     ; 205                     uint8_t CAN_FilterIDMask4)
1189                     ; 206 {
1190                     	switch	.text
1191  0103               _CAN_FilterInit:
1193  0103 89            	pushw	x
1194  0104 5205          	subw	sp,#5
1195       00000005      OFST:	set	5
1198                     ; 207   uint8_t fact = 0;
1200                     ; 208   uint8_t fsc  = 0;
1202                     ; 209   uint8_t fmhl = 0;
1204                     ; 211   CAN_Page_TypeDef can_page_filter = CAN_Page_Filter01;
1206                     ; 212   CAN_Page_TypeDef can_page = CAN_GetSelectedPage();
1208  0106 cd0c3d        	call	_CAN_GetSelectedPage
1210  0109 6b01          	ld	(OFST-4,sp),a
1212                     ; 215   assert_param(IS_CAN_FILTER_NUMBER_OK(CAN_FilterNumber));
1214                     ; 216   assert_param(IS_FUNCTIONALSTATE_OK(CAN_FilterActivation));
1216                     ; 217   assert_param(IS_CAN_FILTER_MODE_OK(CAN_FilterMode));
1218                     ; 218   assert_param(IS_CAN_FILTER_SCALE_OK(CAN_FilterScale));
1220                     ; 221   if (CAN_FilterNumber == CAN_FilterNumber_0)
1222  010b 0d06          	tnz	(OFST+1,sp)
1223  010d 2610          	jrne	L335
1224                     ; 223     fact = 0x01;
1226  010f a601          	ld	a,#1
1227  0111 6b03          	ld	(OFST-2,sp),a
1229                     ; 224     fsc  = 0x00;
1231  0113 0f04          	clr	(OFST-1,sp)
1233                     ; 225     fmhl = 0x03;
1235  0115 a603          	ld	a,#3
1236  0117 6b05          	ld	(OFST+0,sp),a
1238                     ; 227     can_page_filter = CAN_Page_Filter01;
1240  0119 a602          	ld	a,#2
1241  011b 6b02          	ld	(OFST-3,sp),a
1244  011d 206c          	jra	L535
1245  011f               L335:
1246                     ; 229   else if (CAN_FilterNumber == CAN_FilterNumber_1)
1248  011f 7b06          	ld	a,(OFST+1,sp)
1249  0121 a101          	cp	a,#1
1250  0123 2612          	jrne	L735
1251                     ; 231     fact = 0x10;
1253  0125 a610          	ld	a,#16
1254  0127 6b03          	ld	(OFST-2,sp),a
1256                     ; 232     fsc  = 0x04;
1258  0129 a604          	ld	a,#4
1259  012b 6b04          	ld	(OFST-1,sp),a
1261                     ; 233     fmhl = 0x0C;
1263  012d a60c          	ld	a,#12
1264  012f 6b05          	ld	(OFST+0,sp),a
1266                     ; 235     can_page_filter = CAN_Page_Filter01;
1268  0131 a602          	ld	a,#2
1269  0133 6b02          	ld	(OFST-3,sp),a
1272  0135 2054          	jra	L535
1273  0137               L735:
1274                     ; 237   else if (CAN_FilterNumber == CAN_FilterNumber_2)
1276  0137 7b06          	ld	a,(OFST+1,sp)
1277  0139 a102          	cp	a,#2
1278  013b 2610          	jrne	L345
1279                     ; 239     fact = 0x01;
1281  013d a601          	ld	a,#1
1282  013f 6b03          	ld	(OFST-2,sp),a
1284                     ; 240     fsc  = 0x00;
1286  0141 0f04          	clr	(OFST-1,sp)
1288                     ; 241     fmhl = 0x30;
1290  0143 a630          	ld	a,#48
1291  0145 6b05          	ld	(OFST+0,sp),a
1293                     ; 243     can_page_filter = CAN_Page_Filter23;
1295  0147 a603          	ld	a,#3
1296  0149 6b02          	ld	(OFST-3,sp),a
1299  014b 203e          	jra	L535
1300  014d               L345:
1301                     ; 245   else if (CAN_FilterNumber == CAN_FilterNumber_3)
1303  014d 7b06          	ld	a,(OFST+1,sp)
1304  014f a103          	cp	a,#3
1305  0151 2612          	jrne	L745
1306                     ; 247     fact = 0x10;
1308  0153 a610          	ld	a,#16
1309  0155 6b03          	ld	(OFST-2,sp),a
1311                     ; 248     fsc  = 0x04;
1313  0157 a604          	ld	a,#4
1314  0159 6b04          	ld	(OFST-1,sp),a
1316                     ; 249     fmhl = 0xC0;
1318  015b a6c0          	ld	a,#192
1319  015d 6b05          	ld	(OFST+0,sp),a
1321                     ; 251     can_page_filter = CAN_Page_Filter23;
1323  015f a603          	ld	a,#3
1324  0161 6b02          	ld	(OFST-3,sp),a
1327  0163 2026          	jra	L535
1328  0165               L745:
1329                     ; 253   else if (CAN_FilterNumber == CAN_FilterNumber_4)
1331  0165 7b06          	ld	a,(OFST+1,sp)
1332  0167 a104          	cp	a,#4
1333  0169 2610          	jrne	L355
1334                     ; 255     fact = 0x01;
1336  016b a601          	ld	a,#1
1337  016d 6b03          	ld	(OFST-2,sp),a
1339                     ; 256     fsc  = 0x00;
1341  016f 0f04          	clr	(OFST-1,sp)
1343                     ; 257     fmhl = 0x03;
1345  0171 a603          	ld	a,#3
1346  0173 6b05          	ld	(OFST+0,sp),a
1348                     ; 259     can_page_filter = CAN_Page_Filter45;
1350  0175 a604          	ld	a,#4
1351  0177 6b02          	ld	(OFST-3,sp),a
1354  0179 2010          	jra	L535
1355  017b               L355:
1356                     ; 263     fact = 0x10;
1358  017b a610          	ld	a,#16
1359  017d 6b03          	ld	(OFST-2,sp),a
1361                     ; 264     fsc  = 0x04;
1363  017f a604          	ld	a,#4
1364  0181 6b04          	ld	(OFST-1,sp),a
1366                     ; 265     fmhl = 0x0C;
1368  0183 a60c          	ld	a,#12
1369  0185 6b05          	ld	(OFST+0,sp),a
1371                     ; 267     can_page_filter = CAN_Page_Filter45;
1373  0187 a604          	ld	a,#4
1374  0189 6b02          	ld	(OFST-3,sp),a
1376  018b               L535:
1377                     ; 271   CAN_OperatingModeRequest(CAN_OperatingMode_Initialization);
1379  018b 4f            	clr	a
1380  018c cd0883        	call	_CAN_OperatingModeRequest
1382                     ; 273   CAN->PSR = CAN_Page_Config;
1384  018f 35065427      	mov	21543,#6
1385                     ; 278   if (can_page_filter == CAN_Page_Filter01) /* FCR1 */
1387  0193 7b02          	ld	a,(OFST-3,sp)
1388  0195 a102          	cp	a,#2
1389  0197 262b          	jrne	L755
1390                     ; 281     CAN->Page.Config.FCR1 &= (uint8_t)(~(uint8_t)(fact | (uint8_t)((uint8_t)(CAN_FCR1_FSC00|CAN_FCR1_FSC01) << fsc )));
1392  0199 7b04          	ld	a,(OFST-1,sp)
1393  019b 5f            	clrw	x
1394  019c 97            	ld	xl,a
1395  019d a606          	ld	a,#6
1396  019f 5d            	tnzw	x
1397  01a0 2704          	jreq	L21
1398  01a2               L41:
1399  01a2 48            	sll	a
1400  01a3 5a            	decw	x
1401  01a4 26fc          	jrne	L41
1402  01a6               L21:
1403  01a6 1a03          	or	a,(OFST-2,sp)
1404  01a8 43            	cpl	a
1405  01a9 c45432        	and	a,21554
1406  01ac c75432        	ld	21554,a
1407                     ; 283     CAN->Page.Config.FCR1 |= (uint8_t)(CAN_FilterScale << fsc);
1409  01af 7b04          	ld	a,(OFST-1,sp)
1410  01b1 5f            	clrw	x
1411  01b2 97            	ld	xl,a
1412  01b3 7b0b          	ld	a,(OFST+6,sp)
1413  01b5 5d            	tnzw	x
1414  01b6 2704          	jreq	L61
1415  01b8               L02:
1416  01b8 48            	sll	a
1417  01b9 5a            	decw	x
1418  01ba 26fc          	jrne	L02
1419  01bc               L61:
1420  01bc ca5432        	or	a,21554
1421  01bf c75432        	ld	21554,a
1423  01c2 205a          	jra	L165
1424  01c4               L755:
1425                     ; 285   else if (can_page_filter == CAN_Page_Filter23) /* FCR2*/
1427  01c4 7b02          	ld	a,(OFST-3,sp)
1428  01c6 a103          	cp	a,#3
1429  01c8 262b          	jrne	L365
1430                     ; 288     CAN->Page.Config.FCR2 &= (uint8_t)~(uint8_t)( fact | (uint8_t)((uint8_t)(CAN_FCR1_FSC00|CAN_FCR1_FSC01) << fsc ));
1432  01ca 7b04          	ld	a,(OFST-1,sp)
1433  01cc 5f            	clrw	x
1434  01cd 97            	ld	xl,a
1435  01ce a606          	ld	a,#6
1436  01d0 5d            	tnzw	x
1437  01d1 2704          	jreq	L22
1438  01d3               L42:
1439  01d3 48            	sll	a
1440  01d4 5a            	decw	x
1441  01d5 26fc          	jrne	L42
1442  01d7               L22:
1443  01d7 1a03          	or	a,(OFST-2,sp)
1444  01d9 43            	cpl	a
1445  01da c45433        	and	a,21555
1446  01dd c75433        	ld	21555,a
1447                     ; 291     CAN->Page.Config.FCR2 |= (uint8_t)(CAN_FilterScale << fsc);
1449  01e0 7b04          	ld	a,(OFST-1,sp)
1450  01e2 5f            	clrw	x
1451  01e3 97            	ld	xl,a
1452  01e4 7b0b          	ld	a,(OFST+6,sp)
1453  01e6 5d            	tnzw	x
1454  01e7 2704          	jreq	L62
1455  01e9               L03:
1456  01e9 48            	sll	a
1457  01ea 5a            	decw	x
1458  01eb 26fc          	jrne	L03
1459  01ed               L62:
1460  01ed ca5433        	or	a,21555
1461  01f0 c75433        	ld	21555,a
1463  01f3 2029          	jra	L165
1464  01f5               L365:
1465                     ; 297     CAN->Page.Config.FCR3 &= (uint8_t)~(uint8_t)( fact | (uint8_t)((uint8_t)(CAN_FCR1_FSC00|CAN_FCR1_FSC01) << fsc ));
1467  01f5 7b04          	ld	a,(OFST-1,sp)
1468  01f7 5f            	clrw	x
1469  01f8 97            	ld	xl,a
1470  01f9 a606          	ld	a,#6
1471  01fb 5d            	tnzw	x
1472  01fc 2704          	jreq	L23
1473  01fe               L43:
1474  01fe 48            	sll	a
1475  01ff 5a            	decw	x
1476  0200 26fc          	jrne	L43
1477  0202               L23:
1478  0202 1a03          	or	a,(OFST-2,sp)
1479  0204 43            	cpl	a
1480  0205 c45434        	and	a,21556
1481  0208 c75434        	ld	21556,a
1482                     ; 300     CAN->Page.Config.FCR3 |= (uint8_t)(CAN_FilterScale << fsc);
1484  020b 7b04          	ld	a,(OFST-1,sp)
1485  020d 5f            	clrw	x
1486  020e 97            	ld	xl,a
1487  020f 7b0b          	ld	a,(OFST+6,sp)
1488  0211 5d            	tnzw	x
1489  0212 2704          	jreq	L63
1490  0214               L04:
1491  0214 48            	sll	a
1492  0215 5a            	decw	x
1493  0216 26fc          	jrne	L04
1494  0218               L63:
1495  0218 ca5434        	or	a,21556
1496  021b c75434        	ld	21556,a
1497  021e               L165:
1498                     ; 306   if (can_page_filter != CAN_Page_Filter45) /* FMR1*/
1500  021e 7b02          	ld	a,(OFST-3,sp)
1501  0220 a104          	cp	a,#4
1502  0222 273d          	jreq	L765
1503                     ; 309     if (CAN_FilterMode == CAN_FilterMode_IdMask)
1505  0224 0d0a          	tnz	(OFST+5,sp)
1506  0226 260b          	jrne	L175
1507                     ; 312       CAN->Page.Config.FMR1 &= (uint8_t)~(fmhl);
1509  0228 7b05          	ld	a,(OFST+0,sp)
1510  022a 43            	cpl	a
1511  022b c45430        	and	a,21552
1512  022e c75430        	ld	21552,a
1514  0231 2069          	jra	L506
1515  0233               L175:
1516                     ; 314     else if ( CAN_FilterMode == CAN_FilterMode_IdList)
1518  0233 7b0a          	ld	a,(OFST+5,sp)
1519  0235 a101          	cp	a,#1
1520  0237 260a          	jrne	L575
1521                     ; 317       CAN->Page.Config.FMR1 |= (uint8_t)(fmhl);
1523  0239 c65430        	ld	a,21552
1524  023c 1a05          	or	a,(OFST+0,sp)
1525  023e c75430        	ld	21552,a
1527  0241 2059          	jra	L506
1528  0243               L575:
1529                     ; 319     else if ( CAN_FilterMode == CAN_FilterMode_IdList_IdMask)
1531  0243 7b0a          	ld	a,(OFST+5,sp)
1532  0245 a111          	cp	a,#17
1533  0247 260c          	jrne	L106
1534                     ; 322       CAN->Page.Config.FMR1 |= (uint8_t)(fmhl & CAN_IDLIST_IDMASK_MASK);
1536  0249 7b05          	ld	a,(OFST+0,sp)
1537  024b a455          	and	a,#85
1538  024d ca5430        	or	a,21552
1539  0250 c75430        	ld	21552,a
1541  0253 2047          	jra	L506
1542  0255               L106:
1543                     ; 327       CAN->Page.Config.FMR1 |= (uint8_t)(fmhl & CAN_IDMASK_IDLIST_MASK);
1545  0255 7b05          	ld	a,(OFST+0,sp)
1546  0257 a4aa          	and	a,#170
1547  0259 ca5430        	or	a,21552
1548  025c c75430        	ld	21552,a
1549  025f 203b          	jra	L506
1550  0261               L765:
1551                     ; 336     if (CAN_FilterMode == CAN_FilterMode_IdMask)
1553  0261 0d0a          	tnz	(OFST+5,sp)
1554  0263 260b          	jrne	L706
1555                     ; 339       CAN->Page.Config.FMR2 &= (uint8_t)~(fmhl);
1557  0265 7b05          	ld	a,(OFST+0,sp)
1558  0267 43            	cpl	a
1559  0268 c45431        	and	a,21553
1560  026b c75431        	ld	21553,a
1562  026e 202c          	jra	L506
1563  0270               L706:
1564                     ; 341     else if ( CAN_FilterMode == CAN_FilterMode_IdList)
1566  0270 7b0a          	ld	a,(OFST+5,sp)
1567  0272 a101          	cp	a,#1
1568  0274 260a          	jrne	L316
1569                     ; 344       CAN->Page.Config.FMR2 |= (uint8_t)(fmhl);
1571  0276 c65431        	ld	a,21553
1572  0279 1a05          	or	a,(OFST+0,sp)
1573  027b c75431        	ld	21553,a
1575  027e 201c          	jra	L506
1576  0280               L316:
1577                     ; 346     else if ( CAN_FilterMode == CAN_FilterMode_IdList_IdMask)
1579  0280 7b0a          	ld	a,(OFST+5,sp)
1580  0282 a111          	cp	a,#17
1581  0284 260c          	jrne	L716
1582                     ; 349       CAN->Page.Config.FMR2 |= (uint8_t)(fmhl & CAN_IDLIST_IDMASK_MASK);
1584  0286 7b05          	ld	a,(OFST+0,sp)
1585  0288 a455          	and	a,#85
1586  028a ca5431        	or	a,21553
1587  028d c75431        	ld	21553,a
1589  0290 200a          	jra	L506
1590  0292               L716:
1591                     ; 354       CAN->Page.Config.FMR2 |= (uint8_t)(fmhl & CAN_IDMASK_IDLIST_MASK);
1593  0292 7b05          	ld	a,(OFST+0,sp)
1594  0294 a4aa          	and	a,#170
1595  0296 ca5431        	or	a,21553
1596  0299 c75431        	ld	21553,a
1597  029c               L506:
1598                     ; 360   CAN->PSR = (uint8_t)can_page_filter;
1600  029c 7b02          	ld	a,(OFST-3,sp)
1601  029e c75427        	ld	21543,a
1602                     ; 361   if (fsc != 0)
1604  02a1 0d04          	tnz	(OFST-1,sp)
1605  02a3 2603          	jrne	L24
1606  02a5 cc0371        	jp	L326
1607  02a8               L24:
1608                     ; 364     if (CAN_FilterScale == CAN_FilterScale_8Bit)
1610  02a8 0d0b          	tnz	(OFST+6,sp)
1611  02aa 262c          	jrne	L526
1612                     ; 366       CAN->Page.Filter.FR09 = CAN_FilterID1;
1614  02ac 7b0c          	ld	a,(OFST+7,sp)
1615  02ae c75430        	ld	21552,a
1616                     ; 367       CAN->Page.Filter.FR10 = CAN_FilterIDMask1;
1618  02b1 7b10          	ld	a,(OFST+11,sp)
1619  02b3 c75431        	ld	21553,a
1620                     ; 368       CAN->Page.Filter.FR11 = CAN_FilterID2;
1622  02b6 7b0d          	ld	a,(OFST+8,sp)
1623  02b8 c75432        	ld	21554,a
1624                     ; 369       CAN->Page.Filter.FR12 = CAN_FilterIDMask2;
1626  02bb 7b11          	ld	a,(OFST+12,sp)
1627  02bd c75433        	ld	21555,a
1628                     ; 370       CAN->Page.Filter.FR13 = CAN_FilterID3;
1630  02c0 7b0e          	ld	a,(OFST+9,sp)
1631  02c2 c75434        	ld	21556,a
1632                     ; 371       CAN->Page.Filter.FR14 = CAN_FilterIDMask3;
1634  02c5 7b12          	ld	a,(OFST+13,sp)
1635  02c7 c75435        	ld	21557,a
1636                     ; 372       CAN->Page.Filter.FR15 = CAN_FilterID4;
1638  02ca 7b0f          	ld	a,(OFST+10,sp)
1639  02cc c75436        	ld	21558,a
1640                     ; 373       CAN->Page.Filter.FR16 = CAN_FilterIDMask4;
1642  02cf 7b13          	ld	a,(OFST+14,sp)
1643  02d1 c75437        	ld	21559,a
1645  02d4 ac2f042f      	jpf	L346
1646  02d8               L526:
1647                     ; 375     else if (CAN_FilterScale == CAN_FilterScale_16_8Bit)
1649  02d8 7b0b          	ld	a,(OFST+6,sp)
1650  02da a102          	cp	a,#2
1651  02dc 262c          	jrne	L136
1652                     ; 377       CAN->Page.Filter.FR09 = CAN_FilterID1;
1654  02de 7b0c          	ld	a,(OFST+7,sp)
1655  02e0 c75430        	ld	21552,a
1656                     ; 378       CAN->Page.Filter.FR10 = CAN_FilterID2;
1658  02e3 7b0d          	ld	a,(OFST+8,sp)
1659  02e5 c75431        	ld	21553,a
1660                     ; 379       CAN->Page.Filter.FR11 = CAN_FilterIDMask1;
1662  02e8 7b10          	ld	a,(OFST+11,sp)
1663  02ea c75432        	ld	21554,a
1664                     ; 380       CAN->Page.Filter.FR12 = CAN_FilterIDMask2;
1666  02ed 7b11          	ld	a,(OFST+12,sp)
1667  02ef c75433        	ld	21555,a
1668                     ; 381       CAN->Page.Filter.FR13 = CAN_FilterID3;
1670  02f2 7b0e          	ld	a,(OFST+9,sp)
1671  02f4 c75434        	ld	21556,a
1672                     ; 382       CAN->Page.Filter.FR14 = CAN_FilterIDMask3;
1674  02f7 7b12          	ld	a,(OFST+13,sp)
1675  02f9 c75435        	ld	21557,a
1676                     ; 383       CAN->Page.Filter.FR15 = CAN_FilterID4;
1678  02fc 7b0f          	ld	a,(OFST+10,sp)
1679  02fe c75436        	ld	21558,a
1680                     ; 384       CAN->Page.Filter.FR16 = CAN_FilterIDMask4;
1682  0301 7b13          	ld	a,(OFST+14,sp)
1683  0303 c75437        	ld	21559,a
1685  0306 ac2f042f      	jpf	L346
1686  030a               L136:
1687                     ; 386     else if (CAN_FilterScale == CAN_FilterScale_16Bit)
1689  030a 7b0b          	ld	a,(OFST+6,sp)
1690  030c a104          	cp	a,#4
1691  030e 262c          	jrne	L536
1692                     ; 388       CAN->Page.Filter.FR09 = CAN_FilterID1;
1694  0310 7b0c          	ld	a,(OFST+7,sp)
1695  0312 c75430        	ld	21552,a
1696                     ; 389       CAN->Page.Filter.FR10 = CAN_FilterID2;
1698  0315 7b0d          	ld	a,(OFST+8,sp)
1699  0317 c75431        	ld	21553,a
1700                     ; 390       CAN->Page.Filter.FR11 = CAN_FilterIDMask1;
1702  031a 7b10          	ld	a,(OFST+11,sp)
1703  031c c75432        	ld	21554,a
1704                     ; 391       CAN->Page.Filter.FR12 = CAN_FilterIDMask2;
1706  031f 7b11          	ld	a,(OFST+12,sp)
1707  0321 c75433        	ld	21555,a
1708                     ; 392       CAN->Page.Filter.FR13 = CAN_FilterID3;
1710  0324 7b0e          	ld	a,(OFST+9,sp)
1711  0326 c75434        	ld	21556,a
1712                     ; 393       CAN->Page.Filter.FR14 = CAN_FilterID4;
1714  0329 7b0f          	ld	a,(OFST+10,sp)
1715  032b c75435        	ld	21557,a
1716                     ; 394       CAN->Page.Filter.FR15 = CAN_FilterIDMask3;
1718  032e 7b12          	ld	a,(OFST+13,sp)
1719  0330 c75436        	ld	21558,a
1720                     ; 395       CAN->Page.Filter.FR16 = CAN_FilterIDMask4;
1722  0333 7b13          	ld	a,(OFST+14,sp)
1723  0335 c75437        	ld	21559,a
1725  0338 ac2f042f      	jpf	L346
1726  033c               L536:
1727                     ; 397     else if (CAN_FilterScale == CAN_FilterScale_32Bit)
1729  033c 7b0b          	ld	a,(OFST+6,sp)
1730  033e a106          	cp	a,#6
1731  0340 2703          	jreq	L44
1732  0342 cc042f        	jp	L346
1733  0345               L44:
1734                     ; 399       CAN->Page.Filter.FR09 = CAN_FilterID1;
1736  0345 7b0c          	ld	a,(OFST+7,sp)
1737  0347 c75430        	ld	21552,a
1738                     ; 400       CAN->Page.Filter.FR10 = CAN_FilterID2;
1740  034a 7b0d          	ld	a,(OFST+8,sp)
1741  034c c75431        	ld	21553,a
1742                     ; 401       CAN->Page.Filter.FR11 = CAN_FilterID3;
1744  034f 7b0e          	ld	a,(OFST+9,sp)
1745  0351 c75432        	ld	21554,a
1746                     ; 402       CAN->Page.Filter.FR12 = CAN_FilterID4;
1748  0354 7b0f          	ld	a,(OFST+10,sp)
1749  0356 c75433        	ld	21555,a
1750                     ; 403       CAN->Page.Filter.FR13 = CAN_FilterIDMask1;
1752  0359 7b10          	ld	a,(OFST+11,sp)
1753  035b c75434        	ld	21556,a
1754                     ; 404       CAN->Page.Filter.FR14 = CAN_FilterIDMask2;
1756  035e 7b11          	ld	a,(OFST+12,sp)
1757  0360 c75435        	ld	21557,a
1758                     ; 405       CAN->Page.Filter.FR15 = CAN_FilterIDMask3;
1760  0363 7b12          	ld	a,(OFST+13,sp)
1761  0365 c75436        	ld	21558,a
1762                     ; 406       CAN->Page.Filter.FR16 = CAN_FilterIDMask4;
1764  0368 7b13          	ld	a,(OFST+14,sp)
1765  036a c75437        	ld	21559,a
1766  036d ac2f042f      	jpf	L346
1767  0371               L326:
1768                     ; 412     if (CAN_FilterScale == CAN_FilterScale_8Bit)
1770  0371 0d0b          	tnz	(OFST+6,sp)
1771  0373 262c          	jrne	L546
1772                     ; 414       CAN->Page.Filter.FR01 = CAN_FilterID1;
1774  0375 7b0c          	ld	a,(OFST+7,sp)
1775  0377 c75428        	ld	21544,a
1776                     ; 415       CAN->Page.Filter.FR02 = CAN_FilterIDMask1;
1778  037a 7b10          	ld	a,(OFST+11,sp)
1779  037c c75429        	ld	21545,a
1780                     ; 416       CAN->Page.Filter.FR03 = CAN_FilterID2;
1782  037f 7b0d          	ld	a,(OFST+8,sp)
1783  0381 c7542a        	ld	21546,a
1784                     ; 417       CAN->Page.Filter.FR04 = CAN_FilterIDMask2;
1786  0384 7b11          	ld	a,(OFST+12,sp)
1787  0386 c7542b        	ld	21547,a
1788                     ; 418       CAN->Page.Filter.FR05 = CAN_FilterID3;
1790  0389 7b0e          	ld	a,(OFST+9,sp)
1791  038b c7542c        	ld	21548,a
1792                     ; 419       CAN->Page.Filter.FR06 = CAN_FilterIDMask3;
1794  038e 7b12          	ld	a,(OFST+13,sp)
1795  0390 c7542d        	ld	21549,a
1796                     ; 420       CAN->Page.Filter.FR07 = CAN_FilterID4;
1798  0393 7b0f          	ld	a,(OFST+10,sp)
1799  0395 c7542e        	ld	21550,a
1800                     ; 421       CAN->Page.Filter.FR08 = CAN_FilterIDMask4;
1802  0398 7b13          	ld	a,(OFST+14,sp)
1803  039a c7542f        	ld	21551,a
1805  039d ac2f042f      	jpf	L346
1806  03a1               L546:
1807                     ; 423     else if (CAN_FilterScale == CAN_FilterScale_16_8Bit)
1809  03a1 7b0b          	ld	a,(OFST+6,sp)
1810  03a3 a102          	cp	a,#2
1811  03a5 262a          	jrne	L156
1812                     ; 425       CAN->Page.Filter.FR01 = CAN_FilterID1;
1814  03a7 7b0c          	ld	a,(OFST+7,sp)
1815  03a9 c75428        	ld	21544,a
1816                     ; 426       CAN->Page.Filter.FR02 = CAN_FilterID2;
1818  03ac 7b0d          	ld	a,(OFST+8,sp)
1819  03ae c75429        	ld	21545,a
1820                     ; 427       CAN->Page.Filter.FR03 = CAN_FilterIDMask1;
1822  03b1 7b10          	ld	a,(OFST+11,sp)
1823  03b3 c7542a        	ld	21546,a
1824                     ; 428       CAN->Page.Filter.FR04 = CAN_FilterIDMask2;
1826  03b6 7b11          	ld	a,(OFST+12,sp)
1827  03b8 c7542b        	ld	21547,a
1828                     ; 429       CAN->Page.Filter.FR05 = CAN_FilterID3;
1830  03bb 7b0e          	ld	a,(OFST+9,sp)
1831  03bd c7542c        	ld	21548,a
1832                     ; 430       CAN->Page.Filter.FR06 = CAN_FilterIDMask3;
1834  03c0 7b12          	ld	a,(OFST+13,sp)
1835  03c2 c7542d        	ld	21549,a
1836                     ; 431       CAN->Page.Filter.FR07 = CAN_FilterID4;
1838  03c5 7b0f          	ld	a,(OFST+10,sp)
1839  03c7 c7542e        	ld	21550,a
1840                     ; 432       CAN->Page.Filter.FR08 = CAN_FilterIDMask4;
1842  03ca 7b13          	ld	a,(OFST+14,sp)
1843  03cc c7542f        	ld	21551,a
1845  03cf 205e          	jra	L346
1846  03d1               L156:
1847                     ; 434     else if (CAN_FilterScale == CAN_FilterScale_16Bit)
1849  03d1 7b0b          	ld	a,(OFST+6,sp)
1850  03d3 a104          	cp	a,#4
1851  03d5 262a          	jrne	L556
1852                     ; 436       CAN->Page.Filter.FR01 = CAN_FilterID1;
1854  03d7 7b0c          	ld	a,(OFST+7,sp)
1855  03d9 c75428        	ld	21544,a
1856                     ; 437       CAN->Page.Filter.FR02 = CAN_FilterID2;
1858  03dc 7b0d          	ld	a,(OFST+8,sp)
1859  03de c75429        	ld	21545,a
1860                     ; 438       CAN->Page.Filter.FR03 = CAN_FilterIDMask1;
1862  03e1 7b10          	ld	a,(OFST+11,sp)
1863  03e3 c7542a        	ld	21546,a
1864                     ; 439       CAN->Page.Filter.FR04 = CAN_FilterIDMask2;
1866  03e6 7b11          	ld	a,(OFST+12,sp)
1867  03e8 c7542b        	ld	21547,a
1868                     ; 440       CAN->Page.Filter.FR05 = CAN_FilterID3;
1870  03eb 7b0e          	ld	a,(OFST+9,sp)
1871  03ed c7542c        	ld	21548,a
1872                     ; 441       CAN->Page.Filter.FR06 = CAN_FilterID4;
1874  03f0 7b0f          	ld	a,(OFST+10,sp)
1875  03f2 c7542d        	ld	21549,a
1876                     ; 442       CAN->Page.Filter.FR07 = CAN_FilterIDMask3;
1878  03f5 7b12          	ld	a,(OFST+13,sp)
1879  03f7 c7542e        	ld	21550,a
1880                     ; 443       CAN->Page.Filter.FR08 = CAN_FilterIDMask4;
1882  03fa 7b13          	ld	a,(OFST+14,sp)
1883  03fc c7542f        	ld	21551,a
1885  03ff 202e          	jra	L346
1886  0401               L556:
1887                     ; 445     else if (CAN_FilterScale == CAN_FilterScale_32Bit)
1889  0401 7b0b          	ld	a,(OFST+6,sp)
1890  0403 a106          	cp	a,#6
1891  0405 2628          	jrne	L346
1892                     ; 447       CAN->Page.Filter.FR01 = CAN_FilterID1;
1894  0407 7b0c          	ld	a,(OFST+7,sp)
1895  0409 c75428        	ld	21544,a
1896                     ; 448       CAN->Page.Filter.FR02 = CAN_FilterID2;
1898  040c 7b0d          	ld	a,(OFST+8,sp)
1899  040e c75429        	ld	21545,a
1900                     ; 449       CAN->Page.Filter.FR03 = CAN_FilterID3;
1902  0411 7b0e          	ld	a,(OFST+9,sp)
1903  0413 c7542a        	ld	21546,a
1904                     ; 450       CAN->Page.Filter.FR04 = CAN_FilterID4;
1906  0416 7b0f          	ld	a,(OFST+10,sp)
1907  0418 c7542b        	ld	21547,a
1908                     ; 451       CAN->Page.Filter.FR05 = CAN_FilterIDMask1;
1910  041b 7b10          	ld	a,(OFST+11,sp)
1911  041d c7542c        	ld	21548,a
1912                     ; 452       CAN->Page.Filter.FR06 = CAN_FilterIDMask2;
1914  0420 7b11          	ld	a,(OFST+12,sp)
1915  0422 c7542d        	ld	21549,a
1916                     ; 453       CAN->Page.Filter.FR07 = CAN_FilterIDMask3;
1918  0425 7b12          	ld	a,(OFST+13,sp)
1919  0427 c7542e        	ld	21550,a
1920                     ; 454       CAN->Page.Filter.FR08 = CAN_FilterIDMask4;
1922  042a 7b13          	ld	a,(OFST+14,sp)
1923  042c c7542f        	ld	21551,a
1924  042f               L346:
1925                     ; 463   CAN->PSR = CAN_Page_Config;
1927  042f 35065427      	mov	21543,#6
1928                     ; 464   if (CAN_FilterActivation != DISABLE)
1930  0433 0d07          	tnz	(OFST+2,sp)
1931  0435 272a          	jreq	L366
1932                     ; 466     if ((CAN_FilterNumber & 0x06) == 0x00) /* FCR1*/
1934  0437 7b06          	ld	a,(OFST+1,sp)
1935  0439 a506          	bcp	a,#6
1936  043b 260a          	jrne	L566
1937                     ; 467     {   CAN->Page.Config.FCR1 |= (uint8_t)fact;
1939  043d c65432        	ld	a,21554
1940  0440 1a03          	or	a,(OFST-2,sp)
1941  0442 c75432        	ld	21554,a
1943  0445 201a          	jra	L366
1944  0447               L566:
1945                     ; 469     else if ((CAN_FilterNumber & 0x06) == 0x02) /*FCR2*/
1947  0447 7b06          	ld	a,(OFST+1,sp)
1948  0449 a406          	and	a,#6
1949  044b a102          	cp	a,#2
1950  044d 260a          	jrne	L176
1951                     ; 470     { CAN->Page.Config.FCR2 |= (uint8_t)fact;
1953  044f c65433        	ld	a,21555
1954  0452 1a03          	or	a,(OFST-2,sp)
1955  0454 c75433        	ld	21555,a
1957  0457 2008          	jra	L366
1958  0459               L176:
1959                     ; 473     { CAN->Page.Config.FCR3 |= (uint8_t)fact;
1961  0459 c65434        	ld	a,21556
1962  045c 1a03          	or	a,(OFST-2,sp)
1963  045e c75434        	ld	21556,a
1964  0461               L366:
1965                     ; 476   CAN_OperatingModeRequest(CAN_OperatingMode_Normal);
1967  0461 a601          	ld	a,#1
1968  0463 cd0883        	call	_CAN_OperatingModeRequest
1970                     ; 478   CAN_SelectPage(can_page);
1972  0466 7b01          	ld	a,(OFST-4,sp)
1973  0468 cd0c41        	call	_CAN_SelectPage
1975                     ; 479 }
1978  046b 5b07          	addw	sp,#7
1979  046d 81            	ret
2121                     ; 487 void CAN_ITConfig(CAN_IT_TypeDef CAN_IT, FunctionalState NewState)
2121                     ; 488 {
2122                     	switch	.text
2123  046e               _CAN_ITConfig:
2125  046e 89            	pushw	x
2126  046f 5203          	subw	sp,#3
2127       00000003      OFST:	set	3
2130                     ; 489   uint8_t tmperrorinterrupt = 0;
2132                     ; 490   CAN_Page_TypeDef can_page = CAN_GetSelectedPage();
2134  0471 cd0c3d        	call	_CAN_GetSelectedPage
2136  0474 6b02          	ld	(OFST-1,sp),a
2138                     ; 494   assert_param(IS_CAN_IT_CONFIG_OK(CAN_IT));
2140                     ; 495   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2142                     ; 497   tmperrorinterrupt = (uint8_t)(((uint16_t)CAN_IT) >>7);
2144  0476 1e04          	ldw	x,(OFST+1,sp)
2145  0478 4f            	clr	a
2146  0479 01            	rrwa	x,a
2147  047a 48            	sll	a
2148  047b 59            	rlcw	x
2149  047c 9f            	ld	a,xl
2150  047d 6b03          	ld	(OFST+0,sp),a
2152                     ; 498   tmperrorinterrupt = (uint8_t)((uint8_t)((uint16_t)tmperrorinterrupt & 0xF0) | 
2152                     ; 499                                 (uint8_t)((uint8_t)((uint16_t)tmperrorinterrupt & 0x0F) >>1));
2154  047f 7b03          	ld	a,(OFST+0,sp)
2155  0481 a40f          	and	a,#15
2156  0483 44            	srl	a
2157  0484 6b01          	ld	(OFST-2,sp),a
2159  0486 7b03          	ld	a,(OFST+0,sp)
2160  0488 a4f0          	and	a,#240
2161  048a 1a01          	or	a,(OFST-2,sp)
2162  048c 6b03          	ld	(OFST+0,sp),a
2164                     ; 501   CAN->PSR = CAN_Page_Config;
2166  048e 35065427      	mov	21543,#6
2167                     ; 502   if (NewState != DISABLE)
2169  0492 0d08          	tnz	(OFST+5,sp)
2170  0494 2712          	jreq	L757
2171                     ; 505     CAN->IER |= (uint8_t)(CAN_IT);
2173  0496 c65425        	ld	a,21541
2174  0499 1a05          	or	a,(OFST+2,sp)
2175  049b c75425        	ld	21541,a
2176                     ; 506     CAN->Page.Config.EIER |= (uint8_t)(tmperrorinterrupt);
2178  049e c65429        	ld	a,21545
2179  04a1 1a03          	or	a,(OFST+0,sp)
2180  04a3 c75429        	ld	21545,a
2182  04a6 2012          	jra	L167
2183  04a8               L757:
2184                     ; 511     CAN->IER &= (uint8_t)~(uint8_t)((uint16_t)CAN_IT);
2186  04a8 7b05          	ld	a,(OFST+2,sp)
2187  04aa 43            	cpl	a
2188  04ab c45425        	and	a,21541
2189  04ae c75425        	ld	21541,a
2190                     ; 512     CAN->Page.Config.EIER &= (uint8_t)~(tmperrorinterrupt);
2192  04b1 7b03          	ld	a,(OFST+0,sp)
2193  04b3 43            	cpl	a
2194  04b4 c45429        	and	a,21545
2195  04b7 c75429        	ld	21545,a
2196  04ba               L167:
2197                     ; 515   CAN_SelectPage(can_page);
2199  04ba 7b02          	ld	a,(OFST-1,sp)
2200  04bc cd0c41        	call	_CAN_SelectPage
2202                     ; 516 }
2205  04bf 5b05          	addw	sp,#5
2206  04c1 81            	ret
2265                     ; 525 void CAN_ST7CompatibilityCmd(CAN_ST7Compatibility_TypeDef CAN_ST7Compatibility)
2265                     ; 526 {
2266                     	switch	.text
2267  04c2               _CAN_ST7CompatibilityCmd:
2271                     ; 528   assert_param(IS_CAN_ST7_COMPATIBILITY_OK(CAN_ST7Compatibility));
2273                     ; 530   CAN->DGR &= (uint8_t)(~CAN_DGR_TXM2E);
2275  04c2 72195426      	bres	21542,#4
2276                     ; 533   CAN->DGR |= (uint8_t)CAN_ST7Compatibility;
2278  04c6 ca5426        	or	a,21542
2279  04c9 c75426        	ld	21542,a
2280                     ; 534 }
2283  04cc 81            	ret
2330                     ; 541 void CAN_TTComModeCmd(FunctionalState NewState)
2330                     ; 542 {
2331                     	switch	.text
2332  04cd               _CAN_TTComModeCmd:
2334  04cd 88            	push	a
2335  04ce 88            	push	a
2336       00000001      OFST:	set	1
2339                     ; 543   CAN_Page_TypeDef can_page = CAN_GetSelectedPage();
2341  04cf cd0c3d        	call	_CAN_GetSelectedPage
2343  04d2 6b01          	ld	(OFST+0,sp),a
2345                     ; 545   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2347                     ; 546   if (NewState != DISABLE)
2349  04d4 0d02          	tnz	(OFST+1,sp)
2350  04d6 2726          	jreq	L3301
2351                     ; 549     CAN->MCR |= CAN_MCR_TTCM;
2353  04d8 721e5420      	bset	21536,#7
2354                     ; 551     CAN->PSR = CAN_Page_TxMailBox0;
2356  04dc 725f5427      	clr	21543
2357                     ; 552     CAN->Page.TxMailbox.MDLCR |= CAN_MDLCR_TGT;
2359  04e0 721e5429      	bset	21545,#7
2360                     ; 553     CAN->PSR = CAN_Page_TxMailBox1;
2362  04e4 35015427      	mov	21543,#1
2363                     ; 554     CAN->Page.TxMailbox.MDLCR |= CAN_MDLCR_TGT;
2365  04e8 721e5429      	bset	21545,#7
2366                     ; 555     CAN->PSR = CAN_Page_TxMailBox2;
2368  04ec 35055427      	mov	21543,#5
2369                     ; 556     CAN->Page.TxMailbox.MDLCR |= CAN_MDLCR_TGT;
2371  04f0 721e5429      	bset	21545,#7
2372                     ; 557     CAN->PSR = CAN_Page_RxFifo;
2374  04f4 35075427      	mov	21543,#7
2375                     ; 558     CAN->Page.RxFIFO.MDLCR |= CAN_MDLCR_TGT;
2377  04f8 721e5429      	bset	21545,#7
2379  04fc 2024          	jra	L5301
2380  04fe               L3301:
2381                     ; 563     CAN->MCR &= ((uint8_t)~CAN_MCR_TTCM);
2383  04fe 721f5420      	bres	21536,#7
2384                     ; 565     CAN->PSR = CAN_Page_TxMailBox0;
2386  0502 725f5427      	clr	21543
2387                     ; 566     CAN->Page.TxMailbox.MDLCR &= ((uint8_t)~CAN_MDLCR_TGT);
2389  0506 721f5429      	bres	21545,#7
2390                     ; 567     CAN->PSR = CAN_Page_TxMailBox1;
2392  050a 35015427      	mov	21543,#1
2393                     ; 568     CAN->Page.TxMailbox.MDLCR &= ((uint8_t)~CAN_MDLCR_TGT);
2395  050e 721f5429      	bres	21545,#7
2396                     ; 569     CAN->PSR = CAN_Page_TxMailBox2;
2398  0512 35055427      	mov	21543,#5
2399                     ; 570     CAN->Page.TxMailbox.MDLCR &= ((uint8_t)~CAN_MDLCR_TGT);
2401  0516 721f5429      	bres	21545,#7
2402                     ; 571     CAN->PSR = CAN_Page_RxFifo;
2404  051a 35075427      	mov	21543,#7
2405                     ; 572     CAN->Page.RxFIFO.MDLCR &= ((uint8_t)~CAN_MDLCR_TGT);
2407  051e 721f5429      	bres	21545,#7
2408  0522               L5301:
2409                     ; 575   CAN_SelectPage(can_page);
2411  0522 7b01          	ld	a,(OFST+0,sp)
2412  0524 cd0c41        	call	_CAN_SelectPage
2414                     ; 576 }
2417  0527 85            	popw	x
2418  0528 81            	ret
2623                     ; 587 CAN_TxStatus_TypeDef CAN_Transmit(uint32_t CAN_Id,
2623                     ; 588                                   CAN_Id_TypeDef CAN_IDE,
2623                     ; 589                                   CAN_RTR_TypeDef CAN_RTR,
2623                     ; 590                                   uint8_t CAN_DLC,
2623                     ; 591                                   uint8_t *CAN_Data)
2623                     ; 592 {
2624                     	switch	.text
2625  0529               _CAN_Transmit:
2627  0529 5206          	subw	sp,#6
2628       00000006      OFST:	set	6
2631                     ; 593   CAN_TxStatus_TypeDef CAN_TxStatus = CAN_TxStatus_NoMailBox;
2633                     ; 594   CAN_Page_TypeDef can_page = CAN_GetSelectedPage();
2635  052b cd0c3d        	call	_CAN_GetSelectedPage
2637  052e 6b05          	ld	(OFST-1,sp),a
2639                     ; 596   assert_param(IS_CAN_IDTYPE_OK(CAN_IDE));
2641                     ; 597   if (CAN_IDE != CAN_Id_Standard)
2643  0530 0d0d          	tnz	(OFST+7,sp)
2644  0532 2700          	jreq	L1511
2645                     ; 599     assert_param(IS_CAN_EXTID_OK(CAN_Id));
2648  0534               L1511:
2649                     ; 603     assert_param(IS_CAN_STDID_OK(CAN_Id));
2651                     ; 605   assert_param(IS_CAN_RTR_OK(CAN_RTR));
2653                     ; 606   assert_param(IS_CAN_DLC_OK(CAN_DLC));
2655                     ; 608   if ((CAN->TPR & CAN_TPR_TME0) == CAN_TPR_TME0)
2657  0534 c65423        	ld	a,21539
2658  0537 a404          	and	a,#4
2659  0539 a104          	cp	a,#4
2660  053b 2604          	jrne	L5511
2661                     ; 610     CAN_TxStatus = CAN_TxStatus_MailBox0Ok;
2663  053d 0f06          	clr	(OFST+0,sp)
2666  053f 2022          	jra	L7511
2667  0541               L5511:
2668                     ; 612   else if ((CAN->TPR & CAN_TPR_TME1) == CAN_TPR_TME1)
2670  0541 c65423        	ld	a,21539
2671  0544 a408          	and	a,#8
2672  0546 a108          	cp	a,#8
2673  0548 2606          	jrne	L1611
2674                     ; 614     CAN_TxStatus = CAN_TxStatus_MailBox1Ok;
2676  054a a601          	ld	a,#1
2677  054c 6b06          	ld	(OFST+0,sp),a
2680  054e 2013          	jra	L7511
2681  0550               L1611:
2682                     ; 616   else if ((CAN->TPR & CAN_TPR_TME2) == CAN_TPR_TME2)
2684  0550 c65423        	ld	a,21539
2685  0553 a410          	and	a,#16
2686  0555 a110          	cp	a,#16
2687  0557 2606          	jrne	L5611
2688                     ; 618     CAN_TxStatus = CAN_TxStatus_MailBox2Ok;
2690  0559 a605          	ld	a,#5
2691  055b 6b06          	ld	(OFST+0,sp),a
2694  055d 2004          	jra	L7511
2695  055f               L5611:
2696                     ; 622     CAN_TxStatus = CAN_TxStatus_NoMailBox;
2698  055f a6f4          	ld	a,#244
2699  0561 6b06          	ld	(OFST+0,sp),a
2701  0563               L7511:
2702                     ; 624   if (CAN_TxStatus != CAN_TxStatus_NoMailBox)
2704  0563 7b06          	ld	a,(OFST+0,sp)
2705  0565 a1f4          	cp	a,#244
2706  0567 2603          	jrne	L65
2707  0569 cc0635        	jp	L1711
2708  056c               L65:
2709                     ; 626     CAN->PSR = (uint8_t)CAN_TxStatus;
2711  056c 7b06          	ld	a,(OFST+0,sp)
2712  056e c75427        	ld	21543,a
2713                     ; 628     if (CAN_IDE != CAN_Id_Standard)
2715  0571 0d0d          	tnz	(OFST+7,sp)
2716  0573 273b          	jreq	L3711
2717                     ; 630       CAN_Id &= (uint32_t)CAN_EXTID_SIZE;
2719  0575 7b09          	ld	a,(OFST+3,sp)
2720  0577 a41f          	and	a,#31
2721  0579 6b09          	ld	(OFST+3,sp),a
2722                     ; 631       CAN->Page.TxMailbox.MIDR4 = (uint8_t)(CAN_Id);
2724  057b 7b0c          	ld	a,(OFST+6,sp)
2725  057d c7542d        	ld	21549,a
2726                     ; 632       CAN_Id = CAN_Id>>8;
2728  0580 96            	ldw	x,sp
2729  0581 1c0009        	addw	x,#OFST+3
2730  0584 a608          	ld	a,#8
2731  0586 cd0000        	call	c_lgursh
2733                     ; 633       CAN->Page.TxMailbox.MIDR3 = (uint8_t)(CAN_Id);
2735  0589 7b0c          	ld	a,(OFST+6,sp)
2736  058b c7542c        	ld	21548,a
2737                     ; 634       CAN_Id = CAN_Id>>8;
2739  058e 96            	ldw	x,sp
2740  058f 1c0009        	addw	x,#OFST+3
2741  0592 a608          	ld	a,#8
2742  0594 cd0000        	call	c_lgursh
2744                     ; 635       CAN->Page.TxMailbox.MIDR2 = (uint8_t)(CAN_Id);
2746  0597 7b0c          	ld	a,(OFST+6,sp)
2747  0599 c7542b        	ld	21547,a
2748                     ; 636       CAN_Id = CAN_Id>>8;
2750  059c 96            	ldw	x,sp
2751  059d 1c0009        	addw	x,#OFST+3
2752  05a0 a608          	ld	a,#8
2753  05a2 cd0000        	call	c_lgursh
2755                     ; 637       CAN->Page.TxMailbox.MIDR1 = (uint8_t)(CAN_Id |CAN_IDE | CAN_RTR);
2757  05a5 7b0c          	ld	a,(OFST+6,sp)
2758  05a7 1a0d          	or	a,(OFST+7,sp)
2759  05a9 1a0e          	or	a,(OFST+8,sp)
2760  05ab c7542a        	ld	21546,a
2762  05ae 203a          	jra	L5711
2763  05b0               L3711:
2764                     ; 641       CAN_Id &= (uint16_t)CAN_STDID_SIZE;
2766  05b0 7b0b          	ld	a,(OFST+5,sp)
2767  05b2 a407          	and	a,#7
2768  05b4 6b0b          	ld	(OFST+5,sp),a
2769  05b6 0f0a          	clr	(OFST+4,sp)
2770  05b8 0f09          	clr	(OFST+3,sp)
2771                     ; 642       CAN->Page.TxMailbox.MIDR1 = (uint8_t)((CAN_Id>>6) | (CAN_RTR)) ;
2773  05ba 7b0e          	ld	a,(OFST+8,sp)
2774  05bc b703          	ld	c_lreg+3,a
2775  05be 3f02          	clr	c_lreg+2
2776  05c0 3f01          	clr	c_lreg+1
2777  05c2 3f00          	clr	c_lreg
2778  05c4 96            	ldw	x,sp
2779  05c5 1c0001        	addw	x,#OFST-5
2780  05c8 cd0000        	call	c_rtol
2783  05cb 96            	ldw	x,sp
2784  05cc 1c0009        	addw	x,#OFST+3
2785  05cf cd0000        	call	c_ltor
2787  05d2 a606          	ld	a,#6
2788  05d4 cd0000        	call	c_lursh
2790  05d7 96            	ldw	x,sp
2791  05d8 1c0001        	addw	x,#OFST-5
2792  05db cd0000        	call	c_lor
2794  05de b603          	ld	a,c_lreg+3
2795  05e0 c7542a        	ld	21546,a
2796                     ; 643       CAN->Page.TxMailbox.MIDR2 = (uint8_t)(CAN_Id<<2);
2798  05e3 7b0c          	ld	a,(OFST+6,sp)
2799  05e5 48            	sll	a
2800  05e6 48            	sll	a
2801  05e7 c7542b        	ld	21547,a
2802  05ea               L5711:
2803                     ; 647     CAN->Page.TxMailbox.MDLCR &= (uint8_t)0xF0;
2805  05ea c65429        	ld	a,21545
2806  05ed a4f0          	and	a,#240
2807  05ef c75429        	ld	21545,a
2808                     ; 649     CAN->Page.TxMailbox.MDLCR |= CAN_DLC;
2810  05f2 c65429        	ld	a,21545
2811  05f5 1a0f          	or	a,(OFST+9,sp)
2812  05f7 c75429        	ld	21545,a
2813                     ; 651     CAN->Page.TxMailbox.MDAR1 = CAN_Data[0];
2815  05fa 1e10          	ldw	x,(OFST+10,sp)
2816  05fc f6            	ld	a,(x)
2817  05fd c7542e        	ld	21550,a
2818                     ; 652     CAN->Page.TxMailbox.MDAR2 = CAN_Data[1];
2820  0600 1e10          	ldw	x,(OFST+10,sp)
2821  0602 e601          	ld	a,(1,x)
2822  0604 c7542f        	ld	21551,a
2823                     ; 653     CAN->Page.TxMailbox.MDAR3 = CAN_Data[2];
2825  0607 1e10          	ldw	x,(OFST+10,sp)
2826  0609 e602          	ld	a,(2,x)
2827  060b c75430        	ld	21552,a
2828                     ; 654     CAN->Page.TxMailbox.MDAR4 = CAN_Data[3];
2830  060e 1e10          	ldw	x,(OFST+10,sp)
2831  0610 e603          	ld	a,(3,x)
2832  0612 c75431        	ld	21553,a
2833                     ; 655     CAN->Page.TxMailbox.MDAR5 = CAN_Data[4];
2835  0615 1e10          	ldw	x,(OFST+10,sp)
2836  0617 e604          	ld	a,(4,x)
2837  0619 c75432        	ld	21554,a
2838                     ; 656     CAN->Page.TxMailbox.MDAR6 = CAN_Data[5];
2840  061c 1e10          	ldw	x,(OFST+10,sp)
2841  061e e605          	ld	a,(5,x)
2842  0620 c75433        	ld	21555,a
2843                     ; 657     CAN->Page.TxMailbox.MDAR7 = CAN_Data[6];
2845  0623 1e10          	ldw	x,(OFST+10,sp)
2846  0625 e606          	ld	a,(6,x)
2847  0627 c75434        	ld	21556,a
2848                     ; 658     CAN->Page.TxMailbox.MDAR8 = CAN_Data[7];
2850  062a 1e10          	ldw	x,(OFST+10,sp)
2851  062c e607          	ld	a,(7,x)
2852  062e c75435        	ld	21557,a
2853                     ; 660     CAN->Page.TxMailbox.MCSR |= CAN_MCSR_TXRQ;
2855  0631 72105428      	bset	21544,#0
2856  0635               L1711:
2857                     ; 663   CAN_SelectPage(can_page);
2859  0635 7b05          	ld	a,(OFST-1,sp)
2860  0637 cd0c41        	call	_CAN_SelectPage
2862                     ; 664   return (CAN_TxStatus_TypeDef)CAN_TxStatus;
2864  063a 7b06          	ld	a,(OFST+0,sp)
2867  063c 5b06          	addw	sp,#6
2868  063e 81            	ret
2954                     ; 672 CAN_TxStatus_TypeDef CAN_TransmitStatus(CAN_TransmitMailBox_TypeDef CAN_TransmitMailbox)
2954                     ; 673 {
2955                     	switch	.text
2956  063f               _CAN_TransmitStatus:
2958  063f 88            	push	a
2959       00000001      OFST:	set	1
2962                     ; 675   CAN_TxStatus_TypeDef tstate = CAN_TxStatus_Failed;
2964                     ; 676   uint8_t tmpstate=0;
2966  0640 0f01          	clr	(OFST+0,sp)
2968                     ; 679   assert_param(IS_CAN_TRANSMITMAILBOX_OK(CAN_TransmitMailbox));
2970                     ; 681   switch (CAN_TransmitMailbox)
2973                     ; 694     break;
2974  0642 4d            	tnz	a
2975  0643 2709          	jreq	L7711
2976  0645 4a            	dec	a
2977  0646 2718          	jreq	L1021
2978  0648 a004          	sub	a,#4
2979  064a 2728          	jreq	L3021
2980  064c               L5021:
2981                     ; 692   default:
2981                     ; 693     tstate = CAN_TxStatus_Failed;
2983                     ; 694     break;
2985  064c 203a          	jra	L3621
2986  064e               L7711:
2987                     ; 683   case (CAN_TransmitMailBox_0): tmpstate = (uint8_t)((CAN->TSR & (uint8_t)(CAN_TSR_RQCP0|CAN_TSR_TXOK0)));
2989  064e c65422        	ld	a,21538
2990  0651 a411          	and	a,#17
2991  0653 6b01          	ld	(OFST+0,sp),a
2993                     ; 684   tmpstate |= (uint8_t)((CAN->TPR & CAN_TPR_TME0));
2995  0655 c65423        	ld	a,21539
2996  0658 a404          	and	a,#4
2997  065a 1a01          	or	a,(OFST+0,sp)
2998  065c 6b01          	ld	(OFST+0,sp),a
3000                     ; 685   break;
3002  065e 2028          	jra	L3621
3003  0660               L1021:
3004                     ; 686   case (CAN_TransmitMailBox_1): tmpstate = (uint8_t)((uint8_t)(CAN->TSR & (uint8_t)(CAN_TSR_RQCP1|CAN_TSR_TXOK1))>>1);
3006  0660 c65422        	ld	a,21538
3007  0663 a422          	and	a,#34
3008  0665 44            	srl	a
3009  0666 6b01          	ld	(OFST+0,sp),a
3011                     ; 687   tmpstate |= (uint8_t)((uint8_t)(CAN->TPR & CAN_TPR_TME1) >> 1);
3013  0668 c65423        	ld	a,21539
3014  066b a408          	and	a,#8
3015  066d 44            	srl	a
3016  066e 1a01          	or	a,(OFST+0,sp)
3017  0670 6b01          	ld	(OFST+0,sp),a
3019                     ; 688   break;
3021  0672 2014          	jra	L3621
3022  0674               L3021:
3023                     ; 689   case (CAN_TransmitMailBox_2): tmpstate = (uint8_t)((uint8_t)(CAN->TSR & (uint8_t)(CAN_TSR_RQCP2|CAN_TSR_TXOK2))>>2);
3025  0674 c65422        	ld	a,21538
3026  0677 a444          	and	a,#68
3027  0679 44            	srl	a
3028  067a 44            	srl	a
3029  067b 6b01          	ld	(OFST+0,sp),a
3031                     ; 690   tmpstate |= (uint8_t)((uint8_t)(CAN->TPR & CAN_TPR_TME2) >> 2);
3033  067d c65423        	ld	a,21539
3034  0680 a410          	and	a,#16
3035  0682 44            	srl	a
3036  0683 44            	srl	a
3037  0684 1a01          	or	a,(OFST+0,sp)
3038  0686 6b01          	ld	(OFST+0,sp),a
3040                     ; 691   break;
3042  0688               L3621:
3043                     ; 697   switch (tmpstate)
3045  0688 7b01          	ld	a,(OFST+0,sp)
3047                     ; 713     break;
3048  068a 4d            	tnz	a
3049  068b 2711          	jreq	L7021
3050  068d a004          	sub	a,#4
3051  068f 271f          	jreq	L5121
3052  0691 4a            	dec	a
3053  0692 2710          	jreq	L1121
3054  0694 a010          	sub	a,#16
3055  0696 2712          	jreq	L3121
3056  0698               L7121:
3057                     ; 711   default:
3057                     ; 712     tstate = CAN_TxStatus_Failed;
3059  0698 a6f0          	ld	a,#240
3060  069a 6b01          	ld	(OFST+0,sp),a
3062                     ; 713     break;
3064  069c 2016          	jra	L7621
3065  069e               L7021:
3066                     ; 700   case (0x00): tstate = CAN_TxStatus_Pending;
3068  069e a6f2          	ld	a,#242
3069  06a0 6b01          	ld	(OFST+0,sp),a
3071                     ; 701   break;
3073  06a2 2010          	jra	L7621
3074  06a4               L1121:
3075                     ; 703   case (0x05): tstate = CAN_TxStatus_Failed;
3077  06a4 a6f0          	ld	a,#240
3078  06a6 6b01          	ld	(OFST+0,sp),a
3080                     ; 704   break;
3082  06a8 200a          	jra	L7621
3083  06aa               L3121:
3084                     ; 706   case (0x15): tstate = CAN_TxStatus_Ok;
3086  06aa a6f1          	ld	a,#241
3087  06ac 6b01          	ld	(OFST+0,sp),a
3089                     ; 707   break;
3091  06ae 2004          	jra	L7621
3092  06b0               L5121:
3093                     ; 709   case (0x04): tstate = CAN_TxStatus_MailBoxEmpty;
3095  06b0 a6f5          	ld	a,#245
3096  06b2 6b01          	ld	(OFST+0,sp),a
3098                     ; 710   break;
3100  06b4               L7621:
3101                     ; 716   return (CAN_TxStatus_TypeDef)tstate;
3103  06b4 7b01          	ld	a,(OFST+0,sp)
3106  06b6 5b01          	addw	sp,#1
3107  06b8 81            	ret
3155                     ; 724 void CAN_CancelTransmit(CAN_TransmitMailBox_TypeDef CAN_TransmitMailbox)
3155                     ; 725 {
3156                     	switch	.text
3157  06b9               _CAN_CancelTransmit:
3159  06b9 88            	push	a
3160  06ba 88            	push	a
3161       00000001      OFST:	set	1
3164                     ; 726   CAN_Page_TypeDef can_page = CAN_GetSelectedPage();
3166  06bb cd0c3d        	call	_CAN_GetSelectedPage
3168  06be 6b01          	ld	(OFST+0,sp),a
3170                     ; 728   assert_param(IS_CAN_TRANSMITMAILBOX_OK(CAN_TransmitMailbox));
3172                     ; 730   CAN->PSR = (uint8_t)CAN_TransmitMailbox;
3174  06c0 7b02          	ld	a,(OFST+1,sp)
3175  06c2 c75427        	ld	21543,a
3176                     ; 732   CAN->Page.TxMailbox.MCSR |= CAN_MCSR_ABRQ;
3178  06c5 72125428      	bset	21544,#1
3179                     ; 734   CAN_SelectPage(can_page);
3181  06c9 7b01          	ld	a,(OFST+0,sp)
3182  06cb cd0c41        	call	_CAN_SelectPage
3184                     ; 735 }
3187  06ce 85            	popw	x
3188  06cf 81            	ret
3211                     ; 742 void CAN_FIFORelease(void)
3211                     ; 743 {
3212                     	switch	.text
3213  06d0               _CAN_FIFORelease:
3217                     ; 745   CAN->RFR = CAN_RFR_RFOM; /*rc-w1*/
3219  06d0 35205424      	mov	21540,#32
3220                     ; 746 }
3223  06d4 81            	ret
3297                     ; 752 CAN_NbrPendingMessage_TypeDef CAN_MessagePending(void)
3297                     ; 753 {
3298                     	switch	.text
3299  06d5               _CAN_MessagePending:
3301  06d5 88            	push	a
3302       00000001      OFST:	set	1
3305                     ; 754   CAN_NbrPendingMessage_TypeDef msgpending = CAN_NbrPendingMessage_0;
3307                     ; 755   msgpending = (CAN_NbrPendingMessage_TypeDef)(CAN->RFR & CAN_RFR_FMP01);
3309  06d6 c65424        	ld	a,21540
3310  06d9 a403          	and	a,#3
3311  06db 6b01          	ld	(OFST+0,sp),a
3313                     ; 756   return (CAN_NbrPendingMessage_TypeDef)msgpending;
3315  06dd 7b01          	ld	a,(OFST+0,sp)
3318  06df 5b01          	addw	sp,#1
3319  06e1 81            	ret
3390                     ; 767 void CAN_Receive(void)
3390                     ; 768 {
3391                     	switch	.text
3392  06e2               _CAN_Receive:
3394  06e2 520d          	subw	sp,#13
3395       0000000d      OFST:	set	13
3398                     ; 769   CAN_Page_TypeDef can_page = CAN_GetSelectedPage();
3400  06e4 cd0c3d        	call	_CAN_GetSelectedPage
3402  06e7 6b01          	ld	(OFST-12,sp),a
3404                     ; 770   uint32_t temp1 = 0, temp2 = 0, temp3 = 0;
3410                     ; 773   CAN->PSR = CAN_Page_RxFifo;
3412  06e9 35075427      	mov	21543,#7
3413                     ; 776   _IDE = (uint8_t)(CAN->Page.RxFIFO.MIDR1 & CAN_Id_Extended);
3415  06ed c6542a        	ld	a,21546
3416  06f0 a440          	and	a,#64
3417  06f2 b704          	ld	__IDE,a
3418                     ; 777   if (_IDE != CAN_Id_Standard)
3420  06f4 3d04          	tnz	__IDE
3421  06f6 2602          	jrne	L27
3422  06f8 207b          	jp	L7041
3423  06fa               L27:
3424                     ; 779     temp1 = ((uint32_t)((uint32_t)CAN->Page.RxFIFO.MIDR3) << 8);
3426  06fa c6542c        	ld	a,21548
3427  06fd 5f            	clrw	x
3428  06fe 97            	ld	xl,a
3429  06ff 90ae0100      	ldw	y,#256
3430  0703 cd0000        	call	c_umul
3432  0706 96            	ldw	x,sp
3433  0707 1c0006        	addw	x,#OFST-7
3434  070a cd0000        	call	c_rtol
3437                     ; 780     temp2 = ((uint32_t)((uint32_t)CAN->Page.RxFIFO.MIDR2) << 16);  
3439  070d c6542b        	ld	a,21547
3440  0710 b703          	ld	c_lreg+3,a
3441  0712 3f02          	clr	c_lreg+2
3442  0714 3f01          	clr	c_lreg+1
3443  0716 3f00          	clr	c_lreg
3444  0718 a610          	ld	a,#16
3445  071a cd0000        	call	c_llsh
3447  071d 96            	ldw	x,sp
3448  071e 1c000a        	addw	x,#OFST-3
3449  0721 cd0000        	call	c_rtol
3452                     ; 781     temp3 = ((uint32_t)((uint32_t)CAN->Page.RxFIFO.MIDR1 & 0x1F) << 24);
3454  0724 c6542a        	ld	a,21546
3455  0727 b703          	ld	c_lreg+3,a
3456  0729 3f02          	clr	c_lreg+2
3457  072b 3f01          	clr	c_lreg+1
3458  072d 3f00          	clr	c_lreg
3459  072f b603          	ld	a,c_lreg+3
3460  0731 a41f          	and	a,#31
3461  0733 b703          	ld	c_lreg+3,a
3462  0735 3f02          	clr	c_lreg+2
3463  0737 3f01          	clr	c_lreg+1
3464  0739 3f00          	clr	c_lreg
3465  073b a618          	ld	a,#24
3466  073d cd0000        	call	c_llsh
3468  0740 96            	ldw	x,sp
3469  0741 1c0002        	addw	x,#OFST-11
3470  0744 cd0000        	call	c_rtol
3473                     ; 783     _Id = (uint32_t)CAN_EXTID_SIZE & ((CAN->Page.RxFIFO.MIDR4) | temp1 | temp2 | temp3 );
3475  0747 c6542d        	ld	a,21549
3476  074a b703          	ld	c_lreg+3,a
3477  074c 3f02          	clr	c_lreg+2
3478  074e 3f01          	clr	c_lreg+1
3479  0750 3f00          	clr	c_lreg
3480  0752 96            	ldw	x,sp
3481  0753 1c0006        	addw	x,#OFST-7
3482  0756 cd0000        	call	c_lor
3484  0759 96            	ldw	x,sp
3485  075a 1c000a        	addw	x,#OFST-3
3486  075d cd0000        	call	c_lor
3488  0760 96            	ldw	x,sp
3489  0761 1c0002        	addw	x,#OFST-11
3490  0764 cd0000        	call	c_lor
3492  0767 b600          	ld	a,c_lreg
3493  0769 a41f          	and	a,#31
3494  076b b700          	ld	c_lreg,a
3495  076d ae0000        	ldw	x,#__Id
3496  0770 cd0000        	call	c_rtol
3499  0773 204c          	jra	L1141
3500  0775               L7041:
3501                     ; 787     temp1 = (uint16_t)((uint16_t)((uint16_t)((uint16_t)CAN->Page.RxFIFO.MIDR1 & 0x1F) << 6));
3503  0775 c6542a        	ld	a,21546
3504  0778 5f            	clrw	x
3505  0779 a41f          	and	a,#31
3506  077b 5f            	clrw	x
3507  077c 02            	rlwa	x,a
3508  077d 58            	sllw	x
3509  077e 58            	sllw	x
3510  077f 58            	sllw	x
3511  0780 58            	sllw	x
3512  0781 58            	sllw	x
3513  0782 58            	sllw	x
3514  0783 cd0000        	call	c_uitolx
3516  0786 96            	ldw	x,sp
3517  0787 1c0006        	addw	x,#OFST-7
3518  078a cd0000        	call	c_rtol
3521                     ; 788     temp2 = (uint16_t)((uint16_t)((uint16_t)CAN->Page.RxFIFO.MIDR2 >> 2)&0x3F);
3523  078d c6542b        	ld	a,21547
3524  0790 5f            	clrw	x
3525  0791 97            	ld	xl,a
3526  0792 54            	srlw	x
3527  0793 54            	srlw	x
3528  0794 9f            	ld	a,xl
3529  0795 5f            	clrw	x
3530  0796 a43f          	and	a,#63
3531  0798 5f            	clrw	x
3532  0799 cd0000        	call	c_uitol
3534  079c 96            	ldw	x,sp
3535  079d 1c000a        	addw	x,#OFST-3
3536  07a0 cd0000        	call	c_rtol
3539                     ; 790     _Id = (uint16_t)CAN_STDID_SIZE & (temp1 | temp2 );
3541  07a3 96            	ldw	x,sp
3542  07a4 1c0006        	addw	x,#OFST-7
3543  07a7 cd0000        	call	c_ltor
3545  07aa 96            	ldw	x,sp
3546  07ab 1c000a        	addw	x,#OFST-3
3547  07ae cd0000        	call	c_lor
3549  07b1 b602          	ld	a,c_lreg+2
3550  07b3 a407          	and	a,#7
3551  07b5 b702          	ld	c_lreg+2,a
3552  07b7 3f01          	clr	c_lreg+1
3553  07b9 3f00          	clr	c_lreg
3554  07bb ae0000        	ldw	x,#__Id
3555  07be cd0000        	call	c_rtol
3557  07c1               L1141:
3558                     ; 793   _RTR = (uint8_t)((uint8_t)0x20 & CAN->Page.RxFIFO.MIDR1);
3560  07c1 c6542a        	ld	a,21546
3561  07c4 a420          	and	a,#32
3562  07c6 b705          	ld	__RTR,a
3563                     ; 796   _DLC = (uint8_t)(CAN->Page.RxFIFO.MDLCR & (uint8_t)0x0F);
3565  07c8 c65429        	ld	a,21545
3566  07cb a40f          	and	a,#15
3567  07cd b706          	ld	__DLC,a
3568                     ; 799   _FMI = CAN->Page.RxFIFO.MFMI;
3570  07cf 555428000f    	mov	__FMI,21544
3571                     ; 802   _Data[0] = CAN->Page.RxFIFO.MDAR1;
3573  07d4 55542e0007    	mov	__Data,21550
3574                     ; 803   _Data[1] = CAN->Page.RxFIFO.MDAR2;
3576  07d9 55542f0008    	mov	__Data+1,21551
3577                     ; 804   _Data[2] = CAN->Page.RxFIFO.MDAR3;
3579  07de 5554300009    	mov	__Data+2,21552
3580                     ; 805   _Data[3] = CAN->Page.RxFIFO.MDAR4;
3582  07e3 555431000a    	mov	__Data+3,21553
3583                     ; 806   _Data[4] = CAN->Page.RxFIFO.MDAR5;
3585  07e8 555432000b    	mov	__Data+4,21554
3586                     ; 807   _Data[5] = CAN->Page.RxFIFO.MDAR6;
3588  07ed 555433000c    	mov	__Data+5,21555
3589                     ; 808   _Data[6] = CAN->Page.RxFIFO.MDAR7;
3591  07f2 555434000d    	mov	__Data+6,21556
3592                     ; 809   _Data[7] = CAN->Page.RxFIFO.MDAR8;
3594  07f7 555435000e    	mov	__Data+7,21557
3595                     ; 812   CAN_FIFORelease();
3597  07fc cd06d0        	call	_CAN_FIFORelease
3599                     ; 814   CAN_SelectPage(can_page);
3601  07ff 7b01          	ld	a,(OFST-12,sp)
3602  0801 cd0c41        	call	_CAN_SelectPage
3604                     ; 815 }
3607  0804 5b0d          	addw	sp,#13
3608  0806 81            	ret
3632                     ; 825 uint32_t CAN_GetReceivedId(void)
3632                     ; 826 {
3633                     	switch	.text
3634  0807               _CAN_GetReceivedId:
3638                     ; 827   return (_Id);
3640  0807 ae0000        	ldw	x,#__Id
3641  080a cd0000        	call	c_ltor
3645  080d 81            	ret
3670                     ; 838 CAN_Id_TypeDef CAN_GetReceivedIDE(void)
3670                     ; 839 {
3671                     	switch	.text
3672  080e               _CAN_GetReceivedIDE:
3676                     ; 840   return (CAN_Id_TypeDef)(_IDE);
3678  080e b604          	ld	a,__IDE
3681  0810 81            	ret
3706                     ; 851 CAN_RTR_TypeDef CAN_GetReceivedRTR(void)
3706                     ; 852 {
3707                     	switch	.text
3708  0811               _CAN_GetReceivedRTR:
3712                     ; 853   return (CAN_RTR_TypeDef)(_RTR);
3714  0811 b605          	ld	a,__RTR
3717  0813 81            	ret
3741                     ; 864 uint8_t CAN_GetReceivedDLC(void)
3741                     ; 865 {
3742                     	switch	.text
3743  0814               _CAN_GetReceivedDLC:
3747                     ; 866   return (_DLC);
3749  0814 b606          	ld	a,__DLC
3752  0816 81            	ret
3788                     ; 878 uint8_t CAN_GetReceivedData(uint8_t CAN_DataIndex)
3788                     ; 879 {
3789                     	switch	.text
3790  0817               _CAN_GetReceivedData:
3794                     ; 880   assert_param(IS_CAN_DLC_OK(CAN_DataIndex));
3796                     ; 881   return (_Data[CAN_DataIndex]);
3798  0817 5f            	clrw	x
3799  0818 97            	ld	xl,a
3800  0819 e607          	ld	a,(__Data,x)
3803  081b 81            	ret
3827                     ; 892 uint8_t CAN_GetReceivedFMI(void)
3827                     ; 893 {
3828                     	switch	.text
3829  081c               _CAN_GetReceivedFMI:
3833                     ; 894   return (_FMI);
3835  081c b60f          	ld	a,__FMI
3838  081e 81            	ret
3885                     ; 902 uint16_t CAN_GetMessageTimeStamp(void)
3885                     ; 903 {
3886                     	switch	.text
3887  081f               _CAN_GetMessageTimeStamp:
3889  081f 5203          	subw	sp,#3
3890       00000003      OFST:	set	3
3893                     ; 904   uint16_t timestamp = 0;
3895                     ; 905   CAN_Page_TypeDef can_page = CAN_GetSelectedPage();
3897  0821 cd0c3d        	call	_CAN_GetSelectedPage
3899  0824 6b01          	ld	(OFST-2,sp),a
3901                     ; 908   CAN->PSR = CAN_Page_RxFifo;
3903  0826 35075427      	mov	21543,#7
3904                     ; 910   timestamp = CAN->Page.RxFIFO.MTSRL;
3906  082a c65436        	ld	a,21558
3907  082d 5f            	clrw	x
3908  082e 97            	ld	xl,a
3909  082f 1f02          	ldw	(OFST-1,sp),x
3911                     ; 911   timestamp |= (uint16_t)(((uint16_t)CAN->Page.RxFIFO.MTSRH)<<8);
3913  0831 c65437        	ld	a,21559
3914  0834 5f            	clrw	x
3915  0835 97            	ld	xl,a
3916  0836 4f            	clr	a
3917  0837 02            	rlwa	x,a
3918  0838 01            	rrwa	x,a
3919  0839 1a03          	or	a,(OFST+0,sp)
3920  083b 01            	rrwa	x,a
3921  083c 1a02          	or	a,(OFST-1,sp)
3922  083e 01            	rrwa	x,a
3923  083f 1f02          	ldw	(OFST-1,sp),x
3925                     ; 914   CAN_SelectPage(can_page);
3927  0841 7b01          	ld	a,(OFST-2,sp)
3928  0843 cd0c41        	call	_CAN_SelectPage
3930                     ; 916   return (uint16_t)(timestamp);
3932  0846 1e02          	ldw	x,(OFST-1,sp)
3935  0848 5b03          	addw	sp,#3
3936  084a 81            	ret
3992                     ; 924 CAN_Sleep_TypeDef CAN_Sleep(void)
3992                     ; 925 {
3993                     	switch	.text
3994  084b               _CAN_Sleep:
3996  084b 88            	push	a
3997       00000001      OFST:	set	1
4000                     ; 926   CAN_Sleep_TypeDef sleepstatus = CAN_Sleep_Failed;
4002  084c 0f01          	clr	(OFST+0,sp)
4004                     ; 929   CAN->MCR = (uint8_t)((uint8_t)(CAN->MCR & (uint8_t)(~CAN_MCR_INRQ)) | CAN_MCR_SLEEP);
4006  084e c65420        	ld	a,21536
4007  0851 a4fe          	and	a,#254
4008  0853 aa02          	or	a,#2
4009  0855 c75420        	ld	21536,a
4010                     ; 932   if ((CAN->MSR & (CAN_MSR_SLAK|CAN_MSR_INAK)) == CAN_MSR_SLAK)
4012  0858 c65421        	ld	a,21537
4013  085b a403          	and	a,#3
4014  085d a102          	cp	a,#2
4015  085f 2604          	jrne	L1551
4016                     ; 935     sleepstatus =  CAN_Sleep_Ok;
4018  0861 a601          	ld	a,#1
4019  0863 6b01          	ld	(OFST+0,sp),a
4021  0865               L1551:
4022                     ; 939   return (CAN_Sleep_TypeDef) sleepstatus;
4024  0865 7b01          	ld	a,(OFST+0,sp)
4027  0867 5b01          	addw	sp,#1
4028  0869 81            	ret
4084                     ; 947 CAN_WakeUp_TypeDef CAN_WakeUp(void)
4084                     ; 948 {
4085                     	switch	.text
4086  086a               _CAN_WakeUp:
4088  086a 88            	push	a
4089       00000001      OFST:	set	1
4092                     ; 949   CAN_WakeUp_TypeDef wakeupstatus = CAN_WakeUp_Failed;
4094  086b 0f01          	clr	(OFST+0,sp)
4096                     ; 952   CAN->MCR &= (uint8_t)(~CAN_MCR_SLEEP);
4098  086d 72135420      	bres	21536,#1
4099                     ; 955   if ((CAN->MSR & CAN_MSR_SLAK) != CAN_MSR_SLAK)
4101  0871 c65421        	ld	a,21537
4102  0874 a402          	and	a,#2
4103  0876 a102          	cp	a,#2
4104  0878 2704          	jreq	L1061
4105                     ; 958     wakeupstatus = CAN_WakeUp_Ok;
4107  087a a601          	ld	a,#1
4108  087c 6b01          	ld	(OFST+0,sp),a
4110  087e               L1061:
4111                     ; 962   return (CAN_WakeUp_TypeDef)wakeupstatus;
4113  087e 7b01          	ld	a,(OFST+0,sp)
4116  0880 5b01          	addw	sp,#1
4117  0882 81            	ret
4224                     ; 974 CAN_ModeStatus_TypeDef CAN_OperatingModeRequest(CAN_OperatingMode_TypeDef CAN_OperatingMode)
4224                     ; 975 {
4225                     	switch	.text
4226  0883               _CAN_OperatingModeRequest:
4228  0883 88            	push	a
4229  0884 5203          	subw	sp,#3
4230       00000003      OFST:	set	3
4233                     ; 976   uint16_t timeout = CAN_ACKNOWLEDGE_TIMEOUT;
4235  0886 aeffff        	ldw	x,#65535
4236  0889 1f02          	ldw	(OFST-1,sp),x
4238                     ; 977   uint8_t modestatus = 0;
4240                     ; 979   assert_param(IS_CAN_OPERATINGMODE_OK(CAN_OperatingMode));
4242                     ; 981   if (CAN_OperatingMode == CAN_OperatingMode_Initialization)
4244  088b 4d            	tnz	a
4245  088c 2633          	jrne	L3561
4246                     ; 984     CAN->MCR = (uint8_t)((uint8_t)(CAN->MCR & (uint8_t)(~CAN_MCR_SLEEP)) | CAN_MCR_INRQ);
4248  088e c65420        	ld	a,21536
4249  0891 a4fd          	and	a,#253
4250  0893 aa01          	or	a,#1
4251  0895 c75420        	ld	21536,a
4253  0898 2007          	jra	L1661
4254  089a               L5561:
4255                     ; 989       timeout--;
4257  089a 1e02          	ldw	x,(OFST-1,sp)
4258  089c 1d0001        	subw	x,#1
4259  089f 1f02          	ldw	(OFST-1,sp),x
4261  08a1               L1661:
4262                     ; 987     while (((CAN->MSR & CAN_MODE_MASK) != CAN_MSR_INAK) && (timeout != 0))
4264  08a1 c65421        	ld	a,21537
4265  08a4 a403          	and	a,#3
4266  08a6 a101          	cp	a,#1
4267  08a8 2704          	jreq	L5661
4269  08aa 1e02          	ldw	x,(OFST-1,sp)
4270  08ac 26ec          	jrne	L5561
4271  08ae               L5661:
4272                     ; 991     if ((CAN->MSR & CAN_MODE_MASK) != CAN_MSR_INAK)
4274  08ae c65421        	ld	a,21537
4275  08b1 a403          	and	a,#3
4276  08b3 a101          	cp	a,#1
4277  08b5 2704          	jreq	L7661
4278                     ; 993       modestatus = CAN_ModeStatus_Failed;
4280  08b7 0f01          	clr	(OFST-2,sp)
4283  08b9 2074          	jra	L3761
4284  08bb               L7661:
4285                     ; 997       modestatus = CAN_ModeStatus_Success;  
4287  08bb a601          	ld	a,#1
4288  08bd 6b01          	ld	(OFST-2,sp),a
4290  08bf 206e          	jra	L3761
4291  08c1               L3561:
4292                     ; 1001   else  if (CAN_OperatingMode == CAN_OperatingMode_Normal)
4294  08c1 7b04          	ld	a,(OFST+1,sp)
4295  08c3 a101          	cp	a,#1
4296  08c5 262d          	jrne	L5761
4297                     ; 1004     CAN->MCR &= (uint8_t)(~(CAN_MCR_SLEEP|CAN_MCR_INRQ));
4299  08c7 c65420        	ld	a,21536
4300  08ca a4fc          	and	a,#252
4301  08cc c75420        	ld	21536,a
4303  08cf 2007          	jra	L1071
4304  08d1               L7761:
4305                     ; 1009       timeout--;
4307  08d1 1e02          	ldw	x,(OFST-1,sp)
4308  08d3 1d0001        	subw	x,#1
4309  08d6 1f02          	ldw	(OFST-1,sp),x
4311  08d8               L1071:
4312                     ; 1007     while (((CAN->MSR & CAN_MODE_MASK) != 0) && (timeout!=0))
4314  08d8 c65421        	ld	a,21537
4315  08db a503          	bcp	a,#3
4316  08dd 2704          	jreq	L5071
4318  08df 1e02          	ldw	x,(OFST-1,sp)
4319  08e1 26ee          	jrne	L7761
4320  08e3               L5071:
4321                     ; 1011     if ((CAN->MSR & CAN_MODE_MASK) != 0)
4323  08e3 c65421        	ld	a,21537
4324  08e6 a503          	bcp	a,#3
4325  08e8 2704          	jreq	L7071
4326                     ; 1013       modestatus = CAN_ModeStatus_Failed;
4328  08ea 0f01          	clr	(OFST-2,sp)
4331  08ec 2041          	jra	L3761
4332  08ee               L7071:
4333                     ; 1017       modestatus = CAN_ModeStatus_Success;  
4335  08ee a601          	ld	a,#1
4336  08f0 6b01          	ld	(OFST-2,sp),a
4338  08f2 203b          	jra	L3761
4339  08f4               L5761:
4340                     ; 1020   else  if (CAN_OperatingMode == CAN_OperatingMode_Sleep)
4342  08f4 7b04          	ld	a,(OFST+1,sp)
4343  08f6 a102          	cp	a,#2
4344  08f8 2633          	jrne	L5171
4345                     ; 1023     CAN->MCR = (uint8_t)((uint8_t)(CAN->MCR & (uint8_t)(~CAN_MCR_INRQ)) | CAN_MCR_SLEEP);
4347  08fa c65420        	ld	a,21536
4348  08fd a4fe          	and	a,#254
4349  08ff aa02          	or	a,#2
4350  0901 c75420        	ld	21536,a
4352  0904 2007          	jra	L3271
4353  0906               L7171:
4354                     ; 1028       timeout--;
4356  0906 1e02          	ldw	x,(OFST-1,sp)
4357  0908 1d0001        	subw	x,#1
4358  090b 1f02          	ldw	(OFST-1,sp),x
4360  090d               L3271:
4361                     ; 1026     while (((CAN->MSR & CAN_MODE_MASK) != CAN_MSR_SLAK) && (timeout!=0))
4363  090d c65421        	ld	a,21537
4364  0910 a403          	and	a,#3
4365  0912 a102          	cp	a,#2
4366  0914 2704          	jreq	L7271
4368  0916 1e02          	ldw	x,(OFST-1,sp)
4369  0918 26ec          	jrne	L7171
4370  091a               L7271:
4371                     ; 1030     if ((CAN->MSR & CAN_MODE_MASK) != CAN_MSR_SLAK)
4373  091a c65421        	ld	a,21537
4374  091d a403          	and	a,#3
4375  091f a102          	cp	a,#2
4376  0921 2704          	jreq	L1371
4377                     ; 1032       modestatus = CAN_ModeStatus_Failed;  
4379  0923 0f01          	clr	(OFST-2,sp)
4382  0925 2008          	jra	L3761
4383  0927               L1371:
4384                     ; 1036       modestatus = CAN_ModeStatus_Success;  
4386  0927 a601          	ld	a,#1
4387  0929 6b01          	ld	(OFST-2,sp),a
4389  092b 2002          	jra	L3761
4390  092d               L5171:
4391                     ; 1041     modestatus = CAN_ModeStatus_Failed;
4393  092d 0f01          	clr	(OFST-2,sp)
4395  092f               L3761:
4396                     ; 1043   return (CAN_ModeStatus_TypeDef)(modestatus);
4398  092f 7b01          	ld	a,(OFST-2,sp)
4401  0931 5b04          	addw	sp,#4
4402  0933 81            	ret
4521                     ; 1051 CAN_ErrorCode_TypeDef CAN_GetLastErrorCode(void)
4521                     ; 1052 {
4522                     	switch	.text
4523  0934               _CAN_GetLastErrorCode:
4525  0934 89            	pushw	x
4526       00000002      OFST:	set	2
4529                     ; 1053   CAN_ErrorCode_TypeDef errcode = CAN_ErrorCode_NoErr;
4531                     ; 1054   CAN_Page_TypeDef can_page = CAN_GetSelectedPage();
4533  0935 cd0c3d        	call	_CAN_GetSelectedPage
4535  0938 6b01          	ld	(OFST-1,sp),a
4537                     ; 1056   CAN->PSR = CAN_Page_Config;
4539  093a 35065427      	mov	21543,#6
4540                     ; 1057   errcode = (CAN_ErrorCode_TypeDef)((CAN->Page.Config.ESR) & (CAN_ESR_LEC));
4542  093e c65428        	ld	a,21544
4543  0941 a470          	and	a,#112
4544  0943 6b02          	ld	(OFST+0,sp),a
4546                     ; 1060   CAN_SelectPage(can_page);
4548  0945 7b01          	ld	a,(OFST-1,sp)
4549  0947 cd0c41        	call	_CAN_SelectPage
4551                     ; 1062   return (CAN_ErrorCode_TypeDef)(errcode);
4553  094a 7b02          	ld	a,(OFST+0,sp)
4556  094c 85            	popw	x
4557  094d 81            	ret
4687                     ; 1077 void CAN_ClearFlag(CAN_FLAG_TypeDef CAN_Flag)
4687                     ; 1078 {
4688                     	switch	.text
4689  094e               _CAN_ClearFlag:
4691  094e 89            	pushw	x
4692  094f 88            	push	a
4693       00000001      OFST:	set	1
4696                     ; 1079   CAN_Page_TypeDef can_page = (CAN_Page_TypeDef)0;
4698                     ; 1081   assert_param(IS_CAN_FLAG_CLEAR_OK(CAN_Flag));
4700                     ; 1082   if (((uint16_t)CAN_Flag & 0x0700)!= RESET)
4702  0950 01            	rrwa	x,a
4703  0951 9f            	ld	a,xl
4704  0952 a407          	and	a,#7
4705  0954 97            	ld	xl,a
4706  0955 4f            	clr	a
4707  0956 02            	rlwa	x,a
4708  0957 5d            	tnzw	x
4709  0958 2731          	jreq	L1602
4710                     ; 1084     if (((uint16_t)CAN_Flag & 0x020B)!= RESET)
4712  095a 1e02          	ldw	x,(OFST+1,sp)
4713  095c 01            	rrwa	x,a
4714  095d a40b          	and	a,#11
4715  095f 01            	rrwa	x,a
4716  0960 a402          	and	a,#2
4717  0962 01            	rrwa	x,a
4718  0963 a30000        	cpw	x,#0
4719  0966 2707          	jreq	L3602
4720                     ; 1087       CAN->RFR = (uint8_t)(CAN_Flag);
4722  0968 7b03          	ld	a,(OFST+2,sp)
4723  096a c75424        	ld	21540,a
4725  096d 202e          	jra	L3702
4726  096f               L3602:
4727                     ; 1089     else if (((uint16_t)CAN_Flag & 0x0403)!= RESET)
4729  096f 1e02          	ldw	x,(OFST+1,sp)
4730  0971 01            	rrwa	x,a
4731  0972 a403          	and	a,#3
4732  0974 01            	rrwa	x,a
4733  0975 a404          	and	a,#4
4734  0977 01            	rrwa	x,a
4735  0978 a30000        	cpw	x,#0
4736  097b 2707          	jreq	L7602
4737                     ; 1092       CAN->TSR = (uint8_t)(CAN_Flag);
4739  097d 7b03          	ld	a,(OFST+2,sp)
4740  097f c75422        	ld	21538,a
4742  0982 2019          	jra	L3702
4743  0984               L7602:
4744                     ; 1097       CAN->MSR = (uint8_t)(CAN_Flag);
4746  0984 7b03          	ld	a,(OFST+2,sp)
4747  0986 c75421        	ld	21537,a
4748  0989 2012          	jra	L3702
4749  098b               L1602:
4750                     ; 1103     can_page = CAN_GetSelectedPage();
4752  098b cd0c3d        	call	_CAN_GetSelectedPage
4754  098e 6b01          	ld	(OFST+0,sp),a
4756                     ; 1106     CAN->PSR = CAN_Page_Config;
4758  0990 35065427      	mov	21543,#6
4759                     ; 1107     CAN->Page.Config.ESR = (uint8_t)RESET;
4761  0994 725f5428      	clr	21544
4762                     ; 1110     CAN_SelectPage(can_page);
4764  0998 7b01          	ld	a,(OFST+0,sp)
4765  099a cd0c41        	call	_CAN_SelectPage
4767  099d               L3702:
4768                     ; 1112 }
4771  099d 5b03          	addw	sp,#3
4772  099f 81            	ret
4850                     ; 1119 FlagStatus CAN_GetFlagStatus(CAN_FLAG_TypeDef CAN_Flag)
4850                     ; 1120 {
4851                     	switch	.text
4852  09a0               _CAN_GetFlagStatus:
4854  09a0 89            	pushw	x
4855  09a1 89            	pushw	x
4856       00000002      OFST:	set	2
4859                     ; 1121   FlagStatus bitstatus = RESET;
4861                     ; 1122   CAN_Page_TypeDef can_page = (CAN_Page_TypeDef)0;
4863                     ; 1125   assert_param(IS_CAN_FLAG_STATUS_OK(CAN_Flag));
4865                     ; 1127   if (((uint16_t)CAN_Flag & 0x0700)!= RESET)
4867  09a2 01            	rrwa	x,a
4868  09a3 9f            	ld	a,xl
4869  09a4 a407          	and	a,#7
4870  09a6 97            	ld	xl,a
4871  09a7 4f            	clr	a
4872  09a8 02            	rlwa	x,a
4873  09a9 5d            	tnzw	x
4874  09aa 276d          	jreq	L3312
4875                     ; 1129     if (((uint16_t)CAN_Flag & 0x020B)!= RESET)
4877  09ac 1e03          	ldw	x,(OFST+1,sp)
4878  09ae 01            	rrwa	x,a
4879  09af a40b          	and	a,#11
4880  09b1 01            	rrwa	x,a
4881  09b2 a402          	and	a,#2
4882  09b4 01            	rrwa	x,a
4883  09b5 a30000        	cpw	x,#0
4884  09b8 271b          	jreq	L5312
4885                     ; 1132       if ((CAN->RFR & (uint16_t)CAN_Flag )!= RESET)
4887  09ba c65424        	ld	a,21540
4888  09bd 5f            	clrw	x
4889  09be 97            	ld	xl,a
4890  09bf 01            	rrwa	x,a
4891  09c0 1404          	and	a,(OFST+2,sp)
4892  09c2 01            	rrwa	x,a
4893  09c3 1403          	and	a,(OFST+1,sp)
4894  09c5 01            	rrwa	x,a
4895  09c6 a30000        	cpw	x,#0
4896  09c9 2706          	jreq	L7312
4897                     ; 1135         bitstatus = SET;
4899  09cb a601          	ld	a,#1
4900  09cd 6b02          	ld	(OFST+0,sp),a
4903  09cf 206f          	jra	L1612
4904  09d1               L7312:
4905                     ; 1140         bitstatus = RESET;
4907  09d1 0f02          	clr	(OFST+0,sp)
4909  09d3 206b          	jra	L1612
4910  09d5               L5312:
4911                     ; 1144     else if (((uint16_t)CAN_Flag & 0x0403)!= RESET)
4913  09d5 1e03          	ldw	x,(OFST+1,sp)
4914  09d7 01            	rrwa	x,a
4915  09d8 a403          	and	a,#3
4916  09da 01            	rrwa	x,a
4917  09db a404          	and	a,#4
4918  09dd 01            	rrwa	x,a
4919  09de a30000        	cpw	x,#0
4920  09e1 271b          	jreq	L5412
4921                     ; 1147       if ((CAN->TSR & (uint16_t)CAN_Flag )!= RESET)
4923  09e3 c65422        	ld	a,21538
4924  09e6 5f            	clrw	x
4925  09e7 97            	ld	xl,a
4926  09e8 01            	rrwa	x,a
4927  09e9 1404          	and	a,(OFST+2,sp)
4928  09eb 01            	rrwa	x,a
4929  09ec 1403          	and	a,(OFST+1,sp)
4930  09ee 01            	rrwa	x,a
4931  09ef a30000        	cpw	x,#0
4932  09f2 2706          	jreq	L7412
4933                     ; 1150         bitstatus = SET;
4935  09f4 a601          	ld	a,#1
4936  09f6 6b02          	ld	(OFST+0,sp),a
4939  09f8 2046          	jra	L1612
4940  09fa               L7412:
4941                     ; 1155         bitstatus = RESET;
4943  09fa 0f02          	clr	(OFST+0,sp)
4945  09fc 2042          	jra	L1612
4946  09fe               L5412:
4947                     ; 1161       if ((CAN->MSR & (uint16_t)CAN_Flag )!= RESET)
4949  09fe c65421        	ld	a,21537
4950  0a01 5f            	clrw	x
4951  0a02 97            	ld	xl,a
4952  0a03 01            	rrwa	x,a
4953  0a04 1404          	and	a,(OFST+2,sp)
4954  0a06 01            	rrwa	x,a
4955  0a07 1403          	and	a,(OFST+1,sp)
4956  0a09 01            	rrwa	x,a
4957  0a0a a30000        	cpw	x,#0
4958  0a0d 2706          	jreq	L5512
4959                     ; 1164         bitstatus = SET;
4961  0a0f a601          	ld	a,#1
4962  0a11 6b02          	ld	(OFST+0,sp),a
4965  0a13 202b          	jra	L1612
4966  0a15               L5512:
4967                     ; 1169         bitstatus = RESET;
4969  0a15 0f02          	clr	(OFST+0,sp)
4971  0a17 2027          	jra	L1612
4972  0a19               L3312:
4973                     ; 1176     can_page = CAN_GetSelectedPage();
4975  0a19 cd0c3d        	call	_CAN_GetSelectedPage
4977  0a1c 6b01          	ld	(OFST-1,sp),a
4979                     ; 1178     CAN->PSR = CAN_Page_Config;
4981  0a1e 35065427      	mov	21543,#6
4982                     ; 1179     if ((CAN->Page.Config.ESR & (uint16_t)CAN_Flag) != RESET)
4984  0a22 c65428        	ld	a,21544
4985  0a25 5f            	clrw	x
4986  0a26 97            	ld	xl,a
4987  0a27 01            	rrwa	x,a
4988  0a28 1404          	and	a,(OFST+2,sp)
4989  0a2a 01            	rrwa	x,a
4990  0a2b 1403          	and	a,(OFST+1,sp)
4991  0a2d 01            	rrwa	x,a
4992  0a2e a30000        	cpw	x,#0
4993  0a31 2706          	jreq	L3612
4994                     ; 1182       bitstatus = SET;
4996  0a33 a601          	ld	a,#1
4997  0a35 6b02          	ld	(OFST+0,sp),a
5000  0a37 2002          	jra	L5612
5001  0a39               L3612:
5002                     ; 1187       bitstatus = RESET;
5004  0a39 0f02          	clr	(OFST+0,sp)
5006  0a3b               L5612:
5007                     ; 1190     CAN_SelectPage(can_page);
5009  0a3b 7b01          	ld	a,(OFST-1,sp)
5010  0a3d cd0c41        	call	_CAN_SelectPage
5012  0a40               L1612:
5013                     ; 1195   return  (FlagStatus)bitstatus;
5015  0a40 7b02          	ld	a,(OFST+0,sp)
5018  0a42 5b04          	addw	sp,#4
5019  0a44 81            	ret
5078                     ; 1203 ITStatus CAN_GetITStatus(CAN_IT_TypeDef CAN_IT)
5078                     ; 1204 {
5079                     	switch	.text
5080  0a45               _CAN_GetITStatus:
5082  0a45 89            	pushw	x
5083  0a46 89            	pushw	x
5084       00000002      OFST:	set	2
5087                     ; 1205   ITStatus pendingbitstatus = RESET;
5089                     ; 1206   CAN_Page_TypeDef can_page = CAN_GetSelectedPage();
5091  0a47 cd0c3d        	call	_CAN_GetSelectedPage
5093  0a4a 6b01          	ld	(OFST-1,sp),a
5095                     ; 1209   assert_param(IS_CAN_IT_STATUS_OK(CAN_IT));
5097                     ; 1212   switch (CAN_IT)
5099  0a4c 1e03          	ldw	x,(OFST+1,sp)
5101                     ; 1325     break;
5102  0a4e 5a            	decw	x
5103  0a4f 2746          	jreq	L7612
5104  0a51 5a            	decw	x
5105  0a52 2760          	jreq	L1712
5106  0a54 1d0002        	subw	x,#2
5107  0a57 2778          	jreq	L3712
5108  0a59 1d0004        	subw	x,#4
5109  0a5c 2603          	jrne	L031
5110  0a5e cc0aee        	jp	L5712
5111  0a61               L031:
5112  0a61 1d0078        	subw	x,#120
5113  0a64 2603          	jrne	L231
5114  0a66 cc0b0b        	jp	L7712
5115  0a69               L231:
5116  0a69 1d0080        	subw	x,#128
5117  0a6c 2603          	jrne	L431
5118  0a6e cc0b45        	jp	L3022
5119  0a71               L431:
5120  0a71 1d0100        	subw	x,#256
5121  0a74 2603          	jrne	L631
5122  0a76 cc0b62        	jp	L5022
5123  0a79               L631:
5124  0a79 1d0200        	subw	x,#512
5125  0a7c 2603          	jrne	L041
5126  0a7e cc0b7f        	jp	L7022
5127  0a81               L041:
5128  0a81 1d0400        	subw	x,#1024
5129  0a84 2603          	jrne	L241
5130  0a86 cc0b9c        	jp	L1122
5131  0a89               L241:
5132  0a89 1d3800        	subw	x,#14336
5133  0a8c 2603          	jrne	L441
5134  0a8e cc0b28        	jp	L1022
5135  0a91               L441:
5136  0a91               L3122:
5137                     ; 1323   default :
5137                     ; 1324     pendingbitstatus = RESET;
5139  0a91 0f02          	clr	(OFST+0,sp)
5141                     ; 1325     break;
5143  0a93 acb70bb7      	jpf	L5422
5144  0a97               L7612:
5145                     ; 1214   case CAN_IT_TME:
5145                     ; 1215     if ((CAN->IER & CAN_IER_TMEIE) !=RESET)
5147  0a97 c65425        	ld	a,21541
5148  0a9a a501          	bcp	a,#1
5149  0a9c 2710          	jreq	L7422
5150                     ; 1217       pendingbitstatus = CheckITStatus(CAN->TSR, CAN_TSR_RQCP012);
5152  0a9e c65422        	ld	a,21538
5153  0aa1 ae0007        	ldw	x,#7
5154  0aa4 95            	ld	xh,a
5155  0aa5 cd0c45        	call	L3_CheckITStatus
5157  0aa8 6b02          	ld	(OFST+0,sp),a
5160  0aaa acb70bb7      	jpf	L5422
5161  0aae               L7422:
5162                     ; 1221       pendingbitstatus = RESET;
5164  0aae 0f02          	clr	(OFST+0,sp)
5166  0ab0 acb70bb7      	jpf	L5422
5167  0ab4               L1712:
5168                     ; 1225   case CAN_IT_FMP:
5168                     ; 1226     if ((CAN->IER & CAN_IER_FMPIE) !=RESET)
5170  0ab4 c65425        	ld	a,21541
5171  0ab7 a502          	bcp	a,#2
5172  0ab9 2710          	jreq	L3522
5173                     ; 1228       pendingbitstatus = CheckITStatus(CAN->RFR, CAN_RFR_FMP01);
5175  0abb c65424        	ld	a,21540
5176  0abe ae0003        	ldw	x,#3
5177  0ac1 95            	ld	xh,a
5178  0ac2 cd0c45        	call	L3_CheckITStatus
5180  0ac5 6b02          	ld	(OFST+0,sp),a
5183  0ac7 acb70bb7      	jpf	L5422
5184  0acb               L3522:
5185                     ; 1232       pendingbitstatus = RESET;
5187  0acb 0f02          	clr	(OFST+0,sp)
5189  0acd acb70bb7      	jpf	L5422
5190  0ad1               L3712:
5191                     ; 1235   case CAN_IT_FF:
5191                     ; 1236     if ((CAN->IER & CAN_IER_FFIE) !=RESET)
5193  0ad1 c65425        	ld	a,21541
5194  0ad4 a504          	bcp	a,#4
5195  0ad6 2710          	jreq	L7522
5196                     ; 1238       pendingbitstatus = CheckITStatus(CAN->RFR, CAN_RFR_FULL);
5198  0ad8 c65424        	ld	a,21540
5199  0adb ae0008        	ldw	x,#8
5200  0ade 95            	ld	xh,a
5201  0adf cd0c45        	call	L3_CheckITStatus
5203  0ae2 6b02          	ld	(OFST+0,sp),a
5206  0ae4 acb70bb7      	jpf	L5422
5207  0ae8               L7522:
5208                     ; 1242       pendingbitstatus = RESET;
5210  0ae8 0f02          	clr	(OFST+0,sp)
5212  0aea acb70bb7      	jpf	L5422
5213  0aee               L5712:
5214                     ; 1245   case CAN_IT_FOV:
5214                     ; 1246     if ((CAN->IER & CAN_IER_FOVIE) !=RESET)
5216  0aee c65425        	ld	a,21541
5217  0af1 a508          	bcp	a,#8
5218  0af3 2710          	jreq	L3622
5219                     ; 1248       pendingbitstatus = CheckITStatus(CAN->RFR, CAN_RFR_FOVR);
5221  0af5 c65424        	ld	a,21540
5222  0af8 ae0010        	ldw	x,#16
5223  0afb 95            	ld	xh,a
5224  0afc cd0c45        	call	L3_CheckITStatus
5226  0aff 6b02          	ld	(OFST+0,sp),a
5229  0b01 acb70bb7      	jpf	L5422
5230  0b05               L3622:
5231                     ; 1252       pendingbitstatus = RESET;
5233  0b05 0f02          	clr	(OFST+0,sp)
5235  0b07 acb70bb7      	jpf	L5422
5236  0b0b               L7712:
5237                     ; 1255   case CAN_IT_WKU:
5237                     ; 1256     if ((CAN->IER & CAN_IER_WKUIE) !=RESET)
5239  0b0b c65425        	ld	a,21541
5240  0b0e a580          	bcp	a,#128
5241  0b10 2710          	jreq	L7622
5242                     ; 1258       pendingbitstatus = CheckITStatus(CAN->MSR, CAN_MSR_WKUI);
5244  0b12 c65421        	ld	a,21537
5245  0b15 ae0008        	ldw	x,#8
5246  0b18 95            	ld	xh,a
5247  0b19 cd0c45        	call	L3_CheckITStatus
5249  0b1c 6b02          	ld	(OFST+0,sp),a
5252  0b1e acb70bb7      	jpf	L5422
5253  0b22               L7622:
5254                     ; 1262       pendingbitstatus = RESET;
5256  0b22 0f02          	clr	(OFST+0,sp)
5258  0b24 acb70bb7      	jpf	L5422
5259  0b28               L1022:
5260                     ; 1266   case CAN_IT_ERR:
5260                     ; 1267     CAN->PSR = CAN_Page_Config;
5262  0b28 35065427      	mov	21543,#6
5263                     ; 1268     if ((CAN->Page.Config.EIER & CAN_EIER_ERRIE) !=RESET)
5265  0b2c c65429        	ld	a,21545
5266  0b2f a580          	bcp	a,#128
5267  0b31 270e          	jreq	L3722
5268                     ; 1270       pendingbitstatus = CheckITStatus(CAN->Page.Config.ESR, CAN_ESR_EWGF|CAN_ESR_EPVF|CAN_ESR_BOFF|CAN_ESR_LEC);
5270  0b33 c65428        	ld	a,21544
5271  0b36 ae0077        	ldw	x,#119
5272  0b39 95            	ld	xh,a
5273  0b3a cd0c45        	call	L3_CheckITStatus
5275  0b3d 6b02          	ld	(OFST+0,sp),a
5278  0b3f 2076          	jra	L5422
5279  0b41               L3722:
5280                     ; 1274       pendingbitstatus = RESET;
5282  0b41 0f02          	clr	(OFST+0,sp)
5284  0b43 2072          	jra	L5422
5285  0b45               L3022:
5286                     ; 1278   case CAN_IT_EWG:
5286                     ; 1279     CAN->PSR = CAN_Page_Config;
5288  0b45 35065427      	mov	21543,#6
5289                     ; 1280     if ((CAN->Page.Config.EIER & CAN_EIER_EWGIE) !=RESET)
5291  0b49 c65429        	ld	a,21545
5292  0b4c a501          	bcp	a,#1
5293  0b4e 270e          	jreq	L7722
5294                     ; 1282       pendingbitstatus = CheckITStatus(CAN->Page.Config.ESR, CAN_ESR_EWGF);
5296  0b50 c65428        	ld	a,21544
5297  0b53 ae0001        	ldw	x,#1
5298  0b56 95            	ld	xh,a
5299  0b57 cd0c45        	call	L3_CheckITStatus
5301  0b5a 6b02          	ld	(OFST+0,sp),a
5304  0b5c 2059          	jra	L5422
5305  0b5e               L7722:
5306                     ; 1286       pendingbitstatus = RESET;
5308  0b5e 0f02          	clr	(OFST+0,sp)
5310  0b60 2055          	jra	L5422
5311  0b62               L5022:
5312                     ; 1290   case CAN_IT_EPV:
5312                     ; 1291     CAN->PSR = CAN_Page_Config;
5314  0b62 35065427      	mov	21543,#6
5315                     ; 1292     if ((CAN->Page.Config.EIER & CAN_EIER_EPVIE) !=RESET)
5317  0b66 c65429        	ld	a,21545
5318  0b69 a502          	bcp	a,#2
5319  0b6b 270e          	jreq	L3032
5320                     ; 1294       pendingbitstatus = CheckITStatus(CAN->Page.Config.ESR, CAN_ESR_EPVF);
5322  0b6d c65428        	ld	a,21544
5323  0b70 ae0002        	ldw	x,#2
5324  0b73 95            	ld	xh,a
5325  0b74 cd0c45        	call	L3_CheckITStatus
5327  0b77 6b02          	ld	(OFST+0,sp),a
5330  0b79 203c          	jra	L5422
5331  0b7b               L3032:
5332                     ; 1298       pendingbitstatus = RESET;
5334  0b7b 0f02          	clr	(OFST+0,sp)
5336  0b7d 2038          	jra	L5422
5337  0b7f               L7022:
5338                     ; 1301   case CAN_IT_BOF:
5338                     ; 1302     CAN->PSR = CAN_Page_Config;
5340  0b7f 35065427      	mov	21543,#6
5341                     ; 1303     if ((CAN->Page.Config.EIER & CAN_EIER_BOFIE) !=RESET)
5343  0b83 c65429        	ld	a,21545
5344  0b86 a504          	bcp	a,#4
5345  0b88 270e          	jreq	L7032
5346                     ; 1305       pendingbitstatus = CheckITStatus(CAN->Page.Config.ESR, CAN_ESR_BOFF);
5348  0b8a c65428        	ld	a,21544
5349  0b8d ae0004        	ldw	x,#4
5350  0b90 95            	ld	xh,a
5351  0b91 cd0c45        	call	L3_CheckITStatus
5353  0b94 6b02          	ld	(OFST+0,sp),a
5356  0b96 201f          	jra	L5422
5357  0b98               L7032:
5358                     ; 1309       pendingbitstatus = RESET;
5360  0b98 0f02          	clr	(OFST+0,sp)
5362  0b9a 201b          	jra	L5422
5363  0b9c               L1122:
5364                     ; 1312   case CAN_IT_LEC:
5364                     ; 1313     CAN->PSR = CAN_Page_Config;
5366  0b9c 35065427      	mov	21543,#6
5367                     ; 1314     if ((CAN->Page.Config.EIER & CAN_EIER_LECIE) !=RESET)
5369  0ba0 c65429        	ld	a,21545
5370  0ba3 a510          	bcp	a,#16
5371  0ba5 270e          	jreq	L3132
5372                     ; 1316       pendingbitstatus = CheckITStatus(CAN->Page.Config.ESR, CAN_ESR_LEC);
5374  0ba7 c65428        	ld	a,21544
5375  0baa ae0070        	ldw	x,#112
5376  0bad 95            	ld	xh,a
5377  0bae cd0c45        	call	L3_CheckITStatus
5379  0bb1 6b02          	ld	(OFST+0,sp),a
5382  0bb3 2002          	jra	L5422
5383  0bb5               L3132:
5384                     ; 1320       pendingbitstatus = RESET;
5386  0bb5 0f02          	clr	(OFST+0,sp)
5388  0bb7               L5422:
5389                     ; 1328   CAN_SelectPage(can_page);
5391  0bb7 7b01          	ld	a,(OFST-1,sp)
5392  0bb9 cd0c41        	call	_CAN_SelectPage
5394                     ; 1330   return  (ITStatus)pendingbitstatus;
5396  0bbc 7b02          	ld	a,(OFST+0,sp)
5399  0bbe 5b04          	addw	sp,#4
5400  0bc0 81            	ret
5448                     ; 1348 void CAN_ClearITPendingBit(CAN_IT_TypeDef CAN_IT)
5448                     ; 1349 {
5449                     	switch	.text
5450  0bc1               _CAN_ClearITPendingBit:
5452  0bc1 89            	pushw	x
5453  0bc2 88            	push	a
5454       00000001      OFST:	set	1
5457                     ; 1350   CAN_Page_TypeDef can_page = CAN_GetSelectedPage();
5459  0bc3 ad78          	call	_CAN_GetSelectedPage
5461  0bc5 6b01          	ld	(OFST+0,sp),a
5463                     ; 1352   assert_param(IS_CAN_IT_PENDING_BIT_OK(CAN_IT));
5465                     ; 1354   switch (CAN_IT)
5467  0bc7 1e02          	ldw	x,(OFST+1,sp)
5469                     ; 1395   default :
5469                     ; 1396     break;
5470  0bc9 5a            	decw	x
5471  0bca 272a          	jreq	L7132
5472  0bcc 1d0003        	subw	x,#3
5473  0bcf 272b          	jreq	L1232
5474  0bd1 1d0004        	subw	x,#4
5475  0bd4 272c          	jreq	L3232
5476  0bd6 1d0078        	subw	x,#120
5477  0bd9 272d          	jreq	L5232
5478  0bdb 1d0080        	subw	x,#128
5479  0bde 273c          	jreq	L1332
5480  0be0 1d0100        	subw	x,#256
5481  0be3 273d          	jreq	L3332
5482  0be5 1d0200        	subw	x,#512
5483  0be8 273e          	jreq	L5332
5484  0bea 1d0400        	subw	x,#1024
5485  0bed 273f          	jreq	L7332
5486  0bef 1d3800        	subw	x,#14336
5487  0bf2 271a          	jreq	L7232
5488  0bf4 2040          	jra	L7632
5489  0bf6               L7132:
5490                     ; 1356   case CAN_IT_TME:
5490                     ; 1357     CAN->TSR = CAN_TSR_RQCP012;/* rc_w1*/
5492  0bf6 35075422      	mov	21538,#7
5493                     ; 1358     break;
5495  0bfa 203a          	jra	L7632
5496  0bfc               L1232:
5497                     ; 1360   case CAN_IT_FF:
5497                     ; 1361     CAN->RFR = CAN_RFR_FULL; /* rc_w1*/
5499  0bfc 35085424      	mov	21540,#8
5500                     ; 1362     break;
5502  0c00 2034          	jra	L7632
5503  0c02               L3232:
5504                     ; 1364   case CAN_IT_FOV:
5504                     ; 1365     CAN->RFR = CAN_RFR_FOVR; /* rc_w1*/
5506  0c02 35105424      	mov	21540,#16
5507                     ; 1366     break;
5509  0c06 202e          	jra	L7632
5510  0c08               L5232:
5511                     ; 1368   case CAN_IT_WKU:
5511                     ; 1369     CAN->MSR = CAN_MSR_WKUI;  /* rc_w1*/
5513  0c08 35085421      	mov	21537,#8
5514                     ; 1370     break;
5516  0c0c 2028          	jra	L7632
5517  0c0e               L7232:
5518                     ; 1372   case CAN_IT_ERR:
5518                     ; 1373     CAN->PSR = CAN_Page_Config;
5520  0c0e 35065427      	mov	21543,#6
5521                     ; 1374     CAN->Page.Config.ESR = (uint8_t)CAN_ESR_RESET_VALUE;
5523  0c12 725f5428      	clr	21544
5524                     ; 1375     CAN->MSR = CAN_MSR_ERRI;
5526  0c16 35045421      	mov	21537,#4
5527                     ; 1376     break;
5529  0c1a 201a          	jra	L7632
5530  0c1c               L1332:
5531                     ; 1378   case CAN_IT_EWG:
5531                     ; 1379     CAN->MSR = CAN_MSR_ERRI;
5533  0c1c 35045421      	mov	21537,#4
5534                     ; 1380     break;
5536  0c20 2014          	jra	L7632
5537  0c22               L3332:
5538                     ; 1382   case CAN_IT_EPV:
5538                     ; 1383     CAN->MSR = CAN_MSR_ERRI;
5540  0c22 35045421      	mov	21537,#4
5541                     ; 1384     break;
5543  0c26 200e          	jra	L7632
5544  0c28               L5332:
5545                     ; 1386   case CAN_IT_BOF:
5545                     ; 1387     CAN->MSR = CAN_MSR_ERRI;
5547  0c28 35045421      	mov	21537,#4
5548                     ; 1388     break;
5550  0c2c 2008          	jra	L7632
5551  0c2e               L7332:
5552                     ; 1390   case CAN_IT_LEC:
5552                     ; 1391     CAN->PSR = CAN_Page_Config;
5554  0c2e 35065427      	mov	21543,#6
5555                     ; 1392     CAN->Page.Config.ESR = (uint8_t)CAN_ESR_RESET_VALUE;
5557  0c32 725f5428      	clr	21544
5558                     ; 1393     break;
5560  0c36               L1432:
5561                     ; 1395   default :
5561                     ; 1396     break;
5563  0c36               L7632:
5564                     ; 1399   CAN_SelectPage(can_page);
5566  0c36 7b01          	ld	a,(OFST+0,sp)
5567  0c38 ad07          	call	_CAN_SelectPage
5569                     ; 1400 }
5572  0c3a 5b03          	addw	sp,#3
5573  0c3c 81            	ret
5598                     ; 1407 CAN_Page_TypeDef CAN_GetSelectedPage(void)
5598                     ; 1408 {
5599                     	switch	.text
5600  0c3d               _CAN_GetSelectedPage:
5604                     ; 1409   return (CAN_Page_TypeDef)(CAN->PSR);
5606  0c3d c65427        	ld	a,21543
5609  0c40 81            	ret
5644                     ; 1417 void CAN_SelectPage(CAN_Page_TypeDef CAN_Page)
5644                     ; 1418 {
5645                     	switch	.text
5646  0c41               _CAN_SelectPage:
5650                     ; 1419   CAN->PSR = (uint8_t)CAN_Page;
5652  0c41 c75427        	ld	21543,a
5653                     ; 1420 }
5656  0c44 81            	ret
5710                     ; 1428 static ITStatus CheckITStatus(uint8_t CAN_Reg, uint8_t It_Bit)
5710                     ; 1429 {
5711                     	switch	.text
5712  0c45               L3_CheckITStatus:
5714  0c45 89            	pushw	x
5715  0c46 88            	push	a
5716       00000001      OFST:	set	1
5719                     ; 1430   ITStatus pendingbitstatus = RESET;
5721                     ; 1431   if ((CAN_Reg & It_Bit) != (uint8_t)RESET)
5723  0c47 9f            	ld	a,xl
5724  0c48 1402          	and	a,(OFST+1,sp)
5725  0c4a 2706          	jreq	L5442
5726                     ; 1434     pendingbitstatus = SET;
5728  0c4c a601          	ld	a,#1
5729  0c4e 6b01          	ld	(OFST+0,sp),a
5732  0c50 2002          	jra	L7442
5733  0c52               L5442:
5734                     ; 1439     pendingbitstatus = RESET;
5736  0c52 0f01          	clr	(OFST+0,sp)
5738  0c54               L7442:
5739                     ; 1441   return (ITStatus)pendingbitstatus;
5741  0c54 7b01          	ld	a,(OFST+0,sp)
5744  0c56 5b03          	addw	sp,#3
5745  0c58 81            	ret
5815                     	xdef	__FMI
5816                     	xdef	__Data
5817                     	xdef	__DLC
5818                     	xdef	__RTR
5819                     	xdef	__IDE
5820                     	xdef	__Id
5821                     	xdef	_CAN_ClearITPendingBit
5822                     	xdef	_CAN_GetITStatus
5823                     	xdef	_CAN_ClearFlag
5824                     	xdef	_CAN_GetFlagStatus
5825                     	xdef	_CAN_SelectPage
5826                     	xdef	_CAN_GetSelectedPage
5827                     	xdef	_CAN_GetLastErrorCode
5828                     	xdef	_CAN_OperatingModeRequest
5829                     	xdef	_CAN_WakeUp
5830                     	xdef	_CAN_Sleep
5831                     	xdef	_CAN_GetMessageTimeStamp
5832                     	xdef	_CAN_GetReceivedFMI
5833                     	xdef	_CAN_GetReceivedData
5834                     	xdef	_CAN_GetReceivedDLC
5835                     	xdef	_CAN_GetReceivedRTR
5836                     	xdef	_CAN_GetReceivedIDE
5837                     	xdef	_CAN_GetReceivedId
5838                     	xdef	_CAN_Receive
5839                     	xdef	_CAN_MessagePending
5840                     	xdef	_CAN_FIFORelease
5841                     	xdef	_CAN_CancelTransmit
5842                     	xdef	_CAN_TransmitStatus
5843                     	xdef	_CAN_TTComModeCmd
5844                     	xdef	_CAN_Transmit
5845                     	xdef	_CAN_ST7CompatibilityCmd
5846                     	xdef	_CAN_ITConfig
5847                     	xdef	_CAN_FilterInit
5848                     	xdef	_CAN_Init
5849                     	xdef	_CAN_DeInit
5850                     	xref.b	c_lreg
5851                     	xref.b	c_x
5852                     	xref.b	c_y
5871                     	xref	c_uitol
5872                     	xref	c_uitolx
5873                     	xref	c_llsh
5874                     	xref	c_umul
5875                     	xref	c_lor
5876                     	xref	c_rtol
5877                     	xref	c_lursh
5878                     	xref	c_ltor
5879                     	xref	c_lgursh
5880                     	end
