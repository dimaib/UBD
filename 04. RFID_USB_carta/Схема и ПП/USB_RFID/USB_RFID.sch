EESchema Schematic File Version 4
LIBS:USB_RFID-cache
EELAYER 29 0
EELAYER END
$Descr A4 8268 11693 portrait
encoding utf-8
Sheet 1 1
Title "RFID считыватель настольный"
Date "2019-05-24"
Rev "2.4"
Comp "КС"
Comment1 ""
Comment2 "Власов Д.Г."
Comment3 "Власов Д.Г."
Comment4 ""
$EndDescr
$Comp
L Connector_Generic:Conn_01x04 J3
U 1 1 5CE65721
P 5950 5200
F 0 "J3" H 5900 5500 50  0000 L CNN
F 1 "USB кабель" H 5750 5400 50  0000 L CNN
F 2 "USB_RFID:RFID" H 5950 5200 50  0001 C CNN
F 3 "~" H 5950 5200 50  0001 C CNN
F 4 "18-1136" H 0   0   50  0001 C CNN "Артикул"
F 5 "https://www.chipdip.ru/product/18-1136-usb" H 0   0   50  0001 C CNN "Ссылка"
F 6 "140" H 0   0   50  0001 C CNN "Цена"
	1    5950 5200
	1    0    0    -1  
$EndComp
$Comp
L Device:Crystal Y1
U 1 1 5CE65F95
P 3000 3800
F 0 "Y1" H 2700 3950 50  0000 C CNN
F 1 "12MHz" H 2700 3850 50  0000 C CNN
F 2 "USB_RFID:Crystal_SMD_HC49-SD_HandSoldering" H 3000 3800 50  0001 C CNN
F 3 "~" H 3000 3800 50  0001 C CNN
F 4 "12.000 МГц имп. HC-49SM" H 0   0   50  0001 C CNN "Артикул"
F 5 "https://www.chipdip.ru/product/12mhz-hc-49sm" H 0   0   50  0001 C CNN "Ссылка"
F 6 "15" H 0   0   50  0001 C CNN "Цена"
	1    3000 3800
	1    0    0    -1  
$EndComp
$Comp
L Device:R R1
U 1 1 5CE66555
P 3250 3400
F 0 "R1" H 3100 3450 50  0000 L CNN
F 1 "10k" H 3050 3350 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 3180 3400 50  0001 C CNN
F 3 "~" H 3250 3400 50  0001 C CNN
F 4 "0.063Вт 0603 10 кОм, 1%" H 0   0   50  0001 C CNN "Артикул"
F 5 "https://www.chipdip.ru/product0/9000079736" H 0   0   50  0001 C CNN "Ссылка"
F 6 "0.9" H 0   0   50  0001 C CNN "Цена"
	1    3250 3400
	1    0    0    -1  
$EndComp
$Comp
L Diode:BZT52Bxx D1
U 1 1 5CE67D2D
P 5150 5800
F 0 "D1" V 5100 5600 50  0000 L CNN
F 1 "3v6" V 5200 5650 50  0000 C CNN
F 2 "Diode_SMD:D_MiniMELF" H 5150 5625 50  0001 C CNN
F 3 "https://diotec.com/tl_files/diotec/files/pdf/datasheets/bzt52b2v4.pdf" H 5150 5800 50  0001 C CNN
F 4 "BZV55C3V6" H 0   0   50  0001 C CNN "Артикул"
F 5 "https://www.chipdip.ru/product/bzv55c3v6" H 0   0   50  0001 C CNN "Ссылка"
F 6 "2" H 0   0   50  0001 C CNN "Цена"
	1    5150 5800
	0    1    1    0   
