EESchema Schematic File Version 4
LIBS:UBD-cache
EELAYER 29 0
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
L UBD-rescue:ATmega128-16AU-MCU_Microchip_ATmega U4
U 1 1 5CB0F84B
P 5500 2750
F 0 "U4" H 5900 4750 50  0000 C CNN
F 1 "ATmega128-16AU" H 5600 3650 50  0000 C CNN
F 2 "Package_QFP:TQFP-64_14x14mm_P0.8mm" H 5500 2750 50  0001 C CIN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/doc2467.pdf" H 5500 2750 50  0001 C CNN
F 4 "ATmega128A-AU" H 0   0   50  0001 C CNN "Артикул"
F 5 "https://www.chipdip.ru/product/atmega128a-au" H 0   0   50  0001 C CNN "Ссылка"
F 6 "260" H 0   0   50  0001 C CNN "Цена"
	1    5500 2750
	1    0    0    -1  
$EndComp
$Comp
L UBD-rescue:ESP-12F-RF_Module U3
U 1 1 5CB187AB
P 6900 8000
F 0 "U3" H 7350 8750 50  0000 C CNN
F 1 "ESP-12F" H 7200 7450 50  0000 C CNN
F 2 "UBD:ESP-12E" H 6900 8000 50  0001 C CNN
F 3 "http://wiki.ai-thinker.com/_media/esp8266/esp8266_series_modules_user_manual_v1.1.pdf" H 6550 8100 50  0001 C CNN
F 4 "ESP-12F" H 200 550 50  0001 C CNN "Артикул"
F 5 "https://ru.aliexpress.com/item/1PCS-ESP-12F-ESP-12E-upgrade-ESP8266-Remote-Serial-Port-WIFI-Wireless-Module-ESP8266-4M-Flash/32808593889.html?spm=a2g0v.search0604.3.54.756a7bd4h24yBq&ws_ab_test=searchweb0_0,searchweb201602_10_10065_10068_319_317_10696_453_10084_454_10083_10618_10307_10301_537_536_10059_10884_10889_10887_321_322_10915_10103_10914_10911_10910,searchweb201603_52,ppcSwitch_0&algo_expid=fb9e239b-b278-458b-882f-3e2b43ccfff1-8&algo_pvid=fb9e239b-b278-458b-882f-3e2b43ccfff1" H 200 550 50  0001 C CNN "Ссылка"
F 6 "93" H 200 550 50  0001 C CNN "Цена"
	1    6900 8000
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
P 6900 2350
F 0 "Q1" H 7091 2396 50  0000 L CNN
F 1 "BC817" H 7091 2305 50  0000 L CNN
F 2 "UBD:SOT-23" H 7100 2275 50  0001 L CIN
F 3 "http://www.fairchildsemi.com/ds/BC/BC817.pdf" H 6900 2350 50  0001 L CNN
F 4 "BC817.215" H 50  0   50  0001 C CNN "Артикул"
F 5 "https://www.chipdip.ru/product/bc817.215" H 50  0   50  0001 C CNN "Ссылка"
F 6 "3" H 50  0   50  0001 C CNN "Цена"
	1    6900 2350
	1    0    0    -1  
$EndComp
Wire Wire Line
	4900 1250 4500 1250
$Comp
L UBD-rescue:R-Device R2
U 1 1 5CB38DAB
P 4750 800
F 0 "R2" H 4820 846 50  0000 L CNN
F 1 "390k" H 4800 750 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 4680 800 50  0001 C CNN
F 3 "~" H 4750 800 50  0001 C CNN
F 4 "0.063Вт 0603 390 кОм, 1%" H 0   0   50  0001 C CNN "Артикул"
F 5 "https://www.chipdip.ru/product0/9000079774" H 0   0   50  0001 C CNN "Ссылка"
F 6 "0,9" H 0   0   50  0001 C CNN "Цена"
	1    4750 800 
	1    0    0    -1  
$EndComp
Wire Wire Line
	4900 1050 4750 1050
Wire Wire Line
	4750 1050 4750 950 
Text Label 4650 1050 2    50   ~ 0
Rst
Wire Wire Line
	4650 1050 4750 1050
Connection ~ 4750 1050
$Comp
L UBD-rescue:+3.3V-power #PWR0101
U 1 1 5CB48E43
P 4750 600
F 0 "#PWR0101" H 4750 450 50  0001 C CNN
F 1 "+3.3V" H 4765 773 50  0000 C CNN
F 2 "" H 4750 600 50  0001 C CNN
F 3 "" H 4750 600 50  0001 C CNN
	1    4750 600 
	1    0    0    -1  
$EndComp
Wire Wire Line
	4750 600  4750 650 
Wire Wire Line
	5600 750  5600 650 
Wire Wire Line
	5600 650  5500 650 
Wire Wire Line
	5500 650  5500 750 
$Comp
L UBD-rescue:+3.3V-power #PWR0102
U 1 1 5CB4C153
P 5600 600
F 0 "#PWR0102" H 5600 450 50  0001 C CNN
F 1 "+3.3V" H 5615 773 50  0000 C CNN
F 2 "" H 5600 600 50  0001 C CNN
F 3 "" H 5600 600 50  0001 C CNN
	1    5600 600 
	1    0    0    -1  
$EndComp
Wire Wire Line
	5600 600  5600 650 
Connection ~ 5600 650 
$Comp
L UBD-rescue:+3.3V-power #PWR0103
U 1 1 5CB4EE5A
P 4750 1600
F 0 "#PWR0103" H 4750 1450 50  0001 C CNN
F 1 "+3.3V" H 4550 1650 50  0000 C CNN
F 2 "" H 4750 1600 50  0001 C CNN
F 3 "" H 4750 1600 50  0001 C CNN
	1    4750 1600
	1    0    0    -1  
$EndComp
Wire Wire Line
	4750 1600 4750 1650
Wire Wire Line
	4750 1650 4900 1650
$Comp
L UBD-rescue:GND-power #PWR0104
U 1 1 5CB5B40F
P 5500 4800
F 0 "#PWR0104" H 5500 4550 50  0001 C CNN
F 1 "GND" H 5505 4627 50  0000 C CNN
F 2 "" H 5500 4800 50  0001 C CNN
F 3 "" H 5500 4800 50  0001 C CNN
	1    5500 4800
	1    0    0    -1  
$EndComp
Wire Wire Line
	5500 4750 5500 4800
Wire Wire Line
	6100 1350 6150 1350
Wire Wire Line
	6150 1450 6100 1450
Wire Wire Line
	6100 1550 6150 1550
Wire Wire Line
	6150 1650 6100 1650
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
L UBD-rescue:Conn_02x03_Counter_Clockwise-Connector_Generic J1
U 1 1 5CBB95FE
P 3000 3700
F 0 "J1" H 3050 4050 50  0000 C CNN
F 1 "Для программирования" H 2800 3950 50  0000 C CNN
F 2 "UBD:PinHeader_2x03_P2.54mm_Vertical" H 3000 3700 50  0001 C CNN
F 3 "~" H 3000 3700 50  0001 C CNN
F 4 "PLD-6 (DS1021-2x3S)" H -850 0   50  0001 C CNN "Артикул"
F 5 "https://www.chipdip.ru/product/pld-6" H -850 0   50  0001 C CNN "Ссылка"
F 6 "6" H -850 0   50  0001 C CNN "Цена"
	1    3000 3700
	1    0    0    -1  
$EndComp
$Comp
L UBD-rescue:+3.3V-power #PWR0106
U 1 1 5CBC9A62
P 3350 3550
F 0 "#PWR0106" H 3350 3400 50  0001 C CNN
F 1 "+3.3V" H 3365 3723 50  0000 C CNN
F 2 "" H 3350 3550 50  0001 C CNN
F 3 "" H 3350 3550 50  0001 C CNN
	1    3350 3550
	1    0    0    -1  
$EndComp
$Comp
L UBD-rescue:GND-power #PWR0107
U 1 1 5CBCBD1E
P 3350 3850
F 0 "#PWR0107" H 3350 3600 50  0001 C CNN
F 1 "GND" H 3355 3677 50  0000 C CNN
F 2 "" H 3350 3850 50  0001 C CNN
F 3 "" H 3350 3850 50  0001 C CNN
	1    3350 3850
	1    0    0    -1  
$EndComp
Wire Wire Line
	3300 3600 3350 3600
Wire Wire Line
	3350 3600 3350 3550
Wire Wire Line
	3300 3800 3350 3800
Wire Wire Line
	3350 3800 3350 3850
Text Label 3350 3700 0    50   ~ 0
Mos
Text Label 2750 3800 2    50   ~ 0
Rst
Text Label 2750 3700 2    50   ~ 0
Sck
Text Label 2750 3600 2    50   ~ 0
Mis
Wire Wire Line
	2750 3600 2800 3600
Wire Wire Line
	2750 3700 2800 3700
Wire Wire Line
	2750 3800 2800 3800
Wire Wire Line
	3350 3700 3300 3700
Text Label 4850 3850 2    50   ~ 0
Mis
Text Label 6150 2050 0    50   ~ 0
Sck
Wire Wire Line
	6100 2050 6150 2050
Text Label 4850 3750 2    50   ~ 0
Mos
Wire Wire Line
	4850 3850 4900 3850
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
F 2 "Capacitor_THT:C_Radial_D8.0mm_H11.5mm_P3.50mm" H 1838 850 50  0001 C CNN
F 3 "~" H 1800 1000 50  0001 C CNN
F 4 "1" H 250 0   50  0001 C CNN "Номер"
F 5 "B41851F8107M000" H 250 0   50  0001 C CNN "Артикул"
F 6 "https://www.chipdip.ru/product0/9000188152" H 250 0   50  0001 C CNN "Ссылка"
F 7 "14" H 250 0   50  0001 C CNN "Цена"
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
F 1 "2200" V 3449 900 50  0000 C CNN
F 2 "UBD:L_10.4x10.4_H4.8" H 3350 900 50  0001 C CNN
F 3 "~" H 3350 900 50  0001 C CNN
F 4 "SDR0805-222KL, 2200 мкГн" H 250 0   50  0001 C CNN "Артикул"
F 5 "https://www.chipdip.ru/product/sdr0805-222kl" H 250 0   50  0001 C CNN "Ссылка"
F 6 "30" H 250 0   50  0001 C CNN "Цена"
	1    3350 900 
	0    -1   -1   0   
$EndComp
$Comp
L UBD-rescue:GND-power #PWR0122
U 1 1 5CD66DBF
P 6900 8750
F 0 "#PWR0122" H 6900 8500 50  0001 C CNN
F 1 "GND" H 6900 8575 50  0000 C CNN
F 2 "" H 6900 8750 50  0001 C CNN
F 3 "" H 6900 8750 50  0001 C CNN
	1    6900 8750
	-1   0    0    -1  
$EndComp
$Comp
L UBD-rescue:+3.3V-power #PWR0123
U 1 1 5CD6B7F4
P 6900 6950
F 0 "#PWR0123" H 6900 6800 50  0001 C CNN
F 1 "+3.3V" H 6915 7123 50  0000 C CNN
F 2 "" H 6900 6950 50  0001 C CNN
F 3 "" H 6900 6950 50  0001 C CNN
	1    6900 6950
	-1   0    0    -1  
$EndComp
Wire Wire Line
	6900 8700 6900 8750
$Comp
L UBD-rescue:GND-power #PWR0124
U 1 1 5CD72037
P 6200 8750
F 0 "#PWR0124" H 6200 8500 50  0001 C CNN
F 1 "GND" H 6200 8575 50  0000 C CNN
F 2 "" H 6200 8750 50  0001 C CNN
F 3 "" H 6200 8750 50  0001 C CNN
	1    6200 8750
	-1   0    0    -1  
$EndComp
Wire Wire Line
	6200 8300 6300 8300
$Comp
L UBD-rescue:R-Device R7
U 1 1 5CD7A08E
P 7550 7200
F 0 "R7" H 7400 7150 50  0000 C CNN
F 1 "10k" H 7400 7250 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 7480 7200 50  0001 C CNN
F 3 "~" H 7550 7200 50  0001 C CNN
F 4 "0.063Вт 0603 10 кОм, 1%" H 200 550 50  0001 C CNN "Артикул"
F 5 "https://www.chipdip.ru/product0/9000079736" H 200 550 50  0001 C CNN "Ссылка"
F 6 "0,9" H 200 550 50  0001 C CNN "Цена"
	1    7550 7200
	1    0    0    1   
$EndComp
$Comp
L UBD-rescue:+3.3V-power #PWR0125
U 1 1 5CD7C4BC
P 7550 6950
F 0 "#PWR0125" H 7550 6800 50  0001 C CNN
F 1 "+3.3V" H 7565 7123 50  0000 C CNN
F 2 "" H 7550 6950 50  0001 C CNN
F 3 "" H 7550 6950 50  0001 C CNN
	1    7550 6950
	-1   0    0    -1  
$EndComp
Wire Wire Line
	7500 7400 7550 7400
Wire Wire Line
	7550 7400 7550 7350
Wire Wire Line
	7550 7050 7550 7000
$Comp
L UBD-rescue:R-Device R8
U 1 1 5CD83466
P 7700 7200
F 0 "R8" H 7850 7150 50  0000 C CNN
F 1 "10k" H 7850 7250 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 7630 7200 50  0001 C CNN
F 3 "~" H 7700 7200 50  0001 C CNN
F 4 "0.063Вт 0603 10 кОм, 1%" H 200 550 50  0001 C CNN "Артикул"
F 5 "https://www.chipdip.ru/product0/9000079736" H 200 550 50  0001 C CNN "Ссылка"
F 6 "0,9" H 200 550 50  0001 C CNN "Цена"
	1    7700 7200
	1    0    0    1   
$EndComp
Wire Wire Line
	7700 7350 7700 7600
Wire Wire Line
	7700 7600 7500 7600
Wire Wire Line
	7700 7050 7700 7000
Connection ~ 7550 7000
Wire Wire Line
	7550 7000 7550 6950
Connection ~ 7550 7400
Text Label 6150 4450 0    50   ~ 0
Rst_wf
$Comp
L UBD-rescue:D_Schottky-Device D3
U 1 1 5CDE9346
P 3150 1100
F 0 "D3" V 3150 950 50  0000 L CNN
F 1 "Диод Шоттки" H 3195 1179 50  0001 L CNN
F 2 "Diode_SMD:D_SMA" H 3150 1100 50  0001 C CNN
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
P 1050 3575
F 0 "C6" H 1165 3621 50  0000 L CNN
F 1 "1uF" H 1165 3530 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 1088 3425 50  0001 C CNN
F 3 "~" H 1050 3575 50  0001 C CNN
F 4 "3" H -1650 -375 50  0001 C CNN "Номер"
F 5 "GRM21BR71C105KA01K" H -1650 -375 50  0001 C CNN "Артикул"
F 6 "https://www.chipdip.ru/product/grm21br71c105k" H -1650 -375 50  0001 C CNN "Ссылка"
F 7 "4" H -1650 -375 50  0001 C CNN "Цена"
	1    1050 3575
	1    0    0    -1  
$EndComp
$Comp
L UBD-rescue:+3.3V-power #PWR05
U 1 1 5CC12317
P 1050 3375
F 0 "#PWR05" H 1050 3225 50  0001 C CNN
F 1 "+3.3V" H 1065 3548 50  0000 C CNN
F 2 "" H 1050 3375 50  0001 C CNN
F 3 "" H 1050 3375 50  0001 C CNN
	1    1050 3375
	-1   0    0    -1  
$EndComp
$Comp
L UBD-rescue:GND-power #PWR06
U 1 1 5CC1231D
P 1050 3775
F 0 "#PWR06" H 1050 3525 50  0001 C CNN
F 1 "GND" H 900 3725 50  0000 C CNN
F 2 "" H 1050 3775 50  0001 C CNN
F 3 "" H 1050 3775 50  0001 C CNN
	1    1050 3775
	-1   0    0    -1  
$EndComp
Wire Wire Line
	1050 3375 1050 3425
Wire Wire Line
	1050 3775 1050 3725
$Comp
L UBD-rescue:R-Device R9
U 1 1 5CC5F549
P 6450 2350
F 0 "R9" V 6550 2350 50  0000 C CNN
F 1 "360" V 6450 2350 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 6380 2350 50  0001 C CNN
F 3 "~" H 6450 2350 50  0001 C CNN
F 4 " 0.1Вт 0603 360 Ом, 1%" H 0   0   50  0001 C CNN "Артикул"
F 5 "https://www.chipdip.ru/product0/9000079629" H 0   0   50  0001 C CNN "Ссылка"
F 6 "0,9" H 0   0   50  0001 C CNN "Цена"
	1    6450 2350
	0    -1   -1   0   
$EndComp
$Comp
L UBD-rescue:GND-power #PWR07
U 1 1 5CC6E28A
P 7000 2600
F 0 "#PWR07" H 7000 2350 50  0001 C CNN
F 1 "GND" H 7005 2427 50  0000 C CNN
F 2 "" H 7000 2600 50  0001 C CNN
F 3 "" H 7000 2600 50  0001 C CNN
	1    7000 2600
	1    0    0    -1  
$EndComp
Wire Wire Line
	7000 2600 7000 2550
$Comp
L UBD-rescue:BC817-Transistor_BJT Q2
U 1 1 5CC91704
P 6900 1400
F 0 "Q2" H 7091 1446 50  0000 L CNN
F 1 "BC817" H 7091 1355 50  0000 L CNN
F 2 "UBD:SOT-23" H 7100 1325 50  0001 L CIN
F 3 "http://www.fairchildsemi.com/ds/BC/BC817.pdf" H 6900 1400 50  0001 L CNN
F 4 "BC817.215" H 50  -2950 50  0001 C CNN "Артикул"
F 5 "https://www.chipdip.ru/product/bc817.215" H 50  -2950 50  0001 C CNN "Ссылка"
F 6 "3" H 50  -2950 50  0001 C CNN "Цена"
	1    6900 1400
	1    0    0    -1  
$EndComp
$Comp
L UBD-rescue:GND-power #PWR08
U 1 1 5CC91711
P 7000 1650
F 0 "#PWR08" H 7000 1400 50  0001 C CNN
F 1 "GND" H 7005 1477 50  0000 C CNN
F 2 "" H 7000 1650 50  0001 C CNN
F 3 "" H 7000 1650 50  0001 C CNN
	1    7000 1650
	1    0    0    -1  
$EndComp
Wire Wire Line
	7000 1650 7000 1600
Wire Wire Line
	6100 2350 6300 2350
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
$Comp
L UBD-rescue:SW_DIP_x08-Switch SW1
U 1 1 5CEB50BD
P 6450 3250
F 0 "SW1" H 6450 3900 50  0000 C CNN
F 1 "Выбор адреса" H 6450 3800 50  0000 C CNN
F 2 "UBD:SW_DIP_SPSTx08_Slide_Omron_A6H-8101_W6.15mm_P1.27mm" H 6450 3250 50  0001 C CNN
F 3 "~" H 6450 3250 50  0001 C CNN
F 4 "NHDS-08" H 0   0   50  0001 C CNN "Артикул"
F 5 "http://www.platan.ru/cgi-bin/qwery.pl/id=105430408" H 0   0   50  0001 C CNN "Ссылка"
F 6 "70" H 0   0   50  0001 C CNN "Цена"
	1    6450 3250
	1    0    0    -1  
$EndComp
Wire Wire Line
	7550 7000 7700 7000
Wire Wire Line
	7550 7400 7800 7400
Wire Wire Line
	6100 2850 6150 2850
Wire Wire Line
	6100 2950 6150 2950
Wire Wire Line
	6100 3050 6150 3050
Wire Wire Line
	6100 3150 6150 3150
Wire Wire Line
	6100 3250 6150 3250
Wire Wire Line
	6100 3350 6150 3350
Wire Wire Line
	6100 3450 6150 3450
Wire Wire Line
	6100 3550 6150 3550
Wire Wire Line
	6750 2850 6800 2850
Wire Wire Line
	6800 2850 6800 2950
Wire Wire Line
	6800 3550 6750 3550
Wire Wire Line
	6750 3450 6800 3450
Connection ~ 6800 3450
Wire Wire Line
	6800 3450 6800 3550
Wire Wire Line
	6750 3350 6800 3350
Connection ~ 6800 3350
Wire Wire Line
	6800 3350 6800 3450
Wire Wire Line
	6750 3250 6800 3250
Connection ~ 6800 3250
Wire Wire Line
	6800 3250 6800 3350
Wire Wire Line
	6750 3150 6800 3150
Connection ~ 6800 3150
Wire Wire Line
	6800 3150 6800 3250
Wire Wire Line
	6750 3050 6800 3050
Connection ~ 6800 3050
Wire Wire Line
	6800 3050 6800 3150
Wire Wire Line
	6750 2950 6800 2950
Connection ~ 6800 2950
Wire Wire Line
	6800 2950 6800 3050
$Comp
L UBD-rescue:GND-power #PWR0127
U 1 1 5CF502C0
P 6800 3600
F 0 "#PWR0127" H 6800 3350 50  0001 C CNN
F 1 "GND" H 6950 3550 50  0000 C CNN
F 2 "" H 6800 3600 50  0001 C CNN
F 3 "" H 6800 3600 50  0001 C CNN
	1    6800 3600
	1    0    0    -1  
$EndComp
Wire Wire Line
	6800 3600 6800 3550
Connection ~ 6800 3550
Text Label 1475 6250 2    50   ~ 0
Ig_NO1
Wire Wire Line
	1475 6250 1525 6250
Text Label 1475 6350 2    50   ~ 0
Ig_NO2
Wire Wire Line
	1475 6350 1525 6350
Text Label 1475 6450 2    50   ~ 0
Tr_NO2
Wire Wire Line
	1475 6450 1525 6450
Wire Wire Line
	1475 6550 1525 6550
$Comp
L UBD-rescue:+12V-power #PWR0130
U 1 1 5D0A0C71
P 1650 3700
F 0 "#PWR0130" H 1650 3550 50  0001 C CNN
F 1 "+12V" H 1665 3873 50  0000 C CNN
F 2 "" H 1650 3700 50  0001 C CNN
F 3 "" H 1650 3700 50  0001 C CNN
	1    1650 3700
	-1   0    0    1   
$EndComp
$Comp
L UBD-rescue:GND-power #PWR0131
U 1 1 5D0ACBAD
P 1450 3700
F 0 "#PWR0131" H 1450 3450 50  0001 C CNN
F 1 "GND" H 1455 3527 50  0000 C CNN
F 2 "" H 1450 3700 50  0001 C CNN
F 3 "" H 1450 3700 50  0001 C CNN
	1    1450 3700
	1    0    0    -1  
$EndComp
Text Label 6400 1050 0    50   ~ 0
Data0
Wire Wire Line
	6100 1050 6200 1050
Text Label 1900 3750 2    50   ~ 0
Data0
Text Label 7050 1100 0    50   ~ 0
Tr
Wire Wire Line
	7050 1100 7000 1100
Wire Wire Line
	7000 1100 7000 1200
Text Label 7050 2000 0    50   ~ 0
Ig
Wire Wire Line
	7050 2000 7000 2000
Wire Wire Line
	7000 2000 7000 2150
$Comp
L UBD-rescue:R-Device R4
U 1 1 5D1882E1
P 6200 800
F 0 "R4" H 6270 846 50  0000 L CNN
F 1 "10k" H 6270 755 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 6130 800 50  0001 C CNN
F 3 "~" H 6200 800 50  0001 C CNN
F 4 "0.063Вт 0603 10 кОм, 1%" H 0   0   50  0001 C CNN "Артикул"
F 5 "https://www.chipdip.ru/product0/9000079736" H 0   0   50  0001 C CNN "Ссылка"
F 6 "0,9" H 0   0   50  0001 C CNN "Цена"
	1    6200 800 
	1    0    0    -1  
$EndComp
Wire Wire Line
	6200 950  6200 1050
Connection ~ 6200 1050
Wire Wire Line
	6200 1050 6400 1050
$Comp
L UBD-rescue:+3.3V-power #PWR01
U 1 1 5D193300
P 6200 600
F 0 "#PWR01" H 6200 450 50  0001 C CNN
F 1 "+3.3V" H 6215 773 50  0000 C CNN
F 2 "" H 6200 600 50  0001 C CNN
F 3 "" H 6200 600 50  0001 C CNN
	1    6200 600 
	1    0    0    -1  
$EndComp
Wire Wire Line
	6200 600  6200 650 
Wire Wire Line
	3350 6050 3300 6050
Wire Wire Line
	3300 6050 3300 6250
Wire Wire Line
	3300 6350 3350 6350
Wire Wire Line
	3350 6250 3300 6250
Connection ~ 3300 6250
Wire Wire Line
	3300 6250 3300 6350
Wire Wire Line
	3350 5950 3250 5950
Wire Wire Line
	3250 5950 3250 6150
Wire Wire Line
	3250 6450 3350 6450
Wire Wire Line
	3350 6150 3250 6150
Connection ~ 3250 6150
Wire Wire Line
	3250 6150 3250 6450
$Comp
L UBD-rescue:GND-power #PWR012
U 1 1 5D2F64A5
P 3300 6750
F 0 "#PWR012" H 3300 6500 50  0001 C CNN
F 1 "GND" H 3150 6700 50  0000 C CNN
F 2 "" H 3300 6750 50  0001 C CNN
F 3 "" H 3300 6750 50  0001 C CNN
	1    3300 6750
	-1   0    0    -1  
$EndComp
$Comp
L UBD-rescue:GND-power #PWR014
U 1 1 5D2F70A2
P 4200 6750
F 0 "#PWR014" H 4200 6500 50  0001 C CNN
F 1 "GND" H 4050 6700 50  0000 C CNN
F 2 "" H 4200 6750 50  0001 C CNN
F 3 "" H 4200 6750 50  0001 C CNN
	1    4200 6750
	-1   0    0    -1  
$EndComp
Wire Wire Line
	3750 6650 3750 6700
Wire Wire Line
	3250 6700 3250 6450
Connection ~ 3250 6450
Text Label 4500 5700 0    50   ~ 0
SCL
Text Label 4500 5950 0    50   ~ 0
SDA
Wire Wire Line
	3750 5700 3750 5750
$Comp
L UBD-rescue:R-Device R5
U 1 1 5D35A38F
P 4000 5500
F 0 "R5" H 4070 5546 50  0000 L CNN
F 1 "10k" H 4070 5455 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 3930 5500 50  0001 C CNN
F 3 "~" H 4000 5500 50  0001 C CNN
F 4 "0.063Вт 0603 10 кОм, 1%" H -650 -150 50  0001 C CNN "Артикул"
F 5 "https://www.chipdip.ru/product0/9000079736" H -650 -150 50  0001 C CNN "Ссылка"
F 6 "0,9" H -650 -150 50  0001 C CNN "Цена"
	1    4000 5500
	1    0    0    -1  
$EndComp
$Comp
L UBD-rescue:R-Device R6
U 1 1 5D35ACFA
P 4300 5500
F 0 "R6" H 4370 5546 50  0000 L CNN
F 1 "10k" H 4370 5455 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 4230 5500 50  0001 C CNN
F 3 "~" H 4300 5500 50  0001 C CNN
F 4 "0.063Вт 0603 10 кОм, 1%" H -650 -150 50  0001 C CNN "Артикул"
F 5 "https://www.chipdip.ru/product0/9000079736" H -650 -150 50  0001 C CNN "Ссылка"
F 6 "0,9" H -650 -150 50  0001 C CNN "Цена"
	1    4300 5500
	1    0    0    -1  
$EndComp
Wire Wire Line
	4000 5650 4000 5700
Connection ~ 4000 5700
Wire Wire Line
	4000 5700 3750 5700
$Comp
L UBD-rescue:+3.3V-power #PWR013
U 1 1 5D377F2E
P 4000 5300
F 0 "#PWR013" H 4000 5150 50  0001 C CNN
F 1 "+3.3V" H 4015 5473 50  0000 C CNN
F 2 "" H 4000 5300 50  0001 C CNN
F 3 "" H 4000 5300 50  0001 C CNN
	1    4000 5300
	1    0    0    -1  
$EndComp
$Comp
L UBD-rescue:+3.3V-power #PWR015
U 1 1 5D378266
P 4300 5300
F 0 "#PWR015" H 4300 5150 50  0001 C CNN
F 1 "+3.3V" H 4315 5473 50  0000 C CNN
F 2 "" H 4300 5300 50  0001 C CNN
F 3 "" H 4300 5300 50  0001 C CNN
	1    4300 5300
	1    0    0    -1  
$EndComp
Wire Wire Line
	4000 5300 4000 5350
Wire Wire Line
	4300 5300 4300 5350
Wire Wire Line
	3250 6700 3750 6700
Wire Wire Line
	3300 6750 3300 6350
Connection ~ 3300 6350
Wire Wire Line
	4300 5950 4500 5950
Connection ~ 4300 5950
Wire Wire Line
	4300 5650 4300 5950
Wire Wire Line
	4150 5950 4300 5950
Wire Wire Line
	4500 5700 4000 5700
Wire Wire Line
	4200 6250 4150 6250
Wire Wire Line
	4200 6150 4200 6250
Wire Wire Line
	4150 6150 4200 6150
$Comp
L UBD_Lib:LIS302 U5
U 1 1 5D1DFB0E
P 3600 5650
F 0 "U5" H 3700 5600 50  0000 C CNN
F 1 "LIS302" H 3650 5500 50  0000 C CNN
F 2 "UBD:LGA-14_3x5mm_P0.8mm_LayoutBorder1x6y" H 3600 5650 50  0001 C CNN
F 3 "" H 3600 5650 50  0001 C CNN
F 4 "LIS302DLTR" H -650 -150 50  0001 C CNN "Артикул"
F 5 "https://www.chipdip.ru/product/lis302dltr" H -650 -150 50  0001 C CNN "Ссылка"
F 6 "64" H -650 -150 50  0001 C CNN "Цена"
	1    3600 5650
	-1   0    0    -1  
$EndComp
Connection ~ 3250 5950
Wire Wire Line
	3250 5300 3250 5950
$Comp
L UBD-rescue:+3.3V-power #PWR011
U 1 1 5D2E8992
P 3250 5300
F 0 "#PWR011" H 3250 5150 50  0001 C CNN
F 1 "+3.3V" H 3265 5473 50  0000 C CNN
F 2 "" H 3250 5300 50  0001 C CNN
F 3 "" H 3250 5300 50  0001 C CNN
	1    3250 5300
	1    0    0    -1  
$EndComp
$Comp
L UBD-rescue:Conn_01x03-Connector_Generic J3
U 1 1 5CC2F7C2
P 2150 3650
F 0 "J3" H 1550 3850 50  0000 L CNN
F 1 "Считыватель" H 1700 3850 50  0000 L CNN
F 2 "UBD:JST_XH_B3B-XH-A_1x03_P2.50mm_Vertical" H 2150 3650 50  0001 C CNN
F 3 "~" H 2150 3650 50  0001 C CNN
F 4 "CWF-3 (DS1069-3 M)   CHU-3 (DS1069-3 F)" H -2050 -650 50  0001 C CNN "Артикул"
F 5 "https://www.chipdip.ru/product/cwf-3      https://www.chipdip.ru/product/chu-3" H -2050 -650 50  0001 C CNN "Ссылка"
F 6 "5+5" H -2050 -650 50  0001 C CNN "Цена"
	1    2150 3650
	1    0    0    -1  
$EndComp
Wire Wire Line
	1950 3750 1900 3750
$Comp
L UBD-rescue:GND-power #PWR0133
U 1 1 5CD08DC7
P 3650 3850
F 0 "#PWR0133" H 3650 3600 50  0001 C CNN
F 1 "GND" H 3655 3677 50  0000 C CNN
F 2 "" H 3650 3850 50  0001 C CNN
F 3 "" H 3650 3850 50  0001 C CNN
	1    3650 3850
	1    0    0    -1  
