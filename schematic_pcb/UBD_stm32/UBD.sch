EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 8268 11693 portrait
encoding utf-8
Sheet 1 1
Title "Принципиальная схема УБД"
Date "15.04.2019"
Rev "4.7"
Comp "КС"
Comment1 ""
Comment2 "Власов Д.Г."
Comment3 "Власов Д.Г."
Comment4 "Власов Д.Г."
$EndDescr
$Comp
L UBD-rescue:ESP-12F-RF_Module U3
U 1 1 5CB187AB
P 1700 8150
F 0 "U3" H 2150 8950 50  0000 C CNN
F 1 "ESP-12F" H 2000 7600 50  0000 C CNN
F 2 "UBD:ESP-12E" H 1700 8150 50  0001 C CNN
F 3 "http://wiki.ai-thinker.com/_media/esp8266/esp8266_series_modules_user_manual_v1.1.pdf" H 1350 8250 50  0001 C CNN
F 4 "ESP-12F" H -5000 700 50  0001 C CNN "Артикул"
F 5 "https://ru.aliexpress.com/item/1PCS-ESP-12F-ESP-12E-upgrade-ESP8266-Remote-Serial-Port-WIFI-Wireless-Module-ESP8266-4M-Flash/32808593889.html?spm=a2g0v.search0604.3.54.756a7bd4h24yBq&ws_ab_test=searchweb0_0,searchweb201602_10_10065_10068_319_317_10696_453_10084_454_10083_10618_10307_10301_537_536_10059_10884_10889_10887_321_322_10915_10103_10914_10911_10910,searchweb201603_52,ppcSwitch_0&algo_expid=fb9e239b-b278-458b-882f-3e2b43ccfff1-8&algo_pvid=fb9e239b-b278-458b-882f-3e2b43ccfff1" H -5000 700 50  0001 C CNN "Ссылка"
F 6 "93" H -5000 700 50  0001 C CNN "Цена"
	1    1700 8150
	-1   0    0    -1  
$EndComp
$Comp
L UBD-rescue:LM2576HVS-12-Regulator_Switching U2
U 1 1 5CB1ADAC
P 2600 800
F 0 "U2" H 2600 1167 50  0000 C CNN
F 1 "LM2576HVS-12" H 2600 1076 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:TO-263-5_TabPin3" H 2600 550 50  0001 L CIN
F 3 "http://www.ti.com/lit/ds/symlink/lm2576.pdf" H 2600 800 50  0001 C CNN
F 4 "LM2576HVT-12/NOPB" H 250 0   50  0001 C CNN "Артикул"
F 5 "https://www.chipdip.ru/product/lm2576hvt-12-nopb" H 250 0   50  0001 C CNN "Ссылка"
F 6 "330" H 250 0   50  0001 C CNN "Цена"
	1    2600 800 
	1    0    0    -1  
$EndComp
$Comp
L UBD-rescue:BC817-Transistor_BJT Q1
U 1 1 5CB20DD2
P 1900 6250
F 0 "Q1" H 2091 6296 50  0000 L CNN
F 1 "BC817" H 2091 6205 50  0000 L CNN
F 2 "UBD:SOT-23" H 2100 6175 50  0001 L CIN
F 3 "http://www.fairchildsemi.com/ds/BC/BC817.pdf" H 1900 6250 50  0001 L CNN
F 4 "BC817.215" H -4950 3900 50  0001 C CNN "Артикул"
F 5 "https://www.chipdip.ru/product/bc817.215" H -4950 3900 50  0001 C CNN "Ссылка"
F 6 "3" H -4950 3900 50  0001 C CNN "Цена"
	1    1900 6250
	1    0    0    -1  
$EndComp
$Comp
L UBD-rescue:R-Device R2
U 1 1 5CB38DAB
P 7100 1500
F 0 "R2" H 7170 1546 50  0000 L CNN
F 1 "10k" H 7150 1450 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 7030 1500 50  0001 C CNN
F 3 "~" H 7100 1500 50  0001 C CNN
F 4 "0.063Вт 0603 10 кОм, 1%" H 2350 700 50  0001 C CNN "Артикул"
F 5 "https://www.chipdip.ru/product0/9000079736" H 2350 700 50  0001 C CNN "Ссылка"
F 6 "0,9" H 2350 700 50  0001 C CNN "Цена"
	1    7100 1500
	1    0    0    -1  
$EndComp
Text Label 4850 850  2    50   ~ 0
Rst
$Comp
L UBD-rescue:+3.3V-power #PWR0101
U 1 1 5CB48E43
P 7100 1300
F 0 "#PWR0101" H 7100 1150 50  0001 C CNN
F 1 "+3.3V" H 7115 1473 50  0000 C CNN
F 2 "" H 7100 1300 50  0001 C CNN
F 3 "" H 7100 1300 50  0001 C CNN
	1    7100 1300
	1    0    0    -1  
$EndComp
Wire Wire Line
	7100 1300 7100 1350
$Comp
L UBD-rescue:+3.3V-power #PWR0102
U 1 1 5CB4C153
P 5800 450
F 0 "#PWR0102" H 5800 300 50  0001 C CNN
F 1 "+3.3V" H 5815 623 50  0000 C CNN
F 2 "" H 5800 450 50  0001 C CNN
F 3 "" H 5800 450 50  0001 C CNN
	1    5800 450 
	1    0    0    -1  
$EndComp
$Comp
L UBD-rescue:GND-power #PWR0105
U 1 1 5CB9CDCC
P 2125 4750
F 0 "#PWR0105" H 2125 4500 50  0001 C CNN
F 1 "GND" H 2130 4577 50  0000 C CNN
F 2 "" H 2125 4750 50  0001 C CNN
F 3 "" H 2125 4750 50  0001 C CNN
	1    2125 4750
	1    0    0    -1  
$EndComp
$Comp
L UBD-rescue:GND-power #PWR0108
U 1 1 5CC00E5B
P 2600 1300
F 0 "#PWR0108" H 2600 1050 50  0001 C CNN
F 1 "GND" H 2605 1127 50  0000 C CNN
F 2 "" H 2600 1300 50  0001 C CNN
F 3 "" H 2600 1300 50  0001 C CNN
	1    2600 1300
	1    0    0    -1  
$EndComp
Wire Wire Line
	2600 1100 2600 1300
$Comp
L UBD-rescue:GND-power #PWR0109
U 1 1 5CC098A6
P 2050 1300
F 0 "#PWR0109" H 2050 1050 50  0001 C CNN
F 1 "GND" H 2055 1127 50  0000 C CNN
F 2 "" H 2050 1300 50  0001 C CNN
F 3 "" H 2050 1300 50  0001 C CNN
	1    2050 1300
	1    0    0    -1  
$EndComp
Wire Wire Line
	2100 900  2050 900 
Wire Wire Line
	2050 900  2050 1300
$Comp
L UBD-rescue:GND-power #PWR0110
U 1 1 5CC10938
P 3150 1300
F 0 "#PWR0110" H 3150 1050 50  0001 C CNN
F 1 "GND" H 3155 1127 50  0000 C CNN
F 2 "" H 3150 1300 50  0001 C CNN
F 3 "" H 3150 1300 50  0001 C CNN
	1    3150 1300
	1    0    0    -1  
$EndComp
Wire Wire Line
	3150 1250 3150 1300
Wire Wire Line
	3100 900  3150 900 
Wire Wire Line
	3150 900  3150 950 
$Comp
L UBD-rescue:CP-Device C1
U 1 1 5CC1950F
P 1800 1000
F 0 "C1" H 1650 900 50  0000 L CNN
F 1 "100uF" H 1550 800 50  0000 L CNN
F 2 "Capacitor_THT:C_Radial_D12.5mm_H20.0mm_P5.00mm" H 1838 850 50  0001 C CNN
F 3 "~" H 1800 1000 50  0001 C CNN
F 4 "1" H 250 0   50  0001 C CNN "Номер"
F 5 "9000291267" H 250 0   50  0001 C CNN "Артикул"
F 6 "https://www.chipdip.ru/product0/9000291267" H 250 0   50  0001 C CNN "Ссылка"
F 7 "28" H 250 0   50  0001 C CNN "Цена"
	1    1800 1000
	1    0    0    -1  
$EndComp
Wire Wire Line
	2100 700  1800 700 
Wire Wire Line
	1800 700  1800 850 
$Comp
L UBD-rescue:GND-power #PWR0111
U 1 1 5CC1C476
P 1800 1300
F 0 "#PWR0111" H 1800 1050 50  0001 C CNN
F 1 "GND" H 1805 1127 50  0000 C CNN
F 2 "" H 1800 1300 50  0001 C CNN
F 3 "" H 1800 1300 50  0001 C CNN
	1    1800 1300
	1    0    0    -1  
$EndComp
Wire Wire Line
	1800 1150 1800 1300
Wire Wire Line
	3200 900  3150 900 
Connection ~ 3150 900 
$Comp
L UBD-rescue:CP-Device C3
U 1 1 5CC2AAF7
P 3550 1100
F 0 "C3" H 3668 1146 50  0000 L CNN
F 1 "220uF" H 3668 1055 50  0000 L CNN
F 2 "Capacitor_SMD:CP_Elec_8x10.5" H 3588 950 50  0001 C CNN
F 3 "~" H 3550 1100 50  0001 C CNN
F 4 "2" H 250 0   50  0001 C CNN "Номер"
F 5 "ECAP SMD, 220 мкФ, 25В" H 250 0   50  0001 C CNN "Артикул"
F 6 "https://www.chipdip.ru/product0/57194" H 250 0   50  0001 C CNN "Ссылка"
F 7 "24" H 250 0   50  0001 C CNN "Цена"
	1    3550 1100
	1    0    0    -1  
$EndComp
Wire Wire Line
	3500 900  3550 900 
Wire Wire Line
	3550 900  3550 950 
$Comp
L UBD-rescue:GND-power #PWR0112
U 1 1 5CC2C12E
P 3550 1300
F 0 "#PWR0112" H 3550 1050 50  0001 C CNN
F 1 "GND" H 3555 1127 50  0000 C CNN
F 2 "" H 3550 1300 50  0001 C CNN
F 3 "" H 3550 1300 50  0001 C CNN
	1    3550 1300
	1    0    0    -1  
$EndComp
Wire Wire Line
	3550 1250 3550 1300
Wire Wire Line
	3100 700  3550 700 
Wire Wire Line
	3550 700  3550 900 
Connection ~ 3550 900 
$Comp
L UBD-rescue:+12V-power #PWR0113
U 1 1 5CC77906
P 3550 700
F 0 "#PWR0113" H 3550 550 50  0001 C CNN
F 1 "+12V" H 3565 873 50  0000 C CNN
F 2 "" H 3550 700 50  0001 C CNN
F 3 "" H 3550 700 50  0001 C CNN
	1    3550 700 
	1    0    0    -1  
$EndComp
$Comp
L UBD-rescue:L-Device L2
U 1 1 5CC22F51
P 3350 900
F 0 "L2" V 3300 900 50  0000 C CNN
F 1 "1500uH" V 3449 900 50  0000 C CNN
F 2 "UBD:SDR_1006" H 3350 900 50  0001 C CNN
F 3 "~" H 3350 900 50  0001 C CNN
F 4 "SDR1006-152KL" H 250 0   50  0001 C CNN "Артикул"
F 5 "https://www.chipdip.ru/product/sdr1006-152kl-1500" H 250 0   50  0001 C CNN "Ссылка"
F 6 "45" H 250 0   50  0001 C CNN "Цена"
	1    3350 900 
	0    -1   -1   0   
$EndComp
$Comp
L UBD-rescue:GND-power #PWR0122
U 1 1 5CD66DBF
P 1700 8900
F 0 "#PWR0122" H 1700 8650 50  0001 C CNN
F 1 "GND" H 1700 8725 50  0000 C CNN
F 2 "" H 1700 8900 50  0001 C CNN
F 3 "" H 1700 8900 50  0001 C CNN
	1    1700 8900
	-1   0    0    -1  
$EndComp
$Comp
L UBD-rescue:+3.3V-power #PWR0123
U 1 1 5CD6B7F4
P 1700 7100
F 0 "#PWR0123" H 1700 6950 50  0001 C CNN
F 1 "+3.3V" H 1715 7273 50  0000 C CNN
F 2 "" H 1700 7100 50  0001 C CNN
F 3 "" H 1700 7100 50  0001 C CNN
	1    1700 7100
	-1   0    0    -1  
$EndComp
Wire Wire Line
	1700 8850 1700 8900
$Comp
L UBD-rescue:GND-power #PWR0124
U 1 1 5CD72037
P 1000 8900
F 0 "#PWR0124" H 1000 8650 50  0001 C CNN
F 1 "GND" H 1000 8725 50  0000 C CNN
F 2 "" H 1000 8900 50  0001 C CNN
F 3 "" H 1000 8900 50  0001 C CNN
	1    1000 8900
	-1   0    0    -1  
$EndComp
Wire Wire Line
	1000 8450 1100 8450
$Comp
L UBD-rescue:R-Device R7
U 1 1 5CD7A08E
P 2350 7350
F 0 "R7" H 2200 7300 50  0000 C CNN
F 1 "10k" H 2200 7400 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 2280 7350 50  0001 C CNN
F 3 "~" H 2350 7350 50  0001 C CNN
F 4 "0.063Вт 0603 10 кОм, 1%" H -5000 700 50  0001 C CNN "Артикул"
F 5 "https://www.chipdip.ru/product0/9000079736" H -5000 700 50  0001 C CNN "Ссылка"
F 6 "0,9" H -5000 700 50  0001 C CNN "Цена"
	1    2350 7350
	1    0    0    1   
$EndComp
$Comp
L UBD-rescue:+3.3V-power #PWR0125
U 1 1 5CD7C4BC
P 2350 7100
F 0 "#PWR0125" H 2350 6950 50  0001 C CNN
F 1 "+3.3V" H 2365 7273 50  0000 C CNN
F 2 "" H 2350 7100 50  0001 C CNN
F 3 "" H 2350 7100 50  0001 C CNN
	1    2350 7100
	-1   0    0    -1  
$EndComp
Wire Wire Line
	2300 7550 2350 7550
Wire Wire Line
	2350 7550 2350 7500
Wire Wire Line
	2350 7200 2350 7150
$Comp
L UBD-rescue:R-Device R8
U 1 1 5CD83466
P 2500 7350
F 0 "R8" H 2650 7300 50  0000 C CNN
F 1 "10k" H 2650 7400 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 2430 7350 50  0001 C CNN
F 3 "~" H 2500 7350 50  0001 C CNN
F 4 "0.063Вт 0603 10 кОм, 1%" H -5000 700 50  0001 C CNN "Артикул"
F 5 "https://www.chipdip.ru/product0/9000079736" H -5000 700 50  0001 C CNN "Ссылка"
F 6 "0,9" H -5000 700 50  0001 C CNN "Цена"
	1    2500 7350
	1    0    0    1   
$EndComp
Wire Wire Line
	2500 7500 2500 7750
Wire Wire Line
	2500 7750 2300 7750
Wire Wire Line
	2500 7200 2500 7150
Connection ~ 2350 7150
Wire Wire Line
	2350 7150 2350 7100
Connection ~ 2350 7550
Text Label 6250 2050 0    50   ~ 0
Rst_wf
$Comp
L UBD-rescue:D_Schottky-Device D3
U 1 1 5CDE9346
P 3150 1100
F 0 "D3" V 3150 950 50  0000 L CNN
F 1 "Диод Шоттки" H 3195 1179 50  0001 L CNN
F 2 "UBD:D_SMA" H 3150 1100 50  0001 C CNN
F 3 "~" H 3150 1100 50  0001 C CNN
F 4 "SS16" H 250 0   50  0001 C CNN "Артикул"
F 5 "https://www.chipdip.ru/product/ss16" H 250 0   50  0001 C CNN "Ссылка"
F 6 "4" H 250 0   50  0001 C CNN "Цена"
	1    3150 1100
	0    1    1    0   
$EndComp
$Comp
L UBD-rescue:C-Device C6
U 1 1 5CC12311
P 6450 675
F 0 "C6" H 6565 721 50  0000 L CNN
F 1 "1uF" H 6565 630 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 6488 525 50  0001 C CNN
F 3 "~" H 6450 675 50  0001 C CNN
F 4 "3" H 3750 -3275 50  0001 C CNN "Номер"
F 5 "GRM188R61E105KAADD" H 3750 -3275 50  0001 C CNN "Артикул"
F 6 "https://www.chipdip.ru/product/grm188r61e105k" H 3750 -3275 50  0001 C CNN "Ссылка"
F 7 "5" H 3750 -3275 50  0001 C CNN "Цена"
	1    6450 675 
	1    0    0    -1  
$EndComp
$Comp
L UBD-rescue:+3.3V-power #PWR05
U 1 1 5CC12317
P 6450 475
F 0 "#PWR05" H 6450 325 50  0001 C CNN
F 1 "+3.3V" H 6465 648 50  0000 C CNN
F 2 "" H 6450 475 50  0001 C CNN
F 3 "" H 6450 475 50  0001 C CNN
	1    6450 475 
	-1   0    0    -1  
$EndComp
$Comp
L UBD-rescue:GND-power #PWR06
U 1 1 5CC1231D
P 6450 875
F 0 "#PWR06" H 6450 625 50  0001 C CNN
F 1 "GND" H 6300 825 50  0000 C CNN
F 2 "" H 6450 875 50  0001 C CNN
F 3 "" H 6450 875 50  0001 C CNN
	1    6450 875 
	-1   0    0    -1  
$EndComp
Wire Wire Line
	6450 475  6450 525 
Wire Wire Line
	6450 875  6450 825 
$Comp
L UBD-rescue:R-Device R9
U 1 1 5CC5F549
P 2800 6250
F 0 "R9" V 2900 6250 50  0000 C CNN
F 1 "360" V 2800 6250 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 2730 6250 50  0001 C CNN
F 3 "~" H 2800 6250 50  0001 C CNN
F 4 " 0.1Вт 0603 360 Ом, 1%" H -3650 3900 50  0001 C CNN "Артикул"
F 5 "https://www.chipdip.ru/product0/9000079629" H -3650 3900 50  0001 C CNN "Ссылка"
F 6 "0,9" H -3650 3900 50  0001 C CNN "Цена"
	1    2800 6250
	0    -1   -1   0   
$EndComp
$Comp
L UBD-rescue:GND-power #PWR07
U 1 1 5CC6E28A
P 2000 6500
F 0 "#PWR07" H 2000 6250 50  0001 C CNN
F 1 "GND" H 2005 6327 50  0000 C CNN
F 2 "" H 2000 6500 50  0001 C CNN
F 3 "" H 2000 6500 50  0001 C CNN
	1    2000 6500
	1    0    0    -1  
$EndComp
Wire Wire Line
	2000 6500 2000 6450
$Comp
L UBD-rescue:BC817-Transistor_BJT Q2
U 1 1 5CC91704
P 3200 6250
F 0 "Q2" H 3391 6296 50  0000 L CNN
F 1 "BC817" H 3391 6205 50  0000 L CNN
F 2 "UBD:SOT-23" H 3400 6175 50  0001 L CIN
F 3 "http://www.fairchildsemi.com/ds/BC/BC817.pdf" H 3200 6250 50  0001 L CNN
F 4 "BC817.215" H -3650 1900 50  0001 C CNN "Артикул"
F 5 "https://www.chipdip.ru/product/bc817.215" H -3650 1900 50  0001 C CNN "Ссылка"
F 6 "3" H -3650 1900 50  0001 C CNN "Цена"
	1    3200 6250
	1    0    0    -1  
$EndComp
$Comp
L UBD-rescue:GND-power #PWR08
U 1 1 5CC91711
P 3300 6500
F 0 "#PWR08" H 3300 6250 50  0001 C CNN
F 1 "GND" H 3305 6327 50  0000 C CNN
F 2 "" H 3300 6500 50  0001 C CNN
F 3 "" H 3300 6500 50  0001 C CNN
	1    3300 6500
	1    0    0    -1  
$EndComp
Wire Wire Line
	3300 6500 3300 6450
$Comp
L UBD-rescue:R_Pack04-Device R3
U 1 1 5CE72AF4
P 1900 4575
F 0 "R3" V 1483 4575 50  0000 C CNN
F 1 "330" V 1574 4575 50  0000 C CNN
F 2 "Resistor_SMD:R_Array_Convex_4x0603" V 2175 4575 50  0001 C CNN
F 3 "~" H 1900 4575 50  0001 C CNN
F 4 "CAY16-331J4 4х330 Ом" H -4450 3025 50  0001 C CNN "Артикул"
F 5 "https://www.chipdip.ru/product/cay16-331j4" H -4450 3025 50  0001 C CNN "Ссылка"
F 6 "2" H -4450 3025 50  0001 C CNN "Цена"
	1    1900 4575
	0    1    1    0   
$EndComp
Wire Wire Line
	2350 7150 2500 7150
Wire Wire Line
	2350 7550 2600 7550
Wire Wire Line
	4900 2550 4850 2550
Wire Wire Line
	4900 2650 4850 2650
Text Label 1150 5450 2    50   ~ 0
Ig_NO2
Wire Wire Line
	1150 5450 1200 5450
Text Label 1150 5550 2    50   ~ 0
Ig_NO1
Wire Wire Line
	1150 5550 1200 5550
$Comp
L UBD-rescue:+12V-power #PWR0130
U 1 1 5D0A0C71
P 1925 3700
F 0 "#PWR0130" H 1925 3550 50  0001 C CNN
F 1 "+12V" H 1940 3873 50  0000 C CNN
F 2 "" H 1925 3700 50  0001 C CNN
F 3 "" H 1925 3700 50  0001 C CNN
	1    1925 3700
	-1   0    0    1   
$EndComp
$Comp
L UBD-rescue:GND-power #PWR0131
U 1 1 5D0ACBAD
P 1725 3700
F 0 "#PWR0131" H 1725 3450 50  0001 C CNN
F 1 "GND" H 1730 3527 50  0000 C CNN
F 2 "" H 1725 3700 50  0001 C CNN
F 3 "" H 1725 3700 50  0001 C CNN
	1    1725 3700
	1    0    0    -1  
$EndComp
Text Label 4350 2850 0    50   ~ 0
Data0
Text Label 2175 3750 2    50   ~ 0
Data0
$Comp
L UBD-rescue:R-Device R4
U 1 1 5D1882E1
P 4300 2600
F 0 "R4" H 4370 2646 50  0000 L CNN
F 1 "10k" H 4370 2555 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 4230 2600 50  0001 C CNN
F 3 "~" H 4300 2600 50  0001 C CNN
F 4 "0.063Вт 0603 10 кОм, 1%" H -1900 1800 50  0001 C CNN "Артикул"
F 5 "https://www.chipdip.ru/product0/9000079736" H -1900 1800 50  0001 C CNN "Ссылка"
F 6 "0,9" H -1900 1800 50  0001 C CNN "Цена"
	1    4300 2600
	1    0    0    -1  
$EndComp
Wire Wire Line
	4300 2750 4300 2850
Wire Wire Line
	4300 2850 4350 2850
$Comp
L UBD-rescue:+3.3V-power #PWR01
U 1 1 5D193300
P 4300 2400
F 0 "#PWR01" H 4300 2250 50  0001 C CNN
F 1 "+3.3V" H 4315 2573 50  0000 C CNN
F 2 "" H 4300 2400 50  0001 C CNN
F 3 "" H 4300 2400 50  0001 C CNN
	1    4300 2400
	1    0    0    -1  
$EndComp
Wire Wire Line
	4300 2400 4300 2450
$Comp
L UBD-rescue:Conn_01x03-Connector_Generic J3
U 1 1 5CC2F7C2
P 2425 3650
F 0 "J3" H 1825 3850 50  0000 L CNN
F 1 "Считыватель" H 1975 3850 50  0000 L CNN
F 2 "Connector_JST:JST_XH_S3B-XH-A_1x03_P2.50mm_Horizontal" H 2425 3650 50  0001 C CNN
F 3 "~" H 2425 3650 50  0001 C CNN
F 4 "CWF-3R (DS1069-3 MR-A)  CHU-3 (DS1069-3 F)" H -1775 -650 50  0001 C CNN "Артикул"
F 5 "https://www.chipdip.ru/product/cwf-3r  https://www.chipdip.ru/product/chu-3" H -1775 -650 50  0001 C CNN "Ссылка"
F 6 "5+5" H -1775 -650 50  0001 C CNN "Цена"
	1    2425 3650
	1    0    0    -1  
$EndComp
Wire Wire Line
	2225 3750 2175 3750
Text Label 1050 7650 2    50   ~ 0
TX_W
Text Label 1050 7850 2    50   ~ 0
RX_W
Wire Wire Line
	1100 7650 1050 7650
Wire Wire Line
	1100 7850 1050 7850
Text Label 6250 2950 0    50   ~ 0
TXD
Wire Wire Line
	6200 2850 6250 2850
Text Label 6250 2850 0    50   ~ 0
RXD
Wire Wire Line
	6200 2950 6250 2950
Text Label 2600 7550 0    50   ~ 0
Rst_wf
Wire Wire Line
	1000 8900 1000 8450
$Comp
L UBD-rescue:R-Device R10
U 1 1 5CC9170A
P 1500 6250
F 0 "R10" V 1400 6250 50  0000 C CNN
F 1 "360" V 1500 6250 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 1430 6250 50  0001 C CNN
F 3 "~" H 1500 6250 50  0001 C CNN
F 4 " 0.1Вт 0603 360 Ом, 1%" H -5100 2100 50  0001 C CNN "Артикул"
F 5 "https://www.chipdip.ru/product0/9000079629" H -5100 2100 50  0001 C CNN "Ссылка"
F 6 "0,9" H -5100 2100 50  0001 C CNN "Цена"
	1    1500 6250
	0    1    1    0   
$EndComp
$Comp
L UBD-rescue:GND-power #PWR0121
U 1 1 5CCF61F2
P 3600 2925
F 0 "#PWR0121" H 3600 2675 50  0001 C CNN
F 1 "GND" H 3605 2752 50  0000 C CNN
F 2 "" H 3600 2925 50  0001 C CNN
F 3 "" H 3600 2925 50  0001 C CNN
	1    3600 2925
	1    0    0    -1  