$EndComp
$Comp
L Device:C C2
U 1 1 5CE68566
P 2800 4250
F 0 "C2" H 2915 4296 50  0000 L CNN
F 1 "33pF" H 2915 4205 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 2838 4100 50  0001 C CNN
F 3 "~" H 2800 4250 50  0001 C CNN
F 4 "GRM2165C1H330JD01D" H 0   0   50  0001 C CNN "Артикул"
F 5 "https://www.chipdip.ru/product/grm2165c1h330j" H 0   0   50  0001 C CNN "Ссылка"
F 6 "2" H 0   0   50  0001 C CNN "Цена"
	1    2800 4250
	1    0    0    -1  
$EndComp
$Comp
L Device:CP C1
U 1 1 5CE68A89
P 3000 6050
F 0 "C1" H 3118 6096 50  0000 L CNN
F 1 "10uF 10V" H 3118 6005 50  0000 L CNN
F 2 "Capacitor_Tantalum_SMD:CP_EIA-3216-18_Kemet-A" H 3038 5900 50  0001 C CNN
F 3 "~" H 3000 6050 50  0001 C CNN
F 4 "TECAP10/10VA10" H 0   0   50  0001 C CNN "Артикул"
F 5 "https://www.chipdip.ru/product0/868717967" H 0   0   50  0001 C CNN "Ссылка"
F 6 "12" H 0   0   50  0001 C CNN "Цена"
	1    3000 6050
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_02x03_Counter_Clockwise J2
U 1 1 5CE692B7
P 3000 5100
F 0 "J2" H 3050 5417 50  0000 C CNN
F 1 "Разъём программирования" H 2750 5350 50  0000 C CNN
F 2 "USB_RFID:PinHeader_2x03_P2.54mm_Vertical" H 3000 5100 50  0001 C CNN
F 3 "~" H 3000 5100 50  0001 C CNN
F 4 "PLD-6 (DS1021-2x3S)" H 0   0   50  0001 C CNN "Артикул"
F 5 "https://www.chipdip.ru/product/pld-6" H 0   0   50  0001 C CNN "Ссылка"
F 6 "6" H 0   0   50  0001 C CNN "Цена"
	1    3000 5100
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x03 J1
U 1 1 5CE69E9A
P 5950 4200
F 0 "J1" H 5900 4500 50  0000 L CNN
F 1 "К RFID-считывателю" H 5750 4400 50  0000 L CNN
F 2 "USB_RFID:USB" H 5950 4200 50  0001 C CNN
F 3 "~" H 5950 4200 50  0001 C CNN
F 4 "---" H 0   0   50  0001 C CNN "Артикул"
F 5 "---" H 0   0   50  0001 C CNN "Ссылка"
F 6 "---" H 0   0   50  0001 C CNN "Цена"
	1    5950 4200
	1    0    0    -1  
$EndComp
Wire Wire Line
	3500 3800 3200 3800
Wire Wire Line
	2850 3800 2800 3800
Wire Wire Line
	2800 3800 2800 4000
Wire Wire Line
	2800 4000 3500 4000
Wire Wire Line
	4200 3300 4200 3200
Wire Wire Line
	4200 3200 4100 3200
Wire Wire Line
	4100 3200 4100 3300
Wire Wire Line
	4200 6100 4200 6200
Wire Wire Line
	4200 6200 4100 6200
Wire Wire Line
	4100 6200 4100 6100
$Comp
L power:+5V #PWR04
U 1 1 5CE6D245
P 3450 3050
F 0 "#PWR04" H 3450 2900 50  0001 C CNN
F 1 "+5V" H 3465 3223 50  0000 C CNN
F 2 "" H 3450 3050 50  0001 C CNN
F 3 "" H 3450 3050 50  0001 C CNN
	1    3450 3050
	1    0    0    -1  
$EndComp
Wire Wire Line
	3500 4200 3450 4200
Wire Wire Line
	3450 4200 3450 3200
Wire Wire Line
	3450 3200 4100 3200
Connection ~ 4100 3200
Wire Wire Line
	3450 3050 3450 3200
Connection ~ 3450 3200
$Comp
L power:+5V #PWR03
U 1 1 5CE70BAE
P 3250 3050
F 0 "#PWR03" H 3250 2900 50  0001 C CNN
F 1 "+5V" H 3265 3223 50  0000 C CNN
F 2 "" H 3250 3050 50  0001 C CNN
F 3 "" H 3250 3050 50  0001 C CNN
	1    3250 3050
	1    0    0    -1  
$EndComp
Wire Wire Line
	3250 3050 3250 3250
Wire Wire Line
	3250 3600 3250 3550
Wire Wire Line
	3250 3600 3500 3600
$Comp
L Device:C C3
U 1 1 5CE71CF5
P 3200 4250
F 0 "C3" H 3315 4296 50  0000 L CNN
F 1 "33pF" H 3315 4205 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 3238 4100 50  0001 C CNN
F 3 "~" H 3200 4250 50  0001 C CNN
F 4 "GRM2165C1H330JD01D" H 0   0   50  0001 C CNN "Артикул"
F 5 "https://www.chipdip.ru/product/grm2165c1h330j" H 0   0   50  0001 C CNN "Ссылка"
F 6 "2" H 0   0   50  0001 C CNN "Цена"
	1    3200 4250
	1    0    0    -1  
$EndComp
Wire Wire Line
	2800 4100 2800 4000
Connection ~ 2800 4000
Wire Wire Line
	3200 4100 3200 3800
Connection ~ 3200 3800
Wire Wire Line
	3200 3800 3150 3800
Wire Wire Line
	4200 6250 4200 6200
Connection ~ 4200 6200
$Comp
L power:GND #PWR02
U 1 1 5CE7289B
P 3200 4450
F 0 "#PWR02" H 3200 4200 50  0001 C CNN
F 1 "GND" H 3205 4277 50  0000 C CNN
F 2 "" H 3200 4450 50  0001 C CNN
F 3 "" H 3200 4450 50  0001 C CNN
	1    3200 4450
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR01
U 1 1 5CE732CD
P 2800 4450
F 0 "#PWR01" H 2800 4200 50  0001 C CNN
F 1 "GND" H 2805 4277 50  0000 C CNN
F 2 "" H 2800 4450 50  0001 C CNN
F 3 "" H 2800 4450 50  0001 C CNN
	1    2800 4450
	1    0    0    -1  
$EndComp
Wire Wire Line
	2800 4450 2800 4400
Wire Wire Line
	3200 4450 3200 4400
$Comp
L power:+5V #PWR06
U 1 1 5CE746E4
P 5650 4750
F 0 "#PWR06" H 5650 4600 50  0001 C CNN
F 1 "+5V" H 5665 4923 50  0000 C CNN
F 2 "" H 5650 4750 50  0001 C CNN
F 3 "" H 5650 4750 50  0001 C CNN
	1    5650 4750
	1    0    0    -1  
$EndComp
Wire Wire Line
	5750 5100 5650 5100
Wire Wire Line
	5650 5100 5650 4750
$Comp
L power:GND #PWR07
U 1 1 5CE75149
P 5650 6250
F 0 "#PWR07" H 5650 6000 50  0001 C CNN
F 1 "GND" H 5655 6077 50  0000 C CNN
F 2 "" H 5650 6250 50  0001 C CNN
F 3 "" H 5650 6250 50  0001 C CNN
	1    5650 6250
	1    0    0    -1  
$EndComp
Wire Wire Line
	5750 5400 5650 5400
Wire Wire Line
	5650 5400 5650 6250
$Comp
L Device:R R4
U 1 1 5CE787B0
P 5150 4950
F 0 "R4" H 5250 5000 50  0000 L CNN
F 1 "1.5k" H 5250 4900 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 5080 4950 50  0001 C CNN
F 3 "~" H 5150 4950 50  0001 C CNN
F 4 "0.063Вт 0603 1.5 кОм, 1%" H -150 0   50  0001 C CNN "Артикул"
F 5 "https://www.chipdip.ru/product0/9000079716" H -150 0   50  0001 C CNN "Ссылка"
F 6 "0.9" H -150 0   50  0001 C CNN "Цена"
	1    5150 4950
	1    0    0    -1  
