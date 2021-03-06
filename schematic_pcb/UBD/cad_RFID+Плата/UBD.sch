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
L MCU_Microchip_ATmega:ATmega128-16AU U4
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
L RF_Module:ESP-12F U3
U 1 1 5CB187AB
P 6900 6850
F 0 "U3" H 7350 7600 50  0000 C CNN
F 1 "ESP-12F" H 7200 6300 50  0000 C CNN
F 2 "UBD:ESP-12E" H 6900 6850 50  0001 C CNN
F 3 "http://wiki.ai-thinker.com/_media/esp8266/esp8266_series_modules_user_manual_v1.1.pdf" H 6550 6950 50  0001 C CNN
F 4 "ESP-12F" H 200 -600 50  0001 C CNN "Артикул"
F 5 "https://ru.aliexpress.com/item/1PCS-ESP-12F-ESP-12E-upgrade-ESP8266-Remote-Serial-Port-WIFI-Wireless-Module-ESP8266-4M-Flash/32808593889.html?spm=a2g0v.search0604.3.54.756a7bd4h24yBq&ws_ab_test=searchweb0_0,searchweb201602_10_10065_10068_319_317_10696_453_10084_454_10083_10618_10307_10301_537_536_10059_10884_10889_10887_321_322_10915_10103_10914_10911_10910,searchweb201603_52,ppcSwitch_0&algo_expid=fb9e239b-b278-458b-882f-3e2b43ccfff1-8&algo_pvid=fb9e239b-b278-458b-882f-3e2b43ccfff1" H 200 -600 50  0001 C CNN "Ссылка"
F 6 "93" H 200 -600 50  0001 C CNN "Цена"
	1    6900 6850
	-1   0    0    -1  
$EndComp
$Comp
L Regulator_Switching:LM2576HVS-12 U2
U 1 1 5CB1ADAC
P 2350 800
F 0 "U2" H 2350 1167 50  0000 C CNN
F 1 "LM2576HVS-12" H 2350 1076 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:TO-263-5_TabPin3" H 2350 550 50  0001 L CIN
F 3 "http://www.ti.com/lit/ds/symlink/lm2576.pdf" H 2350 800 50  0001 C CNN
F 4 "LM2576HVT-12/NOPB" H 0   0   50  0001 C CNN "Артикул"
F 5 "https://www.chipdip.ru/product/lm2576hvt-12-nopb" H 0   0   50  0001 C CNN "Ссылка"
F 6 "330" H 0   0   50  0001 C CNN "Цена"
	1    2350 800 
	1    0    0    -1  
$EndComp
$Comp
L Transistor_BJT:BC817 Q1
U 1 1 5CB20DD2
P 6850 2350
F 0 "Q1" H 7041 2396 50  0000 L CNN
F 1 "BC817" H 7041 2305 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 7050 2275 50  0001 L CIN
F 3 "http://www.fairchildsemi.com/ds/BC/BC817.pdf" H 6850 2350 50  0001 L CNN
F 4 "BC817.215" H 0   0   50  0001 C CNN "Артикул"
F 5 "https://www.chipdip.ru/product/bc817.215" H 0   0   50  0001 C CNN "Ссылка"
F 6 "3" H 0   0   50  0001 C CNN "Цена"
	1    6850 2350
	1    0    0    -1  
$EndComp
Wire Wire Line
	4900 1250 4500 1250
$Comp
L Device:R R2
U 1 1 5CB38DAB
P 4750 800
F 0 "R2" H 4820 846 50  0000 L CNN
F 1 "10k" H 4820 755 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 4680 800 50  0001 C CNN
F 3 "~" H 4750 800 50  0001 C CNN
F 4 "0.063Вт 0603 10 кОм, 1%" H 0   0   50  0001 C CNN "Артикул"
F 5 "https://www.chipdip.ru/product0/9000079736" H 0   0   50  0001 C CNN "Ссылка"
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
L power:+3.3V #PWR0101
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
L power:+3.3V #PWR0102
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
L power:+3.3V #PWR0103
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
L power:GND #PWR0104
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
L power:GND #PWR0105
U 1 1 5CB9CDCC
P 7300 1750
F 0 "#PWR0105" H 7300 1500 50  0001 C CNN
F 1 "GND" H 7305 1577 50  0000 C CNN
F 2 "" H 7300 1750 50  0001 C CNN
F 3 "" H 7300 1750 50  0001 C CNN
	1    7300 1750
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_02x03_Counter_Clockwise J1
U 1 1 5CBB95FE
P 3850 3700
F 0 "J1" H 3900 4050 50  0000 C CNN
F 1 "Для программирования" H 3650 3950 50  0000 C CNN
F 2 "UBD:PinHeader_2x03_P2.54mm_Horizontal" H 3850 3700 50  0001 C CNN
F 3 "~" H 3850 3700 50  0001 C CNN
F 4 "PLD-6 (DS1021-2x3S)" H 0   0   50  0001 C CNN "Артикул"
F 5 "https://www.chipdip.ru/product/pld-6" H 0   0   50  0001 C CNN "Ссылка"
F 6 "6" H 0   0   50  0001 C CNN "Цена"
	1    3850 3700
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR0106
U 1 1 5CBC9A62
P 4200 3550
F 0 "#PWR0106" H 4200 3400 50  0001 C CNN
F 1 "+3.3V" H 4215 3723 50  0000 C CNN
F 2 "" H 4200 3550 50  0001 C CNN
F 3 "" H 4200 3550 50  0001 C CNN
	1    4200 3550
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0107
U 1 1 5CBCBD1E
P 4200 3850
F 0 "#PWR0107" H 4200 3600 50  0001 C CNN
F 1 "GND" H 4205 3677 50  0000 C CNN
F 2 "" H 4200 3850 50  0001 C CNN
F 3 "" H 4200 3850 50  0001 C CNN
	1    4200 3850
	1    0    0    -1  
$EndComp
Wire Wire Line
	4150 3600 4200 3600
Wire Wire Line
	4200 3600 4200 3550
Wire Wire Line
	4150 3800 4200 3800
Wire Wire Line
	4200 3800 4200 3850
Text Label 4200 3700 0    50   ~ 0
Mos
Text Label 3600 3800 2    50   ~ 0
Rst
Text Label 3600 3700 2    50   ~ 0
Sck
Text Label 3600 3600 2    50   ~ 0
Mis
Wire Wire Line
	3600 3600 3650 3600
Wire Wire Line
	3600 3700 3650 3700
Wire Wire Line
	3600 3800 3650 3800
Wire Wire Line
	4200 3700 4150 3700
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
L power:GND #PWR0108
U 1 1 5CC00E5B
P 2350 1300
F 0 "#PWR0108" H 2350 1050 50  0001 C CNN
F 1 "GND" H 2355 1127 50  0000 C CNN
F 2 "" H 2350 1300 50  0001 C CNN
F 3 "" H 2350 1300 50  0001 C CNN
	1    2350 1300
	1    0    0    -1  
$EndComp
Wire Wire Line
	2350 1100 2350 1300
$Comp
L power:GND #PWR0109
U 1 1 5CC098A6
P 1800 1300
F 0 "#PWR0109" H 1800 1050 50  0001 C CNN
F 1 "GND" H 1805 1127 50  0000 C CNN
F 2 "" H 1800 1300 50  0001 C CNN
F 3 "" H 1800 1300 50  0001 C CNN
	1    1800 1300
	1    0    0    -1  
$EndComp
Wire Wire Line
	1850 900  1800 900 
Wire Wire Line
	1800 900  1800 1300
$Comp
L power:GND #PWR0110
U 1 1 5CC10938
P 2900 1300
F 0 "#PWR0110" H 2900 1050 50  0001 C CNN
F 1 "GND" H 2905 1127 50  0000 C CNN
F 2 "" H 2900 1300 50  0001 C CNN
F 3 "" H 2900 1300 50  0001 C CNN
	1    2900 1300
	1    0    0    -1  
$EndComp
Wire Wire Line
	2900 1250 2900 1300
Wire Wire Line
	2850 900  2900 900 
Wire Wire Line
	2900 900  2900 950 
$Comp
L Device:CP C1
U 1 1 5CC1950F
P 1550 1000
F 0 "C1" H 1400 900 50  0000 L CNN
F 1 "100uF" H 1300 800 50  0000 L CNN
F 2 "Capacitor_THT:C_Radial_D8.0mm_H11.5mm_P3.50mm" H 1588 850 50  0001 C CNN
F 3 "~" H 1550 1000 50  0001 C CNN
F 4 "1" H 0   0   50  0001 C CNN "Номер"
F 5 "B41851F8107M000" H 0   0   50  0001 C CNN "Артикул"
F 6 "https://www.chipdip.ru/product0/9000188152" H 0   0   50  0001 C CNN "Ссылка"
F 7 "14" H 0   0   50  0001 C CNN "Цена"
	1    1550 1000
	1    0    0    -1  
$EndComp
Wire Wire Line
	1850 700  1550 700 
Wire Wire Line
	1550 700  1550 850 
$Comp
L power:GND #PWR0111
U 1 1 5CC1C476
P 1550 1300
F 0 "#PWR0111" H 1550 1050 50  0001 C CNN
F 1 "GND" H 1555 1127 50  0000 C CNN
F 2 "" H 1550 1300 50  0001 C CNN
F 3 "" H 1550 1300 50  0001 C CNN
	1    1550 1300
	1    0    0    -1  
$EndComp
Wire Wire Line
	1550 1150 1550 1300
Wire Wire Line
	2950 900  2900 900 
Connection ~ 2900 900 
$Comp
L Device:CP C3
U 1 1 5CC2AAF7
P 3300 1100
F 0 "C3" H 3418 1146 50  0000 L CNN
F 1 "220uF" H 3418 1055 50  0000 L CNN
F 2 "Capacitor_SMD:CP_Elec_8x10.5" H 3338 950 50  0001 C CNN
F 3 "~" H 3300 1100 50  0001 C CNN
F 4 "2" H 0   0   50  0001 C CNN "Номер"
F 5 "ECAP SMD, 220 мкФ, 25В" H 0   0   50  0001 C CNN "Артикул"
F 6 "https://www.chipdip.ru/product0/57194" H 0   0   50  0001 C CNN "Ссылка"
F 7 "24" H 0   0   50  0001 C CNN "Цена"
	1    3300 1100
	1    0    0    -1  
$EndComp
Wire Wire Line
	3250 900  3300 900 
Wire Wire Line
	3300 900  3300 950 
$Comp
L power:GND #PWR0112
U 1 1 5CC2C12E
P 3300 1300
F 0 "#PWR0112" H 3300 1050 50  0001 C CNN
F 1 "GND" H 3305 1127 50  0000 C CNN
F 2 "" H 3300 1300 50  0001 C CNN
F 3 "" H 3300 1300 50  0001 C CNN
	1    3300 1300
	1    0    0    -1  
$EndComp
Wire Wire Line
	3300 1250 3300 1300
Wire Wire Line
	2850 700  3300 700 
Wire Wire Line
	3300 700  3300 900 
Connection ~ 3300 900 
$Comp
L Device:D_Schottky D1
U 1 1 5CC435EF
P 1350 700
F 0 "D1" H 1300 550 50  0000 L CNN
F 1 "Диод Шоттки" H 1350 600 50  0001 L CNN
F 2 "Diode_SMD:D_SMA" H 1350 700 50  0001 C CNN
F 3 "~" H 1350 700 50  0001 C CNN
F 4 "SS16" H 0   0   50  0001 C CNN "Артикул"
F 5 "https://www.chipdip.ru/product/ss16" H 0   0   50  0001 C CNN "Ссылка"
F 6 "4" H 0   0   50  0001 C CNN "Цена"
	1    1350 700 
	-1   0    0    1   
$EndComp
Wire Wire Line
	1500 700  1550 700 
Connection ~ 1550 700 
$Comp
L Device:Fuse F1
U 1 1 5CC591C6
P 1150 900
F 0 "F1" H 1210 946 50  0000 L CNN
F 1 "Fuse" H 1210 855 50  0000 L CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 1080 900 50  0001 C CNN
F 3 "~" H 1150 900 50  0001 C CNN
F 4 "Fuse 1.1A smd" H 0   0   50  0001 C CNN "Артикул"
F 5 "https://ru.aliexpress.com/item/100-0805-1206-1812-0-05A-2A-0-1A-0-2A-0-5A-0/32894932841.html?spm=a2g0v.search0604.3.2.5dfa3840LWdN9u&s=p&ws_ab_test=searchweb0_0%2Csearchweb201602_10_10065_10068_319_317_10696_453_10084_454_10083_10618_10307_10301_537_536_10059_10884_10889_10887_321_322_10915_10103_10914_10911_10910%2Csearchweb201603_52%2CppcSwitch_0&algo_pvid=f4320855-dcf9-435f-8f79-b3d6bf9b8046&algo_expid=f4320855-dcf9-435f-8f79-b3d6bf9b8046-0" H 0   0   50  0001 C CNN "Ссылка"
F 6 "6" H 0   0   50  0001 C CNN "Цена"
	1    1150 900 
	1    0    0    -1  
$EndComp
Wire Wire Line
	1200 700  1150 700 
Wire Wire Line
	1150 700  1150 750 
$Comp
L power:+12V #PWR0113
U 1 1 5CC77906
P 3300 550
F 0 "#PWR0113" H 3300 400 50  0001 C CNN
F 1 "+12V" H 3315 723 50  0000 C CNN
F 2 "" H 3300 550 50  0001 C CNN
F 3 "" H 3300 550 50  0001 C CNN
	1    3300 550 
	1    0    0    -1  
$EndComp
Wire Wire Line
	3300 550  3300 700 
Connection ~ 3300 700 
$Comp
L Device:L L2
U 1 1 5CC22F51
P 3100 900
F 0 "L2" V 3050 900 50  0000 C CNN
F 1 "2200" V 3199 900 50  0000 C CNN
F 2 "UBD:L_10.4x10.4_H4.8" H 3100 900 50  0001 C CNN
F 3 "~" H 3100 900 50  0001 C CNN
F 4 "SDR0805-222KL, 2200 мкГн" H 0   0   50  0001 C CNN "Артикул"
F 5 "https://www.chipdip.ru/product/sdr0805-222kl" H 0   0   50  0001 C CNN "Ссылка"
F 6 "30" H 0   0   50  0001 C CNN "Цена"
	1    3100 900 
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR0122
U 1 1 5CD66DBF
P 6900 7600
F 0 "#PWR0122" H 6900 7350 50  0001 C CNN
F 1 "GND" H 6750 7550 50  0000 C CNN
F 2 "" H 6900 7600 50  0001 C CNN
F 3 "" H 6900 7600 50  0001 C CNN
	1    6900 7600
	-1   0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR0123
U 1 1 5CD6B7F4
P 6900 5800
F 0 "#PWR0123" H 6900 5650 50  0001 C CNN
F 1 "+3.3V" H 6915 5973 50  0000 C CNN
F 2 "" H 6900 5800 50  0001 C CNN
F 3 "" H 6900 5800 50  0001 C CNN
	1    6900 5800
	-1   0    0    -1  
$EndComp
Wire Wire Line
	6900 7550 6900 7600
$Comp
L power:GND #PWR0124
U 1 1 5CD72037
P 6200 7600
F 0 "#PWR0124" H 6200 7350 50  0001 C CNN
F 1 "GND" H 6050 7550 50  0000 C CNN
F 2 "" H 6200 7600 50  0001 C CNN
F 3 "" H 6200 7600 50  0001 C CNN
	1    6200 7600
	-1   0    0    -1  
$EndComp
Wire Wire Line
	6200 7150 6300 7150
$Comp
L Device:R R7
U 1 1 5CD7A08E
P 7550 6050
F 0 "R7" H 7400 6000 50  0000 C CNN
F 1 "360" H 7400 6100 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 7480 6050 50  0001 C CNN
F 3 "~" H 7550 6050 50  0001 C CNN
F 4 "0.063Вт 0603 360 Ом, 1%" H 200 -600 50  0001 C CNN "Артикул"
F 5 "https://www.chipdip.ru/product0/9000079629" H 200 -600 50  0001 C CNN "Ссылка"
F 6 "0,9" H 200 -600 50  0001 C CNN "Цена"
	1    7550 6050
	1    0    0    1   
$EndComp
$Comp
L power:+3.3V #PWR0125
U 1 1 5CD7C4BC
P 7550 5800
F 0 "#PWR0125" H 7550 5650 50  0001 C CNN
F 1 "+3.3V" H 7565 5973 50  0000 C CNN
F 2 "" H 7550 5800 50  0001 C CNN
F 3 "" H 7550 5800 50  0001 C CNN
	1    7550 5800
	-1   0    0    -1  
$EndComp
Wire Wire Line
	7500 6250 7550 6250
Wire Wire Line
	7550 6250 7550 6200
Wire Wire Line
	7550 5900 7550 5850
$Comp
L Device:R R8
U 1 1 5CD83466
P 7700 6050
F 0 "R8" H 7850 6000 50  0000 C CNN
F 1 "360" H 7850 6100 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 7630 6050 50  0001 C CNN
F 3 "~" H 7700 6050 50  0001 C CNN
F 4 "0.063Вт 0603 360 Ом, 1%" H 200 -600 50  0001 C CNN "Артикул"
F 5 "https://www.chipdip.ru/product0/9000079629" H 200 -600 50  0001 C CNN "Ссылка"
F 6 "0,9" H 200 -600 50  0001 C CNN "Цена"
	1    7700 6050
	1    0    0    1   
$EndComp
Wire Wire Line
	7700 6200 7700 6450
Wire Wire Line
	7700 6450 7500 6450
Wire Wire Line
	7700 5900 7700 5850
Connection ~ 7550 5850
Wire Wire Line
	7550 5850 7550 5800
Connection ~ 7550 6250
Text Label 6150 4150 0    50   ~ 0
Rst_wf
Wire Wire Line
	6150 4150 6100 4150
$Comp
L Device:D_Schottky D3
U 1 1 5CDE9346
P 2900 1100
F 0 "D3" V 2900 1200 50  0000 L CNN
F 1 "Диод Шоттки" H 2945 1179 50  0001 L CNN
F 2 "Diode_SMD:D_SMA" H 2900 1100 50  0001 C CNN
F 3 "~" H 2900 1100 50  0001 C CNN
F 4 "SS16" H 0   0   50  0001 C CNN "Артикул"
F 5 "https://www.chipdip.ru/product/ss16" H 0   0   50  0001 C CNN "Ссылка"
F 6 "4" H 0   0   50  0001 C CNN "Цена"
	1    2900 1100
	0    1    1    0   
$EndComp
$Comp
L Device:C C5
U 1 1 5CC0F19B
P 2300 3950
F 0 "C5" H 2415 3996 50  0000 L CNN
F 1 "1uF" H 2415 3905 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 2338 3800 50  0001 C CNN
F 3 "~" H 2300 3950 50  0001 C CNN
F 4 "3" H 0   0   50  0001 C CNN "Номер"
F 5 "GRM21BR71C105KA01K" H 0   0   50  0001 C CNN "Артикул"
F 6 "https://www.chipdip.ru/product/grm21br71c105k" H 0   0   50  0001 C CNN "Ссылка"
F 7 "4" H 0   0   50  0001 C CNN "Цена"
	1    2300 3950
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR03
U 1 1 5CC0F1A1
P 2300 3750
F 0 "#PWR03" H 2300 3600 50  0001 C CNN
F 1 "+3.3V" H 2315 3923 50  0000 C CNN
F 2 "" H 2300 3750 50  0001 C CNN
F 3 "" H 2300 3750 50  0001 C CNN
	1    2300 3750
	-1   0    0    -1  
$EndComp
$Comp
L power:GND #PWR04
U 1 1 5CC0F1A7
P 2300 4150
F 0 "#PWR04" H 2300 3900 50  0001 C CNN
F 1 "GND" H 2150 4100 50  0000 C CNN
F 2 "" H 2300 4150 50  0001 C CNN
F 3 "" H 2300 4150 50  0001 C CNN
	1    2300 4150
	-1   0    0    -1  
$EndComp
Wire Wire Line
	2300 3750 2300 3800
Wire Wire Line
	2300 4150 2300 4100
$Comp
L Device:C C6
U 1 1 5CC12311
P 2700 3950
F 0 "C6" H 2815 3996 50  0000 L CNN
F 1 "1uF" H 2815 3905 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 2738 3800 50  0001 C CNN
F 3 "~" H 2700 3950 50  0001 C CNN
F 4 "3" H 0   0   50  0001 C CNN "Номер"
F 5 "GRM21BR71C105KA01K" H 0   0   50  0001 C CNN "Артикул"
F 6 "https://www.chipdip.ru/product/grm21br71c105k" H 0   0   50  0001 C CNN "Ссылка"
F 7 "4" H 0   0   50  0001 C CNN "Цена"
	1    2700 3950
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR05
U 1 1 5CC12317
P 2700 3750
F 0 "#PWR05" H 2700 3600 50  0001 C CNN
F 1 "+3.3V" H 2715 3923 50  0000 C CNN
F 2 "" H 2700 3750 50  0001 C CNN
F 3 "" H 2700 3750 50  0001 C CNN
	1    2700 3750
	-1   0    0    -1  
$EndComp
$Comp
L power:GND #PWR06
U 1 1 5CC1231D
P 2700 4150
F 0 "#PWR06" H 2700 3900 50  0001 C CNN
F 1 "GND" H 2550 4100 50  0000 C CNN
F 2 "" H 2700 4150 50  0001 C CNN
F 3 "" H 2700 4150 50  0001 C CNN
	1    2700 4150
	-1   0    0    -1  
$EndComp
Wire Wire Line
	2700 3750 2700 3800
Wire Wire Line
	2700 4150 2700 4100
$Comp
L Device:R R9
U 1 1 5CC5F549
P 6450 2350
F 0 "R9" V 6550 2350 50  0000 C CNN
F 1 "360" V 6450 2350 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 6380 2350 50  0001 C CNN
F 3 "~" H 6450 2350 50  0001 C CNN
F 4 "0.063Вт 0603 360 Ом, 1%" H 0   0   50  0001 C CNN "Артикул"
F 5 "https://www.chipdip.ru/product0/9000079629" H 0   0   50  0001 C CNN "Ссылка"
F 6 "0,9" H 0   0   50  0001 C CNN "Цена"
	1    6450 2350
	0    -1   -1   0   
$EndComp
Wire Wire Line
	6650 2350 6600 2350
$Comp
L power:GND #PWR07
U 1 1 5CC6E28A
P 6950 2600
F 0 "#PWR07" H 6950 2350 50  0001 C CNN
F 1 "GND" H 6955 2427 50  0000 C CNN
F 2 "" H 6950 2600 50  0001 C CNN
F 3 "" H 6950 2600 50  0001 C CNN
	1    6950 2600
	1    0    0    -1  
$EndComp
Wire Wire Line
	6950 2600 6950 2550
$Comp
L Transistor_BJT:BC817 Q2
U 1 1 5CC91704
P 6850 4350
F 0 "Q2" H 7041 4396 50  0000 L CNN
F 1 "BC817" H 7041 4305 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 7050 4275 50  0001 L CIN
F 3 "http://www.fairchildsemi.com/ds/BC/BC817.pdf" H 6850 4350 50  0001 L CNN
F 4 "BC817.215" H 0   0   50  0001 C CNN "Артикул"
F 5 "https://www.chipdip.ru/product/bc817.215" H 0   0   50  0001 C CNN "Ссылка"
F 6 "3" H 0   0   50  0001 C CNN "Цена"
	1    6850 4350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR08
U 1 1 5CC91711
P 6950 4600
F 0 "#PWR08" H 6950 4350 50  0001 C CNN
F 1 "GND" H 6955 4427 50  0000 C CNN
F 2 "" H 6950 4600 50  0001 C CNN
F 3 "" H 6950 4600 50  0001 C CNN
	1    6950 4600
	1    0    0    -1  
$EndComp
Wire Wire Line
	6950 4600 6950 4550
Wire Wire Line
	6100 2350 6300 2350
$Comp
L Relay:G5LE-1 K2
U 1 1 5CCE6A6C
P 2750 6200
F 0 "K2" H 2800 5900 50  0000 R CNN
F 1 "G5LE-1" H 2350 6250 50  0001 R CNN
F 2 "UBD:Relay_SPDT_Omron-G5LE-1" H 3200 6150 50  0001 L CNN
F 3 "http://www.omron.com/ecb/products/pdf/en-g5le.pdf" H 2750 5800 50  0001 C CNN
F 4 "NRP-07-C-12D" H 0   0   50  0001 C CNN "Артикул"
F 5 "https://www.chipdip.ru/product/nrp-07-c-12d" H 0   0   50  0001 C CNN "Ссылка"
F 6 "61" H 0   0   50  0001 C CNN "Цена"
	1    2750 6200
	1    0    0    1   
$EndComp
$Comp
L Device:D_Schottky D6
U 1 1 5CCFFD09
P 2250 6200
F 0 "D6" V 2250 6050 50  0000 L CNN
F 1 "Диод защитный" V 2300 5700 50  0001 L CNN
F 2 "Diode_THT:D_DO-41_SOD81_P7.62mm_Horizontal" H 2250 6200 50  0001 C CNN
F 3 "~" H 2250 6200 50  0001 C CNN
F 4 "EM518" H 0   0   50  0001 C CNN "Артикул"
F 5 "https://www.chipdip.ru/product/em518" H 0   0   50  0001 C CNN "Ссылка"
F 6 "3" H 0   0   50  0001 C CNN "Цена"
	1    2250 6200
	0    1    1    0   
$EndComp
$Comp
L Device:D_Schottky D5
U 1 1 5CD060BA
P 2250 5150
F 0 "D5" V 2250 5000 50  0000 L CNN
F 1 "Диод защитный" V 2300 4650 50  0001 L CNN
F 2 "Diode_THT:D_DO-41_SOD81_P7.62mm_Horizontal" H 2250 5150 50  0001 C CNN
F 3 "~" H 2250 5150 50  0001 C CNN
F 4 "EM518" H 0   0   50  0001 C CNN "Артикул"
F 5 "https://www.chipdip.ru/product/em518" H 0   0   50  0001 C CNN "Ссылка"
F 6 "3" H 0   0   50  0001 C CNN "Цена"
	1    2250 5150
	0    1    1    0   
$EndComp
$Comp
L Relay:G5LE-1 K1
U 1 1 5CB651C7
P 2750 5150
F 0 "K1" H 2800 4850 50  0000 R CNN
F 1 "G5LE-1" H 2321 5195 50  0001 R CNN
F 2 "UBD:Relay_SPDT_Omron-G5LE-1" H 3200 5100 50  0001 L CNN
F 3 "http://www.omron.com/ecb/products/pdf/en-g5le.pdf" H 2750 4750 50  0001 C CNN
F 4 "NRP-07-C-12D" H 0   0   50  0001 C CNN "Артикул"
F 5 "https://www.chipdip.ru/product/nrp-07-c-12d" H 0   0   50  0001 C CNN "Ссылка"
F 6 "61" H 0   0   50  0001 C CNN "Цена"
	1    2750 5150
	1    0    0    1   
$EndComp
$Comp
L power:+12V #PWR09
U 1 1 5CC388FE
P 1200 5450
F 0 "#PWR09" H 1200 5300 50  0001 C CNN
F 1 "+12V" H 1215 5623 50  0000 C CNN
F 2 "" H 1200 5450 50  0001 C CNN
F 3 "" H 1200 5450 50  0001 C CNN
	1    1200 5450
	0    -1   -1   0   
$EndComp
Text Label 1800 6250 0    50   ~ 0
Ig_NO_1
Text Label 1200 6250 2    50   ~ 0
Ig_NO_1
Text Label 3000 4800 0    50   ~ 0
Ig_NO_1
Wire Wire Line
	3000 4800 2950 4800
Wire Wire Line
	2950 4800 2950 4850
Text Label 1800 6150 0    50   ~ 0
Ig_NO_2
Text Label 1200 6150 2    50   ~ 0
Ig_NO_2
Text Label 3100 5500 0    50   ~ 0
Ig_NO_2
Wire Wire Line
	3050 5450 3050 5500
Wire Wire Line
	3050 5500 3100 5500
Text Label 1200 6050 2    50   ~ 0
Tr_NO_1
Text Label 1200 5950 2    50   ~ 0
Tr_NO_2
Text Label 1800 6050 0    50   ~ 0
Tr_NO_1
Text Label 1800 5950 0    50   ~ 0
Tr_NO_2
Text Label 3000 5850 0    50   ~ 0
Tr_NO_1
Text Label 3100 6550 0    50   ~ 0
Tr_NO_2
Wire Wire Line
	3050 6500 3050 6550
Wire Wire Line
	3050 6550 3100 6550
Wire Wire Line
	2950 5900 2950 5850
Wire Wire Line
	2950 5850 3000 5850
$Comp
L Connector_Generic:Conn_02x06_Counter_Clockwise J5
U 1 1 5CC63BA3
P 1450 6150
F 0 "J5" H 1100 6500 50  0000 C CNN
F 1 "На релейной плате" H 1600 6500 50  0000 C CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_2x06_P2.54mm_Vertical" H 1450 6150 50  0001 C CNN
F 3 "~" H 1450 6150 50  0001 C CNN
F 4 "PBD-12 (DS-1023 - 2x6)" H 0   0   50  0001 C CNN "Артикул"
F 5 "https://www.chipdip.ru/product/pbd-12" H 0   0   50  0001 C CNN "Ссылка"
F 6 "13" H 0   0   50  0001 C CNN "Цена"
	1    1450 6150
	1    0    0    -1  
$EndComp
Wire Wire Line
	1800 5950 1750 5950
Wire Wire Line
	1200 5950 1250 5950
Wire Wire Line
	1200 6050 1250 6050
Wire Wire Line
	1750 6050 1800 6050
Wire Wire Line
	1200 6150 1250 6150
Wire Wire Line
	1200 6250 1250 6250
Wire Wire Line
	1800 6250 1750 6250
Wire Wire Line
	1800 6150 1750 6150
Text Label 1800 6450 0    50   ~ 0
+12_Rel
Text Label 1200 6450 2    50   ~ 0
+12_Rel
Wire Wire Line
	1800 6450 1750 6450
Wire Wire Line
	1200 6450 1250 6450
Text Label 2600 4750 0    50   ~ 0
+12_Rel
Wire Wire Line
	2550 4850 2550 4750
Wire Wire Line
	2550 4750 2600 4750
Text Label 2600 5800 0    50   ~ 0
+12_Rel
Wire Wire Line
	2550 5900 2550 5800
Wire Wire Line
	2550 5800 2600 5800
Wire Wire Line
	2250 6050 2250 5800
Wire Wire Line
	2250 5800 2550 5800
Connection ~ 2550 5800
Wire Wire Line
	2250 5000 2250 4750
Wire Wire Line
	2250 4750 2550 4750
Connection ~ 2550 4750
Wire Wire Line
	2250 5300 2250 5500
Wire Wire Line
	2250 5500 2550 5500
Wire Wire Line
	2550 5500 2550 5450
Wire Wire Line
	2250 6550 2550 6550
Wire Wire Line
	2550 6550 2550 6500
Text Label 1200 6350 2    50   ~ 0
Ig
Wire Wire Line
	1250 6350 1200 6350
Text Label 2650 5500 0    50   ~ 0
Ig
Wire Wire Line
	2650 5500 2550 5500
Connection ~ 2550 5500
Text Label 1800 6350 0    50   ~ 0
Tr
Wire Wire Line
	1750 6350 1800 6350
Text Label 2600 6550 0    50   ~ 0
Tr
Wire Wire Line
	2600 6550 2550 6550
Connection ~ 2550 6550
Wire Wire Line
	2250 6350 2250 6550