$EndComp
Wire Wire Line
	3600 2400 3600 2450
$Comp
L UBD-rescue:R-Device R1
U 1 1 5CCEAF44
P 3600 2250
F 0 "R1" H 3450 2200 50  0000 C CNN
F 1 "360" H 3450 2300 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 3530 2250 50  0001 C CNN
F 3 "~" H 3600 2250 50  0001 C CNN
F 4 " 0.1Вт 0603 360 Ом, 1%" H 50  250 50  0001 C CNN "Артикул"
F 5 "https://www.chipdip.ru/product0/9000079629" H 50  250 50  0001 C CNN "Ссылка"
F 6 "0,9" H 50  250 50  0001 C CNN "Цена"
	1    3600 2250
	-1   0    0    1   
$EndComp
$Comp
L UBD-rescue:LED-Device D4
U 1 1 5CCE5D17
P 3600 2600
F 0 "D4" V 3639 2483 50  0000 R CNN
F 1 "LED" V 3548 2483 50  0000 R CNN
F 2 "LED_SMD:LED_0805_2012Metric" H 3600 2600 50  0001 C CNN
F 3 "~" H 3600 2600 50  0001 C CNN
F 4 "KP-2012EC" H 50  250 50  0001 C CNN "Артикул"
F 5 "https://www.chipdip.ru/product/kp-2012ec" H 50  250 50  0001 C CNN "Ссылка"
F 6 "9" H 50  250 50  0001 C CNN "Цена"
	1    3600 2600
	0    -1   -1   0   
$EndComp
Wire Wire Line
	2225 3550 1725 3550
Wire Wire Line
	1725 3550 1725 3700
Wire Wire Line
	2225 3650 1925 3650
Wire Wire Line
	1925 3650 1925 3700
$Comp
L UBD-rescue:GND-power #PWR017
U 1 1 5D04D6F3
P 4550 7250
F 0 "#PWR017" H 4550 7000 50  0001 C CNN
F 1 "GND" H 4555 7077 50  0000 C CNN
F 2 "" H 4550 7250 50  0001 C CNN
F 3 "" H 4550 7250 50  0001 C CNN
	1    4550 7250
	1    0    0    -1  
$EndComp
Wire Wire Line
	4550 7250 4550 5700
$Comp
L UBD-rescue:+5V-power #PWR021
U 1 1 5D185C72
P 5100 4350
F 0 "#PWR021" H 5100 4200 50  0001 C CNN
F 1 "+5V" H 4950 4450 50  0000 C CNN
F 2 "" H 5100 4350 50  0001 C CNN
F 3 "" H 5100 4350 50  0001 C CNN
	1    5100 4350
	1    0    0    -1  
$EndComp
$Comp
L UBD-rescue:Crystal-Device Y1
U 1 1 5CB22433
P 4350 1250
F 0 "Y1" H 4200 1400 50  0000 C CNN
F 1 "8.0MHz" H 4400 1400 50  0000 C CNN
F 2 "UBD:Crystal_SMD_3225-2Pin_3.2x2.5mm_HandSoldering" H 4350 1250 50  0001 C CNN
F 3 "~" H 4350 1250 50  0001 C CNN
F 4 "NX3225GD-8MHz" H 0   0   50  0001 C CNN "Артикул"
F 5 "https://www.chipdip.ru/product0/9000523940" H 0   0   50  0001 C CNN "Ссылка"
F 6 "13" H 0   0   50  0001 C CNN "Цена"
	1    4350 1250
	1    0    0    -1  
$EndComp
Text Label 1225 4750 2    50   ~ 0
Led1
Text Label 1225 4600 2    50   ~ 0
Led2
Text Label 1225 4450 2    50   ~ 0
Led3
Text Label 1225 4300 2    50   ~ 0
Led4
Wire Wire Line
	1225 4750 1275 4750
Wire Wire Line
	1225 4600 1275 4600
Wire Wire Line
	1225 4450 1275 4450
Wire Wire Line
	1225 4300 1275 4300
Wire Wire Line
	1700 4575 1650 4575
Wire Wire Line
	1650 4575 1650 4600
Wire Wire Line
	1700 4475 1650 4475
Wire Wire Line
	1650 4475 1650 4450
Wire Wire Line
	1700 4375 1700 4300
Wire Wire Line
	1700 4675 1700 4750
Wire Wire Line
	2100 4375 2125 4375
Wire Wire Line
	2125 4375 2125 4475
Wire Wire Line
	2125 4675 2100 4675
Wire Wire Line
	2100 4575 2125 4575
Connection ~ 2125 4575
Wire Wire Line
	2125 4575 2125 4675
Wire Wire Line
	2100 4475 2125 4475
Connection ~ 2125 4475
Wire Wire Line
	2125 4475 2125 4575
Wire Wire Line
	2125 4750 2125 4675
Connection ~ 2125 4675
Text Label 4850 2750 2    50   ~ 0
Led2
Wire Wire Line
	4850 2350 4900 2350
Text Label 4850 2850 2    50   ~ 0
Led3
Wire Wire Line
	6200 2150 6250 2150
Text Label 4850 1550 2    50   ~ 0
Led4
Wire Wire Line
	6200 2250 6250 2250
$Comp
L UBD-rescue:LED-Device D7
U 1 1 5CDEB0D8
P 1425 4750
F 0 "D7" H 600 4750 50  0000 C CNN
F 1 "Светодиод красный" H 450 4750 50  0000 R CNN
F 2 "UBD:LED_D3.0mm_Horizontal_O1.27mm_Z2.0mm" H 1425 4750 50  0001 C CNN
F 3 "~" H 1425 4750 50  0001 C CNN
F 4 "GNL-3014SRD" H -5325 3400 50  0001 C CNN "Артикул"
F 5 "https://www.chipdip.ru/product/gnl-3014srd" H -5325 3400 50  0001 C CNN "Ссылка"
F 6 "4" H -5325 3400 50  0001 C CNN "Цена"
	1    1425 4750
	-1   0    0    1   
$EndComp
$Comp
L UBD-rescue:LED-Device D8
U 1 1 5CDFC4A1
P 1425 4600
F 0 "D8" H 600 4600 50  0000 C CNN
F 1 "Светодиод жёлтый" H 450 4600 50  0000 R CNN
F 2 "UBD:LED_D3.0mm_Horizontal_O1.27mm_Z2.0mm" H 1425 4600 50  0001 C CNN
F 3 "~" H 1425 4600 50  0001 C CNN
F 4 "GNL-3012GD" H -5625 3150 50  0001 C CNN "Артикул"
F 5 "https://www.chipdip.ru/product/gnl-3012gd" H -5625 3150 50  0001 C CNN "Ссылка"
F 6 "5" H -5625 3150 50  0001 C CNN "Цена"
	1    1425 4600
	-1   0    0    1   
$EndComp
$Comp
L UBD-rescue:LED-Device D9
U 1 1 5CDFC9E3
P 1425 4450
F 0 "D9" H 600 4450 50  0000 C CNN
F 1 "Светодиод зелёный" H 450 4450 50  0000 R CNN
F 2 "UBD:LED_D3.0mm_Horizontal_O1.27mm_Z2.0mm" H 1425 4450 50  0001 C CNN
F 3 "~" H 1425 4450 50  0001 C CNN
F 4 "GNL-3014YT" H -5325 2900 50  0001 C CNN "Артикул"
F 5 "https://www.chipdip.ru/product/gnl-3014yt" H -5325 2900 50  0001 C CNN "Ссылка"
F 6 "5" H -5325 2900 50  0001 C CNN "Цена"
	1    1425 4450
	-1   0    0    1   
$EndComp
$Comp
L UBD-rescue:LED-Device D10
U 1 1 5CDFD38D
P 1425 4300
F 0 "D10" H 600 4300 50  0000 C CNN
F 1 "Светодиод синий" H 450 4300 50  0000 R CNN
F 2 "UBD:LED_D3.0mm_Horizontal_O1.27mm_Z2.0mm" H 1425 4300 50  0001 C CNN
F 3 "~" H 1425 4300 50  0001 C CNN
F 4 "GNL-3014UBD-TL" H -5625 2650 50  0001 C CNN "Артикул"
F 5 "https://www.chipdip.ru/product/gnl-3014ubd-tl" H -5625 2650 50  0001 C CNN "Ссылка"
F 6 "11" H -5625 2650 50  0001 C CNN "Цена"
	1    1425 4300
	-1   0    0    1   
$EndComp
Wire Wire Line
	1700 4300 1575 4300
Wire Wire Line
	1650 4450 1575 4450
Wire Wire Line
	1575 4600 1650 4600
Wire Wire Line
	1575 4750 1700 4750
$Comp
L UBD-rescue:LM2734Y-Regulator_Switching U9
U 1 1 5D207472
P 2025 2150
F 0 "U9" H 1750 2475 50  0000 C CNN
F 1 "LM2734Y" H 1875 2400 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:TSOT-23-6" H 2050 1900 50  0001 L CIN
F 3 "http://www.ti.com/lit/ds/symlink/lm2734.pdf" H 1925 2250 50  0001 C CNN
F 4 "LM2734YMK" H -725 0   50  0001 C CNN "Артикул"
F 5 "https://www.chipdip.ru/product/lm2734ymk-nopb" H -725 0   50  0001 C CNN "Ссылка"
F 6 "120" H -725 0   50  0001 C CNN "Цена"
	1    2025 2150
	1    0    0    -1  
$EndComp
$Comp
L UBD-rescue:R-Device R22
U 1 1 5D20CC70
P 1525 2200
F 0 "R22" H 1300 2250 50  0000 L CNN
F 1 "100k" H 1275 2150 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 1455 2200 50  0001 C CNN
F 3 "~" H 1525 2200 50  0001 C CNN
F 4 "0.1Вт 0603 100 кОм, 1%" H -4675 1400 50  0001 C CNN "Артикул"
F 5 "https://www.chipdip.ru/product0/9000079760" H -4675 1400 50  0001 C CNN "Ссылка"
F 6 "0,9" H -4675 1400 50  0001 C CNN "Цена"
	1    1525 2200
	1    0    0    -1  
$EndComp
$Comp
L UBD-rescue:L-Device L3
U 1 1 5D2179F0
P 2750 2150
F 0 "L3" V 2900 2150 50  0000 C CNN
F 1 "10uH" V 2825 2100 50  0000 C CNN
F 2 "UBD:L_Vishay_IHLP-2525" H 2750 2150 50  0001 C CNN
F 3 "~" H 2750 2150 50  0001 C CNN
F 4 "LQH66SN100M03L" H -350 0   50  0001 C CNN "Артикул"
F 5 "https://www.chipdip.ru/product/lqh66sn100m" H -350 0   50  0001 C CNN "Ссылка"
F 6 "74" H -350 0   50  0001 C CNN "Цена"
	1    2750 2150
	0    -1   -1   0   
$EndComp
$Comp
L UBD-rescue:D_Schottky-Device D15
U 1 1 5D24512B
P 2600 2300
F 0 "D15" V 2625 2100 50  0000 L CNN
F 1 "Диод Шоттки" V 2650 1800 50  0001 L CNN
F 2 "Diode_SMD:D_SOT-23_ANK" H 2600 2300 50  0001 C CNN
F 3 "~" H 2600 2300 50  0001 C CNN
F 4 "ZHCS1000TA" H -300 -50 50  0001 C CNN "Артикул"
F 5 "https://www.chipdip.ru/product/zhcs1000ta-sot23" H -300 -50 50  0001 C CNN "Ссылка"
F 6 "4" H -300 -50 50  0001 C CNN "Цена"
	1    2600 2300
	0    1    1    0   
$EndComp
$Comp
L UBD-rescue:C-Device C8
U 1 1 5D245F69
P 1175 2200
F 0 "C8" H 1325 2150 50  0000 L CNN
F 1 "10uF" H 1275 2250 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 1213 2050 50  0001 C CNN
F 3 "~" H 1175 2200 50  0001 C CNN
F 4 "3" H -1525 -1750 50  0001 C CNN "Номер"
F 5 "GRM188R61E106MA73D" H -1525 -1750 50  0001 C CNN "Артикул"
F 6 "https://www.chipdip.ru/product/grm21br61c106ke15l" H -1525 -1750 50  0001 C CNN "Ссылка"
F 7 "12" H -1525 -1750 50  0001 C CNN "Цена"
	1    1175 2200
	-1   0    0    1   
$EndComp
Wire Wire Line
	1625 2050 1525 2050
$Comp
L UBD-rescue:GND-power #PWR032
U 1 1 5D28CD5B
P 2025 2925
F 0 "#PWR032" H 2025 2675 50  0001 C CNN
F 1 "GND" H 2030 2752 50  0000 C CNN
F 2 "" H 2025 2925 50  0001 C CNN
F 3 "" H 2025 2925 50  0001 C CNN
	1    2025 2925
	1    0    0    -1  
$EndComp
Wire Wire Line
	2025 2925 2025 2450
$Comp
L UBD-rescue:GND-power #PWR09
U 1 1 5D36489B
P 1175 2400
F 0 "#PWR09" H 1175 2150 50  0001 C CNN
F 1 "GND" H 1300 2325 50  0000 C CNN
F 2 "" H 1175 2400 50  0001 C CNN
F 3 "" H 1175 2400 50  0001 C CNN
	1    1175 2400
	1    0    0    -1  