$EndComp
$Comp
L Device:R R2
U 1 1 5CE78C35
P 4900 5200
F 0 "R2" V 4800 5150 50  0000 L CNN
F 1 "68" V 4900 5150 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 4830 5200 50  0001 C CNN
F 3 "~" H 4900 5200 50  0001 C CNN
F 4 "0.063Вт 0603 68 Ом, 1%" H 0   0   50  0001 C CNN "Артикул"
F 5 "https://www.chipdip.ru/product0/9000079612" H 0   0   50  0001 C CNN "Ссылка"
F 6 "0.9" H 0   0   50  0001 C CNN "Цена"
	1    4900 5200
	0    1    1    0   
$EndComp
$Comp
L Device:R R3
U 1 1 5CE7947B
P 4900 5400
F 0 "R3" V 5000 5350 50  0000 L CNN
F 1 "68" V 4900 5350 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 4830 5400 50  0001 C CNN
F 3 "~" H 4900 5400 50  0001 C CNN
F 4 "0.063Вт 0603 68 Ом, 1%" H 0   0   50  0001 C CNN "Артикул"
F 5 "https://www.chipdip.ru/product0/9000079612" H 0   0   50  0001 C CNN "Ссылка"
F 6 "0.9" H 0   0   50  0001 C CNN "Цена"
	1    4900 5400
	0    1    1    0   
$EndComp
Wire Wire Line
	4750 5200 4700 5200
Wire Wire Line
	5050 5200 5300 5200
$Comp
L Diode:BZT52Bxx D2
U 1 1 5CE7C697
P 5300 5800
F 0 "D2" V 5250 5900 50  0000 L CNN
F 1 "3v6" V 5350 5950 50  0000 C CNN
F 2 "Diode_SMD:D_MiniMELF" H 5300 5625 50  0001 C CNN
F 3 "https://diotec.com/tl_files/diotec/files/pdf/datasheets/bzt52b2v4.pdf" H 5300 5800 50  0001 C CNN
F 4 "BZV55C3V6" H 0   0   50  0001 C CNN "Артикул"
F 5 "https://www.chipdip.ru/product/bzv55c3v6" H 0   0   50  0001 C CNN "Ссылка"
F 6 "2" H 0   0   50  0001 C CNN "Цена"
	1    5300 5800
	0    1    1    0   
$EndComp
Wire Wire Line
	5150 5650 5150 5400
Wire Wire Line
	5300 5200 5300 5650
Connection ~ 5300 5200
Wire Wire Line
	5300 5200 5750 5200
$Comp
L power:GND #PWR014
U 1 1 5CE7EE21
P 5300 6250
F 0 "#PWR014" H 5300 6000 50  0001 C CNN
F 1 "GND" H 5305 6077 50  0000 C CNN
F 2 "" H 5300 6250 50  0001 C CNN
F 3 "" H 5300 6250 50  0001 C CNN
	1    5300 6250
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR012
U 1 1 5CE7F140
P 5150 6250
F 0 "#PWR012" H 5150 6000 50  0001 C CNN
F 1 "GND" H 5155 6077 50  0000 C CNN
F 2 "" H 5150 6250 50  0001 C CNN
F 3 "" H 5150 6250 50  0001 C CNN
	1    5150 6250
	1    0    0    -1  
$EndComp
Wire Wire Line
	5150 6250 5150 5950
Wire Wire Line
	5300 6250 5300 5950