$EndComp
$Comp
L UBD-rescue:+3.3V-power #PWR0134
U 1 1 5CD20C4A
P 3850 3850
F 0 "#PWR0134" H 3850 3700 50  0001 C CNN
F 1 "+3.3V" H 3865 4023 50  0000 C CNN
F 2 "" H 3850 3850 50  0001 C CNN
F 3 "" H 3850 3850 50  0001 C CNN
	1    3850 3850
	-1   0    0    1   
$EndComp
Text Label 4850 2350 2    50   ~ 0
SCL
Text Label 6150 2550 0    50   ~ 0
SDA
Wire Wire Line
	4850 2350 4900 2350
Text Label 4100 3900 2    50   ~ 0
Udar
Text Label 4850 2450 2    50   ~ 0
Udar
Wire Wire Line
	4850 2450 4900 2450
Wire Wire Line
	6100 2550 6150 2550
Text Label 6250 7500 2    50   ~ 0
TXD
Text Label 6250 7700 2    50   ~ 0
RXD
Wire Wire Line
	6300 7500 6250 7500
Wire Wire Line
	6300 7700 6250 7700
Text Label 6150 3950 0    50   ~ 0
TXD
Wire Wire Line
	6100 3950 6150 3950
Text Label 6150 4050 0    50   ~ 0
RXD
Wire Wire Line
	6100 4050 6150 4050
Text Label 7800 7400 0    50   ~ 0
Rst_wf
Wire Wire Line
	6200 8750 6200 8300
$Comp
L UBD-rescue:R-Device R10
U 1 1 5CC9170A
P 6650 1600
F 0 "R10" H 6500 1550 50  0000 C CNN
F 1 "360" H 6500 1650 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 6580 1600 50  0001 C CNN
F 3 "~" H 6650 1600 50  0001 C CNN
F 4 " 0.1Вт 0603 360 Ом, 1%" H 50  -2550 50  0001 C CNN "Артикул"
F 5 "https://www.chipdip.ru/product0/9000079629" H 50  -2550 50  0001 C CNN "Ссылка"
F 6 "0,9" H 50  -2550 50  0001 C CNN "Цена"
	1    6650 1600
	1    0    0    -1  
$EndComp
$Comp
L UBD-rescue:GND-power #PWR0121
U 1 1 5CCF61F2
P 4325 2925
F 0 "#PWR0121" H 4325 2675 50  0001 C CNN
F 1 "GND" H 4330 2752 50  0000 C CNN
F 2 "" H 4325 2925 50  0001 C CNN
F 3 "" H 4325 2925 50  0001 C CNN
	1    4325 2925
	1    0    0    -1  
$EndComp
Wire Wire Line
	4325 2400 4325 2450
$Comp
L UBD-rescue:R-Device R1
U 1 1 5CCEAF44
P 4325 2250
F 0 "R1" H 4175 2200 50  0000 C CNN
F 1 "360" H 4175 2300 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 4255 2250 50  0001 C CNN
F 3 "~" H 4325 2250 50  0001 C CNN
F 4 " 0.1Вт 0603 360 Ом, 1%" H 775 250 50  0001 C CNN "Артикул"
F 5 "https://www.chipdip.ru/product0/9000079629" H 775 250 50  0001 C CNN "Ссылка"
F 6 "0,9" H 775 250 50  0001 C CNN "Цена"
	1    4325 2250
	-1   0    0    1   
$EndComp
$Comp
L UBD-rescue:LED-Device D4
U 1 1 5CCE5D17
P 4325 2600
F 0 "D4" V 4364 2483 50  0000 R CNN
F 1 "LED" V 4273 2483 50  0000 R CNN
F 2 "LED_SMD:LED_0805_2012Metric" H 4325 2600 50  0001 C CNN
F 3 "~" H 4325 2600 50  0001 C CNN
F 4 "KP-2012EC" H 775 250 50  0001 C CNN "Артикул"
F 5 "https://www.chipdip.ru/product/kp-2012ec" H 775 250 50  0001 C CNN "Ссылка"
F 6 "9" H 775 250 50  0001 C CNN "Цена"
	1    4325 2600
	0    -1   -1   0   
$EndComp
Wire Wire Line
	1950 3550 1450 3550
Wire Wire Line
	1450 3550 1450 3700
Wire Wire Line
	1950 3650 1650 3650
Wire Wire Line
	1650 3650 1650 3700
$Comp
L UBD_Lib:USB_B_Micro J4
U 1 1 5CFBC8CB
P 1500 8100
F 0 "J4" H 1500 8550 50  0000 C CNN
F 1 "USB_B_Micro" H 1450 8450 50  0000 C CNN
F 2 "Connector_USB:USB_Mini-B_Lumberg_2486_01_Horizontal" H 1650 8050 50  0001 C CNN
F 3 "~" H 1650 8050 50  0001 C CNN
F 4 "MiniUSB-A" H 0   0   50  0001 C CNN "Артикул"
F 5 "https://www.chipdip.ru/product/miniusb-a-5pin" H 0   0   50  0001 C CNN "Ссылка"
F 6 "22" H 0   0   50  0001 C CNN "Цена"
	1    1500 8100
	1    0    0    -1  
$EndComp
$Comp
L UBD-rescue:CH340G-Interface_USB U6
U 1 1 5CFD0C16
P 2700 8200
F 0 "U6" H 2850 8850 50  0000 C CNN
F 1 "CH340G" H 2900 8750 50  0000 C CNN
F 2 "Package_SO:SOIC-16_3.9x9.9mm_P1.27mm" H 2750 7650 50  0001 L CNN
F 3 "http://www.datasheet5.com/pdf-local-2195953" H 2350 9000 50  0001 C CNN
F 4 "CH340G" H 0   0   50  0001 C CNN "Артикул"
F 5 "https://ru.aliexpress.com/item/5-CH340G-16-CH340/32985956586.html?spm=a2g0v.search0604.3.31.6a5818a6fO6Vm1&s=p&ws_ab_test=searchweb0_0%2Csearchweb201602_10_10065_10068_319_317_10696_453_10084_454_10083_10618_10307_10301_537_536_10059_10884_10889_10887_321_322_10915_10103_10914_10911_10910%2Csearchweb201603_52%2CppcSwitch_0&algo_pvid=57b213c5-8bb9-4439-876d-7cef18e7242d&algo_expid=57b213c5-8bb9-4439-876d-7cef18e7242d-7" H 0   0   50  0001 C CNN "Ссылка"
F 6 "20" H 0   0   50  0001 C CNN "Цена"
	1    2700 8200
	1    0    0    -1  
$EndComp
$Comp
L UBD-rescue:Crystal-Device Y2
U 1 1 5CFD2D1D
P 2050 8400
F 0 "Y2" H 2050 8550 50  0000 C CNN
F 1 "12MHz" H 2100 8250 50  0000 C CNN
F 2 "UBD:Crystal_SMD_3225-4Pin_3.2x2.5mm_HandSoldering" H 2050 8400 50  0001 C CNN
F 3 "~" H 2050 8400 50  0001 C CNN
F 4 "NX3225GA-12MHZ STD-CRG-2" H 0   0   50  0001 C CNN "Артикул"
F 5 "https://www.chipdip.ru/product0/9000523957" H 0   0   50  0001 C CNN "Ссылка"
F 6 "12" H 0   0   50  0001 C CNN "Цена"
	1    2050 8400
	1    0    0    -1  
$EndComp
Wire Wire Line
	2300 8600 1850 8600
Wire Wire Line
	1850 8600 1850 8400
Wire Wire Line
	1850 8400 1900 8400
Wire Wire Line
	2200 8400 2300 8400
Wire Wire Line
	2300 8200 1800 8200
Wire Wire Line
	1800 8100 2300 8100
$Comp
L UBD-rescue:GND-power #PWR016
U 1 1 5D03967B
P 1875 7450
F 0 "#PWR016" H 1875 7200 50  0001 C CNN
F 1 "GND" H 2025 7400 50  0000 C CNN
F 2 "" H 1875 7450 50  0001 C CNN
F 3 "" H 1875 7450 50  0001 C CNN
	1    1875 7450
	1    0    0    -1  
$EndComp
Wire Wire Line
	1875 7400 1875 7450
$Comp
L UBD-rescue:GND-power #PWR018
U 1 1 5D04D218
P 2700 8850
F 0 "#PWR018" H 2700 8600 50  0001 C CNN
F 1 "GND" H 2705 8677 50  0000 C CNN
F 2 "" H 2700 8850 50  0001 C CNN
F 3 "" H 2700 8850 50  0001 C CNN
	1    2700 8850
	1    0    0    -1  
$EndComp
$Comp
L UBD-rescue:GND-power #PWR017
U 1 1 5D04D6F3
P 1500 8850
F 0 "#PWR017" H 1500 8600 50  0001 C CNN
F 1 "GND" H 1505 8677 50  0000 C CNN
F 2 "" H 1500 8850 50  0001 C CNN
F 3 "" H 1500 8850 50  0001 C CNN
	1    1500 8850
	1    0    0    -1  
$EndComp
Wire Wire Line
	2700 8800 2700 8850
Wire Wire Line
	1500 8850 1500 8550
$Comp
L UBD-rescue:+3.3V-power #PWR020
U 1 1 5D159F9D
P 2225 7050
F 0 "#PWR020" H 2225 6900 50  0001 C CNN
F 1 "+3.3V" H 2225 7225 50  0000 C CNN
F 2 "" H 2225 7050 50  0001 C CNN
F 3 "" H 2225 7050 50  0001 C CNN
	1    2225 7050
	1    0    0    -1  
$EndComp
Wire Wire Line
	2225 7050 2225 7100
Wire Wire Line
	2225 7100 2175 7100
$Comp
L UBD-rescue:+3.3V-power #PWR022
U 1 1 5D16F2EF
P 2700 7500
F 0 "#PWR022" H 2700 7350 50  0001 C CNN
F 1 "+3.3V" H 2715 7673 50  0000 C CNN
F 2 "" H 2700 7500 50  0001 C CNN
F 3 "" H 2700 7500 50  0001 C CNN
	1    2700 7500
	1    0    0    -1  
$EndComp
Wire Wire Line
	2700 7500 2700 7550
$Comp
L UBD-rescue:+5V-power #PWR021
U 1 1 5D185C72
P 1850 7850
F 0 "#PWR021" H 1850 7700 50  0001 C CNN
F 1 "+5V" H 1865 8023 50  0000 C CNN
F 2 "" H 1850 7850 50  0001 C CNN
F 3 "" H 1850 7850 50  0001 C CNN
	1    1850 7850
	1    0    0    -1  