$EndComp
Wire Wire Line
	1175 2400 1175 2350
$Comp
L UBD-rescue:C-Device C9
U 1 1 5D3D8A9E
P 2600 2000
F 0 "C9" H 2950 1825 50  0000 L CNN
F 1 "0.01uF" H 2800 1900 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 2638 1850 50  0001 C CNN
F 3 "~" H 2600 2000 50  0001 C CNN
F 4 "3" H -100 -1950 50  0001 C CNN "Номер"
F 5 "MLCC0.01uFX7R50V10%0603" H -100 -1950 50  0001 C CNN "Артикул"
F 6 "https://www.chipdip.ru/product0/9000143994" H -100 -1950 50  0001 C CNN "Ссылка"
F 7 "3" H -100 -1950 50  0001 C CNN "Цена"
	1    2600 2000
	-1   0    0    1   
$EndComp
Connection ~ 2600 2150
$Comp
L UBD-rescue:D_Schottky-Device D16
U 1 1 5D3E72B7
P 2750 1850
F 0 "D16" H 2675 1950 50  0000 L CNN
F 1 "Диод Шоттки" V 2800 1350 50  0001 L CNN
F 2 "Diode_SMD:D_SOT-23_ANK" H 2750 1850 50  0001 C CNN
F 3 "~" H 2750 1850 50  0001 C CNN
F 4 "ZHCS1000TA" H -150 -500 50  0001 C CNN "Артикул"
F 5 "https://www.chipdip.ru/product/zhcs1000ta-sot23" H -150 -500 50  0001 C CNN "Ссылка"
F 6 "4" H -150 -500 50  0001 C CNN "Цена"
	1    2750 1850
	1    0    0    -1  
$EndComp
Wire Wire Line
	2900 1850 2900 2150
$Comp
L UBD-rescue:C-Device C10
U 1 1 5D43C119
P 2900 2300
F 0 "C10" H 2975 2450 50  0000 L CNN
F 1 "22uF" H 2925 2525 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 2938 2150 50  0001 C CNN
F 3 "~" H 2900 2300 50  0001 C CNN
F 4 "3" H 200 -1650 50  0001 C CNN "Номер"
F 5 "GRM188R60G226MEA0L" H 200 -1650 50  0001 C CNN "Артикул"
F 6 "https://www.chipdip.ru/product/grm188r60g226mea0l" H 200 -1650 50  0001 C CNN "Ссылка"
F 7 "13" H 200 -1650 50  0001 C CNN "Цена"
	1    2900 2300
	-1   0    0    1   
$EndComp
Connection ~ 2900 2150
$Comp
L UBD-rescue:R-Device R24
U 1 1 5D4B0960
P 3200 2300
F 0 "R24" H 3100 2025 50  0000 L CNN
F 1 "30k" H 3100 2100 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 3130 2300 50  0001 C CNN
F 3 "~" H 3200 2300 50  0001 C CNN
F 4 "0.1Вт 0603 30 кОм, 1%" H -3000 1500 50  0001 C CNN "Артикул"
F 5 "https://www.chipdip.ru/product0/9000079747" H -3000 1500 50  0001 C CNN "Ссылка"
F 6 "0,9" H -3000 1500 50  0001 C CNN "Цена"
	1    3200 2300
	-1   0    0    1   
$EndComp
$Comp
L UBD-rescue:R-Device R25
U 1 1 5D4B1C41
P 3200 2650
F 0 "R25" H 3000 2700 50  0000 L CNN
F 1 "10k" H 3000 2775 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 3130 2650 50  0001 C CNN
F 3 "~" H 3200 2650 50  0001 C CNN
F 4 "0.063Вт 0603 10 кОм, 1%" H -3000 1850 50  0001 C CNN "Артикул"
F 5 "https://www.chipdip.ru/product0/9000079736" H -3000 1850 50  0001 C CNN "Ссылка"
F 6 "0,9" H -3000 1850 50  0001 C CNN "Цена"
	1    3200 2650
	-1   0    0    1   
$EndComp
Wire Wire Line
	3200 2450 3200 2475
$Comp
L UBD-rescue:GND-power #PWR033
U 1 1 5D4E8738
P 2600 2925
F 0 "#PWR033" H 2600 2675 50  0001 C CNN
F 1 "GND" H 2605 2752 50  0000 C CNN
F 2 "" H 2600 2925 50  0001 C CNN
F 3 "" H 2600 2925 50  0001 C CNN
	1    2600 2925
	1    0    0    -1  
$EndComp
$Comp
L UBD-rescue:GND-power #PWR035
U 1 1 5D4E9654
P 3200 2925
F 0 "#PWR035" H 3200 2675 50  0001 C CNN
F 1 "GND" H 3205 2752 50  0000 C CNN
F 2 "" H 3200 2925 50  0001 C CNN
F 3 "" H 3200 2925 50  0001 C CNN
	1    3200 2925
	1    0    0    -1  
$EndComp
$Comp
L UBD-rescue:GND-power #PWR034
U 1 1 5D4E9CF0
P 2900 2925
F 0 "#PWR034" H 2900 2675 50  0001 C CNN
F 1 "GND" H 2905 2752 50  0000 C CNN
F 2 "" H 2900 2925 50  0001 C CNN
F 3 "" H 2900 2925 50  0001 C CNN
	1    2900 2925
	1    0    0    -1  
$EndComp
Wire Wire Line
	2600 2925 2600 2450
Wire Wire Line
	2900 2450 2900 2925
Wire Wire Line
	3200 2925 3200 2800
Text Label 3150 2475 2    50   ~ 0
Fb
Wire Wire Line
	3150 2475 3200 2475
Connection ~ 3200 2475
Wire Wire Line
	3200 2475 3200 2500
Text Label 2450 2250 0    50   ~ 0
Fb
Wire Wire Line
	2450 2250 2425 2250
Wire Wire Line
	2425 2150 2600 2150
Wire Wire Line
	2425 2050 2425 1850
Wire Wire Line
	2425 1850 2600 1850
Connection ~ 2600 1850
$Comp
L UBD-rescue:R-Device R23
U 1 1 5D6A7AB3
P 3050 2150
F 0 "R23" V 3125 2100 50  0000 L CNN
F 1 "1.6k" V 3050 2075 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 2980 2150 50  0001 C CNN
F 3 "~" H 3050 2150 50  0001 C CNN
F 4 "0.1Вт 0603 1.6 кОм, 1%" H -3150 1350 50  0001 C CNN "Артикул"
F 5 "https://www.chipdip.ru/product0/770" H -3150 1350 50  0001 C CNN "Ссылка"
F 6 "0,9" H -3150 1350 50  0001 C CNN "Цена"
	1    3050 2150
	0    -1   -1   0   
$EndComp
$Comp
L UBD-rescue:C-Device C11
U 1 1 5D6F40FA
P 3375 2325
F 0 "C11" H 3350 2525 50  0000 L CNN
F 1 "1000pF" H 3200 2600 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 3413 2175 50  0001 C CNN
F 3 "~" H 3375 2325 50  0001 C CNN
F 4 "3" H 675 -1625 50  0001 C CNN "Номер"
F 5 "GRM1885C1H102JA01D" H 675 -1625 50  0001 C CNN "Артикул"
F 6 "https://www.chipdip.ru/product/grm1885c1h102j" H 675 -1625 50  0001 C CNN "Ссылка"
F 7 "2" H 675 -1625 50  0001 C CNN "Цена"
	1    3375 2325
	-1   0    0    1   
$EndComp
Wire Wire Line
	3200 2475 3375 2475
Wire Wire Line
	2900 1850 3375 1850
Connection ~ 2900 1850
$Comp
L UBD-rescue:+3.3V-power #PWR037
U 1 1 5D86943C
P 3750 2050
F 0 "#PWR037" H 3750 1900 50  0001 C CNN
F 1 "+3.3V" H 3765 2223 50  0000 C CNN
F 2 "" H 3750 2050 50  0001 C CNN
F 3 "" H 3750 2050 50  0001 C CNN
	1    3750 2050
	1    0    0    -1  
$EndComp
Wire Wire Line
	3600 2750 3600 2925
Wire Wire Line
	3375 1850 3375 2175
Wire Wire Line
	3600 1850 3375 1850
Wire Wire Line
	3600 1850 3600 2050
Connection ~ 3375 1850
Wire Wire Line
	3750 2050 3600 2050
Connection ~ 3600 2050
Wire Wire Line
	3600 2050 3600 2100
$Comp
L UBD-rescue:+12V-power #PWR0114
U 1 1 5DB8F983
P 1175 1900
F 0 "#PWR0114" H 1175 1750 50  0001 C CNN
F 1 "+12V" H 1325 2000 50  0000 C CNN
F 2 "" H 1175 1900 50  0001 C CNN
F 3 "" H 1175 1900 50  0001 C CNN
	1    1175 1900
	1    0    0    -1  
$EndComp
Wire Wire Line
	1175 1900 1175 2050
Connection ~ 1800 700 
Wire Wire Line
	1525 2050 1175 2050
Connection ~ 1525 2050
Connection ~ 1175 2050
Wire Wire Line
	1700 7100 1700 7350
$Comp
L UBD-rescue:+12V-power #PWR0128
U 1 1 5D0BB3B9
P 3000 5225
F 0 "#PWR0128" H 3000 5075 50  0001 C CNN
F 1 "+12V" H 3015 5398 50  0000 C CNN
F 2 "" H 3000 5225 50  0001 C CNN
F 3 "" H 3000 5225 50  0001 C CNN
	1    3000 5225
	1    0    0    -1  
$EndComp
$Comp
L UBD-rescue:D_Schottky-Device D6
U 1 1 5CFF9E32
P 3000 5625
F 0 "D6" V 3000 5450 50  0000 L CNN
F 1 "Диод Шоттки" V 3050 5125 50  0001 L CNN
F 2 "UBD:D_SMA" H 3000 5625 50  0001 C CNN
F 3 "~" H 3000 5625 50  0001 C CNN
F 4 "SS16" H 100 3275 50  0001 C CNN "Артикул"
F 5 "https://www.chipdip.ru/product/ss16" H 100 3275 50  0001 C CNN "Ссылка"
F 6 "4" H 100 3275 50  0001 C CNN "Цена"
	1    3000 5625
	0    1    1    0   
$EndComp
$Comp
L UBD-rescue:D_Schottky-Device D5
U 1 1 5CFF5BA7
P 1700 5625
F 0 "D5" V 1700 5450 50  0000 L CNN
F 1 "Диод Шоттки" V 1750 5125 50  0001 L CNN
F 2 "UBD:D_SMA" H 1700 5625 50  0001 C CNN
F 3 "~" H 1700 5625 50  0001 C CNN
F 4 "SS16" H -1200 3275 50  0001 C CNN "Артикул"
F 5 "https://www.chipdip.ru/product/ss16" H -1200 3275 50  0001 C CNN "Ссылка"
F 6 "4" H -1200 3275 50  0001 C CNN "Цена"
	1    1700 5625
	0    1    1    0   
$EndComp
Connection ~ 3000 5225
Connection ~ 1700 5225
$Comp
L UBD-rescue:+12V-power #PWR0129
U 1 1 5CFEDAE7
P 1700 5225
F 0 "#PWR0129" H 1700 5075 50  0001 C CNN
F 1 "+12V" H 1715 5398 50  0000 C CNN
F 2 "" H 1700 5225 50  0001 C CNN
F 3 "" H 1700 5225 50  0001 C CNN
	1    1700 5225
	1    0    0    -1  
$EndComp
Wire Wire Line
	3000 5775 3000 5975
Wire Wire Line
	3000 5975 3300 5975
Wire Wire Line
	1700 5975 2000 5975
Wire Wire Line
	1700 5775 1700 5975
Wire Wire Line
	1700 5225 2000 5225
Wire Wire Line
	1700 5475 1700 5225
Wire Wire Line
	3000 5225 3300 5225
Wire Wire Line
	3000 5475 3000 5225
Wire Wire Line
	3300 5325 3300 5225
Wire Wire Line
	2000 5325 2000 5225
Wire Wire Line
	3700 5275 3750 5275
Wire Wire Line
	3700 5325 3700 5275
Wire Wire Line
	3800 5975 3850 5975
Wire Wire Line
	3800 5925 3800 5975
Wire Wire Line
	2500 5975 2550 5975
Wire Wire Line
	2500 5925 2500 5975
Wire Wire Line
	2400 5275 2400 5325
Wire Wire Line
	2450 5275 2400 5275
Text Label 3850 5975 0    50   ~ 0
Tr_NO2
Text Label 2550 5975 0    50   ~ 0
Ig_NO2
Text Label 2450 5275 0    50   ~ 0
Ig_NO1
Text Label 3750 5275 0    50   ~ 0
Tr_NO1
$Comp
L UBD-rescue:G5LE-1-Relay K1
U 1 1 5CB651C7
P 2200 5625
F 0 "K1" H 2250 5325 50  0000 R CNN
F 1 "NRP-18" H 1771 5670 50  0001 R CNN
F 2 "UBD:Relay_NRP-18" H 2650 5575 50  0001 L CNN
F 3 "http://www.omron.com/ecb/products/pdf/en-g5le.pdf" H 2200 5225 50  0001 C CNN
F 4 "NRP-18-C-12D-H" H -550 475 50  0001 C CNN "Артикул"
F 5 "https://www.chipdip.ru/product/nrp-18-c-12d-s-h" H -550 475 50  0001 C CNN "Ссылка"
F 6 "47" H -550 475 50  0001 C CNN "Цена"
	1    2200 5625
	1    0    0    1   
$EndComp
$Comp
L UBD-rescue:G5LE-1-Relay K2
U 1 1 5CCE6A6C
P 3500 5625
F 0 "K2" H 3550 5325 50  0000 R CNN
F 1 "NRP-18" H 3100 5675 50  0001 R CNN
F 2 "UBD:Relay_NRP-18" H 3950 5575 50  0001 L CNN
F 3 "http://www.omron.com/ecb/products/pdf/en-g5le.pdf" H 3500 5225 50  0001 C CNN
F 4 "NRP-18-C-12D-H" H 750 -575 50  0001 C CNN "Артикул"
F 5 "https://www.chipdip.ru/product/nrp-18-c-12d-s-h" H 750 -575 50  0001 C CNN "Ссылка"
F 6 "47" H 750 -575 50  0001 C CNN "Цена"
	1    3500 5625
	1    0    0    1   
$EndComp
Connection ~ 3550 700 
Wire Wire Line
	4400 5650 4400 5700
Wire Wire Line
	4400 5700 4550 5700
Connection ~ 4550 5700
Wire Wire Line
	4550 5700 4550 5650
$Comp
L UBD-rescue:Conn_01x02-Connector_Generic J7
U 1 1 5D052756
P 1125 1475
F 0 "J7" H 1125 1275 50  0000 C CNN
F 1 "Питание" H 1175 1275 50  0001 C CNN
F 2 "Connector_JST:JST_XH_S2B-XH-A_1x02_P2.50mm_Horizontal" H 1125 1475 50  0001 C CNN
F 3 "~" H 1125 1475 50  0001 C CNN
F 4 "CWF-2R (DS1069-2 MR-A)  CHU-2 (DS1069-2 F)" H 125 125 50  0001 C CNN "Артикул"
F 5 "https://www.chipdip.ru/product/cwf-2r-ds1069-2-mr   https://www.chipdip.ru/product/chu-2" H 125 125 50  0001 C CNN "Ссылка"
F 6 "6+6" H 125 125 50  0001 C CNN "Цена"
	1    1125 1475
	-1   0    0    1   
$EndComp
$Comp
L UBD-rescue:GND-power #PWR0135
U 1 1 5D06F4B6
P 1325 1475
F 0 "#PWR0135" H 1325 1225 50  0001 C CNN
F 1 "GND" H 1330 1302 50  0000 C CNN
F 2 "" H 1325 1475 50  0001 C CNN
F 3 "" H 1325 1475 50  0001 C CNN
	1    1325 1475
	1    0    0    -1  
$EndComp
$Comp
L UBD-rescue:Fuse-Device F1
U 1 1 5CC591C6
P 1325 1225
F 0 "F1" H 1125 1375 50  0000 L CNN
F 1 "Fuse" H 1075 1325 50  0000 L CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 1255 1225 50  0001 C CNN
F 3 "~" H 1325 1225 50  0001 C CNN
F 4 "Fuse 1.1A smd" H 175 325 50  0001 C CNN "Артикул"
F 5 "https://ru.aliexpress.com/item/100-0805-1206-1812-0-05A-2A-0-1A-0-2A-0-5A-0/32894932841.html?spm=a2g0v.search0604.3.2.5dfa3840LWdN9u&s=p&ws_ab_test=searchweb0_0%2Csearchweb201602_10_10065_10068_319_317_10696_453_10084_454_10083_10618_10307_10301_537_536_10059_10884_10889_10887_321_322_10915_10103_10914_10911_10910%2Csearchweb201603_52%2CppcSwitch_0&algo_pvid=f4320855-dcf9-435f-8f79-b3d6bf9b8046&algo_expid=f4320855-dcf9-435f-8f79-b3d6bf9b8046-0" H 175 325 50  0001 C CNN "Ссылка"
F 6 "6" H 175 325 50  0001 C CNN "Цена"
	1    1325 1225
	1    0    0    -1  
$EndComp
$Comp
L UBD-rescue:D_Schottky-Device D1
U 1 1 5CC435EF
P 1325 925
F 0 "D1" V 1325 775 50  0000 L CNN
F 1 "Диод Шоттки" H 1325 825 50  0001 L CNN
F 2 "UBD:D_SMA" H 1325 925 50  0001 C CNN
F 3 "~" H 1325 925 50  0001 C CNN
F 4 "SS16" H -25 225 50  0001 C CNN "Артикул"
F 5 "https://www.chipdip.ru/product/ss16" H -25 225 50  0001 C CNN "Ссылка"
F 6 "4" H -25 225 50  0001 C CNN "Цена"
	1    1325 925 
	0    1    1    0   
$EndComp
Wire Wire Line
	1325 700  1800 700 
Wire Wire Line
	1325 700  1325 775 
$Comp
L UBD_Lib:USB_B_Micro J4
U 1 1 5CFBC8CB
P 4550 5250
F 0 "J4" H 4550 5700 50  0000 C CNN
F 1 "USB_B_Micro" H 4500 5600 50  0000 C CNN
F 2 "Connector_USB:USB_Mini-B_Lumberg_2486_01_Horizontal" H 4700 5200 50  0001 C CNN
F 3 "~" H 4700 5200 50  0001 C CNN
F 4 "MiniUSB-A" H 3050 -2850 50  0001 C CNN "Артикул"
F 5 "https://www.chipdip.ru/product/miniusb-a-5pin" H 3050 -2850 50  0001 C CNN "Ссылка"
F 6 "22" H 3050 -2850 50  0001 C CNN "Цена"
	1    4550 5250
	1    0    0    -1  
$EndComp
$Comp
L MCU_ST_STM32F1:STM32F103C8Tx U1
U 1 1 5E32F83A
P 5600 2150
F 0 "U1" H 5450 3950 50  0000 C CNN
F 1 "STM32F103C8Tx" H 5450 3850 50  0000 C CNN
F 2 "Package_QFP:LQFP-48_7x7mm_P0.5mm" H 5000 750 50  0001 R CNN
F 3 "http://www.st.com/st-web-ui/static/active/en/resource/technical/document/datasheet/CD00161566.pdf" H 5600 2150 50  0001 C CNN
F 4 "STM32F103C8T6" H 5600 2150 50  0001 C CNN "Артикул"
F 5 "https://www.chipdip.ru/product/stm32f103c8t6" H 5600 2150 50  0001 C CNN "Ссылка"
F 6 "110" H 5600 2150 50  0001 C CNN "Цена"
	1    5600 2150
	1    0    0    -1  
$EndComp
Wire Wire Line
	5500 650  5500 550 
Wire Wire Line
	5500 550  5600 550 
Wire Wire Line
	5700 550  5700 650 
Wire Wire Line
	5600 650  5600 550 
Connection ~ 5600 550 
Wire Wire Line
	5600 550  5700 550 
Wire Wire Line
	5700 550  5800 550 
Wire Wire Line
	5800 550  5800 650 
Connection ~ 5700 550 
Wire Wire Line
	5700 3650 5700 3750
Wire Wire Line
	5700 3750 5600 3750
Wire Wire Line
	5400 3750 5400 3650
Wire Wire Line
	5500 3650 5500 3750
Connection ~ 5500 3750
Wire Wire Line
	5500 3750 5400 3750
Wire Wire Line
	5600 3650 5600 3750
Connection ~ 5600 3750
Wire Wire Line
	5600 3750 5500 3750
$Comp
L UBD-rescue:C-Device C5
U 1 1 5E21B47F
P 7100 2000
F 0 "C5" H 7215 2046 50  0000 L CNN
F 1 "100n" H 7215 1955 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 7138 1850 50  0001 C CNN
F 3 "~" H 7100 2000 50  0001 C CNN
F 4 "3" H 4400 -1950 50  0001 C CNN "Номер"
F 5 "GRM188R71E104KA01D" H 4400 -1950 50  0001 C CNN "Артикул"
F 6 "https://www.chipdip.ru/product/grm188r71e104ka01d" H 4400 -1950 50  0001 C CNN "Ссылка"
F 7 "3" H 4400 -1950 50  0001 C CNN "Цена"
	1    7100 2000
	1    0    0    -1  
$EndComp
$Comp
L UBD-rescue:GND-power #PWR019
U 1 1 5E241FA6
P 7100 2250
F 0 "#PWR019" H 7100 2000 50  0001 C CNN
F 1 "GND" H 7105 2077 50  0000 C CNN
F 2 "" H 7100 2250 50  0001 C CNN
F 3 "" H 7100 2250 50  0001 C CNN
	1    7100 2250
	1    0    0    -1  
$EndComp
Wire Wire Line
	7100 2250 7100 2150
$Comp
L UBD-rescue:R-Device R6
U 1 1 5E250FA8
P 4050 3600
F 0 "R6" H 4120 3646 50  0000 L CNN
F 1 "10k" H 4100 3550 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 3980 3600 50  0001 C CNN
F 3 "~" H 4050 3600 50  0001 C CNN
F 4 "0.063Вт 0603 10 кОм, 1%" H -700 2800 50  0001 C CNN "Артикул"
F 5 "https://www.chipdip.ru/product0/9000079736" H -700 2800 50  0001 C CNN "Ссылка"
F 6 "0,9" H -700 2800 50  0001 C CNN "Цена"
	1    4050 3600
	1    0    0    -1  
$EndComp
$Comp
L UBD-rescue:R-Device R5
U 1 1 5E252859
P 3950 3600
F 0 "R5" H 3800 3650 50  0000 L CNN
F 1 "10k" H 3750 3550 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 3880 3600 50  0001 C CNN
F 3 "~" H 3950 3600 50  0001 C CNN
F 4 "0.063Вт 0603 10 кОм, 1%" H -800 2800 50  0001 C CNN "Артикул"
F 5 "https://www.chipdip.ru/product0/9000079736" H -800 2800 50  0001 C CNN "Ссылка"
F 6 "0,9" H -800 2800 50  0001 C CNN "Цена"
	1    3950 3600
	1    0    0    -1  
$EndComp
Wire Wire Line
	7100 1650 7100 1750
Wire Wire Line
	4900 850  4850 850 
Text Label 7000 1750 2    50   ~ 0
Rst
Wire Wire Line
	7000 1750 7100 1750
Connection ~ 7100 1750
Wire Wire Line
	7100 1750 7100 1850
Wire Wire Line
	4050 2150 4050 3450
Wire Wire Line
	3950 1050 3950 3450
$Comp
L UBD-rescue:GND-power #PWR02
U 1 1 5E2CEC70
P 3950 3850
F 0 "#PWR02" H 3950 3600 50  0001 C CNN
F 1 "GND" H 3800 3750 50  0000 C CNN
F 2 "" H 3950 3850 50  0001 C CNN
F 3 "" H 3950 3850 50  0001 C CNN
	1    3950 3850
	1    0    0    -1  
$EndComp
$Comp
L UBD-rescue:GND-power #PWR03
U 1 1 5E2CF1F3
P 4050 3850
F 0 "#PWR03" H 4050 3600 50  0001 C CNN
F 1 "GND" H 4200 3750 50  0000 C CNN
F 2 "" H 4050 3850 50  0001 C CNN
F 3 "" H 4050 3850 50  0001 C CNN
	1    4050 3850
	1    0    0    -1  
$EndComp
$Comp
L UBD-rescue:GND-power #PWR013
U 1 1 5E2CF31C
P 5400 3850
F 0 "#PWR013" H 5400 3600 50  0001 C CNN
F 1 "GND" H 5405 3677 50  0000 C CNN
F 2 "" H 5400 3850 50  0001 C CNN
F 3 "" H 5400 3850 50  0001 C CNN
	1    5400 3850
	1    0    0    -1  
$EndComp
Wire Wire Line
	3950 3850 3950 3750
Wire Wire Line
	4050 3850 4050 3750
Wire Wire Line
	5400 3850 5400 3750
Connection ~ 5400 3750
$Comp
L Connector_Generic:Conn_01x05 J1
U 1 1 5E32AEE6
P 7050 3250
F 0 "J1" H 6850 3550 50  0000 L CNN
F 1 "ST-Link" H 7000 3550 50  0000 L CNN
F 2 "Connector_JST:JST_XH_S5B-XH-A_1x05_P2.50mm_Horizontal" H 7050 3250 50  0001 C CNN
F 3 "~" H 7050 3250 50  0001 C CNN
F 4 "???" H 7050 3250 50  0001 C CNN "Артикул"
F 5 "https://www.tme.eu/ru/details/s5b-xh-a/razemy-signalnye-rastr-2-50mm/jst/s5b-xh-a-lf-sn   https://www.tme.eu/ru/details/nx2501-05pfs/razemy-signalnye-rastr-2-50mm/joint-tech/a2501h-5p" H 7050 3250 50  0001 C CNN "Ссылка"
	1    7050 3250
	1    0    0    -1  