$Comp
L MCU_Microchip_ATmega:ATmega8-16AU U1
U 1 1 5CE642EC
P 4100 4700
F 0 "U1" H 4550 6250 50  0000 C CNN
F 1 "ATmega8-16AU" H 4550 6150 50  0000 C CNN
F 2 "Package_QFP:TQFP-32_7x7mm_P0.8mm" H 4100 4700 50  0001 C CIN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/atmel-2486-8-bit-avr-microcontroller-atmega8_l_datasheet.pdf" H 4100 4700 50  0001 C CNN
F 4 "ATmega8A-AU" H 0   0   50  0001 C CNN "Артикул"
F 5 "https://www.chipdip.ru/product/atmega8a-au" H 0   0   50  0001 C CNN "Ссылка"
F 6 "90" H 0   0   50  0001 C CNN "Цена"
	1    4100 4700
	1    0    0    -1  
$EndComp
Wire Wire Line
	4700 5400 4750 5400
Wire Wire Line
	5050 5400 5150 5400
Wire Wire Line
	5150 5400 5550 5400
Wire Wire Line
	5550 5400 5550 5300
Wire Wire Line
	5550 5300 5750 5300
Connection ~ 5150 5400
$Comp
L power:+5V #PWR013
U 1 1 5CE87291
P 5150 4800
F 0 "#PWR013" H 5150 4650 50  0001 C CNN
F 1 "+5V" H 5250 4900 50  0000 C CNN
F 2 "" H 5150 4800 50  0001 C CNN
F 3 "" H 5150 4800 50  0001 C CNN
	1    5150 4800
	1    0    0    -1  
$EndComp
Text Label 2750 5000 2    50   ~ 0
Mis
Text Label 2750 5100 2    50   ~ 0
Sck
Text Label 2750 5200 2    50   ~ 0
Res
Text Label 3350 5100 0    50   ~ 0
Mos
Wire Wire Line
	2750 5000 2800 5000
Wire Wire Line
	2750 5100 2800 5100
Wire Wire Line
	2750 5200 2800 5200
Wire Wire Line
	3300 5100 3350 5100
$Comp
L power:GND #PWR011
U 1 1 5CE8CF32
P 3350 5250
F 0 "#PWR011" H 3350 5000 50  0001 C CNN
F 1 "GND" H 3355 5077 50  0000 C CNN
F 2 "" H 3350 5250 50  0001 C CNN
F 3 "" H 3350 5250 50  0001 C CNN
	1    3350 5250
	1    0    0    -1  
$EndComp
Wire Wire Line
	3350 5250 3350 5200
Wire Wire Line
	3350 5200 3300 5200
$Comp
L power:+5V #PWR010
U 1 1 5CE8DDFB
P 3350 4950
F 0 "#PWR010" H 3350 4800 50  0001 C CNN
F 1 "+5V" H 3365 5123 50  0000 C CNN
F 2 "" H 3350 4950 50  0001 C CNN
F 3 "" H 3350 4950 50  0001 C CNN
	1    3350 4950
	1    0    0    -1  
$EndComp
Wire Wire Line
	3350 4950 3350 5000
Wire Wire Line
	3350 5000 3300 5000
$Comp
L power:+5V #PWR08
U 1 1 5CE8F9EC
P 3000 5850
F 0 "#PWR08" H 3000 5700 50  0001 C CNN
F 1 "+5V" H 3015 6023 50  0000 C CNN
F 2 "" H 3000 5850 50  0001 C CNN
F 3 "" H 3000 5850 50  0001 C CNN
	1    3000 5850
	1    0    0    -1  
$EndComp
Wire Wire Line
	3000 5850 3000 5900
Wire Wire Line
	3000 6200 3000 6250
Text Notes 6075 5125 0    50   ~ 0
Vcc (Красный)
Text Notes 6075 5225 0    50   ~ 0
D+ (Зелёный)
Text Notes 6075 5325 0    50   ~ 0
D- (Белый)
Text Notes 6075 5425 0    50   ~ 0
Gnd (Чёрный)
Text Label 4850 4500 0    50   ~ 0
1wire
Wire Wire Line
	4850 4500 4700 4500
