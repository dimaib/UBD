Declare Sub Setup_wifi()                                    '����� � ��������� WiFi ������
Declare Sub Connect_ap(point As String * 30 , Pass As String * 30)       '����������� � ����� �������
Declare Sub Uart_com(command As String * 1)                 '������� ��������� ������� UART
Declare Function Read_matrix() As Long                      '������� ��� ������ RFIDa � �������������� � Long
Declare Sub Init_var()                                      '������������� ���������� ��� ����������� � ������� � WIFI
Declare Sub Init_rfid()                                     '�������� RFID ���� �� EEPROM
Declare Sub Printf(st As String * 100 , Newline As Byte , Msg_status As Byte)       '����� ��������� ���������
'��� st-������ ��� ������, msg_status-��� ���������, ������� ����� � ����������� ��������� ��� ��������. ���������� ������
'Newline-��������� ��� ��� ������ ����� ������ � ����� ���������

Declare Function Start_lis(calib As Byte) As Byte           '����������� ������������ ����� ������� � ���������� ������������� ����������
Declare Sub I2c_wr(adrr As Byte , Bt As Byte)               '������ ������ ����� � I2C
Declare Function I2c_rd(adrr As Byte) As Byte               '������ ������ ����� �� I2C
Declare Function Osi(xyz As Byte) As Integer                '��������� ����� �� �������� ��������� �� ����. ����������� ������� ����� � ����������
Declare Sub Read_x_y_z()                                    '���������� ������ �� ����
Declare Sub Position_spase()                                '����������� ��������� ������������� � ������������
Declare Sub Send_porog()                                    '������� ������� ����� � ������ �����
