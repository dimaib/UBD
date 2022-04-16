'FUSES: H=E4, L=D9

$regfile = "m8adef.dat"
$crystal = 8000000
$baud = 9600

'���������� �������
Declare Function Read_matrix() As Long                      '������� ��� ������ RFIDa � �������������� � Long

Config 1wire = Portd.2                                      '��������� 1Wire ���������� ��� ������ RFID �����

Open "comc.0:9600,8,n,1" For Output As #2                   '��������� ��������� UARTa ��� ����328
'Config Com2 = 9600 , Synchrone = 0 , Parity = None , Stopbits = 1 , Databits = 8 , Clockpol = 0
'Open "com2:" For Binary As #2

Config Portc.1 = Output : Led Alias Portc.1

Dim Increm As Byte , Test As Byte , Lon As Long , Rfid_cur As Long

Do
   Rfid_cur = Read_matrix()
   If Rfid_cur > 0 Then Led = 1 Else Led = 0
   Print #2 , "RFID_CUR=" ; Rfid_cur
   Waitms 50
Loop

Function Read_matrix() As Long                              '������� ��� ������ RFIDa � �������������� � Long
   Test = 0
   Lon = 0
   Increm = 0
   For Increm = 1 To 10                                     '10 ������� �����������, � ���� ���� ���� ��� ������ ������������ ���
      1wreset
      If Err <> 1 Then Exit For
      Waitms 10
   Next
   If Increm < 11 Then                                      '���� ��������� ����� �� �����, �� ��� ����������, �� �������� �� ����������� RFID
      1wwrite &H33
      'Rfid_print = Lookupstr(19 , Str_uart)
      For Increm = 1 To 8                                   '�������� 8 ���� �� �����������
         Test = 1wread()
         'Print #2 , " -> " ; Hex(test );
         'Rfid_print = Rfid_print + Hex(test) + " "
         If Increm > 4 Then                                 '��������� ��������� 4 ����� RFIDa � 4 �������� ���������� Long
            Shift Lon , Left , 8                            '�������� ���������� Lon �� 8 ����� �����
            Lon = Lon Or Test                               '��������� � ������� ���� ��������� �������� �� Matrixa
         End If                                             '��� ����� ����� ����� ���������� 4 ���� �� 8 ��� � ���������� Lon ����������� �������
         Waitms 1
      Next
      'Rfid_print = Rfid_print + "[" + Lookupstr(20 , Str_uart) + Str(lon) + "]"
   End If
   Read_matrix = Lon
End Function