Text Label 3100 3600 2    50   ~ 0
Res
Wire Wire Line
	3250 3600 3100 3600
Connection ~ 3250 3600
$Comp
L Device:R R5
U 1 1 5CEB9CAD
P 4900 4600
F 0 "R5" V 4950 4700 50  0000 L CNN
F 1 "360" V 4900 4550 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 4830 4600 50  0001 C CNN
F 3 "~" H 4900 4600 50  0001 C CNN
F 4 "0.063Вт 0603 360 Ом, 1%" H 0   0   50  0001 C CNN "Артикул"
F 5 "https://www.chipdip.ru/product0/9000079629" H 0   0   50  0001 C CNN "Ссылка"
F 6 "0.9" H 0   0   50  0001 C CNN "Цена"
	1    4900 4600
	0    1    1    0   
$EndComp
Wire Wire Line
	4700 4600 4750 4600
$Comp
L Device:LED D3
U 1 1 5CEBB4A6
P 5100 4200
F 0 "D3" V 5100 4000 50  0000 L CNN
F 1 "LED" V 5138 4278 50  0001 L CNN
F 2 "LED_SMD:LED_0603_1608Metric" H 5100 4200 50  0001 C CNN
F 3 "~" H 5100 4200 50  0001 C CNN
F 4 "TO-1608BC-MYF" H 0   0   50  0001 C CNN "Артикул"
F 5 "https://www.chipdip.ru/product/to-1608bc-myf" H 0   0   50  0001 C CNN "Ссылка"
F 6 "3" H 0   0   50  0001 C CNN "Цена"
	1    5100 4200
	0    1    1    0   
$EndComp
Wire Wire Line
	5100 4350 5100 4600
Wire Wire Line
	5100 4600 5050 4600
$Comp
L power:GND #PWR015
U 1 1 5CEBD7DB
P 5250 4250
F 0 "#PWR015" H 5250 4000 50  0001 C CNN
F 1 "GND" H 5255 4077 50  0000 C CNN
F 2 "" H 5250 4250 50  0001 C CNN
F 3 "" H 5250 4250 50  0001 C CNN
	1    5250 4250
	1    0    0    -1  
$EndComp
Wire Wire Line
	5100 4050 5100 4000
Wire Wire Line
	5100 4000 5250 4000
Wire Wire Line
	5250 4000 5250 4250
Text Label 4750 4000 0    50   ~ 0
Mis
Text Label 4750 3900 0    50   ~ 0
Mos
Text Label 4750 4100 0    50   ~ 0
Sck
Wire Wire Line
	4700 4100 4750 4100
Wire Wire Line
	4700 4000 4750 4000
Wire Wire Line
	4700 3900 4750 3900
$Comp
L power:+5V #PWR0101
U 1 1 5CEF6639
P 5450 3700
F 0 "#PWR0101" H 5450 3550 50  0001 C CNN
F 1 "+5V" H 5465 3873 50  0000 C CNN
F 2 "" H 5450 3700 50  0001 C CNN
F 3 "" H 5450 3700 50  0001 C CNN
	1    5450 3700
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0102
U 1 1 5CEF7D59
P 5450 4250
F 0 "#PWR0102" H 5450 4000 50  0001 C CNN
F 1 "GND" H 5455 4077 50  0000 C CNN
F 2 "" H 5450 4250 50  0001 C CNN
F 3 "" H 5450 4250 50  0001 C CNN
	1    5450 4250
	1    0    0    -1  
$EndComp
Wire Wire Line
	5450 4250 5450 4200
Wire Wire Line
	5450 3700 5450 4100
Wire Wire Line
	5450 4100 5750 4100