$EndComp
Wire Wire Line
	1850 7850 1850 7900
Wire Wire Line
	1850 7900 1800 7900
$Comp
L UBD-rescue:+5V-power #PWR019
U 1 1 5D19B77D
P 1225 7050
F 0 "#PWR019" H 1225 6900 50  0001 C CNN
F 1 "+5V" H 1200 7200 50  0000 C CNN
F 2 "" H 1225 7050 50  0001 C CNN
F 3 "" H 1225 7050 50  0001 C CNN
	1    1225 7050
	1    0    0    -1  
$EndComp
Wire Wire Line
	2600 7600 2600 7550
Wire Wire Line
	2600 7550 2700 7550
Connection ~ 2700 7550
Wire Wire Line
	2700 7550 2700 7600
Wire Wire Line
	4900 3750 4850 3750
Text Label 3150 7900 0    50   ~ 0
Mis
Text Label 3150 7800 0    50   ~ 0
Mos
Wire Wire Line
	3100 7800 3150 7800
Wire Wire Line
	3100 7900 3150 7900
Text Label 3475 8500 0    50   ~ 0
Rst
Wire Wire Line
	4150 1450 4900 1450
Wire Wire Line
	4150 1250 4150 1450
Wire Wire Line
	4200 1250 4150 1250
$Comp
L UBD-rescue:Crystal-Device Y1
U 1 1 5CB22433
P 4350 1250
F 0 "Y1" H 4350 1400 50  0000 C CNN
F 1 "14.7456MHz" H 4400 1100 50  0000 C CNN
F 2 "UBD:Crystal_SMD_HC49-SD" H 4350 1250 50  0001 C CNN
F 3 "~" H 4350 1250 50  0001 C CNN
F 4 "14.7456 МГц имп. HC-49SM" H 0   0   50  0001 C CNN "Артикул"
F 5 "https://www.chipdip.ru/product/14.7456mhz-hc-49sm" H 0   0   50  0001 C CNN "Ссылка"
F 6 "18" H 0   0   50  0001 C CNN "Цена"
	1    4350 1250
	1    0    0    -1  
$EndComp
$Comp
L UBD-rescue:LMV321-Amplifier_Operational U8
U 1 1 5CFF3396
P 5375 7900
F 0 "U8" H 5425 8050 50  0000 L CNN
F 1 "LMV321" H 5325 7700 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23-5" H 5375 7900 50  0001 L CNN
F 3 "http://www.ti.com/lit/ds/symlink/lmv324.pdf" H 5375 7900 50  0001 C CNN
F 4 "LMV321ILT" H 375 500 50  0001 C CNN "Артикул"
F 5 "https://www.chipdip.ru/product/lmv321ilt" H 375 500 50  0001 C CNN "Ссылка"
F 6 "15" H 375 500 50  0001 C CNN "Цена"
	1    5375 7900
	1    0    0    -1  
$EndComp
$Comp
L UBD-rescue:R-Device R18
U 1 1 5CFF7F4A
P 5075 8550
F 0 "R18" H 5125 8600 50  0000 L CNN
F 1 "1k" H 5125 8500 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 5005 8550 50  0001 C CNN
F 3 "~" H 5075 8550 50  0001 C CNN
F 4 "0.063Вт 0603 1 кОм, 1%" H 3625 6400 50  0001 C CNN "Артикул"
F 5 "0,9" H 3625 6400 50  0001 C CNN "Цена"
F 6 "https://www.chipdip.ru/product0/9000079676" H 3625 6400 50  0001 C CNN "Ссылка"
	1    5075 8550
	1    0    0    -1  
$EndComp
$Comp
L UBD-rescue:R-Device R19
U 1 1 5CFF965F
P 5450 8350
F 0 "R19" V 5350 8300 50  0000 L CNN
F 1 "22k" V 5450 8300 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 5380 8350 50  0001 C CNN
F 3 "~" H 5450 8350 50  0001 C CNN
F 4 "0.063Вт 0603 22 кОм, 1%" H 3800 6550 50  0001 C CNN "Артикул"
F 5 "https://www.chipdip.ru/product0/9000079744" H 3800 6550 50  0001 C CNN "Ссылка"
F 6 "0,9" H 3800 6550 50  0001 C CNN "Цена"
	1    5450 8350
	0    1    1    0   
$EndComp
Wire Wire Line
	5300 8350 5075 8350
Wire Wire Line
	5075 8350 5075 8000
Wire Wire Line
	5075 8400 5075 8350
Connection ~ 5075 8350
Wire Wire Line
	5075 8700 5075 8750
$Comp
L UBD-rescue:GND-power #PWR029
U 1 1 5D0A9584
P 5275 8750
F 0 "#PWR029" H 5275 8500 50  0001 C CNN
F 1 "GND" H 5280 8577 50  0000 C CNN
F 2 "" H 5275 8750 50  0001 C CNN
F 3 "" H 5275 8750 50  0001 C CNN
	1    5275 8750
	1    0    0    -1  
$EndComp
Wire Wire Line
	5275 8750 5275 8200
$Comp
L UBD-rescue:R-Device R17
U 1 1 5D0C28FE
P 4925 8550
F 0 "R17" H 4700 8600 50  0000 L CNN
F 1 "100k" H 4700 8500 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 4855 8550 50  0001 C CNN
F 3 "~" H 4925 8550 50  0001 C CNN
F 4 "0.1Вт 0603 100 кОм, 1%" H 3475 6400 50  0001 C CNN "Артикул"
F 5 "0,9" H 3475 6400 50  0001 C CNN "Цена"
F 6 "https://www.chipdip.ru/product0/9000079760" H 3475 6400 50  0001 C CNN "Ссылка"
	1    4925 8550
	1    0    0    -1  
$EndComp
$Comp
L UBD-rescue:GND-power #PWR026
U 1 1 5D0C403F
P 4675 8750
F 0 "#PWR026" H 4675 8500 50  0001 C CNN
F 1 "GND" H 4680 8577 50  0000 C CNN
F 2 "" H 4675 8750 50  0001 C CNN
F 3 "" H 4675 8750 50  0001 C CNN
	1    4675 8750
	1    0    0    -1  
$EndComp
Wire Wire Line
	4925 8700 4925 8750
Wire Wire Line
	5075 7800 4925 7800
Wire Wire Line
	4925 8400 4925 7800
Connection ~ 4925 7800
$Comp
L UBD-rescue:R-Device R20
U 1 1 5D15D250
P 4575 7800
F 0 "R20" V 4675 7800 50  0000 C CNN
F 1 "100k" V 4575 7800 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 4505 7800 50  0001 C CNN
F 3 "~" H 4575 7800 50  0001 C CNN
F 4 "0.1Вт 0603 100 кОм, 1%" H -2925 1150 50  0001 C CNN "Артикул"
F 5 "https://www.chipdip.ru/product0/9000079760" H -2925 1150 50  0001 C CNN "Ссылка"
F 6 "0,9" H -2925 1150 50  0001 C CNN "Цена"
	1    4575 7800
	0    1    -1   0   
$EndComp
$Comp
L UBD-rescue:DIODE-Simulation_SPICE D11
U 1 1 5CFF64A0
P 4375 8000
F 0 "D11" V 4475 7925 50  0000 R CNN
F 1 "BAS321" V 4375 7950 50  0000 R CNN
F 2 "UBD:D_SOD-323_HandSoldering" H 4375 8000 50  0001 C CNN
F 3 "~" H 4375 8000 50  0001 C CNN
F 4 "Y" H 4375 8000 50  0001 L CNN "Spice_Netlist_Enabled"
F 5 "V" H 4375 8000 50  0001 L CNN "Spice_Primitive"
F 6 " BAS321.115" H 375 500 50  0001 C CNN "Артикул"
F 7 "https://www.chipdip.ru/product/bas321.115" H 375 500 50  0001 C CNN "Ссылка"
F 8 "8" H 375 500 50  0001 C CNN "Цена"
	1    4375 8000
	0    -1   -1   0   
$EndComp
Wire Wire Line
	4425 7800 4375 7800
Wire Wire Line
	4375 7800 4375 7850
$Comp
L UBD-rescue:+3.3V-power #PWR030
U 1 1 5D24A5E7
P 5275 7550
F 0 "#PWR030" H 5275 7400 50  0001 C CNN
F 1 "+3.3V" H 5425 7600 50  0000 C CNN
F 2 "" H 5275 7550 50  0001 C CNN
F 3 "" H 5275 7550 50  0001 C CNN
	1    5275 7550
	-1   0    0    -1  
$EndComp
Wire Wire Line
	5275 7550 5275 7600
Text Label 5675 7800 1    50   ~ 0
Speed
$Comp
L UBD-rescue:GND-power #PWR027
U 1 1 5D0C3CF5
P 4925 8750
F 0 "#PWR027" H 4925 8500 50  0001 C CNN
F 1 "GND" H 4930 8577 50  0000 C CNN
F 2 "" H 4925 8750 50  0001 C CNN
F 3 "" H 4925 8750 50  0001 C CNN
	1    4925 8750
	1    0    0    -1  
$EndComp
$Comp
L UBD-rescue:GND-power #PWR028
U 1 1 5D09036F
P 5075 8750
F 0 "#PWR028" H 5075 8500 50  0001 C CNN
F 1 "GND" H 5080 8577 50  0000 C CNN
F 2 "" H 5075 8750 50  0001 C CNN
F 3 "" H 5075 8750 50  0001 C CNN
	1    5075 8750
	1    0    0    -1  
$EndComp
$Comp
L UBD-rescue:Conn_01x04-Connector_Generic J8
U 1 1 5D1549D8
P 4350 3700
F 0 "J8" H 4300 4000 50  0000 L CNN
F 1 "Удар" H 4250 3900 50  0000 L CNN
F 2 "UBD:JST_XH_B4B-XH-A_1x04_P2.50mm_Vertical" H 4350 3700 50  0001 C CNN
F 3 "~" H 4350 3700 50  0001 C CNN
F 4 "CWF-4 (DS1069-4 M)   CHU-4 (DS1069-4 F)" H 0   0   50  0001 C CNN "Артикул"
F 5 "https://www.chipdip.ru/product/cwf-4    https://www.chipdip.ru/product/chu-4" H 0   0   50  0001 C CNN "Ссылка"
F 6 "5+5" H 0   0   50  0001 C CNN "Цена"
	1    4350 3700
	1    0    0    -1  
$EndComp
Wire Wire Line
	4150 3900 4100 3900
Wire Wire Line
	3850 3850 3850 3800
Wire Wire Line
	3850 3800 4150 3800
Wire Wire Line
	3650 3700 4150 3700
Wire Wire Line
	3650 3700 3650 3850