$EndComp
Wire Wire Line
	5800 450  5800 550 
Connection ~ 5800 550 
Text Notes 7150 3500 0    50   ~ 0
Gnd
Text Notes 7150 3400 0    50   ~ 0
CLK
Text Notes 7150 3300 0    50   ~ 0
SWD
Text Notes 7150 3200 0    50   ~ 0
3v3
Text Notes 7150 3100 0    50   ~ 0
SWO
Text Label 6800 3350 2    50   ~ 0
CLK
Text Label 6800 3250 2    50   ~ 0
SWD
Text Label 6800 3050 2    50   ~ 0
SWO
Wire Wire Line
	6800 3350 6850 3350
Wire Wire Line
	6800 3250 6850 3250
Wire Wire Line
	6800 3050 6850 3050
$Comp
L UBD-rescue:GND-power #PWR018
U 1 1 5E39E932
P 6800 3500
F 0 "#PWR018" H 6800 3250 50  0001 C CNN
F 1 "GND" H 6805 3327 50  0000 C CNN
F 2 "" H 6800 3500 50  0001 C CNN
F 3 "" H 6800 3500 50  0001 C CNN
	1    6800 3500
	1    0    0    -1  
$EndComp
Wire Wire Line
	6800 3500 6800 3450
Wire Wire Line
	6800 3450 6850 3450
$Comp
L UBD-rescue:+3.3V-power #PWR016
U 1 1 5E3AB97C
P 6600 3000
F 0 "#PWR016" H 6600 2850 50  0001 C CNN
F 1 "+3.3V" H 6615 3173 50  0000 C CNN
F 2 "" H 6600 3000 50  0001 C CNN
F 3 "" H 6600 3000 50  0001 C CNN
	1    6600 3000
	1    0    0    -1  
$EndComp
Wire Wire Line
	6600 3000 6600 3150
Wire Wire Line
	6600 3150 6850 3150
Text Label 4850 2250 2    50   ~ 0
SWO
Wire Wire Line
	4850 2250 4900 2250
Text Label 6250 3350 0    50   ~ 0
CLK
Text Label 6250 3250 0    50   ~ 0
SWD
Wire Wire Line
	6250 3250 6200 3250
Wire Wire Line
	6250 3350 6200 3350
Text Label 4850 2450 2    50   ~ 0
Led1
Wire Wire Line
	6200 3450 6250 3450
Wire Wire Line
	4050 2150 4900 2150
Wire Wire Line
	3950 1050 4900 1050
$Comp
L UBD-rescue:C-Device C2
U 1 1 5E48FEB1
P 4150 1650
F 0 "C2" H 4250 1600 50  0000 L CNN
F 1 "100n" H 4200 1500 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 4188 1500 50  0001 C CNN
F 3 "~" H 4150 1650 50  0001 C CNN
F 4 "3" H 1450 -2300 50  0001 C CNN "Номер"
F 5 "GRM188R71E104KA01D" H 1450 -2300 50  0001 C CNN "Артикул"
F 6 "https://www.chipdip.ru/product/grm188r71e104ka01d" H 1450 -2300 50  0001 C CNN "Ссылка"
F 7 "3" H 1450 -2300 50  0001 C CNN "Цена"
	1    4150 1650
	1    0    0    -1  
$EndComp
$Comp
L UBD-rescue:C-Device C4
U 1 1 5E490C67
P 4550 1650
F 0 "C4" H 4575 1750 50  0000 L CNN
F 1 "100n" H 4575 1475 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 4588 1500 50  0001 C CNN
F 3 "~" H 4550 1650 50  0001 C CNN
F 4 "3" H 1850 -2300 50  0001 C CNN "Номер"
F 5 "GRM188R71E104KA01D" H 1850 -2300 50  0001 C CNN "Артикул"
F 6 "https://www.chipdip.ru/product/grm188r71e104ka01d" H 1850 -2300 50  0001 C CNN "Ссылка"
F 7 "3" H 1850 -2300 50  0001 C CNN "Цена"
	1    4550 1650
	1    0    0    -1  
$EndComp
$Comp
L UBD-rescue:GND-power #PWR04
U 1 1 5E4912AB
P 4150 1850
F 0 "#PWR04" H 4150 1600 50  0001 C CNN
F 1 "GND" H 4150 1700 50  0000 C CNN
F 2 "" H 4150 1850 50  0001 C CNN
F 3 "" H 4150 1850 50  0001 C CNN
	1    4150 1850
	-1   0    0    -1  
$EndComp
$Comp
L UBD-rescue:GND-power #PWR010
U 1 1 5E4916D5
P 4550 1850
F 0 "#PWR010" H 4550 1600 50  0001 C CNN
F 1 "GND" H 4550 1700 50  0000 C CNN
F 2 "" H 4550 1850 50  0001 C CNN
F 3 "" H 4550 1850 50  0001 C CNN
	1    4550 1850
	-1   0    0    -1  
$EndComp
Wire Wire Line
	4150 1800 4150 1850
Wire Wire Line
	4550 1800 4550 1850
Wire Wire Line
	4200 1250 4150 1250
Wire Wire Line
	4150 1250 4150 1450
Wire Wire Line
	4500 1250 4550 1250
Wire Wire Line
	4550 1500 4550 1250
Connection ~ 4550 1250
Wire Wire Line
	4550 1250 4900 1250
Wire Wire Line
	4900 1350 4750 1350
Wire Wire Line
	4750 1350 4750 1450
Wire Wire Line
	4750 1450 4150 1450
Connection ~ 4150 1450
Wire Wire Line
	4150 1450 4150 1500
$Comp
L Interface_USB:CP2102N-A01-GQFN28 U4
U 1 1 5E5C474D
P 5750 5850
F 0 "U4" H 5950 7200 50  0000 C CNN
F 1 "CP2102" H 5950 7100 50  0000 C CNN
F 2 "Package_DFN_QFN:QFN-28-1EP_5x5mm_P0.5mm_EP3.35x3.35mm" H 6200 4650 50  0001 L CNN
F 3 "https://www.silabs.com/documents/public/data-sheets/cp2102n-datasheet.pdf" H 5800 5100 50  0001 C CNN
F 4 "CP2102-GMR" H 5750 5850 50  0001 C CNN "Артикул"
F 5 "https://www.chipdip.ru/product/cp2102-gmr" H 5750 5850 50  0001 C CNN "Ссылка"
F 6 "110" H 5750 5850 50  0001 C CNN "Цена"
	1    5750 5850
	1    0    0    -1  
$EndComp
Wire Wire Line
	5250 5250 5000 5250
Wire Wire Line
	5650 4550 5650 4450
$Comp
L UBD-rescue:R-Device R11
U 1 1 5E66D5FE
P 5200 4650
F 0 "R11" H 5250 4800 50  0000 L CNN
F 1 "10k" H 5250 4700 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 5130 4650 50  0001 C CNN
F 3 "~" H 5200 4650 50  0001 C CNN
F 4 "0.063Вт 0603 10 кОм, 1%" H 450 3850 50  0001 C CNN "Артикул"
F 5 "https://www.chipdip.ru/product0/9000079736" H 450 3850 50  0001 C CNN "Ссылка"
F 6 "0,9" H 450 3850 50  0001 C CNN "Цена"
	1    5200 4650
	1    0    0    -1  
$EndComp
$Comp
L UBD-rescue:+3.3V-power #PWR012
U 1 1 5E66D604
P 5200 4350
F 0 "#PWR012" H 5200 4200 50  0001 C CNN
F 1 "+3.3V" H 5350 4450 50  0000 C CNN
F 2 "" H 5200 4350 50  0001 C CNN
F 3 "" H 5200 4350 50  0001 C CNN
	1    5200 4350
	1    0    0    -1  
$EndComp
Wire Wire Line
	5200 4350 5200 4500
Wire Wire Line
	5200 4800 5200 4950
Wire Wire Line
	5200 4950 5250 4950
Wire Wire Line
	5250 5150 5100 5150
$Comp
L UBD-rescue:+3.3V-power #PWR014
U 1 1 5E6A7F5C
P 5750 4350
F 0 "#PWR014" H 5750 4200 50  0001 C CNN
F 1 "+3.3V" H 5765 4523 50  0000 C CNN
F 2 "" H 5750 4350 50  0001 C CNN
F 3 "" H 5750 4350 50  0001 C CNN
	1    5750 4350
	1    0    0    -1  
$EndComp
Wire Wire Line
	5750 4350 5750 4550
Wire Wire Line
	2000 5925 2000 5975
Connection ~ 2000 5975
Wire Wire Line
	2000 5975 2000 6050
Wire Wire Line
	3300 5925 3300 5975
Connection ~ 3300 5975
Wire Wire Line
	3300 5975 3300 6050
Wire Wire Line
	1650 6250 1700 6250
Wire Wire Line
	2950 6250 3000 6250
Text Label 1300 6250 2    50   ~ 0
Ig
Text Label 2600 6250 2    50   ~ 0
Tr
Wire Wire Line
	2600 6250 2650 6250
Wire Wire Line
	1300 6250 1350 6250
Wire Wire Line
	5100 4350 5100 4450
$Comp
L UBD-rescue:D_Schottky-Device D2
U 1 1 5E85EF27
P 4950 4850
F 0 "D2" V 4950 4700 50  0000 L CNN
F 1 "Диод Шоттки" H 4995 4929 50  0001 L CNN
F 2 "UBD:D_SMA" H 4950 4850 50  0001 C CNN
F 3 "~" H 4950 4850 50  0001 C CNN
F 4 "SS16" H 2050 3750 50  0001 C CNN "Артикул"
F 5 "https://www.chipdip.ru/product/ss16" H 2050 3750 50  0001 C CNN "Ссылка"
F 6 "4" H 2050 3750 50  0001 C CNN "Цена"
	1    4950 4850
	0    1    1    0   
$EndComp
Wire Wire Line
	4950 5000 4950 5050
Wire Wire Line
	4950 5050 4850 5050
Wire Wire Line
	5650 4450 5100 4450
Connection ~ 5100 4450
Wire Wire Line
	5100 4450 5100 5150
Wire Wire Line
	4950 4450 5100 4450
Wire Wire Line
	4950 4450 4950 4700
Text Label 6300 4950 0    50   ~ 0
RXD
Text Label 6300 5050 0    50   ~ 0
TXD
Wire Wire Line
	6250 4950 6300 4950
Wire Wire Line
	6250 5050 6300 5050
Text Label 6250 2150 0    50   ~ 0
RX_W
Text Label 6250 2250 0    50   ~ 0
TX_W
Wire Wire Line
	4900 2450 4850 2450
Wire Wire Line
	4900 1550 4850 1550
$Comp
L Power_Protection:SP0503BAHT D11
U 1 1 5E9BA501
P 5000 5750
F 0 "D11" H 4700 5600 50  0000 L CNN
F 1 "SP0503" H 4700 5500 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-143" H 5225 5700 50  0001 L CNN
F 3 "http://www.littelfuse.com/~/media/files/littelfuse/technical%20resources/documents/data%20sheets/sp05xxba.pdf" H 5125 5875 50  0001 C CNN
F 4 "SP0503BAHTG" H 5000 5750 50  0001 C CNN "Артикул"
F 5 "https://www.chipdip.ru/product/sp0503bahtg" H 5000 5750 50  0001 C CNN "Ссылка"
F 6 "44" H 5000 5750 50  0001 C CNN "Цена"
	1    5000 5750
	1    0    0    -1  
$EndComp
Wire Wire Line
	5100 5550 5100 5150
Connection ~ 5100 5150
Wire Wire Line
	4850 5350 4900 5350
Wire Wire Line
	5000 5550 5000 5250
Connection ~ 5000 5250
Wire Wire Line
	5000 5250 4850 5250
Wire Wire Line
	4900 5550 4900 5350
Connection ~ 4900 5350
Wire Wire Line
	4900 5350 5250 5350
$Comp
L UBD-rescue:GND-power #PWR015
U 1 1 5E9F6866
P 5750 7250
F 0 "#PWR015" H 5750 7000 50  0001 C CNN
F 1 "GND" H 5755 7077 50  0000 C CNN
F 2 "" H 5750 7250 50  0001 C CNN
F 3 "" H 5750 7250 50  0001 C CNN
	1    5750 7250
	1    0    0    -1  
$EndComp
Wire Wire Line
	5750 7250 5750 7150
$Comp
L UBD-rescue:GND-power #PWR011
U 1 1 5EA056A5
P 5000 7250
F 0 "#PWR011" H 5000 7000 50  0001 C CNN
F 1 "GND" H 5005 7077 50  0000 C CNN
F 2 "" H 5000 7250 50  0001 C CNN
F 3 "" H 5000 7250 50  0001 C CNN
	1    5000 7250
	1    0    0    -1  
$EndComp
Wire Wire Line
	5000 7250 5000 5950
