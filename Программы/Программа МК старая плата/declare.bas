Declare Sub Setup_wifi()                                    '����� � ��������� WiFi ������
Declare Sub Connect_ap(point As String * 30 , Pass As String * 30)       '����������� � ����� �������
Declare Sub Uart_com(command As String * 1)                 '������� ��������� ������� UART
Declare Function Read_matrix() As Long                      '������� ��� ������ RFIDa � �������������� � Long
Declare Sub Init_var()                                      '������������� ���������� ��� ����������� � ������� � WIFI
Declare Sub Init_rfid()                                     '�������� RFID ���� �� EEPROM