$Comp
L UBD-rescue:Conn_01x04-Connector_Generic J9
U 1 1 5D1F99EA
P 1725 6350
F 0 "J9" H 1805 6296 50  0000 L CNN
F 1 "Conn_01x04" H 1805 6251 50  0001 L CNN
F 2 "UBD:DG_308_4" H 1725 6350 50  0001 C CNN
F 3 "~" H 1725 6350 50  0001 C CNN
F 4 "308-021-14" H 0   0   50  0001 C CNN "Артикул"
F 5 "https://www.chipdip.ru/product/308-021-12-14" H 0   0   50  0001 C CNN "Ссылка"
F 6 "14" H 0   0   50  0001 C CNN "Цена"
	1    1725 6350
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
Text Label 6150 2650 0    50   ~ 0
Led1
Wire Wire Line
	6150 2650 6100 2650
Text Label 6150 3850 0    50   ~ 0
Led2
Wire Wire Line
	6150 3850 6100 3850
Text Label 6150 4250 0    50   ~ 0
Led3
Wire Wire Line
	6100 4250 6150 4250
Text Label 6150 4350 0    50   ~ 0
Led4
Wire Wire Line
	6100 4350 6150 4350
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
Text Label 1475 6550 2    50   ~ 0
Tr_NO1
Text Label 4100 3600 2    50   ~ 0
Sp
Wire Wire Line
	4150 3600 4100 3600
Text Label 4375 8225 2    50   ~ 0
Sp
Wire Wire Line
	4375 8225 4375 8150
$Comp
L UBD_Lib:AZ23C3V3 D14
U 1 1 5D2438B1
P 4725 7975
F 0 "D14" H 4525 7525 50  0000 L CNN
F 1 "AZ23C3V3" H 4275 7425 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 4700 8100 50  0001 C CNN
F 3 "" H 4700 8100 50  0001 C CNN
F 4 "AZ23C3V3-E3-18" H 375 500 50  0001 C CNN "Артикул"
F 5 "https://www.chipdip.ru/product/az23-c3v3" H 375 500 50  0001 C CNN "Ссылка"
F 6 "4" H 375 500 50  0001 C CNN "Цена"
	1    4725 7975
	1    0    0    -1  
$EndComp
Wire Wire Line
	4725 7800 4750 7800
Wire Wire Line
	4750 8000 4750 7800
Connection ~ 4750 7800
Wire Wire Line
	4750 7800 4925 7800
Wire Wire Line
	4825 8350 4825 8375
Wire Wire Line
	4825 8375 4675 8375
Wire Wire Line
	4675 8375 4675 8350
Wire Wire Line
	4675 8750 4675 8375
Connection ~ 4675 8375
$Comp
L UBD-rescue:LM2734Y-Regulator_Switching U9
U 1 1 5D207472
P 2750 2150
F 0 "U9" H 2475 2475 50  0000 C CNN
F 1 "LM2734Y" H 2600 2400 50  0000 C CNN
F 2 "UBD:TSOT-23-6" H 2775 1900 50  0001 L CIN
F 3 "http://www.ti.com/lit/ds/symlink/lm2734.pdf" H 2650 2250 50  0001 C CNN
F 4 "LM2734YMK" H 0   0   50  0001 C CNN "Артикул"
F 5 "https://www.chipdip.ru/product/lm2734ymk-nopb" H 0   0   50  0001 C CNN "Ссылка"
F 6 "120" H 0   0   50  0001 C CNN "Цена"
	1    2750 2150
	1    0    0    -1  
$EndComp
$Comp
L UBD-rescue:R-Device R22
U 1 1 5D20CC70
P 2250 2200
F 0 "R22" H 2025 2250 50  0000 L CNN
F 1 "100k" H 2000 2150 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 2180 2200 50  0001 C CNN
F 3 "~" H 2250 2200 50  0001 C CNN
F 4 "0.1Вт 0603 100 кОм, 1%" H -3950 1400 50  0001 C CNN "Артикул"
F 5 "https://www.chipdip.ru/product0/9000079760" H -3950 1400 50  0001 C CNN "Ссылка"
F 6 "0,9" H -3950 1400 50  0001 C CNN "Цена"
	1    2250 2200
	1    0    0    -1  
$EndComp
$Comp
L UBD-rescue:BC817-Transistor_BJT Q5
U 1 1 5D20D733
P 2250 2600
F 0 "Q5" H 2441 2646 50  0000 L CNN
F 1 "BC817" H 2441 2555 50  0000 L CNN
F 2 "UBD:SOT-23" H 2450 2525 50  0001 L CIN
F 3 "http://www.fairchildsemi.com/ds/BC/BC817.pdf" H 2250 2600 50  0001 L CNN
F 4 "BC817.215" H -4600 250 50  0001 C CNN "Артикул"
F 5 "https://www.chipdip.ru/product/bc817.215" H -4600 250 50  0001 C CNN "Ссылка"
F 6 "3" H -4600 250 50  0001 C CNN "Цена"
	1    2250 2600
	1    0    0    -1  
$EndComp
$Comp
L UBD-rescue:L-Device L3
U 1 1 5D2179F0
P 3475 2150
F 0 "L3" V 3625 2150 50  0000 C CNN
F 1 "10uH" V 3550 2100 50  0000 C CNN
F 2 "UBD:L_Vishay_IHLP-2525" H 3475 2150 50  0001 C CNN
F 3 "~" H 3475 2150 50  0001 C CNN
F 4 "LQH66SN100M03L" H 375 0   50  0001 C CNN "Артикул"
F 5 "https://www.chipdip.ru/product/lqh66sn100m" H 375 0   50  0001 C CNN "Ссылка"
F 6 "74" H 375 0   50  0001 C CNN "Цена"
	1    3475 2150
	0    -1   -1   0   
$EndComp
$Comp
L UBD-rescue:D_Schottky-Device D15
U 1 1 5D24512B
P 3325 2300
F 0 "D15" V 3350 2100 50  0000 L CNN
F 1 "Диод Шоттки" V 3375 1800 50  0001 L CNN
F 2 "Diode_SMD:D_SOT-23_ANK" H 3325 2300 50  0001 C CNN
F 3 "~" H 3325 2300 50  0001 C CNN
F 4 "ZHCS1000TA" H 425 -50 50  0001 C CNN "Артикул"
F 5 "https://www.chipdip.ru/product/zhcs1000ta-sot23" H 425 -50 50  0001 C CNN "Ссылка"
F 6 "4" H 425 -50 50  0001 C CNN "Цена"
	1    3325 2300
	0    1    1    0   
$EndComp
$Comp
L UBD-rescue:C-Device C8
U 1 1 5D245F69
P 1900 2200
F 0 "C8" H 2050 2150 50  0000 L CNN
F 1 "10uF" H 2000 2250 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 1938 2050 50  0001 C CNN
F 3 "~" H 1900 2200 50  0001 C CNN
F 4 "3" H -800 -1750 50  0001 C CNN "Номер"
F 5 "GRM21BR61C106KE15L" H -800 -1750 50  0001 C CNN "Артикул"
F 6 "https://www.chipdip.ru/product/grm21br61c106ke15l" H -800 -1750 50  0001 C CNN "Ссылка"
F 7 "4" H -800 -1750 50  0001 C CNN "Цена"
	1    1900 2200
	-1   0    0    1   
$EndComp
Wire Wire Line
	2350 2050 2250 2050
Wire Wire Line
	2350 2250 2350 2350
Wire Wire Line
	2350 2350 2250 2350
$Comp
L UBD-rescue:GND-power #PWR032
U 1 1 5D28CD5B
P 2750 2925
F 0 "#PWR032" H 2750 2675 50  0001 C CNN
F 1 "GND" H 2755 2752 50  0000 C CNN
F 2 "" H 2750 2925 50  0001 C CNN
F 3 "" H 2750 2925 50  0001 C CNN
	1    2750 2925
	1    0    0    -1  
$EndComp
Wire Wire Line
	2750 2925 2750 2450
Wire Wire Line
	2350 2400 2350 2350
Connection ~ 2350 2350
$Comp
L UBD-rescue:GND-power #PWR031
U 1 1 5D2D4241
P 2350 2925
F 0 "#PWR031" H 2350 2675 50  0001 C CNN
F 1 "GND" H 2355 2752 50  0000 C CNN
F 2 "" H 2350 2925 50  0001 C CNN
F 3 "" H 2350 2925 50  0001 C CNN
	1    2350 2925
	1    0    0    -1  
$EndComp
Wire Wire Line
	2350 2925 2350 2800
$Comp
L UBD-rescue:R-Device R21
U 1 1 5D2EF0CC
P 1850 2600
F 0 "R21" V 1950 2550 50  0000 L CNN
F 1 "360" V 1850 2550 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 1780 2600 50  0001 C CNN
F 3 "~" H 1850 2600 50  0001 C CNN
F 4 " 0.1Вт 0603 360 Ом, 1%" H -4350 1800 50  0001 C CNN "Артикул"
F 5 "https://www.chipdip.ru/product0/9000079629" H -4350 1800 50  0001 C CNN "Ссылка"
F 6 "0,9" H -4350 1800 50  0001 C CNN "Цена"
	1    1850 2600
	0    1    1    0   
$EndComp
Wire Wire Line
	2000 2600 2025 2600
$Comp
L UBD-rescue:GND-power #PWR09
U 1 1 5D36489B
P 1900 2400
F 0 "#PWR09" H 1900 2150 50  0001 C CNN
F 1 "GND" H 2025 2325 50  0000 C CNN
F 2 "" H 1900 2400 50  0001 C CNN
F 3 "" H 1900 2400 50  0001 C CNN
	1    1900 2400
	1    0    0    -1  
$EndComp
Wire Wire Line
	1900 2400 1900 2350
$Comp
L UBD-rescue:C-Device C9
U 1 1 5D3D8A9E
P 3325 2000
F 0 "C9" H 3675 1825 50  0000 L CNN
F 1 "0.01uF" H 3525 1900 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 3363 1850 50  0001 C CNN
F 3 "~" H 3325 2000 50  0001 C CNN
F 4 "3" H 625 -1950 50  0001 C CNN "Номер"
F 5 "GRM21BR72E103KW03K" H 625 -1950 50  0001 C CNN "Артикул"
F 6 "https://www.chipdip.ru/product/grm21br72e103k" H 625 -1950 50  0001 C CNN "Ссылка"
F 7 "4" H 625 -1950 50  0001 C CNN "Цена"
	1    3325 2000
	-1   0    0    1   