$Comp
L Connector_Generic:Conn_02x06_Counter_Clockwise J6
U 1 1 5CD8D9AE
P 1450 5150
F 0 "J6" H 1100 5500 50  0000 C CNN
F 1 "На основной плате" H 1600 5500 50  0000 C CNN
F 2 "UBD:PinHeader_2x06_P2.54mm_Vertical" H 1450 5150 50  0001 C CNN
F 3 "~" H 1450 5150 50  0001 C CNN
F 4 "PLD-12" H 0   0   50  0001 C CNN "Артикул"
F 5 "https://www.chipdip.ru/product/pld-12" H 0   0   50  0001 C CNN "Ссылка"
F 6 "20" H 0   0   50  0001 C CNN "Цена"
	1    1450 5150
	1    0    0    -1  
$EndComp
$Comp
L Device:LED D7
U 1 1 5CDEB0D8
P 6750 1350
F 0 "D7" H 6100 1350 50  0000 C CNN
F 1 "Светодиод красный" H 6400 900 50  0000 C CNN
F 2 "UBD:LED_D3.0mm_Horizontal_O1.27mm_Z2.0mm" H 6750 1350 50  0001 C CNN
F 3 "~" H 6750 1350 50  0001 C CNN
F 4 "GNL-3014SRD" H 0   0   50  0001 C CNN "Артикул"
F 5 "https://www.chipdip.ru/product/gnl-3014srd" H 0   0   50  0001 C CNN "Ссылка"
F 6 "4" H 0   0   50  0001 C CNN "Цена"
	1    6750 1350
	-1   0    0    1   
$EndComp
$Comp
L Device:LED D8
U 1 1 5CDFC4A1
P 7050 1450
F 0 "D8" H 6700 1450 50  0000 C CNN
F 1 "Светодиод жёлтый" H 7000 1000 50  0000 C CNN
F 2 "UBD:LED_D3.0mm_Horizontal_O1.27mm_Z2.0mm" H 7050 1450 50  0001 C CNN
F 3 "~" H 7050 1450 50  0001 C CNN
F 4 "GNL-3012GD" H 0   0   50  0001 C CNN "Артикул"
F 5 "https://www.chipdip.ru/product/gnl-3012gd" H 0   0   50  0001 C CNN "Ссылка"
F 6 "5" H 0   0   50  0001 C CNN "Цена"
	1    7050 1450
	-1   0    0    1   
$EndComp
$Comp
L Device:LED D9
U 1 1 5CDFC9E3
P 6750 1550
F 0 "D9" H 6100 1550 50  0000 C CNN
F 1 "Светодиод зелёный" H 6400 1100 50  0000 C CNN
F 2 "UBD:LED_D3.0mm_Horizontal_O1.27mm_Z2.0mm" H 6750 1550 50  0001 C CNN
F 3 "~" H 6750 1550 50  0001 C CNN
F 4 "GNL-3014YT" H 0   0   50  0001 C CNN "Артикул"
F 5 "https://www.chipdip.ru/product/gnl-3014yt" H 0   0   50  0001 C CNN "Ссылка"
F 6 "5" H 0   0   50  0001 C CNN "Цена"
	1    6750 1550
	-1   0    0    1   
$EndComp
$Comp
L Device:LED D10
U 1 1 5CDFD38D
P 7050 1650
F 0 "D10" H 6700 1650 50  0000 C CNN
F 1 "Светодиод синий" H 6650 1200 50  0000 L CNN
F 2 "UBD:LED_D3.0mm_Horizontal_O1.27mm_Z2.0mm" H 7050 1650 50  0001 C CNN
F 3 "~" H 7050 1650 50  0001 C CNN
F 4 "GNL-3014UBD-TL" H 0   0   50  0001 C CNN "Артикул"
F 5 "https://www.chipdip.ru/product/gnl-3014ubd-tl" H 0   0   50  0001 C CNN "Ссылка"
F 6 "11" H 0   0   50  0001 C CNN "Цена"
	1    7050 1650
	-1   0    0    1   
$EndComp
Wire Wire Line
	7300 1750 7300 1650
Wire Wire Line
	7300 1350 6900 1350
Wire Wire Line
	7200 1450 7300 1450
Connection ~ 7300 1450
Wire Wire Line
	7300 1450 7300 1350
Wire Wire Line
	6900 1550 7300 1550
Connection ~ 7300 1550
Wire Wire Line
	7300 1550 7300 1450
Wire Wire Line
	7200 1650 7300 1650
Connection ~ 7300 1650
Wire Wire Line
	7300 1650 7300 1550
$Comp
L Device:R_Pack04 R3
U 1 1 5CE72AF4
P 6350 1550
F 0 "R3" V 5933 1550 50  0000 C CNN
F 1 "360" V 6024 1550 50  0000 C CNN
F 2 "Resistor_SMD:R_Array_Convex_4x0603" V 6625 1550 50  0001 C CNN
F 3 "~" H 6350 1550 50  0001 C CNN
F 4 "CAY16-331J4 4х330 Ом" H 0   0   50  0001 C CNN "Артикул"
F 5 "https://www.chipdip.ru/product/cay16-331j4" H 0   0   50  0001 C CNN "Ссылка"
F 6 "2" H 0   0   50  0001 C CNN "Цена"
	1    6350 1550
	0    1    1    0   
$EndComp
Wire Wire Line
	6550 1350 6600 1350
Wire Wire Line
	6550 1450 6900 1450
Wire Wire Line
	6550 1550 6600 1550
Wire Wire Line
	6550 1650 6900 1650
$Comp
L Switch:SW_DIP_x08 SW1
U 1 1 5CEB50BD
P 6450 3250
F 0 "SW1" H 6450 3900 50  0000 C CNN
F 1 "Выбор адреса" H 6450 3800 50  0000 C CNN
F 2 "Button_Switch_SMD:SW_DIP_SPSTx08_Slide_Omron_A6H-8101_W6.15mm_P1.27mm" H 6450 3250 50  0001 C CNN
F 3 "~" H 6450 3250 50  0001 C CNN
F 4 "NHDS-08" H 0   0   50  0001 C CNN "Артикул"
F 5 "http://www.platan.ru/cgi-bin/qwery.pl/id=105430408" H 0   0   50  0001 C CNN "Ссылка"
F 6 "70" H 0   0   50  0001 C CNN "Цена"
	1    6450 3250
	1    0    0    -1  
$EndComp
Wire Wire Line
	7550 5850 7700 5850
Wire Wire Line
	7550 6250 7800 6250
Wire Wire Line
	6100 3750 6600 3750
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
L power:GND #PWR0127
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
$Comp
L Connector_Generic:Conn_01x09 J2
U 1 1 5CF8379C
P 1900 3850
F 0 "J2" H 1150 4350 50  0000 L CNN
F 1 "Входной клемник" H 1300 4350 50  0000 L CNN
F 2 "UBD:DG_381_9" H 1900 3850 50  0001 C CNN
F 3 "~" H 1900 3850 50  0001 C CNN
F 4 "340-031-12 (EK381V-03P)" H 0   0   50  0001 C CNN "Артикул"
F 5 "https://www.chipdip.ru/product/340-031-12" H 0   0   50  0001 C CNN "Ссылка"
F 6 "21" H 0   0   50  0001 C CNN "Цена"
	1    1900 3850
	1    0    0    -1  
$EndComp
Text Label 1150 1150 2    50   ~ 0
+Vin
Wire Wire Line
	1150 1150 1150 1050
Text Label 1650 3550 2    50   ~ 0
+Vin
Wire Wire Line
	1650 3550 1700 3550
$Comp
L power:GND #PWR0128
U 1 1 5CFC7E13
P 1200 3550
F 0 "#PWR0128" H 1200 3300 50  0001 C CNN
F 1 "GND" H 1205 3377 50  0000 C CNN
F 2 "" H 1200 3550 50  0001 C CNN
F 3 "" H 1200 3550 50  0001 C CNN
	1    1200 3550
	1    0    0    -1  
$EndComp
Text Label 1200 4950 2    50   ~ 0
Tr_NO2
Text Label 1200 5050 2    50   ~ 0
Tr_NO1
Text Label 1200 5150 2    50   ~ 0
Ig_NO2
Text Label 1200 5250 2    50   ~ 0
Ig_NO1
Text Label 1200 5350 2    50   ~ 0
Igg
Text Label 1800 4950 0    50   ~ 0
Tr_NO2
Text Label 1800 5050 0    50   ~ 0
Tr_NO1
Text Label 1800 5150 0    50   ~ 0
Ig_NO2
Text Label 1800 5250 0    50   ~ 0
Ig_NO1
Text Label 1800 5350 0    50   ~ 0
Trr
$Comp
L power:+12V #PWR0129
U 1 1 5CFEDAE7
P 1800 5450
F 0 "#PWR0129" H 1800 5300 50  0001 C CNN
F 1 "+12V" H 1815 5623 50  0000 C CNN
F 2 "" H 1800 5450 50  0001 C CNN
F 3 "" H 1800 5450 50  0001 C CNN
	1    1800 5450
	0    1    1    0   
$EndComp
Wire Wire Line
	1750 5450 1800 5450
Wire Wire Line
	1200 4950 1250 4950
Wire Wire Line
	1200 5050 1250 5050
Wire Wire Line
	1200 5150 1250 5150
Wire Wire Line
	1200 5250 1250 5250
Wire Wire Line
	1200 5350 1250 5350
Wire Wire Line
	1750 5350 1800 5350
Wire Wire Line
	1750 5250 1800 5250
Wire Wire Line
	1750 5150 1800 5150
Wire Wire Line
	1750 5050 1800 5050
Wire Wire Line
	1750 4950 1800 4950
Text Label 1650 3650 2    50   ~ 0
Ig_NO1
Wire Wire Line
	1650 3650 1700 3650
Text Label 1650 3750 2    50   ~ 0
Ig_NO2
Wire Wire Line
	1650 3750 1700 3750
Text Label 1650 3850 2    50   ~ 0
Tr_NO2
Text Label 1650 3950 2    50   ~ 0
Tr_NO1
Wire Wire Line
	1650 3850 1700 3850
Wire Wire Line
	1650 3950 1700 3950
$Comp
L power:+12V #PWR0130
U 1 1 5D0A0C71
P 3700 4350
F 0 "#PWR0130" H 3700 4200 50  0001 C CNN
F 1 "+12V" H 3715 4523 50  0000 C CNN
F 2 "" H 3700 4350 50  0001 C CNN
F 3 "" H 3700 4350 50  0001 C CNN
	1    3700 4350
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR0131
U 1 1 5D0ACBAD
P 3500 4350
F 0 "#PWR0131" H 3500 4100 50  0001 C CNN
F 1 "GND" H 3505 4177 50  0000 C CNN
F 2 "" H 3500 4350 50  0001 C CNN
F 3 "" H 3500 4350 50  0001 C CNN
	1    3500 4350
	1    0    0    -1  
