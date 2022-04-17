$regfile = "m128def.dat"

$crystal = 14745600                                         '����� ������� �������� ������� (�����)

$hwstack = 80
$swstack = 40
$framesize = 100

$baud1 = 115200                                             '�������� UART
$baud = 115200                                              '�������� UART
$bigstrings
'����� = FF C9 FF

'��������� ��� ������ � ���������� �������
Const Plata = 1                                             '������ ����� 1-������ ������, 2-����� ������
Const Debug_info = 0                                        '����� ���������� ���������� � UART
Const Print_info = 1                                        '����� ���������� � ��������� ���������� � UART
'��������� ��� ������ � ���������� �������

$include "pins_m128.bas"                                    '��������� ������ �����/������

Open "comd.7:9600,8,n,1" For Output As #2                   '��������� ��������� UARTa ��� �������� ������ � ������ �����
Config Com2 = 115200 , Synchrone = 0 , Parity = None , Stopbits = 1 , Databits = 8 , Clockpol = 0
Open "com2:" For Binary As #1


Dim I9 As Byte
'(
Led1 = 1 : Waitms 200 : Led1 = 0
Led2 = 1 : Waitms 200 : Led2 = 0
Led3 = 1 : Waitms 200 : Led3 = 0
Led4 = 1 : Waitms 200 : Led4 = 0
')

$include "Vars.bas"                                         '���������� � ������������� ����������
$include "declare.bas"                                      '���������� �������� � �������
Init_var                                                    '������������� ��������� ����������
$include "Start_terminal.bas"                               '����� � �������� ��������� ����������
$include "int_set.bas"                                      '��������� ����������
$include "Main.bas"                                         '������� ���� ���������                               'do..Loop
$include "prog_interrupt.bas"                               '������������ ����������
$include "sub_function.bas"                                 '������� ������������ � �������
End
$include "Data.bas"                                         '������ � ������, ������� �������� �� ����-������. ��� ����������� ���