$EndComp
Connection ~ 3325 2150
$Comp
L UBD-rescue:D_Schottky-Device D16
U 1 1 5D3E72B7
P 3475 1850
F 0 "D16" H 3400 1950 50  0000 L CNN
F 1 "Диод Шоттки" V 3525 1350 50  0001 L CNN
F 2 "Diode_SMD:D_SOT-23_ANK" H 3475 1850 50  0001 C CNN
F 3 "~" H 3475 1850 50  0001 C CNN
F 4 "ZHCS1000TA" H 575 -500 50  0001 C CNN "Артикул"
F 5 "https://www.chipdip.ru/product/zhcs1000ta-sot23" H 575 -500 50  0001 C CNN "Ссылка"
F 6 "4" H 575 -500 50  0001 C CNN "Цена"
	1    3475 1850
	1    0    0    -1  
$EndComp
Wire Wire Line
	3625 1850 3625 2150
$Comp
L UBD-rescue:C-Device C10
U 1 1 5D43C119
P 3625 2300
F 0 "C10" H 3700 2450 50  0000 L CNN
F 1 "22uF" H 3650 2525 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 3663 2150 50  0001 C CNN
F 3 "~" H 3625 2300 50  0001 C CNN
F 4 "3" H 925 -1650 50  0001 C CNN "Номер"
F 5 "GRM21BR60J226ME39L" H 925 -1650 50  0001 C CNN "Артикул"
F 6 "https://www.chipdip.ru/product/grm21br60j226m" H 925 -1650 50  0001 C CNN "Ссылка"
F 7 "4" H 925 -1650 50  0001 C CNN "Цена"
	1    3625 2300
	-1   0    0    1   
$EndComp
Connection ~ 3625 2150
$Comp
L UBD-rescue:R-Device R24
U 1 1 5D4B0960
P 3925 2300
F 0 "R24" H 3825 2025 50  0000 L CNN
F 1 "30k" H 3825 2100 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 3855 2300 50  0001 C CNN
F 3 "~" H 3925 2300 50  0001 C CNN
F 4 "0.1Вт 0603 30 кОм, 1%" H -2275 1500 50  0001 C CNN "Артикул"
F 5 "https://www.chipdip.ru/product0/9000079747" H -2275 1500 50  0001 C CNN "Ссылка"
F 6 "0,9" H -2275 1500 50  0001 C CNN "Цена"
	1    3925 2300
	-1   0    0    1   
$EndComp
$Comp
L UBD-rescue:R-Device R25
U 1 1 5D4B1C41
P 3925 2650
F 0 "R25" H 3725 2700 50  0000 L CNN
F 1 "10k" H 3725 2775 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 3855 2650 50  0001 C CNN
F 3 "~" H 3925 2650 50  0001 C CNN
F 4 "0.063Вт 0603 10 кОм, 1%" H -2275 1850 50  0001 C CNN "Артикул"
F 5 "https://www.chipdip.ru/product0/9000079736" H -2275 1850 50  0001 C CNN "Ссылка"
F 6 "0,9" H -2275 1850 50  0001 C CNN "Цена"
	1    3925 2650
	-1   0    0    1   
$EndComp
Wire Wire Line
	3925 2450 3925 2475
$Comp
L UBD-rescue:GND-power #PWR033
U 1 1 5D4E8738
P 3325 2925
F 0 "#PWR033" H 3325 2675 50  0001 C CNN
F 1 "GND" H 3330 2752 50  0000 C CNN
F 2 "" H 3325 2925 50  0001 C CNN
F 3 "" H 3325 2925 50  0001 C CNN
	1    3325 2925
	1    0    0    -1  
$EndComp
$Comp
L UBD-rescue:GND-power #PWR035
U 1 1 5D4E9654
P 3925 2925
F 0 "#PWR035" H 3925 2675 50  0001 C CNN
F 1 "GND" H 3930 2752 50  0000 C CNN
F 2 "" H 3925 2925 50  0001 C CNN
F 3 "" H 3925 2925 50  0001 C CNN
	1    3925 2925
	1    0    0    -1  
$EndComp
$Comp
L UBD-rescue:GND-power #PWR034
U 1 1 5D4E9CF0
P 3625 2925
F 0 "#PWR034" H 3625 2675 50  0001 C CNN
F 1 "GND" H 3630 2752 50  0000 C CNN
F 2 "" H 3625 2925 50  0001 C CNN
F 3 "" H 3625 2925 50  0001 C CNN
	1    3625 2925
	1    0    0    -1  
$EndComp
Wire Wire Line
	3325 2925 3325 2450
Wire Wire Line
	3625 2450 3625 2925
Wire Wire Line
	3925 2925 3925 2800
Text Label 3875 2475 2    50   ~ 0
Fb
Wire Wire Line
	3875 2475 3925 2475
Connection ~ 3925 2475
Wire Wire Line
	3925 2475 3925 2500
Text Label 3175 2250 0    50   ~ 0
Fb
Wire Wire Line
	3175 2250 3150 2250
Wire Wire Line
	3150 2150 3325 2150
Wire Wire Line
	3150 2050 3150 1850
Wire Wire Line
	3150 1850 3325 1850
Connection ~ 3325 1850
$Comp
L UBD-rescue:R-Device R23
U 1 1 5D6A7AB3
P 3775 2150
F 0 "R23" V 3850 2100 50  0000 L CNN
F 1 "1.6k" V 3775 2075 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 3705 2150 50  0001 C CNN
F 3 "~" H 3775 2150 50  0001 C CNN
F 4 "0.1Вт 0603 1.6 кОм, 1%" H -2425 1350 50  0001 C CNN "Артикул"
F 5 "https://www.chipdip.ru/product0/770" H -2425 1350 50  0001 C CNN "Ссылка"
F 6 "0,9" H -2425 1350 50  0001 C CNN "Цена"
	1    3775 2150
	0    -1   -1   0   
$EndComp
$Comp
L UBD-rescue:C-Device C11
U 1 1 5D6F40FA
P 4100 2325
F 0 "C11" H 4075 2525 50  0000 L CNN
F 1 "1000pF" H 3925 2600 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 4138 2175 50  0001 C CNN
F 3 "~" H 4100 2325 50  0001 C CNN
F 4 "3" H 1400 -1625 50  0001 C CNN "Номер"
F 5 "GRM21BR71C105KA01K" H 1400 -1625 50  0001 C CNN "Артикул"
F 6 "https://www.chipdip.ru/product/grm21br71c105k" H 1400 -1625 50  0001 C CNN "Ссылка"
F 7 "4" H 1400 -1625 50  0001 C CNN "Цена"
	1    4100 2325
	-1   0    0    1   
$EndComp
Wire Wire Line
	3925 2475 4100 2475
Wire Wire Line
	3625 1850 4100 1850
Connection ~ 3625 1850
$Comp
L UBD-rescue:R-Device R26
U 1 1 5D7BA196
P 2025 2750
F 0 "R26" H 1825 2775 50  0000 L CNN
F 1 "10k" H 1825 2850 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 1955 2750 50  0001 C CNN
F 3 "~" H 2025 2750 50  0001 C CNN
F 4 "0.063Вт 0603 10 кОм, 1%" H -4175 1950 50  0001 C CNN "Артикул"
F 5 "https://www.chipdip.ru/product0/9000079736" H -4175 1950 50  0001 C CNN "Ссылка"
F 6 "0,9" H -4175 1950 50  0001 C CNN "Цена"
	1    2025 2750
	-1   0    0    1   
$EndComp
Connection ~ 2025 2600
Wire Wire Line
	2025 2600 2050 2600
$Comp
L UBD-rescue:GND-power #PWR036
U 1 1 5D7BD065
P 2025 2925
F 0 "#PWR036" H 2025 2675 50  0001 C CNN
F 1 "GND" H 2030 2752 50  0000 C CNN
F 2 "" H 2025 2925 50  0001 C CNN
F 3 "" H 2025 2925 50  0001 C CNN
	1    2025 2925
	1    0    0    -1  
$EndComp
Wire Wire Line
	2025 2900 2025 2925
$Comp
L UBD-rescue:+3.3V-power #PWR037
U 1 1 5D86943C
P 4475 2050
F 0 "#PWR037" H 4475 1900 50  0001 C CNN
F 1 "+3.3V" H 4490 2223 50  0000 C CNN
F 2 "" H 4475 2050 50  0001 C CNN
F 3 "" H 4475 2050 50  0001 C CNN
	1    4475 2050
	1    0    0    -1  
$EndComp
Wire Wire Line
	4325 2750 4325 2925
Wire Wire Line
	4100 1850 4100 2175
Wire Wire Line
	4325 1850 4100 1850
Wire Wire Line
	4325 1850 4325 2050
Connection ~ 4100 1850
Wire Wire Line
	4475 2050 4325 2050
Connection ~ 4325 2050
Wire Wire Line
	4325 2050 4325 2100
$Comp
L UBD-rescue:+5V-power #PWR023
U 1 1 5DA65F01
P 1700 2500
F 0 "#PWR023" H 1700 2350 50  0001 C CNN
F 1 "+5V" H 1700 2650 50  0000 C CNN
F 2 "" H 1700 2500 50  0001 C CNN
F 3 "" H 1700 2500 50  0001 C CNN
	1    1700 2500
	1    0    0    -1  
$EndComp
Wire Wire Line
	1700 2500 1700 2600
$Comp
L UBD-rescue:+12V-power #PWR0114
U 1 1 5DB8F983
P 1900 1900
F 0 "#PWR0114" H 1900 1750 50  0001 C CNN
F 1 "+12V" H 2050 2000 50  0000 C CNN
F 2 "" H 1900 1900 50  0001 C CNN
F 3 "" H 1900 1900 50  0001 C CNN
	1    1900 1900
	1    0    0    -1  
$EndComp
Wire Wire Line
	6100 4450 6150 4450
Text Label 6150 4150 0    50   ~ 0
Speed
Wire Wire Line
	6150 4150 6100 4150
Wire Wire Line
	6700 1400 6650 1400
Wire Wire Line
	6650 1400 6650 1450
Wire Wire Line
	6650 1750 6650 1950
Wire Wire Line
	6650 1950 6100 1950
Connection ~ 4200 6250
Wire Wire Line
	4200 6750 4200 6250
Wire Wire Line
	1900 1900 1900 2050
Connection ~ 1800 700 
Wire Wire Line
	6600 2350 6700 2350
Wire Wire Line
	2250 2050 1900 2050
Connection ~ 2250 2050
Connection ~ 1900 2050
Wire Wire Line
	5675 7800 5675 7900
Wire Wire Line
	6900 6950 6900 7200
$Comp
L UBD-rescue:+12V-power #PWR0128
U 1 1 5D0BB3B9
P 6350 5275
F 0 "#PWR0128" H 6350 5125 50  0001 C CNN
F 1 "+12V" H 6365 5448 50  0000 C CNN
F 2 "" H 6350 5275 50  0001 C CNN
F 3 "" H 6350 5275 50  0001 C CNN
	1    6350 5275
	1    0    0    -1  