Text Label 5700 4450 0    50   ~ 0
1wire
Text Notes 6050 4325 0    50   ~ 0
1Wire (Жёлтый)
Text Notes 6050 4225 0    50   ~ 0
Gnd (Белый)
Text Notes 6050 4125 0    50   ~ 0
Vcc (Коричневый)
$Comp
L Switch:SW_Push SW1
U 1 1 5CF26F41
P 5450 3150
F 0 "SW1" H 5450 3343 50  0000 C CNN
F 1 "SW_Push" H 5450 3344 50  0001 C CNN
F 2 "USB_RFID:SW_SPST_PTS645" H 5450 3350 50  0001 C CNN
F 3 "~" H 5450 3350 50  0001 C CNN
F 4 " L-KLS7-TS6604-7.0-180-T" H 0   -300 50  0001 C CNN "Артикул"
F 5 "https://www.chipdip.ru/product/swt-34" H 0   -300 50  0001 C CNN "Ссылка"
F 6 "8" H 0   -300 50  0001 C CNN "Цена"
	1    5450 3150
	1    0    0    -1  
$EndComp
Text Label 4750 5000 0    50   ~ 0
Mod
Text Label 5200 3150 2    50   ~ 0
Mod
Wire Wire Line
	5200 3150 5250 3150
$Comp
L power:GND #PWR0103
U 1 1 5CF2FC9F
P 5700 3200
F 0 "#PWR0103" H 5700 2950 50  0001 C CNN
F 1 "GND" H 5705 3027 50  0000 C CNN
F 2 "" H 5700 3200 50  0001 C CNN
F 3 "" H 5700 3200 50  0001 C CNN
	1    5700 3200
	1    0    0    -1  
$EndComp
Wire Wire Line
	5700 3200 5700 3150
Wire Wire Line
	5700 3150 5650 3150
Wire Wire Line
	4700 5000 4750 5000
$Comp
L power:GND #PWR09
U 1 1 5CE8F719
P 3000 6250
F 0 "#PWR09" H 3000 6000 50  0001 C CNN
F 1 "GND" H 3005 6077 50  0000 C CNN
F 2 "" H 3000 6250 50  0001 C CNN
F 3 "" H 3000 6250 50  0001 C CNN
	1    3000 6250
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR05
U 1 1 5CE6DB44
P 4200 6250
F 0 "#PWR05" H 4200 6000 50  0001 C CNN
F 1 "GND" H 4205 6077 50  0000 C CNN
F 2 "" H 4200 6250 50  0001 C CNN
F 3 "" H 4200 6250 50  0001 C CNN
	1    4200 6250
	1    0    0    -1  
$EndComp
Wire Wire Line
	5150 5100 5150 5400
$Comp
L Device:R R6
U 1 1 5D24B9E7
P 5650 3900
F 0 "R6" H 5500 3950 50  0000 L CNN
F 1 "10k" H 5450 3850 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 5580 3900 50  0001 C CNN
F 3 "~" H 5650 3900 50  0001 C CNN
F 4 "0.063Вт 0603 10 кОм, 1%" H 2400 500 50  0001 C CNN "Артикул"
F 5 "https://www.chipdip.ru/product0/9000079736" H 2400 500 50  0001 C CNN "Ссылка"
F 6 "0.9" H 2400 500 50  0001 C CNN "Цена"
	1    5650 3900
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR016
U 1 1 5D24E4FD
P 5650 3700
F 0 "#PWR016" H 5650 3550 50  0001 C CNN
F 1 "+5V" H 5665 3873 50  0000 C CNN
F 2 "" H 5650 3700 50  0001 C CNN
F 3 "" H 5650 3700 50  0001 C CNN
	1    5650 3700
	1    0    0    -1  
$EndComp
Wire Wire Line
	5650 3700 5650 3750
Wire Wire Line
	5450 4200 5750 4200
Wire Wire Line
	5650 4050 5650 4300
Wire Wire Line
	5650 4300 5750 4300
Wire Wire Line
	5700 4450 5650 4450
Wire Wire Line
	5650 4450 5650 4300
Connection ~ 5650 4300
$EndSCHEMATC