$EndComp
Text Label 6400 1050 0    50   ~ 0
Data0
Wire Wire Line
	6100 1050 6200 1050
Text Label 3950 4400 2    50   ~ 0
Data0
Text Label 7000 4050 0    50   ~ 0
Trr
Wire Wire Line
	7000 4050 6950 4050
Wire Wire Line
	6950 4050 6950 4150
Text Label 7000 2000 0    50   ~ 0
Igg
Wire Wire Line
	7000 2000 6950 2000
Wire Wire Line
	6950 2000 6950 2150
$Comp
L Device:R R4
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
L power:+3.3V #PWR01
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
	3650 5700 3600 5700
Wire Wire Line
	3600 5700 3600 5900
Wire Wire Line
	3600 6000 3650 6000
Wire Wire Line
	3650 5900 3600 5900
Connection ~ 3600 5900
Wire Wire Line
	3600 5900 3600 6000
Wire Wire Line
	3650 5600 3550 5600
Wire Wire Line
	3550 5600 3550 5800
Wire Wire Line
	3550 6100 3650 6100
Wire Wire Line
	3650 5800 3550 5800
Connection ~ 3550 5800
Wire Wire Line
	3550 5800 3550 6100
$Comp
L power:GND #PWR012
U 1 1 5D2F64A5
P 3600 6550
F 0 "#PWR012" H 3600 6300 50  0001 C CNN
F 1 "GND" H 3450 6500 50  0000 C CNN
F 2 "" H 3600 6550 50  0001 C CNN
F 3 "" H 3600 6550 50  0001 C CNN
	1    3600 6550
	-1   0    0    -1  
$EndComp
$Comp
L power:GND #PWR014
U 1 1 5D2F70A2
P 4500 6550
F 0 "#PWR014" H 4500 6300 50  0001 C CNN
F 1 "GND" H 4350 6500 50  0000 C CNN
F 2 "" H 4500 6550 50  0001 C CNN
F 3 "" H 4500 6550 50  0001 C CNN
	1    4500 6550
	-1   0    0    -1  
$EndComp
Wire Wire Line
	4050 6300 4050 6350
Wire Wire Line
	3550 6350 3550 6100
Connection ~ 3550 6100
Text Label 4800 5350 0    50   ~ 0
SCL
Text Label 4800 5600 0    50   ~ 0
SDA
Wire Wire Line
	4050 5350 4050 5400
$Comp
L Device:R R5
U 1 1 5D35A38F
P 4300 5150
F 0 "R5" H 4370 5196 50  0000 L CNN
F 1 "10k" H 4370 5105 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 4230 5150 50  0001 C CNN
F 3 "~" H 4300 5150 50  0001 C CNN
F 4 "0.063Вт 0603 10 кОм, 1%" H -350 -500 50  0001 C CNN "Артикул"
F 5 "https://www.chipdip.ru/product0/9000079736" H -350 -500 50  0001 C CNN "Ссылка"
F 6 "0,9" H -350 -500 50  0001 C CNN "Цена"
	1    4300 5150
	1    0    0    -1  
$EndComp
$Comp
L Device:R R6
U 1 1 5D35ACFA
P 4600 5150
F 0 "R6" H 4670 5196 50  0000 L CNN
F 1 "10k" H 4670 5105 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 4530 5150 50  0001 C CNN
F 3 "~" H 4600 5150 50  0001 C CNN
F 4 "0.063Вт 0603 10 кОм, 1%" H -350 -500 50  0001 C CNN "Артикул"
F 5 "https://www.chipdip.ru/product0/9000079736" H -350 -500 50  0001 C CNN "Ссылка"
F 6 "0,9" H -350 -500 50  0001 C CNN "Цена"
	1    4600 5150
	1    0    0    -1  
$EndComp
Wire Wire Line
	4300 5300 4300 5350
Connection ~ 4300 5350
Wire Wire Line
	4300 5350 4050 5350
$Comp
L power:+3.3V #PWR013
U 1 1 5D377F2E
P 4300 4950
F 0 "#PWR013" H 4300 4800 50  0001 C CNN
F 1 "+3.3V" H 4315 5123 50  0000 C CNN
F 2 "" H 4300 4950 50  0001 C CNN
F 3 "" H 4300 4950 50  0001 C CNN
	1    4300 4950
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR015
U 1 1 5D378266
P 4600 4950
F 0 "#PWR015" H 4600 4800 50  0001 C CNN
F 1 "+3.3V" H 4615 5123 50  0000 C CNN
F 2 "" H 4600 4950 50  0001 C CNN
F 3 "" H 4600 4950 50  0001 C CNN
	1    4600 4950
	1    0    0    -1  
$EndComp
Wire Wire Line
	4300 4950 4300 5000
Wire Wire Line
	4600 4950 4600 5000
Wire Wire Line
	3550 6350 4050 6350
Wire Wire Line
	3600 6550 3600 6000
Connection ~ 3600 6000
Wire Wire Line
	4600 5600 4800 5600
Connection ~ 4600 5600
Wire Wire Line
	4600 5300 4600 5600
Wire Wire Line
	4450 5600 4600 5600
Wire Wire Line
	4800 5350 4300 5350
Connection ~ 4500 5900
Wire Wire Line
	4500 6550 4500 5900
Wire Wire Line
	4500 5900 4450 5900
Wire Wire Line
	4500 5800 4500 5900
Wire Wire Line
	4450 5800 4500 5800
$Comp
L UBD_Lib:LIS302 U5
U 1 1 5D1DFB0E
P 3900 5300
F 0 "U5" H 4000 5250 50  0000 C CNN
F 1 "LIS302" H 3950 5150 50  0000 C CNN
F 2 "UBD:LGA-14_3x5mm_P0.8mm_LayoutBorder1x6y" H 3900 5300 50  0001 C CNN
F 3 "" H 3900 5300 50  0001 C CNN
F 4 "LIS302DLTR" H -350 -500 50  0001 C CNN "Артикул"
F 5 "https://www.chipdip.ru/product/lis302dltr" H -350 -500 50  0001 C CNN "Ссылка"
F 6 "64" H -350 -500 50  0001 C CNN "Цена"
	1    3900 5300
	-1   0    0    -1  
$EndComp
Connection ~ 3550 5600
Wire Wire Line
	3550 4950 3550 5600
$Comp
L power:+3.3V #PWR011
U 1 1 5D2E8992
P 3550 4950
F 0 "#PWR011" H 3550 4800 50  0001 C CNN
F 1 "+3.3V" H 3565 5123 50  0000 C CNN
F 2 "" H 3550 4950 50  0001 C CNN
F 3 "" H 3550 4950 50  0001 C CNN
	1    3550 4950
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR02
U 1 1 5D436C68
P 3100 3750
F 0 "#PWR02" H 3100 3600 50  0001 C CNN
F 1 "+3.3V" H 3115 3923 50  0000 C CNN
F 2 "" H 3100 3750 50  0001 C CNN
F 3 "" H 3100 3750 50  0001 C CNN
	1    3100 3750
	-1   0    0    -1  
$EndComp
$Comp
L Device:C C4
U 1 1 5D4370B7
P 3100 3950
F 0 "C4" H 3215 3996 50  0000 L CNN
F 1 "1uF" H 3215 3905 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 3138 3800 50  0001 C CNN
F 3 "~" H 3100 3950 50  0001 C CNN
F 4 "3" H 0   0   50  0001 C CNN "Номер"
F 5 "GRM21BR71C105KA01K" H 0   0   50  0001 C CNN "Артикул"
F 6 "https://www.chipdip.ru/product/grm21br71c105k" H 0   0   50  0001 C CNN "Ссылка"
F 7 "4" H 0   0   50  0001 C CNN "Цена"
	1    3100 3950
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR010
U 1 1 5D4375C5
P 3100 4150
F 0 "#PWR010" H 3100 3900 50  0001 C CNN
F 1 "GND" H 2950 4100 50  0000 C CNN
F 2 "" H 3100 4150 50  0001 C CNN
F 3 "" H 3100 4150 50  0001 C CNN
	1    3100 4150
	-1   0    0    -1  
$EndComp
Wire Wire Line
	3100 3750 3100 3800
Wire Wire Line
	3100 4100 3100 4150
$Comp
L Device:LED D12
U 1 1 5D45935E
P 4700 6000
F 0 "D12" H 4700 5900 50  0000 C CNN
F 1 "Светодиод SMD" H 4500 5850 50  0001 C CNN
F 2 "LED_SMD:LED_0805_2012Metric" H 4700 6000 50  0001 C CNN
F 3 "~" H 4700 6000 50  0001 C CNN
F 4 "KP-2012EC" H -350 -500 50  0001 C CNN "Артикул"
F 5 "https://www.chipdip.ru/product/kp-2012ec" H -350 -500 50  0001 C CNN "Ссылка"
F 6 "9" H -350 -500 50  0001 C CNN "Цена"
	1    4700 6000
	-1   0    0    1   
$EndComp
$Comp
L Device:LED D13
U 1 1 5D459F9F
P 4850 6100
F 0 "D13" H 5000 6150 50  0000 C CNN
F 1 "Светодиод SMD" H 4900 6350 50  0001 C CNN
F 2 "LED_SMD:LED_0805_2012Metric" H 4850 6100 50  0001 C CNN
F 3 "~" H 4850 6100 50  0001 C CNN
F 4 "KP-2012EC" H -350 -500 50  0001 C CNN "Артикул"
F 5 "https://www.chipdip.ru/product/kp-2012ec" H -350 -500 50  0001 C CNN "Ссылка"
F 6 "9" H -350 -500 50  0001 C CNN "Цена"
	1    4850 6100
	-1   0    0    1   
$EndComp
Wire Wire Line
	4450 6000 4550 6000
Wire Wire Line
	4450 6100 4700 6100
$Comp
L Device:R R11
U 1 1 5D479E5D
P 5150 6300
F 0 "R11" H 5500 6300 50  0000 L CNN
F 1 "360" H 5300 6400 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 5080 6300 50  0001 C CNN
F 3 "~" H 5150 6300 50  0001 C CNN
F 4 "0.063Вт 0603 360 Ом, 1%" H -350 -500 50  0001 C CNN "Артикул"
F 5 "https://www.chipdip.ru/product0/9000079629" H -350 -500 50  0001 C CNN "Ссылка"
F 6 "0,9" H -350 -500 50  0001 C CNN "Цена"
	1    5150 6300
	-1   0    0    1   
