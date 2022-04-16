'$regfile = "m32def.dat"
'Const Mk = "m32"

'$regfile = "m328def.dat"
'Const Mk = "m328"
''Const Mk = "m328_1.3"

$regfile = "m128def.dat"
Const Mk = "m128"

$crystal = 14745600                                         '����� ������� �������� ������� (�����)

$hwstack = 80
$swstack = 40
$framesize = 100

$baud1 = 115200                                             '�������� UART
$baud = 115200                                              '�������� UART
$bigstrings
'����� = FF C9 FF

#if Mk = "m328_1.3"
   Open "comd.6:115200,8,n,1" For Output As #2              '��������� ��������� UARTa ��� ����32
   $include "pins_m328_1.3.bas"
#elseif Mk = "m328"
   Open "comd.5:115200,8,n,1" For Output As #2              '��������� ��������� UARTa ��� ����328
   $include "pins_m328.bas"
#elseif Mk = "m128"
   Open "comd.7:115200,8,n,1" For Output As #2              '��������� ��������� UARTa ��� ����128
   $include "pins_m128.bas"

   Config Com2 = 115200 , Synchrone = 0 , Parity = None , Stopbits = 1 , Databits = 8 , Clockpol = 0
   Open "com2:" For Binary As #1
#endif

Dim I9 As Byte

'For I9 = 1 To 3
   Led1 = 1 : Waitms 200 : Led1 = 0
   Led2 = 1 : Waitms 200 : Led2 = 0
   Led3 = 1 : Waitms 200 : Led3 = 0
   Led4 = 1 : Waitms 200 : Led4 = 0
'Next

'���������� � ������������� ����������
   $include "Vars.bas"
'���������� � ������������� ����������

'���������� �������� � �������
   $include "declare.bas"
'���������� �������� � �������

Init_var


Config Adc = Single , Prescaler = 8 , Reference = Avcc
Start Adc
Config Timer1 = Timer , Prescale = 256
'Config Watchdog

'����� � �������� ��������� ����������
   $include "Start_terminal.bas"
'����� � �������� ��������� ����������
'Reset Watchdog
'��������� ����������
   $include "int_set.bas"
'��������� ����������
'Reset Watchdog
'������� ���� ���������
   $include "Main.bas"                                      'do..Loop
'������� ���� ���������
'Reset Watchdog
'������� � ��������� ������������ � �������
   $include "prog_interrupt.bas"                            '������������ ���������� �� UARTa
   $include "sub_function.bas"
'������� � ��������� ������������ � �������
   End
   $include "Data.bas"