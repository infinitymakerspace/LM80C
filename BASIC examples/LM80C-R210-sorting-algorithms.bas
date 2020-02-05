1000 REM *************************************************
1020 REM *   SORT-TEST - ADAPTED BY LEONARDO MILIANI     *
1040 REM * FOR LM80C FROM THE ORIGINAL SOURCE BY ERNESTO *
1050 REM * SIDOTTI & RINALDO NALDI PUBLISHED ON ISSUE #9 *
1060 REM * OF <COMMODORE> ITALIAN MAGAZINE (05/1985)     *
1070 REM *************************************************
1100 :
1110 REM ** PRINT MAIN TITLE **
1120 SCREEN0:RESTORE4000
1130 FOR I=0TO2:LOCATE8,I:FOR L=1TO24
1140 READA:PRINTCHR$(A);:NEXT:NEXT
1160 PRINT:PRINT
1170 PRINT"# OF DATA "
1190 PRINT"% OF ORDER"
1200 PRINT:PRINT
1210 REM ** PRINT MAIN FORM **
1220 FORI=1TO4:FORL=1TO40:READA:PRINTCHR$(A);:NEXT:NEXT
1230 FORI=1TO5:RESTORE4130:FORL=1TO80:READA
1240 PRINTCHR$(A);:NEXT:NEXT
1250 REM RESTORE4170:FORL=1TO40:READA:PRINTCHR$(A);:NEXT
1260 RESTORE4210:FORL=1TO40:READA:PRINTCHR$(A);:NEXT
1300 REM
1310 LOCATE1,11:PRINT"QUICK";
1320 LOCATE1,13:PRINT"SHELL";
1330 LOCATE1,15:PRINT"SHAKE";
1340 LOCATE1,17:PRINT"BUBBLE";
1350 LOCATE1,19:PRINT"INSERT.";
1360 LOCATE1,21:PRINT"SELECT.";
1410 LOCATE11,4:PRINTSPC(20);
1420 LOCATE11,4:INPUT NDATI$
1430 NDATI=VAL(NDATI$):IFNDATI>99999ORNDATI<10THEN1410
1440 LOCATE11,5:INPUTD$
1450 PA=VAL(D$)
1460 IFPA<0ORPA>100THENLOCATE11,5:PRINTSPC(20);:GOTO1440
1480 A$="GENERATING DATA...":GOSUB3200
1490 DIM MAX(NDATI+1):DIM BX(NDATI)
1500 REM **********************
1510 REM * RANDOM  GENERATION *
1520 REM **********************
1540 PA=(PA/100)*NDATI
1550 FOR Q=1 TO NDATI
1560 IF (RND(1)*NDATI<PA) THEN BX(Q)=Q:GOTO 1580
1570 BX(Q)=INT(NDATI*RND(1))
1580 NEXT
1581 REM ****************
1582 REM * SHOW RESULTS *
1583 REM ****************
1585 Y=11:A$=CHR$(199)+"SORTING WITH QUICK SORT...":GOSUB3200
1590 GOSUB 1670:GOSUB3300:TEMPO=TI:GOSUB 2630:GOSUB 3090:GOSUB 3000
1595 Y=Y+2:A$=CHR$(199)+"SORTING WITH SHELL SORT...":GOSUB3200
1600 GOSUB 1670:GOSUB3300:TEMPO=TI:GOSUB 2410:GOSUB 3090:GOSUB 3000
1605 Y=Y+2:A$=CHR$(199)+"SORTING WITH SHAKE SORT...":GOSUB3200
1610 GOSUB 1670:GOSUB3300:TEMPO=TI:GOSUB 1890:GOSUB 3090:GOSUB 3000
1615 Y=Y+2:A$=CHR$(199)+"SORTING WITH BUBBLE SORT...":GOSUB3200
1620 GOSUB 1670:GOSUB3300:TEMPO=TI:GOSUB 1720:GOSUB 3090:GOSUB 3000
1625 Y=Y+2:A$=CHR$(199)+"SORTING WITH INSERTION SORT...":GOSUB3200
1630 GOSUB 1670:GOSUB3300:TEMPO=TI:GOSUB 2140:GOSUB 3090:GOSUB 3000
1635 Y=Y+2:A$=CHR$(199)+"SORTING WITH SELECTION SORT...":GOSUB3200
1640 GOSUB 1670:GOSUB3300:TEMPO=TI:GOSUB 2280:GOSUB 3090:GOSUB 3000
1650 A$="FINISHED. <R> REPEAT - <E> EXIT":GOSUB3200:A=INKEY(0)
1652 A=INKEY(10):IFA=0THEN1652
1654 IFA=ASC("R")ORA=ASC("r")THENRUN
1656 IFA<>ASC("E")ANDA<>ASC("e")THEN1652
1658 LOCATE0,21:END
1660 REM *******************
1662 REM *   COPY VECTOR   *
1664 REM *******************
1670 FOR LO=1 TO NDATI:MAX(LO)=BX(LO):NEXT
1675 FOR LO=1TO4:CK(LO)=0:NEXT
1680 RETURN
1690 FORT=1 TO NDATI:PRINTMAX(T):NEXT:RETURN
1700 :
1710 REM ***************
1712 REM * BUBBLE-SORT *
1714 REM ***************
1720 FOR A=1 TO NDATI
1730 FOR B=1 TO NDATI-A
1740 FLAG=0
1750 CK(1)=CK(1)+1
1760 IF MAX(B+1)>=MAX(B) THEN 1820
1770 CK(2)=CK(2)+1
1780 X=MAX(B)
1790 MAX(B)=MAX(B+1)
1800 MAX(B+1)=X
1810 FLAG=1
1820 NEXT B
1830 IF FLAG=0 THEN 1840
1840 NEXT A
1850 RETURN
1860 :
1870 :
1880 REM *************
1883 REM * SHAKESORT *
1884 REM *************
1890 L=2:R=NDATI:K=NDATI
1900 FOR J=R TO L STEP -1
1910 CK(1)=CK(1)+1
1920 IF MAX(J-1)<MAX(J) THEN 1980
1930 CK(2)=CK(2)+1
1940 X=MAX(J-1)
1950 MAX(J-1)=MAX(J)
1960 MAX(J)=X
1970 K=J
1980 NEXT J
1990 L=K+1
2000 FOR J=L TO R
2010 CK(1)=CK(1)+1
2020 IF MAX(J-1)<MAX(J) THEN 2080
2030 CK(2)=CK(2)+1
2040 X=MAX(J-1)
2050 MAX(J-1)=MAX(J)
2060 MAX(J)=X
2070 K=J
2080 NEXT J
2090 R=K-1
2100 IF L<=R THEN 1900
2120 RETURN
2130 REM **********************
2132 REM * STRAIGHT INSERTION *
2134 REM **********************
2140 FOR I=2 TO NDATI
2150 X=MAX(I)
2160 MAX(0)=X
2170 J=I-1
2180 CK(1)=CK(1)+1
2190 IF X>=MAX(J) THEN 2240
2200 CK(2)=CK(2)+1
2210 MAX(J+1)=MAX(J)
2220 J=J-1
2230 GOTO 2190
2240 MAX(J+1)=X
2250 NEXT I
2260 RETURN
2270 REM **********************
2272 REM * STRAIGHT SELECTION *
2274 REM **********************
2280 FOR I=1 TO NDATI-1
2290 K=I:X=MAX(I)
2300 FOR J=I+1 TO NDATI
2310 CK(1)=CK(1)+1
2320 IF MAX(J)<X THEN K=J:X=MAX(J)
2350 NEXT J
2360 MAX(K)=MAX(I):MAX(I)=X
2370 CK(2)=CK(2)+1
2380 NEXT I
2390 RETURN
2400 REM *************
2402 REM * SHELLSORT *
2404 REM *************
2410 LB=1:UB=NDATI:INC=UB-LB
2420 INC=INT(INC/2.2)
2430 IF INC<1THENINC=1
2440 FLAG=0
2450 FORI=LB TO UB-INC
2460 CK(1)=CK(1)+1
2470 IF MAX(I)<=MAX(I+INC)THEN2500
2480 X=MAX(I):MAX(I)=MAX(I+INC):MAX(I+INC)=X:FLAG=1
2490 CK(2)=CK(2)+1
2500 NEXT
2510 IF FLAG<>0THEN2440
2520 IF INC<>1THEN2420
2530 RETURN
2620 REM **************
2622 REM * QUICK SORT *
2624 REM **************
2630 PNT=1
2640 STACK(PNT,1)=1
2650 STACK(PNT,2)=NDATI
2660 IF PNT<=0 THEN 2720
2670 A1=STACK(PNT,1)
2680 B1=STACK(PNT,2)
2690 PNT=PNT-1
2700 GOSUB 2750
2710 GOTO 2660
2720 CK(1)=C1
2730 CK(2)=C2
2740 RETURN
2750 T=0
2760 IF B1<=A1 THEN 2990
2770 A=A1
2780 B=B1
2790 S=-1
2800 IF A>=B THEN 2930
2810 C1=C1+1
2820 IF MAX(A)<=MAX(B) THEN 2880
2830 C2=C2+1
2840 T=MAX(A)
2850 MAX(A)=MAX(B)
2860 MAX(B)=T
2870 S=-S
2880 IF S<0 THEN 2910
2890 B=B-1
2900 GOTO 2920
2910 A=A+1
2920 GOTO 2800
2930 IF A+1>=B1 THEN 2970
2940 PNT=PNT+1
2950 STACK(PNT,1)=A+1
2960 STACK(PNT,2)=B1
2970 B1=A-1
2980 GOTO 2760
2990 RETURN
2997 REM ******************
2998 REM * PRINT  RESULTS *
2999 REM ******************
3000 GOSUB 3400:RESTORE3070:FOR DM=1 TO 4:READCC
3010 DT$=STR$(CK(DM)):DT$=MID$(DT$,2,LEN(DT$)-1)
3020 LOCATECC,Y:IFDM<4THENPRINTDT$;:GOTO3040
3030 PRINTCHR$(CK(DM));
3040 NEXT
3050 RESTORE
3060 RETURN
3070 DATA 11,20,30,38
3087 REM ****************
3088 REM * COMPUTE TIME *
3089 REM ****************
3090 GOSUB 3300:XN=(TI-TEMPO)/100
3100 VV$=STR$(XN)
3110 CK(3)=VAL(LEFT$(VV$,7))
3120 RETURN
3197 REM ************************
3198 REM * PRINT STATUS MESSAGE *
3199 REM ************************
3200 LOCATE0,7:PRINTSPC(40);
3210 LOCATE0,7:PRINTA$;
3220 RETURN
3297 REM ****************
3298 REM * TIME ROUTINE *
3299 REM ****************
3300 TL=TMR(0):IFTL<0THENTL=65536+TL
3310 TH=TMR(1):IFTH<0THENTH=65536+TH
3320 TI=(TH*65536)+TL
3330 RETURN
3397 REM **************
3398 REM * CHECK SORT *
3399 REM **************
3400 FLAG=1
3410 FORI=1TONDATI-1
3420 IFMAX(I)>MAX(I+1)THENFLAG=0
3430 NEXT
3440 CK(4)=228:IFFLAG=0THENCK(4)=229
3450 RETURN
3995 REM  ** MAIN TITLE **
4000 DATA 217,143,143,143,143,143,143,143,143,143,143,143
4010 DATA 143,143,143,143,143,143,143,143,143,143,143,218
4020 DATA 144,32,32,32,83,32,79,32,82,32,84,32,45,32,84,32
4030 DATA 69,32,83,32,84,32,32,144
4040 DATA 220,143,143,143,143,143,143,143,143,143,143,143
4050 DATA 143,143,143,143,143,143,143,143,143,143,143,219
4055 REM  ** HEADER OF THE FORM **
4060 DATA 149,157,157,157,157,157,157,157,157,155,157,157
4070 DATA 157,157,157,157,157,157,155,157,157,157,157,157
4080 DATA 157,157,157,157,155,157,157,157,157,157,157,157
4090 DATA 157,155,157,150
4100 DATA 158,32,32,83,79,82,84,32,32,158,32,67,79,77,80
4110 DATA 83,46,32,158,32,32,83,87,65,80,83,32,32,158,32
4120 DATA 84,46,32,40,83,41,32,158,86,158
4125 REM  ** BODY OF THE FORM **
4130 DATA 154,157,157,157,157,157,157,157,157,148,157,157
4140 DATA 157,157,157,157,157,157,148,157,157,157,157,157
4150 DATA 157,157,157,157,148,157,157,157,157,157,157,157
4160 DATA 157,148,157,156
4170 DATA 158,32,32,32,32,32,32,32,32,158,32,32
4180 DATA 32,32,32,32,32,32,158,32,32,32,32,32
4190 DATA 32,32,32,32,158,32,32,32,32,32,32,32
4200 DATA 32,158,32,158
4205 REM  ** FOOTER OF THE FORM **
4210 DATA 152,157,157,157,157,157,157,157,157,153,157,157
4220 DATA 157,157,157,157,157,157,153,157,157,157,157,157
4230 DATA 157,157,157,157,153,157,157,157,157,157,157,157
4240 DATA 157,153,157,151