$Comp
L Memory_EEPROM:AT24CS32-SSHM U5
U 1 1 5EA469D2
P 7050 6500
F 0 "U5" H 6600 6850 50  0000 C CNN
F 1 "AT24CS256" H 6750 6750 50  0000 C CNN
F 2 "Package_SO:SOIC-8_3.9x4.9mm_P1.27mm" H 7050 6500 50  0001 C CNN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/Atmel-8869-SEEPROM-AT24CS32-Datasheet.pdf" H 7050 6500 50  0001 C CNN
F 4 "AT24CS256" H 7050 6500 50  0001 C CNN "Артикул"
F 5 "https://www.chipdip.ru/product/at24cs02-sshm-t-microchip" H 7050 6500 50  0001 C CNN "Ссылка"
F 6 "40" H 7050 6500 50  0001 C CNN "Цена"
	1    7050 6500
	1    0    0    -1  
$EndComp
$Comp
L UBD-rescue:GND-power #PWR024
U 1 1 5EA476CB
P 7050 6850
F 0 "#PWR024" H 7050 6600 50  0001 C CNN
F 1 "GND" H 7055 6677 50  0000 C CNN
F 2 "" H 7050 6850 50  0001 C CNN
F 3 "" H 7050 6850 50  0001 C CNN
	1    7050 6850
	1    0    0    -1  
$EndComp
$Comp
L UBD-rescue:GND-power #PWR020
U 1 1 5EA47B41
P 6550 6850
F 0 "#PWR020" H 6550 6600 50  0001 C CNN
F 1 "GND" H 6555 6677 50  0000 C CNN
F 2 "" H 6550 6850 50  0001 C CNN
F 3 "" H 6550 6850 50  0001 C CNN
	1    6550 6850
	1    0    0    -1  
$EndComp
Wire Wire Line
	6550 6850 6550 6600
Wire Wire Line
	6550 6400 6650 6400
Wire Wire Line
	6650 6500 6550 6500
Connection ~ 6550 6500
Wire Wire Line
	6550 6500 6550 6400
Wire Wire Line
	6650 6600 6550 6600
Connection ~ 6550 6600
Wire Wire Line
	6550 6600 6550 6500
Wire Wire Line
	7050 6850 7050 6800
$Comp
L UBD-rescue:GND-power #PWR025
U 1 1 5EA84FCD
P 7550 6850
F 0 "#PWR025" H 7550 6600 50  0001 C CNN
F 1 "GND" H 7555 6677 50  0000 C CNN
F 2 "" H 7550 6850 50  0001 C CNN
F 3 "" H 7550 6850 50  0001 C CNN
	1    7550 6850
	1    0    0    -1  
$EndComp
Wire Wire Line
	7550 6850 7550 6600
Wire Wire Line
	7550 6600 7450 6600
$Comp
L UBD-rescue:R-Device R12
U 1 1 5EA95B16
P 7500 6200
F 0 "R12" H 7400 6150 50  0000 C CNN
F 1 "10k" V 7500 6200 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 7430 6200 50  0001 C CNN
F 3 "~" H 7500 6200 50  0001 C CNN
F 4 "0.063Вт 0603 10 кОм, 1%" H 150 -450 50  0001 C CNN "Артикул"
F 5 "https://www.chipdip.ru/product0/9000079736" H 150 -450 50  0001 C CNN "Ссылка"
F 6 "0,9" H 150 -450 50  0001 C CNN "Цена"
	1    7500 6200
	1    0    0    1   
$EndComp
$Comp
L UBD-rescue:R-Device R13
U 1 1 5EAD589D
P 7600 6200
F 0 "R13" H 7700 6150 50  0000 C CNN
F 1 "10k" V 7600 6200 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 7530 6200 50  0001 C CNN
F 3 "~" H 7600 6200 50  0001 C CNN
F 4 "0.063Вт 0603 10 кОм, 1%" H 250 -450 50  0001 C CNN "Артикул"
F 5 "https://www.chipdip.ru/product0/9000079736" H 250 -450 50  0001 C CNN "Ссылка"
F 6 "0,9" H 250 -450 50  0001 C CNN "Цена"
	1    7600 6200
	1    0    0    1   
$EndComp
Wire Wire Line
	7450 6400 7500 6400
Wire Wire Line
	7500 6400 7500 6350
Wire Wire Line
	7450 6500 7600 6500
Wire Wire Line
	7600 6500 7600 6350
$Comp
L UBD-rescue:+3.3V-power #PWR022
U 1 1 5EAF64EE
P 7050 5950
F 0 "#PWR022" H 7050 5800 50  0001 C CNN
F 1 "+3.3V" H 7065 6123 50  0000 C CNN
F 2 "" H 7050 5950 50  0001 C CNN
F 3 "" H 7050 5950 50  0001 C CNN
	1    7050 5950
	-1   0    0    -1  
$EndComp
$Comp
L UBD-rescue:+3.3V-power #PWR026
U 1 1 5EAF69F2
P 7600 5950
F 0 "#PWR026" H 7600 5800 50  0001 C CNN
F 1 "+3.3V" H 7615 6123 50  0000 C CNN
F 2 "" H 7600 5950 50  0001 C CNN
F 3 "" H 7600 5950 50  0001 C CNN
	1    7600 5950
	-1   0    0    -1  
$EndComp
Wire Wire Line
	7600 5950 7600 6000
Wire Wire Line
	7500 6050 7500 6000
Wire Wire Line
	7500 6000 7600 6000
Connection ~ 7600 6000
Wire Wire Line
	7600 6000 7600 6050
Wire Wire Line
	7050 5950 7050 6200
Text Label 7750 6400 0    50   ~ 0
SDA
Text Label 7750 6500 0    50   ~ 0
SCL
Wire Wire Line
	7750 6500 7600 6500
Connection ~ 7600 6500
Wire Wire Line
	7750 6400 7500 6400
Connection ~ 7500 6400
Text Label 4850 2550 2    50   ~ 0
SCL
Text Label 4850 2650 2    50   ~ 0
SDA
Text Label 7325 4000 0    50   ~ 0
bit0
Wire Wire Line
	7275 4000 7325 4000
Text Label 7325 4100 0    50   ~ 0
bit1
Wire Wire Line
	7275 4100 7325 4100
Text Label 7325 4200 0    50   ~ 0
bit2
Wire Wire Line
	7275 4200 7325 4200
Text Label 7325 4300 0    50   ~ 0
bit3
Wire Wire Line
	7275 4300 7325 4300
Text Label 7325 4400 0    50   ~ 0
bit4
Wire Wire Line
	7275 4400 7325 4400
Text Label 7325 4500 0    50   ~ 0
bit5
Wire Wire Line
	7275 4500 7325 4500
Text Label 7325 4925 0    50   ~ 0
bit6
Wire Wire Line
	7275 4925 7325 4925
Text Label 7325 5025 0    50   ~ 0
bit7
Wire Wire Line
	7275 5025 7325 5025
Wire Wire Line
	4900 3450 4850 3450
Text Label 6250 2750 0    50   ~ 0
bit2
Wire Wire Line
	4900 3350 4850 3350
Text Label 4850 3450 2    50   ~ 0
bit3
Wire Wire Line
	4900 3250 4850 3250
Text Label 4850 3350 2    50   ~ 0
bit4
Wire Wire Line
	4900 3150 4850 3150
Text Label 4850 3250 2    50   ~ 0
bit5
Wire Wire Line
	4900 2050 4850 2050
Text Label 4850 3150 2    50   ~ 0
bit6
Wire Wire Line
	4900 1950 4850 1950
Text Label 4850 2050 2    50   ~ 0
bit7
Wire Wire Line
	6200 2650 6250 2650
$Comp
L Connector_Generic:Conn_01x02 J2
U 1 1 5E3B460A
P 1400 5450
F 0 "J2" H 1250 5550 50  0000 L CNN
F 1 "Ignition" H 1350 5550 50  0000 L CNN
F 2 "Connector_JST:JST_XH_S2B-XH-A_1x02_P2.50mm_Horizontal" H 1400 5450 50  0001 C CNN
F 3 "~" H 1400 5450 50  0001 C CNN
F 4 "CWF-2R (DS1069-2 MR-A)  CHU-2 (DS1069-2 F)" H 1400 5450 50  0001 C CNN "Артикул"
F 5 "https://www.chipdip.ru/product/cwf-2r-ds1069-2-mr   https://www.chipdip.ru/product/chu-2" H 1400 5450 50  0001 C CNN "Ссылка"
F 6 "6+6" H 1400 5450 50  0001 C CNN "Цена"
	1    1400 5450
	1    0    0    -1  
$EndComp
Text Label 1150 5800 2    50   ~ 0
Tr_NO2
Wire Wire Line
	1150 5900 1200 5900
Wire Wire Line
	1150 5800 1200 5800
Text Label 1150 5900 2    50   ~ 0
Tr_NO1
$Comp
L Connector_Generic:Conn_01x02 J5
U 1 1 5E3EE6C6
P 1400 5800
F 0 "J5" H 1250 5900 50  0000 L CNN
F 1 "Turtle" H 1350 5900 50  0000 L CNN
F 2 "Connector_JST:JST_XH_S2B-XH-A_1x02_P2.50mm_Horizontal" H 1400 5800 50  0001 C CNN
F 3 "~" H 1400 5800 50  0001 C CNN
F 4 "CWF-2R (DS1069-2 MR-A)  CHU-2 (DS1069-2 F)" H 1400 5800 50  0001 C CNN "Артикул"
F 5 "https://www.chipdip.ru/product/cwf-2r-ds1069-2-mr   https://www.chipdip.ru/product/chu-2" H 1400 5800 50  0001 C CNN "Ссылка"
F 6 "6+6" H 1400 5800 50  0001 C CNN "Цена"
	1    1400 5800
	1    0    0    -1  
$EndComp
Wire Wire Line
	1525 2350 1525 2400
Wire Wire Line
	1525 2400 1600 2400
Wire Wire Line
	1600 2400 1600 2250
Wire Wire Line
	1600 2250 1625 2250
$Comp
L Connector_Generic:Conn_01x04 J6
U 1 1 5E24329A
P 3550 7375
F 0 "J6" H 3500 6975 50  0000 L CNN
F 1 "Удар" H 3475 7075 50  0000 L CNN
F 2 "Connector_JST:JST_XH_S4B-XH-A_1x04_P2.50mm_Horizontal" H 3550 7375 50  0001 C CNN
F 3 "~" H 3550 7375 50  0001 C CNN
F 4 "CWF-4R (DS1069-4 MR-A)  CHU-4 (DS1069-4 F)" H 3550 7375 50  0001 C CNN "Артикул"
F 5 "https://www.chipdip.ru/product/cwf-4r-ds1069-4-mr  https://www.chipdip.ru/product/chu-4" H 3550 7375 50  0001 C CNN "Ссылка"
F 6 "6+6" H 3550 7375 50  0001 C CNN "Цена"
	1    3550 7375
	1    0    0    1   
$EndComp
Text Label 6250 3050 0    50   ~ 0
bit0
Wire Wire Line
	6200 2750 6250 2750
Text Label 6250 2550 0    50   ~ 0
Data0
Wire Wire Line
	6250 2550 6200 2550
Text Label 6250 2450 0    50   ~ 0
Ig
Wire Wire Line
	6200 2450 6250 2450
Text Label 6250 2350 0    50   ~ 0
Tr
Wire Wire Line
	6250 2350 6200 2350
Wire Wire Line
	6250 2050 6200 2050
$Comp
L UBD-rescue:CP-Device C7
U 1 1 5E2AAE28
P 6925 675
F 0 "C7" H 7043 721 50  0000 L CNN
F 1 "220uF" H 7043 630 50  0000 L CNN
F 2 "Capacitor_SMD:CP_Elec_8x10.5" H 6963 525 50  0001 C CNN
F 3 "~" H 6925 675 50  0001 C CNN
F 4 "2" H 3625 -425 50  0001 C CNN "Номер"
F 5 "ECAP SMD, 220 мкФ, 25В" H 3625 -425 50  0001 C CNN "Артикул"
F 6 "https://www.chipdip.ru/product0/57194" H 3625 -425 50  0001 C CNN "Ссылка"
F 7 "24" H 3625 -425 50  0001 C CNN "Цена"
	1    6925 675 
	1    0    0    -1  
$EndComp
$Comp
L UBD-rescue:GND-power #PWR0103
U 1 1 5E2AC1ED
P 6925 875
F 0 "#PWR0103" H 6925 625 50  0001 C CNN
F 1 "GND" H 6775 825 50  0000 C CNN
F 2 "" H 6925 875 50  0001 C CNN
F 3 "" H 6925 875 50  0001 C CNN
	1    6925 875 
	-1   0    0    -1  
$EndComp
$Comp
L UBD-rescue:+3.3V-power #PWR0104
U 1 1 5E2AC51E
P 6925 475
F 0 "#PWR0104" H 6925 325 50  0001 C CNN
F 1 "+3.3V" H 6940 648 50  0000 C CNN
F 2 "" H 6925 475 50  0001 C CNN
F 3 "" H 6925 475 50  0001 C CNN
	1    6925 475 
	-1   0    0    -1  
$EndComp
Wire Wire Line
	6925 475  6925 525 
Wire Wire Line
	6925 825  6925 875 
