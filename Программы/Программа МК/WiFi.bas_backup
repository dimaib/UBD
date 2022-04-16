$regfile = "m128def.dat"

$crystal = 14745600                                         'выбор дробной тактовой частоты (кварц)

$hwstack = 80
$swstack = 40
$framesize = 100

$baud1 = 115200                                             'скорость UART
$baud = 115200                                              'скорость UART
$bigstrings
'Фьюзы = FF C9 FF

'константы для сборки и компиляции проекта
Const Plata = 1                                             'Версия платы 1-старая версия, 2-новая версия
Const Debug_info = 0                                        'вывод отладочной информации в UART
Const Print_info = 1                                        'вывод информации о состоянии устройства в UART
'константы для сборки и компиляции проекта

$include "pins_m128.bas"                                    'настройка портов ввода/вывода

Open "comd.7:9600,8,n,1" For Output As #2                   'настройка софтового UARTa для передачи данных в датчик удара
Config Com2 = 115200 , Synchrone = 0 , Parity = None , Stopbits = 1 , Databits = 8 , Clockpol = 0
Open "com2:" For Binary As #1


Dim I9 As Byte
'(
Led1 = 1 : Waitms 200 : Led1 = 0
Led2 = 1 : Waitms 200 : Led2 = 0
Led3 = 1 : Waitms 200 : Led3 = 0
Led4 = 1 : Waitms 200 : Led4 = 0
')

$include "Vars.bas"                                         'Объявление и инициализация переменных
$include "declare.bas"                                      'Объявление процедур и функций
Init_var                                                    'инициализация некоторых переменных
$include "Start_terminal.bas"                               'Вывод в терменал стартовой информации
$include "int_set.bas"                                      'Настройка прерываний
$include "Main.bas"                                         'Главное тело программы                               'do..Loop
$include "prog_interrupt.bas"                               'подпрограммы прерываний
$include "sub_function.bas"                                 'функции используемые в проекте
End
$include "Data.bas"                                         'строки и данные, которые хранятся во флеш-памяти. Для оптимизации ОЗУ