$EndComp
$Comp
L Device:R R12
U 1 1 5D47A77F
P 5050 6300
F 0 "R12" H 5300 6400 50  0000 L CNN
F 1 "360" H 5100 6300 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 4980 6300 50  0001 C CNN
F 3 "~" H 5050 6300 50  0001 C CNN
F 4 "0.063Вт 0603 360 Ом, 1%" H -350 -500 50  0001 C CNN "Артикул"
F 5 "https://www.chipdip.ru/product0/9000079629" H -350 -500 50  0001 C CNN "Ссылка"
F 6 "0,9" H -350 -500 50  0001 C CNN "Цена"
	1    5050 6300
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR0132
U 1 1 5D4B1EB7
P 5050 6550
F 0 "#PWR0132" H 5050 6300 50  0001 C CNN
F 1 "GND" H 4900 6500 50  0000 C CNN
F 2 "" H 5050 6550 50  0001 C CNN
F 3 "" H 5050 6550 50  0001 C CNN
	1    5050 6550
	-1   0    0    -1  
$EndComp
Wire Wire Line
	5150 6500 5150 6450
Wire Wire Line
	5050 6450 5050 6500
$Comp
L Connector_Generic:Conn_01x03 J3
U 1 1 5CC2F7C2
P 4200 4300
F 0 "J3" H 3600 4500 50  0000 L CNN
F 1 "Считыватель" H 3750 4500 50  0000 L CNN
F 2 "UBD:JST_XH_B3B-XH-A_1x03_P2.50mm_Vertical" H 4200 4300 50  0001 C CNN
F 3 "~" H 4200 4300 50  0001 C CNN
F 4 "CWF-3 (DS1069-3 M) CWF-3 (DS1069-3 F)" H 0   0   50  0001 C CNN "Артикул"
F 5 "https://www.chipdip.ru/product/cwf-3" H 0   0   50  0001 C CNN "Ссылка"
F 6 "5" H 0   0   50  0001 C CNN "Цена"
	1    4200 4300
	1    0    0    -1  
$EndComp
Wire Wire Line
	4000 4400 3950 4400
$Comp
L power:GND #PWR0133
U 1 1 5CD08DC7
P 1200 4200
F 0 "#PWR0133" H 1200 3950 50  0001 C CNN
F 1 "GND" H 1205 4027 50  0000 C CNN
F 2 "" H 1200 4200 50  0001 C CNN
F 3 "" H 1200 4200 50  0001 C CNN
	1    1200 4200
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR0134
U 1 1 5CD20C4A
P 1400 4200
F 0 "#PWR0134" H 1400 4050 50  0001 C CNN
F 1 "+3.3V" H 1415 4373 50  0000 C CNN
F 2 "" H 1400 4200 50  0001 C CNN
F 3 "" H 1400 4200 50  0001 C CNN
	1    1400 4200
	-1   0    0    1   
$EndComp
Text Label 4850 2350 2    50   ~ 0
SCL
Text Label 6150 2550 0    50   ~ 0
SDA
Wire Wire Line
	4850 2350 4900 2350
Text Label 1650 4250 2    50   ~ 0
Udar
Wire Wire Line
	1650 4250 1700 4250
Text Label 4850 2450 2    50   ~ 0
Udar
Wire Wire Line
	4850 2450 4900 2450
Wire Wire Line
	6100 2550 6150 2550
Text Label 6250 6350 2    50   ~ 0
TXD
Text Label 6250 6550 2    50   ~ 0
RXD
Wire Wire Line
	6300 6350 6250 6350
Wire Wire Line
	6300 6550 6250 6550
Text Label 6150 3950 0    50   ~ 0
TXD
Wire Wire Line
	6100 3950 6150 3950
Text Label 6150 4050 0    50   ~ 0
RXD
Wire Wire Line
	6100 4050 6150 4050
Text Label 7800 6250 0    50   ~ 0
Rst_wf
Wire Wire Line
	6200 7600 6200 7150
Wire Wire Line
	6900 5800 6900 6050
$Comp
L Device:R R10
U 1 1 5CC9170A
P 6600 4150
F 0 "R10" H 6450 4100 50  0000 C CNN
F 1 "360" H 6450 4200 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 6530 4150 50  0001 C CNN
F 3 "~" H 6600 4150 50  0001 C CNN
F 4 "0.063Вт 0603 360 Ом, 1%" H 0   0   50  0001 C CNN "Артикул"
F 5 "https://www.chipdip.ru/product0/9000079629" H 0   0   50  0001 C CNN "Ссылка"
F 6 "0,9" H 0   0   50  0001 C CNN "Цена"
	1    6600 4150
	-1   0    0    1   
$EndComp
Wire Wire Line
	6600 4300 6600 4350
Wire Wire Line
	6600 4350 6650 4350
Wire Wire Line
	6600 3750 6600 4000
Wire Wire Line
	3050 1950 3300 1950
Connection ~ 3050 1950
Wire Wire Line
	3050 1800 3050 1950
$Comp
L power:+3V3 #PWR0126
U 1 1 5CB9749E
P 3050 1800
F 0 "#PWR0126" H 3050 1650 50  0001 C CNN
F 1 "+3V3" H 3065 1973 50  0000 C CNN
F 2 "" H 3050 1800 50  0001 C CNN
F 3 "" H 3050 1800 50  0001 C CNN
	1    3050 1800
	1    0    0    -1  
$EndComp
Wire Wire Line
	3550 2500 3550 2900
$Comp
L power:GND #PWR0121
U 1 1 5CCF61F2
P 3550 2900
F 0 "#PWR0121" H 3550 2650 50  0001 C CNN
F 1 "GND" H 3555 2727 50  0000 C CNN
F 2 "" H 3550 2900 50  0001 C CNN
F 3 "" H 3550 2900 50  0001 C CNN
	1    3550 2900
	1    0    0    -1  
$EndComp
Wire Wire Line
	3550 1800 3550 1850
$Comp
L power:+3.3V #PWR0120
U 1 1 5CCF287E
P 3550 1800
F 0 "#PWR0120" H 3550 1650 50  0001 C CNN
F 1 "+3.3V" H 3565 1973 50  0000 C CNN
F 2 "" H 3550 1800 50  0001 C CNN
F 3 "" H 3550 1800 50  0001 C CNN
	1    3550 1800
	1    0    0    -1  
$EndComp
Wire Wire Line
	3550 2150 3550 2200
$Comp
L Device:R R1
U 1 1 5CCEAF44
P 3550 2000
F 0 "R1" H 3400 1950 50  0000 C CNN
F 1 "360" H 3400 2050 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 3480 2000 50  0001 C CNN
F 3 "~" H 3550 2000 50  0001 C CNN
F 4 "0.063Вт 0603 360 Ом, 1%" H 0   0   50  0001 C CNN "Артикул"
F 5 "https://www.chipdip.ru/product0/9000079629" H 0   0   50  0001 C CNN "Ссылка"
F 6 "0,9" H 0   0   50  0001 C CNN "Цена"
	1    3550 2000
	-1   0    0    1   
$EndComp
$Comp
L Device:LED D4
U 1 1 5CCE5D17
P 3550 2350
F 0 "D4" V 3589 2233 50  0000 R CNN
F 1 "LED" V 3498 2233 50  0000 R CNN
F 2 "LED_SMD:LED_0805_2012Metric" H 3550 2350 50  0001 C CNN
F 3 "~" H 3550 2350 50  0001 C CNN
F 4 "KP-2012EC" H 0   0   50  0001 C CNN "Артикул"
F 5 "https://www.chipdip.ru/product/kp-2012ec" H 0   0   50  0001 C CNN "Ссылка"
F 6 "9" H 0   0   50  0001 C CNN "Цена"
	1    3550 2350
	0    -1   -1   0   
$EndComp
Connection ~ 3300 1950
Wire Wire Line
	3300 1800 3300 1950
$Comp
L power:+3.3V #PWR0119
U 1 1 5CCCDF74
P 3300 1800
F 0 "#PWR0119" H 3300 1650 50  0001 C CNN
F 1 "+3.3V" H 3315 1973 50  0000 C CNN
F 2 "" H 3300 1800 50  0001 C CNN
F 3 "" H 3300 1800 50  0001 C CNN
	1    3300 1800
	1    0    0    -1  
$EndComp
Connection ~ 3300 2150
Wire Wire Line
	3300 1950 3300 2150
Wire Wire Line
	2850 1950 3050 1950
$Comp
L power:+12V #PWR0118
U 1 1 5CCACD6B
P 1450 1800
F 0 "#PWR0118" H 1450 1650 50  0001 C CNN
F 1 "+12V" H 1465 1973 50  0000 C CNN
F 2 "" H 1450 1800 50  0001 C CNN
F 3 "" H 1450 1800 50  0001 C CNN
	1    1450 1800
	1    0    0    -1  
$EndComp
Wire Wire Line
	3300 2150 3300 2200
Wire Wire Line
	3250 2150 3300 2150
Wire Wire Line
	2900 2150 2950 2150
Connection ~ 2900 2150
Wire Wire Line
	2900 2200 2900 2150
Wire Wire Line
	2850 2150 2900 2150
$Comp
L Device:L L1
U 1 1 5CCA3575
P 3100 2150
F 0 "L1" V 3050 2150 50  0000 C CNN
F 1 "100uH" V 3199 2150 50  0000 C CNN
F 2 "Inductor_SMD:L_10.4x10.4_H4.8" H 3100 2150 50  0001 C CNN
F 3 "~" H 3100 2150 50  0001 C CNN
F 4 "B82464G4104M000" H 0   0   50  0001 C CNN "Артикул"
F 5 "https://www.chipdip.ru/product/b82464g4104m" H 0   0   50  0001 C CNN "Ссылка"
F 6 "60" H 0   0   50  0001 C CNN "Цена"
	1    3100 2150
	0    -1   -1   0   
$EndComp
Wire Wire Line
	3300 2500 3300 2900
$Comp
L power:GND #PWR0117
U 1 1 5CCA0658
P 3300 2900
F 0 "#PWR0117" H 3300 2650 50  0001 C CNN
F 1 "GND" H 3305 2727 50  0000 C CNN
F 2 "" H 3300 2900 50  0001 C CNN
F 3 "" H 3300 2900 50  0001 C CNN
	1    3300 2900
	1    0    0    -1  
$EndComp
$Comp
L Device:CP C2
U 1 1 5CCA0652
P 3300 2350
F 0 "C2" H 3200 2250 50  0000 L CNN
F 1 "220uF" H 3150 2150 50  0000 L CNN
F 2 "Capacitor_SMD:CP_Elec_8x10.5" H 3338 2200 50  0001 C CNN
F 3 "~" H 3300 2350 50  0001 C CNN
F 4 "2" H 0   0   50  0001 C CNN "Номер"
F 5 "ECAP SMD, 220 мкФ, 25В" H 0   0   50  0001 C CNN "Артикул"
F 6 "https://www.chipdip.ru/product0/57194" H 0   0   50  0001 C CNN "Ссылка"
F 7 "24" H 0   0   50  0001 C CNN "Цена"
	1    3300 2350
	1    0    0    -1  