$Comp
L UBD-rescue:C-Device C12
U 1 1 5E3045B4
P 6450 1475
F 0 "C12" H 6565 1521 50  0000 L CNN
F 1 "1uF" H 6565 1430 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 6488 1325 50  0001 C CNN
F 3 "~" H 6450 1475 50  0001 C CNN
F 4 "3" H 3750 -2475 50  0001 C CNN "Номер"
F 5 "GRM188R61E105KAADD" H 3750 -2475 50  0001 C CNN "Артикул"
F 6 "https://www.chipdip.ru/product/grm188r61e105k" H 3750 -2475 50  0001 C CNN "Ссылка"
F 7 "5" H 3750 -2475 50  0001 C CNN "Цена"
	1    6450 1475
	1    0    0    -1  
$EndComp
$Comp
L UBD-rescue:+3.3V-power #PWR023
U 1 1 5E3045BA
P 6450 1275
F 0 "#PWR023" H 6450 1125 50  0001 C CNN
F 1 "+3.3V" H 6465 1448 50  0000 C CNN
F 2 "" H 6450 1275 50  0001 C CNN
F 3 "" H 6450 1275 50  0001 C CNN
	1    6450 1275
	-1   0    0    -1  
$EndComp
$Comp
L UBD-rescue:GND-power #PWR027
U 1 1 5E3045C0
P 6450 1675
F 0 "#PWR027" H 6450 1425 50  0001 C CNN
F 1 "GND" H 6300 1625 50  0000 C CNN
F 2 "" H 6450 1675 50  0001 C CNN
F 3 "" H 6450 1675 50  0001 C CNN
	1    6450 1675
	-1   0    0    -1  
$EndComp
Wire Wire Line
	6450 1275 6450 1325
Wire Wire Line
	6450 1675 6450 1625
$Comp
L UBD-rescue:+3.3V-power #PWR0106
U 1 1 5E3414AA
P 3300 7125
F 0 "#PWR0106" H 3300 6975 50  0001 C CNN
F 1 "+3.3V" H 3315 7298 50  0000 C CNN
F 2 "" H 3300 7125 50  0001 C CNN
F 3 "" H 3300 7125 50  0001 C CNN
	1    3300 7125
	-1   0    0    -1  
$EndComp
$Comp
L UBD-rescue:GND-power #PWR0107
U 1 1 5E341973
P 3300 7525
F 0 "#PWR0107" H 3300 7275 50  0001 C CNN
F 1 "GND" H 3305 7352 50  0000 C CNN
F 2 "" H 3300 7525 50  0001 C CNN
F 3 "" H 3300 7525 50  0001 C CNN
	1    3300 7525
	1    0    0    -1  
$EndComp
Wire Wire Line
	3350 7175 3300 7175
Wire Wire Line
	3300 7175 3300 7125
Wire Wire Line
	3350 7475 3300 7475
Wire Wire Line
	3300 7475 3300 7525
$Comp
L UBD-rescue:C-Device C13
U 1 1 5E3829EA
P 6650 2275
F 0 "C13" H 6765 2321 50  0000 L CNN
F 1 "1uF" H 6765 2230 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 6688 2125 50  0001 C CNN
F 3 "~" H 6650 2275 50  0001 C CNN
F 4 "3" H 3950 -1675 50  0001 C CNN "Номер"
F 5 "GRM188R61E105KAADD" H 3950 -1675 50  0001 C CNN "Артикул"
F 6 "https://www.chipdip.ru/product/grm188r61e105k" H 3950 -1675 50  0001 C CNN "Ссылка"
F 7 "5" H 3950 -1675 50  0001 C CNN "Цена"
	1    6650 2275
	1    0    0    -1  
$EndComp
$Comp
L UBD-rescue:+3.3V-power #PWR0115
U 1 1 5E3829F0
P 6650 2075
F 0 "#PWR0115" H 6650 1925 50  0001 C CNN
F 1 "+3.3V" H 6665 2248 50  0000 C CNN
F 2 "" H 6650 2075 50  0001 C CNN
F 3 "" H 6650 2075 50  0001 C CNN
	1    6650 2075
	-1   0    0    -1  
$EndComp
$Comp
L UBD-rescue:GND-power #PWR0116
U 1 1 5E3829F6
P 6650 2475
F 0 "#PWR0116" H 6650 2225 50  0001 C CNN
F 1 "GND" H 6500 2425 50  0000 C CNN
F 2 "" H 6650 2475 50  0001 C CNN
F 3 "" H 6650 2475 50  0001 C CNN
	1    6650 2475
	-1   0    0    -1  
$EndComp
Wire Wire Line
	6650 2075 6650 2125
Wire Wire Line
	6650 2475 6650 2425
Text Label 4850 3050 2    50   ~ 0
Udar
Wire Wire Line
	4850 3050 4900 3050
Text Label 4850 2950 2    50   ~ 0
Tx_ud
Wire Wire Line
	4850 2950 4900 2950
Text Label 3300 7275 2    50   ~ 0
Udar
Wire Wire Line
	3300 7275 3350 7275
Text Label 3300 7375 2    50   ~ 0
Tx_ud
Wire Wire Line
	3300 7375 3350 7375
Text Label 7325 5125 0    50   ~ 0
bit8
Text Label 7325 5225 0    50   ~ 0
bit9
Wire Wire Line
	7275 5125 7325 5125
Wire Wire Line
	7275 5225 7325 5225
Text Label 6250 3150 0    50   ~ 0
bit1
Wire Wire Line
	6200 3050 6250 3050
Wire Wire Line
	6200 3150 6250 3150
Text Label 4850 1950 2    50   ~ 0
bit8
Text Label 6250 2650 0    50   ~ 0
bit9
$Comp
L Switch:SW_DIP_x06 SW1
U 1 1 5E3CAFFE
P 6975 4300
F 0 "SW1" H 6975 4867 50  0000 C CNN
F 1 "SW_DIP_x06" H 6975 4776 50  0000 C CNN
F 2 "Button_Switch_SMD:SW_DIP_SPSTx06_Slide_Omron_A6H-6101_W6.15mm_P1.27mm" H 6975 4300 50  0001 C CNN
F 3 "~" H 6975 4300 50  0001 C CNN
F 4 "https://www.platan.ru/cgi-bin/qwery.pl/id=895954746" H 6975 4300 50  0001 C CNN "Ссылка"
F 5 "75" H 6975 4300 50  0001 C CNN "Цена"
	1    6975 4300
	-1   0    0    -1  
$EndComp
$Comp
L Switch:SW_DIP_x06 SW2
U 1 1 5E3CD712
P 6975 5225
F 0 "SW2" H 6975 5792 50  0000 C CNN
F 1 "SW_DIP_x06" H 6975 5701 50  0000 C CNN
F 2 "Button_Switch_SMD:SW_DIP_SPSTx06_Slide_Omron_A6H-6101_W6.15mm_P1.27mm" H 6975 5225 50  0001 C CNN
F 3 "~" H 6975 5225 50  0001 C CNN
F 4 "https://www.platan.ru/cgi-bin/qwery.pl/id=895954746" H 6975 5225 50  0001 C CNN "Ссылка"
F 5 "75" H 6975 5225 50  0001 C CNN "Цена"
	1    6975 5225
	-1   0    0    -1  
$EndComp
Text Label 7325 5325 0    50   ~ 0
bit10
Text Label 7325 5425 0    50   ~ 0
bit11
Wire Wire Line
	7325 5325 7275 5325
Wire Wire Line
	7325 5425 7275 5425
Wire Wire Line
	6675 4000 6625 4000
Wire Wire Line
	6625 4000 6625 4100
Wire Wire Line
	6625 5425 6675 5425
Wire Wire Line
	6675 5325 6625 5325
Connection ~ 6625 5325
Wire Wire Line
	6625 5325 6625 5425
Wire Wire Line
	6675 5225 6625 5225
Connection ~ 6625 5225
Wire Wire Line
	6625 5225 6625 5325
Wire Wire Line
	6675 5125 6625 5125
Connection ~ 6625 5125
Wire Wire Line
	6625 5125 6625 5225
Wire Wire Line
	6675 5025 6625 5025
Connection ~ 6625 5025
Wire Wire Line
	6625 5025 6625 5125
Wire Wire Line
	6675 4925 6625 4925
Connection ~ 6625 4925
Wire Wire Line
	6625 4925 6625 5025
Wire Wire Line
	6675 4500 6625 4500
Connection ~ 6625 4500
Wire Wire Line
	6625 4500 6625 4925
Wire Wire Line
	6675 4400 6625 4400
Connection ~ 6625 4400
Wire Wire Line
	6625 4400 6625 4500
Wire Wire Line
	6675 4300 6625 4300
Connection ~ 6625 4300
Wire Wire Line
	6625 4300 6625 4400
Wire Wire Line
	6675 4200 6625 4200
Connection ~ 6625 4200
Wire Wire Line
	6625 4200 6625 4300
Wire Wire Line
	6675 4100 6625 4100
Connection ~ 6625 4100
Wire Wire Line
	6625 4100 6625 4200
$Comp
L UBD-rescue:GND-power #PWR0117
U 1 1 5E534C3E
P 6625 5500
F 0 "#PWR0117" H 6625 5250 50  0001 C CNN
F 1 "GND" H 6630 5327 50  0000 C CNN
F 2 "" H 6625 5500 50  0001 C CNN
F 3 "" H 6625 5500 50  0001 C CNN
	1    6625 5500
	1    0    0    -1  
$EndComp
Wire Wire Line
	6625 5500 6625 5425
Connection ~ 6625 5425
Wire Wire Line
	4850 2850 4900 2850
Wire Wire Line
	4850 2750 4900 2750
Text Label 4850 2350 2    50   ~ 0
bit10
Text Label 6250 3450 0    50   ~ 0
bit11
$Comp
L UBD_Lib:LIS3DHTR D12
U 1 1 5E3FB301
P 6150 7375
F 0 "D12" H 6450 7050 50  0000 R CNN
F 1 "LIS3DHTR" H 6650 6975 50  0000 R CNN
F 2 "Package_LGA:LGA-16_3x3mm_P0.5mm_LayoutBorder3x5y" H 6150 7375 50  0001 C CNN
F 3 "" H 6150 7375 50  0001 C CNN
F 4 "https://www.chipdip.ru/product/lis3dhtr" H 6150 7375 50  0001 C CNN "Ссылка"
F 5 "42" H 6150 7375 50  0001 C CNN "Цена"
	1    6150 7375
	1    0    0    -1  
$EndComp
Wire Wire Line
	6300 8675 6300 8750
Wire Wire Line
	6300 8750 6200 8750
Wire Wire Line
	6000 8750 6000 8675
Wire Wire Line
	6100 8675 6100 8750
Connection ~ 6100 8750
Wire Wire Line
	6100 8750 6000 8750
Wire Wire Line
	6200 8675 6200 8750
Connection ~ 6200 8750
Wire Wire Line
	6200 8750 6100 8750
Wire Wire Line
	6650 8500 6700 8500
Wire Wire Line
	6700 8500 6700 8750
Wire Wire Line
	6700 8750 6300 8750
Connection ~ 6300 8750
Wire Wire Line
	6650 8400 6700 8400
Wire Wire Line
	6700 8400 6700 8500
Connection ~ 6700 8500
Wire Wire Line
	6650 8100 6700 8100
Wire Wire Line
	6700 8100 6700 8200
Connection ~ 6700 8400
Wire Wire Line
	6650 8200 6700 8200
Connection ~ 6700 8200
Wire Wire Line
	6700 8200 6700 8300
Wire Wire Line
	6650 8300 6700 8300
Connection ~ 6700 8300
Wire Wire Line
	6700 8300 6700 8400
Wire Wire Line
	6250 7725 6250 7675
Wire Wire Line
	6050 7675 6050 7725
Wire Wire Line
	6150 7725 6150 7675
Wire Wire Line
	6050 7675 6150 7675
Connection ~ 6150 7675
Wire Wire Line
	6150 7675 6250 7675
$Comp
L UBD-rescue:GND-power #PWR028
U 1 1 5E50F1CF
P 6000 8850
F 0 "#PWR028" H 6000 8600 50  0001 C CNN
F 1 "GND" H 6150 8775 50  0000 C CNN
F 2 "" H 6000 8850 50  0001 C CNN
F 3 "" H 6000 8850 50  0001 C CNN
	1    6000 8850
	1    0    0    -1  
$EndComp
Wire Wire Line
	6000 8850 6000 8750
Connection ~ 6000 8750
$Comp
L UBD-rescue:+3.3V-power #PWR029
U 1 1 5E5405D6
P 6250 7550
F 0 "#PWR029" H 6250 7400 50  0001 C CNN
F 1 "+3.3V" H 6100 7625 50  0000 C CNN
F 2 "" H 6250 7550 50  0001 C CNN
F 3 "" H 6250 7550 50  0001 C CNN
	1    6250 7550
	-1   0    0    -1  
$EndComp
Wire Wire Line
	6250 7550 6250 7675
Connection ~ 6250 7675
Text Notes 5325 7625 0    50   ~ 0
i2c addresss 0x30
Text Notes 6725 7150 0    50   ~ 0
i2c addresss 0x50
Text Label 5600 8150 2    50   ~ 0
SDA
Text Label 5600 8250 2    50   ~ 0
SCL
Wire Wire Line
	5600 8250 5650 8250
Wire Wire Line
	5600 8150 5650 8150
$EndSCHEMATC