$EndComp
$Comp
L UBD-rescue:D_Schottky-Device D6
U 1 1 5CFF9E32
P 6350 5675
F 0 "D6" V 6350 5500 50  0000 L CNN
F 1 "Диод Шоттки" V 6400 5175 50  0001 L CNN
F 2 "Diode_SMD:D_SMA" H 6350 5675 50  0001 C CNN
F 3 "~" H 6350 5675 50  0001 C CNN
F 4 "SS16" H 3450 3325 50  0001 C CNN "Артикул"
F 5 "https://www.chipdip.ru/product/ss16" H 3450 3325 50  0001 C CNN "Ссылка"
F 6 "4" H 3450 3325 50  0001 C CNN "Цена"
	1    6350 5675
	0    1    1    0   
$EndComp
$Comp
L UBD-rescue:D_Schottky-Device D5
U 1 1 5CFF5BA7
P 5050 5675
F 0 "D5" V 5050 5500 50  0000 L CNN
F 1 "Диод Шоттки" V 5100 5175 50  0001 L CNN
F 2 "Diode_SMD:D_SMA" H 5050 5675 50  0001 C CNN
F 3 "~" H 5050 5675 50  0001 C CNN
F 4 "SS16" H 2150 3325 50  0001 C CNN "Артикул"
F 5 "https://www.chipdip.ru/product/ss16" H 2150 3325 50  0001 C CNN "Ссылка"
F 6 "4" H 2150 3325 50  0001 C CNN "Цена"
	1    5050 5675
	0    1    1    0   
$EndComp
Connection ~ 6350 5275
Connection ~ 5050 5275
$Comp
L UBD-rescue:+12V-power #PWR0129
U 1 1 5CFEDAE7
P 5050 5275
F 0 "#PWR0129" H 5050 5125 50  0001 C CNN
F 1 "+12V" H 5065 5448 50  0000 C CNN
F 2 "" H 5050 5275 50  0001 C CNN
F 3 "" H 5050 5275 50  0001 C CNN
	1    5050 5275
	1    0    0    -1  
$EndComp
Wire Wire Line
	6350 5825 6350 6025
Wire Wire Line
	6700 6025 6650 6025
Wire Wire Line
	5450 6025 5350 6025
Wire Wire Line
	6650 6025 6650 5975
Wire Wire Line
	6350 6025 6650 6025
Wire Wire Line
	5350 6025 5350 5975
Wire Wire Line
	5050 6025 5350 6025
Wire Wire Line
	5050 5825 5050 6025
Wire Wire Line
	5050 5275 5350 5275
Wire Wire Line
	5050 5525 5050 5275
Wire Wire Line
	6350 5275 6650 5275
Wire Wire Line
	6350 5525 6350 5275
Wire Wire Line
	6650 5375 6650 5275
Wire Wire Line
	5350 5375 5350 5275
Wire Wire Line
	7050 5325 7100 5325
Wire Wire Line
	7050 5375 7050 5325
Wire Wire Line
	7150 6025 7200 6025
Wire Wire Line
	7150 5975 7150 6025
Wire Wire Line
	5850 6025 5900 6025
Wire Wire Line
	5850 5975 5850 6025
Wire Wire Line
	5750 5325 5750 5375
Wire Wire Line
	5800 5325 5750 5325
Text Label 7200 6025 0    50   ~ 0
Tr_NO2
Text Label 5900 6025 0    50   ~ 0
Ig_NO2
Text Label 5800 5325 0    50   ~ 0
Ig_NO1
Text Label 7100 5325 0    50   ~ 0
Tr_NO1
$Comp
L UBD-rescue:G5LE-1-Relay K1
U 1 1 5CB651C7
P 5550 5675
F 0 "K1" H 5600 5375 50  0000 R CNN
F 1 "NRP-18" H 5121 5720 50  0001 R CNN
F 2 "UBD:Relay_NRP-18" H 6000 5625 50  0001 L CNN
F 3 "http://www.omron.com/ecb/products/pdf/en-g5le.pdf" H 5550 5275 50  0001 C CNN
F 4 "NRP-18-C-12D-H" H 2800 525 50  0001 C CNN "Артикул"
F 5 "https://www.chipdip.ru/product/nrp-18-c-12d-s-h" H 2800 525 50  0001 C CNN "Ссылка"
F 6 "47" H 2800 525 50  0001 C CNN "Цена"
	1    5550 5675
	1    0    0    1   
$EndComp
$Comp
L UBD-rescue:G5LE-1-Relay K2
U 1 1 5CCE6A6C
P 6850 5675
F 0 "K2" H 6900 5375 50  0000 R CNN
F 1 "NRP-18" H 6450 5725 50  0001 R CNN
F 2 "UBD:Relay_NRP-18" H 7300 5625 50  0001 L CNN
F 3 "http://www.omron.com/ecb/products/pdf/en-g5le.pdf" H 6850 5275 50  0001 C CNN
F 4 "NRP-18-C-12D-H" H 4100 -525 50  0001 C CNN "Артикул"
F 5 "https://www.chipdip.ru/product/nrp-18-c-12d-s-h" H 4100 -525 50  0001 C CNN "Ссылка"
F 6 "47" H 4100 -525 50  0001 C CNN "Цена"
	1    6850 5675
	1    0    0    1   
$EndComp
Connection ~ 6650 6025
Connection ~ 5350 6025
Text Label 6700 6025 0    50   ~ 0
Tr
Text Label 5450 6025 0    50   ~ 0
Ig
Connection ~ 3550 700 
Wire Wire Line
	5600 8350 5675 8350
Wire Wire Line
	5675 8350 5675 7900
Connection ~ 5675 7900
$Comp
L UBD-rescue:C-Device C2
U 1 1 5D357A86
P 5675 8575
F 0 "C2" H 5875 8525 50  0000 L CNN
F 1 "1000pF" H 5775 8625 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 5713 8425 50  0001 C CNN
F 3 "~" H 5675 8575 50  0001 C CNN
F 4 "4" H 2375 375 50  0001 C CNN "Номер"
F 5 "MLCC1000pF50VNP05%0805" H 2375 375 50  0001 C CNN "Артикул"
F 6 "https://www.chipdip.ru/product0/522764173" H 2375 375 50  0001 C CNN "Ссылка"
F 7 "4" H 2375 375 50  0001 C CNN "Цена"
	1    5675 8575
	-1   0    0    1   
$EndComp
$Comp
L UBD-rescue:GND-power #PWR02
U 1 1 5D35CC6D
P 5675 8750
F 0 "#PWR02" H 5675 8500 50  0001 C CNN
F 1 "GND" H 5680 8577 50  0000 C CNN
F 2 "" H 5675 8750 50  0001 C CNN
F 3 "" H 5675 8750 50  0001 C CNN
	1    5675 8750
	1    0    0    -1  
$EndComp
Wire Wire Line
	5675 8750 5675 8725
Wire Wire Line
	5675 8425 5675 8350
Connection ~ 5675 8350
$Comp
L UBD-rescue:DIODE-Simulation_SPICE D2
U 1 1 5D3EF8EC
P 1400 7100
F 0 "D2" H 1450 7225 50  0000 R CNN
F 1 "BAS321" H 1550 6975 50  0000 R CNN
F 2 "UBD:D_SOD-323_HandSoldering" H 1400 7100 50  0001 C CNN
F 3 "~" H 1400 7100 50  0001 C CNN
F 4 "Y" H 1400 7100 50  0001 L CNN "Spice_Netlist_Enabled"
F 5 "V" H 1400 7100 50  0001 L CNN "Spice_Primitive"
F 6 " BAS321.115" H -2600 -400 50  0001 C CNN "Артикул"
F 7 "https://www.chipdip.ru/product/bas321.115" H -2600 -400 50  0001 C CNN "Ссылка"
F 8 "8" H -2600 -400 50  0001 C CNN "Цена"
	1    1400 7100
	1    0    0    -1  
$EndComp
$Comp
L UBD-rescue:AP1117-33-Regulator_Linear U7
U 1 1 5D035B3F
P 1875 7100
F 0 "U7" H 1875 7342 50  0000 C CNN
F 1 "AP1117-33" H 1875 7251 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-223-3_TabPin2" H 1875 7300 50  0001 C CNN
F 3 "http://www.diodes.com/datasheets/AP1117.pdf" H 1975 6850 50  0001 C CNN
F 4 "AMS1117-3.3" H 375 0   50  0001 C CNN "Артикул"
F 5 "https://www.chipdip.ru/product/ams1117-3.3" H 375 0   50  0001 C CNN "Ссылка"
F 6 "17" H 375 0   50  0001 C CNN "Цена"
	1    1875 7100
	1    0    0    -1  
$EndComp
Wire Wire Line
	1250 7100 1225 7100
Wire Wire Line
	1225 7100 1225 7050
Wire Wire Line
	1550 7100 1575 7100
Wire Wire Line
	1350 8500 1350 8550
Wire Wire Line
	1350 8550 1500 8550
Connection ~ 1500 8550
Wire Wire Line
	1500 8550 1500 8500
$Comp
L UBD-rescue:Conn_01x02-Connector_Generic J7
U 1 1 5D052756
P 1125 1475
F 0 "J7" H 1125 1275 50  0000 C CNN
F 1 "Conn_01x02" H 1175 1275 50  0001 C CNN
F 2 "UBD:DG_308_2" H 1125 1475 50  0001 C CNN
F 3 "~" H 1125 1475 50  0001 C CNN
F 4 "308-021-14" H 125 125 50  0001 C CNN "Артикул"
F 5 "https://www.chipdip.ru/product/308-021-12-14" H 125 125 50  0001 C CNN "Ссылка"
F 6 "14" H 125 125 50  0001 C CNN "Цена"
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
F 2 "Diode_SMD:D_SMA" H 1325 925 50  0001 C CNN
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
L UBD-rescue:C-Device C4
U 1 1 5D38CE6D
P 3300 8500
F 0 "C4" V 3550 8450 50  0000 L CNN
F 1 "10uF" V 3475 8400 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 3338 8350 50  0001 C CNN
F 3 "~" H 3300 8500 50  0001 C CNN
F 4 "4" H 0   300 50  0001 C CNN "Номер"
F 5 "GRM188R61E106MA73D" H 0   300 50  0001 C CNN "Артикул"
F 6 "https://www.chipdip.ru/product/grm188r61e106m" H 0   300 50  0001 C CNN "Ссылка"
F 7 "12" H 0   300 50  0001 C CNN "Цена"
	1    3300 8500
	0    -1   -1   0   
$EndComp
Wire Wire Line
	3450 8500 3475 8500
Wire Wire Line
	3100 8500 3150 8500
$EndSCHEMATC