$EndComp
Wire Wire Line
	2900 2500 2900 2900
$Comp
L power:GND #PWR0116
U 1 1 5CCA0644
P 2900 2900
F 0 "#PWR0116" H 2900 2650 50  0001 C CNN
F 1 "GND" H 2905 2727 50  0000 C CNN
F 2 "" H 2900 2900 50  0001 C CNN
F 3 "" H 2900 2900 50  0001 C CNN
	1    2900 2900
	1    0    0    -1  
$EndComp
$Comp
L Device:D_Schottky D2
U 1 1 5CCA063E
P 2900 2350
F 0 "D2" V 2900 2450 50  0000 L CNN
F 1 "Диод Шоттки" V 2950 1850 50  0001 L CNN
F 2 "Diode_SMD:D_SMA" H 2900 2350 50  0001 C CNN
F 3 "~" H 2900 2350 50  0001 C CNN
F 4 "SS16" H 0   0   50  0001 C CNN "Артикул"
F 5 "https://www.chipdip.ru/product/ss16" H 0   0   50  0001 C CNN "Ссылка"
F 6 "4" H 0   0   50  0001 C CNN "Цена"
	1    2900 2350
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR0115
U 1 1 5CCA0637
P 1800 2900
F 0 "#PWR0115" H 1800 2650 50  0001 C CNN
F 1 "GND" H 1805 2727 50  0000 C CNN
F 2 "" H 1800 2900 50  0001 C CNN
F 3 "" H 1800 2900 50  0001 C CNN
	1    1800 2900
	1    0    0    -1  
$EndComp
Wire Wire Line
	2350 2350 2350 2900
$Comp
L Regulator_Switching:LM2576HVS-3.3 U1
U 1 1 5CB1BCB7
P 2350 2050
F 0 "U1" H 2350 2417 50  0000 C CNN
F 1 "LM2576HVS-3.3" H 2350 2326 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:TO-263-5_TabPin3" H 2350 1800 50  0001 L CIN
F 3 "http://www.ti.com/lit/ds/symlink/lm2576.pdf" H 2350 2050 50  0001 C CNN
F 4 "LM2576HVR-ADJ" H 0   0   50  0001 C CNN "Артикул"
F 5 "https://www.chipdip.ru/product/lm2576hvr-adj" H 0   0   50  0001 C CNN "Ссылка"
F 6 "150" H 0   0   50  0001 C CNN "Цена"
	1    2350 2050
	1    0    0    -1  
$EndComp
Wire Wire Line
	1700 4150 1400 4150
Wire Wire Line
	1400 4150 1400 4200
Wire Wire Line
	1700 4050 1200 4050
Wire Wire Line
	1200 4050 1200 4200
Wire Wire Line
	1700 3450 1200 3450
Wire Wire Line
	1200 3450 1200 3550
Wire Wire Line
	4000 4200 3500 4200
Wire Wire Line
	3500 4200 3500 4350
Wire Wire Line
	4000 4300 3700 4300
Wire Wire Line
	3700 4300 3700 4350
Wire Wire Line
	1200 5450 1250 5450
Wire Wire Line
	5050 6150 5050 6100
Wire Wire Line
	5050 6100 5000 6100
Wire Wire Line
	5150 6150 5150 6000
Wire Wire Line
	5150 6000 4850 6000
Wire Wire Line
	5150 6500 5050 6500
Wire Wire Line
	5050 6550 5050 6500
Connection ~ 5050 6500
$Comp
L UBD_Lib:USB_B_Micro J4
U 1 1 5CFBC8CB
P 1500 8100
F 0 "J4" H 1500 8550 50  0000 C CNN
F 1 "USB_B_Micro" H 1450 8450 50  0000 C CNN
F 2 "UBD:USB_Micro" H 1650 8050 50  0001 C CNN
F 3 "~" H 1650 8050 50  0001 C CNN
F 4 "L-KLS1-233-0-0-1-T" H 0   0   50  0001 C CNN "Артикул"
F 5 "https://www.chipdip.ru/product/micro-usb-5s-b" H 0   0   50  0001 C CNN "Ссылка"
F 6 "6" H 0   0   50  0001 C CNN "Цена"
	1    1500 8100
	1    0    0    -1  
$EndComp
$Comp
L Interface_USB:CH340G U6
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
L Device:Crystal Y2
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
L Regulator_Linear:AP1117-33 U7
U 1 1 5D035B3F
P 1500 7100
F 0 "U7" H 1500 7342 50  0000 C CNN
F 1 "AP1117-33" H 1500 7251 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-223-3_TabPin2" H 1500 7300 50  0001 C CNN
F 3 "http://www.diodes.com/datasheets/AP1117.pdf" H 1600 6850 50  0001 C CNN
F 4 "AMS1117-3.3" H 0   0   50  0001 C CNN "Артикул"
F 5 "https://www.chipdip.ru/product/ams1117-3.3" H 0   0   50  0001 C CNN "Ссылка"
F 6 "17" H 0   0   50  0001 C CNN "Цена"
	1    1500 7100
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR016
U 1 1 5D03967B
P 1500 7450
F 0 "#PWR016" H 1500 7200 50  0001 C CNN
F 1 "GND" H 1650 7400 50  0000 C CNN
F 2 "" H 1500 7450 50  0001 C CNN
F 3 "" H 1500 7450 50  0001 C CNN
	1    1500 7450
	1    0    0    -1  
$EndComp
Wire Wire Line
	1500 7400 1500 7450
$Comp
L power:GND #PWR018
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
L power:GND #PWR017
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
	1500 8850 1500 8500
$Comp
L Transistor_BJT:BC817 Q3
U 1 1 5D075A76
P 1700 2400
F 0 "Q3" H 1900 2400 50  0000 L CNN
F 1 "BC817" H 1900 2300 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 1900 2325 50  0001 L CIN
F 3 "http://www.fairchildsemi.com/ds/BC/BC817.pdf" H 1700 2400 50  0001 L CNN
F 4 "BC817.215" H 0   0   50  0001 C CNN "Артикул"
F 5 "https://www.chipdip.ru/product/bc817.215" H 0   0   50  0001 C CNN "Ссылка"
F 6 "3" H 0   0   50  0001 C CNN "Цена"
	1    1700 2400
	1    0    0    -1  
$EndComp
Wire Wire Line
	1800 2900 1800 2600
Wire Wire Line
	1800 2200 1800 2150
Wire Wire Line
	1800 2150 1850 2150
$Comp
L Device:R R13
U 1 1 5D0B63CE
P 1450 2150
F 0 "R13" H 1250 2200 50  0000 L CNN
F 1 "1k" H 1300 2100 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 1380 2150 50  0001 C CNN
F 3 "~" H 1450 2150 50  0001 C CNN
F 4 "0.063Вт 0603 1 кОм, 1%" H 0   0   50  0001 C CNN "Артикул"
F 5 "0,9" H 0   0   50  0001 C CNN "Цена"
F 6 "https://www.chipdip.ru/product0/9000079676" H 0   0   50  0001 C CNN "Ссылка"
	1    1450 2150
	1    0    0    -1  
$EndComp
Wire Wire Line
	1500 2400 1450 2400
Wire Wire Line
	1450 2400 1450 2300
Wire Wire Line
	1450 2000 1450 1950
Wire Wire Line
	1450 1950 1850 1950
Connection ~ 1450 1950
$Comp
L power:GND #PWR0114
U 1 1 5CCA0630
P 2350 2900
F 0 "#PWR0114" H 2350 2650 50  0001 C CNN
F 1 "GND" H 2355 2727 50  0000 C CNN
F 2 "" H 2350 2900 50  0001 C CNN
F 3 "" H 2350 2900 50  0001 C CNN
	1    2350 2900
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR020
U 1 1 5D159F9D
P 1850 7050
F 0 "#PWR020" H 1850 6900 50  0001 C CNN
F 1 "+3.3V" H 1850 6900 50  0000 C CNN
F 2 "" H 1850 7050 50  0001 C CNN
F 3 "" H 1850 7050 50  0001 C CNN
	1    1850 7050
	1    0    0    -1  
$EndComp
Wire Wire Line
	1850 7050 1850 7100
Wire Wire Line
	1850 7100 1800 7100
$Comp
L power:+3.3V #PWR022
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
L power:+5V #PWR021
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
L power:+5V #PWR019
U 1 1 5D19B77D
P 1150 7050
F 0 "#PWR019" H 1150 6900 50  0001 C CNN
F 1 "+5V" H 1200 6950 50  0000 C CNN
F 2 "" H 1150 7050 50  0001 C CNN
F 3 "" H 1150 7050 50  0001 C CNN
	1    1150 7050
	1    0    0    -1  
$EndComp
Wire Wire Line
	1200 7100 1150 7100
Wire Wire Line
	1150 7100 1150 7050
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
$Comp
L Device:C C7
U 1 1 5D24CABA
P 3300 8200
F 0 "C7" V 3150 8100 50  0000 L CNN
F 1 "100nF" V 3150 8250 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 3338 8050 50  0001 C CNN
F 3 "~" H 3300 8200 50  0001 C CNN
F 4 "4" H 0   0   50  0001 C CNN "Номер"
F 5 "MLCC1000pF50VNP05%0805" H 0   0   50  0001 C CNN "Артикул"
F 6 "https://www.chipdip.ru/product0/522764173" H 0   0   50  0001 C CNN "Ссылка"
F 7 "4" H 0   0   50  0001 C CNN "Цена"
	1    3300 8200
	0    1    1    0   
$EndComp
Wire Wire Line
	3100 8200 3150 8200
Text Label 3500 8200 0    50   ~ 0
Rst
Wire Wire Line
	3450 8200 3500 8200
$Comp
L Device:R R14
U 1 1 5D27B79D
P 1650 1800
F 0 "R14" V 1550 1750 50  0000 L CNN
F 1 "10k" V 1650 1750 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 1580 1800 50  0001 C CNN
F 3 "~" H 1650 1800 50  0001 C CNN
F 4 "0.063Вт 0603 10 кОм, 1%" H 0   0   50  0001 C CNN "Артикул"
F 5 "https://www.chipdip.ru/product0/9000079736" H 0   0   50  0001 C CNN "Ссылка"
F 6 "0,9" H 0   0   50  0001 C CNN "Цена"
	1    1650 1800
	0    1    1    0   
$EndComp
Connection ~ 1800 2150
Wire Wire Line
	1800 1800 1800 2150
Wire Wire Line
	1500 1800 1450 1800
Connection ~ 1450 1800
Wire Wire Line
	1450 1800 1450 1950
$Comp
L Transistor_BJT:BC817 Q4
U 1 1 5D02ECF8
P 1350 2600
F 0 "Q4" H 1550 2600 50  0000 L CNN
F 1 "BC817" H 1550 2500 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 1550 2525 50  0001 L CIN
F 3 "http://www.fairchildsemi.com/ds/BC/BC817.pdf" H 1350 2600 50  0001 L CNN
F 4 "BC817.215" H 0   0   50  0001 C CNN "Артикул"
F 5 "https://www.chipdip.ru/product/bc817.215" H 0   0   50  0001 C CNN "Ссылка"
F 6 "3" H 0   0   50  0001 C CNN "Цена"
	1    1350 2600
	1    0    0    -1  
$EndComp
Connection ~ 1450 2400
$Comp
L power:GND #PWR023
U 1 1 5D0467B9
P 1450 2900
F 0 "#PWR023" H 1450 2650 50  0001 C CNN
F 1 "GND" H 1455 2727 50  0000 C CNN
F 2 "" H 1450 2900 50  0001 C CNN
F 3 "" H 1450 2900 50  0001 C CNN
	1    1450 2900
	1    0    0    -1  
$EndComp
Wire Wire Line
	1450 2900 1450 2800
$Comp
L power:+5V #PWR024
U 1 1 5D15BC11
P 1150 1800
F 0 "#PWR024" H 1150 1650 50  0001 C CNN
F 1 "+5V" H 1150 1950 50  0000 C CNN
F 2 "" H 1150 1800 50  0001 C CNN
F 3 "" H 1150 1800 50  0001 C CNN
	1    1150 1800
	1    0    0    -1  
$EndComp
$Comp
L Device:R R15
U 1 1 5D15C3A4
P 1150 2150
F 0 "R15" H 950 2200 50  0000 L CNN
F 1 "360" H 950 2100 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 1080 2150 50  0001 C CNN
F 3 "~" H 1150 2150 50  0001 C CNN
F 4 "0.063Вт 0603 360 Ом, 1%" H 0   0   50  0001 C CNN "Артикул"
F 5 "https://www.chipdip.ru/product0/9000079629" H 0   0   50  0001 C CNN "Ссылка"
F 6 "0,9" H 0   0   50  0001 C CNN "Цена"
	1    1150 2150
	1    0    0    -1  
$EndComp
Wire Wire Line
	1150 2300 1150 2600
Wire Wire Line
	1150 1800 1150 2000
$Comp
L Device:R R16
U 1 1 5D1BA533
P 1150 2750
F 0 "R16" H 950 2800 50  0000 L CNN
F 1 "10k" H 950 2700 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 1080 2750 50  0001 C CNN
F 3 "~" H 1150 2750 50  0001 C CNN
F 4 "0.063Вт 0603 10 кОм, 1%" H 0   0   50  0001 C CNN "Артикул"
F 5 "https://www.chipdip.ru/product0/9000079736" H 0   0   50  0001 C CNN "Ссылка"
F 6 "0,9" H 0   0   50  0001 C CNN "Цена"
	1    1150 2750
	1    0    0    -1  
$EndComp
Connection ~ 1150 2600
$Comp
L power:GND #PWR025
U 1 1 5D229D65
P 1150 2900
F 0 "#PWR025" H 1150 2650 50  0001 C CNN
F 1 "GND" H 1155 2727 50  0000 C CNN
F 2 "" H 1150 2900 50  0001 C CNN
F 3 "" H 1150 2900 50  0001 C CNN
	1    1150 2900
	1    0    0    -1  
$EndComp
Wire Wire Line
	4150 1450 4900 1450
Wire Wire Line
	4150 1250 4150 1450
Wire Wire Line
	4200 1250 4150 1250
$Comp
L Device:Crystal Y1
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
L Amplifier_Operational:LMV321 U8
U 1 1 5CFF3396
P 5000 7400
F 0 "U8" H 5200 7500 50  0000 L CNN
F 1 "LMV321" H 4950 7200 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23-5" H 5000 7400 50  0001 L CNN
F 3 "http://www.ti.com/lit/ds/symlink/lmv324.pdf" H 5000 7400 50  0001 C CNN
	1    5000 7400
	1    0    0    -1  
$EndComp
$Comp
L Device:D_Zener D14
U 1 1 5CFF54EB
P 4400 7750
F 0 "D14" V 4350 7500 50  0000 L CNN
F 1 "AZ23C3V3" V 4450 7300 50  0000 L CNN
F 2 "UBD:SOT-23" H 4400 7750 50  0001 C CNN
F 3 "~" H 4400 7750 50  0001 C CNN
	1    4400 7750
	0    1    1    0   
$EndComp
$Comp
L Device:R R18
U 1 1 5CFF7F4A
P 4700 8050
F 0 "R18" H 4750 8100 50  0000 L CNN
F 1 "1k" H 4750 8000 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 4630 8050 50  0001 C CNN
F 3 "~" H 4700 8050 50  0001 C CNN
F 4 "0.063Вт 0603 1 кОм, 1%" H 3250 5900 50  0001 C CNN "Артикул"
F 5 "0,9" H 3250 5900 50  0001 C CNN "Цена"
F 6 "https://www.chipdip.ru/product0/9000079676" H 3250 5900 50  0001 C CNN "Ссылка"
	1    4700 8050
	1    0    0    -1  
$EndComp
$Comp
L Device:R R19
U 1 1 5CFF965F
P 5150 7850
F 0 "R19" V 5050 7800 50  0000 L CNN
F 1 "10k" V 5150 7800 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 5080 7850 50  0001 C CNN
F 3 "~" H 5150 7850 50  0001 C CNN
F 4 "0.063Вт 0603 10 кОм, 1%" H 3500 6050 50  0001 C CNN "Артикул"
F 5 "https://www.chipdip.ru/product0/9000079736" H 3500 6050 50  0001 C CNN "Ссылка"
F 6 "0,9" H 3500 6050 50  0001 C CNN "Цена"
	1    5150 7850
	0    1    1    0   
$EndComp
Wire Wire Line
	5300 7400 5300 7850
Wire Wire Line
	5000 7850 4700 7850
Wire Wire Line
	4700 7850 4700 7500
Wire Wire Line
	4700 7900 4700 7850
Connection ~ 4700 7850
Wire Wire Line
	4700 8200 4700 8250
$Comp
L power:GND #PWR029
U 1 1 5D0A9584
P 4900 8250
F 0 "#PWR029" H 4900 8000 50  0001 C CNN
F 1 "GND" H 4905 8077 50  0000 C CNN
F 2 "" H 4900 8250 50  0001 C CNN
F 3 "" H 4900 8250 50  0001 C CNN
	1    4900 8250
	1    0    0    -1  
$EndComp
Wire Wire Line
	4900 8250 4900 7700
$Comp
L Device:R R17
U 1 1 5D0C28FE
P 4550 8050
F 0 "R17" H 4250 8100 50  0000 L CNN
F 1 "10k" H 4250 8000 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 4480 8050 50  0001 C CNN
F 3 "~" H 4550 8050 50  0001 C CNN
F 4 "0.063Вт 0603 1 кОм, 1%" H 3100 5900 50  0001 C CNN "Артикул"
F 5 "0,9" H 3100 5900 50  0001 C CNN "Цена"
F 6 "https://www.chipdip.ru/product0/9000079676" H 3100 5900 50  0001 C CNN "Ссылка"
	1    4550 8050
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR026
U 1 1 5D0C403F
P 4400 8250
F 0 "#PWR026" H 4400 8000 50  0001 C CNN
F 1 "GND" H 4405 8077 50  0000 C CNN
F 2 "" H 4400 8250 50  0001 C CNN
F 3 "" H 4400 8250 50  0001 C CNN
	1    4400 8250
	1    0    0    -1  
$EndComp
Wire Wire Line
	4550 8200 4550 8250
Wire Wire Line
	4400 7900 4400 8250
Wire Wire Line
	4700 7300 4550 7300
Wire Wire Line
	4400 7300 4400 7600
Wire Wire Line
	4550 7900 4550 7300
Connection ~ 4550 7300
Wire Wire Line
	4550 7300 4400 7300
$Comp
L Device:R R20
U 1 1 5D15D250
P 4200 7300
F 0 "R20" V 4300 7300 50  0000 C CNN
F 1 "360" V 4200 7300 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 4130 7300 50  0001 C CNN
F 3 "~" H 4200 7300 50  0001 C CNN
F 4 "0.063Вт 0603 360 Ом, 1%" H -3300 650 50  0001 C CNN "Артикул"
F 5 "https://www.chipdip.ru/product0/9000079629" H -3300 650 50  0001 C CNN "Ссылка"
F 6 "0,9" H -3300 650 50  0001 C CNN "Цена"
	1    4200 7300
	0    1    -1   0   
$EndComp
Wire Wire Line
	4350 7300 4400 7300
Connection ~ 4400 7300
$Comp
L Simulation_SPICE:DIODE D11
U 1 1 5CFF64A0
P 4000 7500
F 0 "D11" V 4050 7400 50  0000 R CNN
F 1 "BAS321" V 3950 7400 50  0000 R CNN
F 2 "" H 4000 7500 50  0001 C CNN
F 3 "~" H 4000 7500 50  0001 C CNN
F 4 "Y" H 4000 7500 50  0001 L CNN "Spice_Netlist_Enabled"
F 5 "V" H 4000 7500 50  0001 L CNN "Spice_Primitive"
	1    4000 7500
	0    -1   -1   0   
$EndComp
Wire Wire Line
	4050 7300 4000 7300
Wire Wire Line
	4000 7300 4000 7350
$Comp
L power:+3.3V #PWR?
U 1 1 5D24A5E7
P 4900 7050
F 0 "#PWR?" H 4900 6900 50  0001 C CNN
F 1 "+3.3V" H 5050 7100 50  0000 C CNN
F 2 "" H 4900 7050 50  0001 C CNN
F 3 "" H 4900 7050 50  0001 C CNN
	1    4900 7050
	-1   0    0    -1  
$EndComp
Wire Wire Line
	4900 7050 4900 7100
Text Label 5350 7400 0    50   ~ 0
Speed
Wire Wire Line
	5350 7400 5300 7400
Connection ~ 5300 7400
$Comp
L power:GND #PWR027
U 1 1 5D0C3CF5
P 4550 8250
F 0 "#PWR027" H 4550 8000 50  0001 C CNN
F 1 "GND" H 4555 8077 50  0000 C CNN
F 2 "" H 4550 8250 50  0001 C CNN
F 3 "" H 4550 8250 50  0001 C CNN
	1    4550 8250
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR028
U 1 1 5D09036F
P 4700 8250
F 0 "#PWR028" H 4700 8000 50  0001 C CNN
F 1 "GND" H 4705 8077 50  0000 C CNN
F 2 "" H 4700 8250 50  0001 C CNN
F 3 "" H 4700 8250 50  0001 C CNN
	1    4700 8250
	1    0    0    -1  
$EndComp
$EndSCHEMATC
