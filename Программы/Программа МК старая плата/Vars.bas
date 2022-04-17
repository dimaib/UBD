'���������� ���������� � EEPROM
Dim Id_eep As Eram Byte                                     'ID �����
Dim Ip_eep(4) As Eram Byte                                  'IP �������
Dim Port_eep As Eram Word                                   '���� �������
Dim Ssid_eep As Eram String * 30                            '��� ����� ������� (SSID)
Dim Pass_eep As Eram String * 30                            '������ ��� ����� �������
Dim Porog_eep As Eram Word                                  '����� ������������ �����
Dim Settings_eep(7) As Eram Byte                            '�������������� ���������
Dim Rfid_eep(40) As Eram Long                               'RFID ����� ����������
Dim Rfid_mast_eep(5) As Eram Long                           'RFID ������-�����
Dim Udar_eep As Eram Byte                                   '���������� ����� � EEPROM'e
'���������� ���������� � EEPROM

Const Cmaxchar = 400                                        '������ ������ �����
Const Del_ignition = 200                                    '��������� �������� ���������� ��������� ����� �������� �����
Const Nit = 10                                              '�������� ��� ��������� ��������� �������������

'��������� �����
   Dim Ig_ud_off As Bit : Ig_ud_off = 0                     '���� 0 - ��������� ��� ����� �� �����������, ���� 1 - ��������� ��� ����� �����������
   Dim Ud_eep As Bit : Ud_eep = 0                           '���� 0 - �� ��������� ���� � eeprom, ���� 1 - ��������� ���� � eeprom
   Dim Ud_on As Bit : Ud_on = 0                             '���� 0 - ���� ��������, ���� 1 - ���� �������
'��������� �����


Dim Bc As Word , Buf As String * Cmaxchar , D As Byte       '���������� ��� UARTa
Dim Stt As String * 2
Dim Buf_copy As String * Cmaxchar                           '����������� ������ ��� ����������� ��������� �������� ������ �� WIFI ������
Bc = 0
Dim Rfid_ar(41) As Long                                     '������ RFID-����
Dim Rfid_cur As Long                                        '������� ��������� RFID
Dim I As Integer , I_uart As Byte                           '����������
Dim Wd_tim As Long                                          '������� ��� ������������ ��������� WIFI ������ '3 ���� �������� ����� 1 �������
Dim Tcp_inc As Byte , Tcp_con As Bit                        '������� �������� ����������� � �������
Dim Ap_inc As Byte , Ap_con As Bit                          '������� �������� ����������� � ����� �������
Dim Id As Byte                                              'ID �����
Dim Ap_name As String * 30                                  '��� ����� �������
Dim Pass_ap As String * 30                                  '������ ����� �������
Dim Server_ip(4) As Byte                                    '����� �������
Dim Server_port As Word                                     '���� �������
Dim Buf_uart As String * 100                                '����� ����� ������ �� UART
Dim Rf_shift As Byte , Rf_it As Byte
Dim Temp_long As Long
Dim Max_buf As Bit                                          '���������� ��� ������� ������ ������� ������ ������ ����� ������ WiFi
Dim Str_send As String * 30                                 '������ ��� ������� �������
Dim Com_a As Bit , Com_b As Bit , Com_c As Bit , Com_d As Bit , Com_e As Bit , Com_f As Bit       '��������� ������ ������ �� ��� �������� � ������ �������������
Dim Id_tmp_s As String * 5 , Id_tmp_b As Byte , Tmp_send As String * 30       '���������� ��� �������
Dim Tm_str As String * Cmaxchar
Dim Tm_char As String * 1
Dim Tm1(2) As Byte
Dim Connect As Bit                                          '���� ��� ����������� ������� ����������� � WiFi ����� �������
Dim Del_led4 As Integer


Dim Rfid_delay As Byte                                      '�������� �� ����� ��������� RFIDa
Dim Rfid_print As String * 70

Dim Dff As Long
Dim Increm As Byte , Lon As Long , Test As Byte
Dim Del_off As Integer                                      '�������� ���������� ���������
Dim Z As Word                                               '���������� ��� ���������� �����
Dim Udar_porog As Word                                      '����� ��� �����
Dim Xyz_max As Word
Dim Udar As Bit                                             '���� �����
Dim Udar_n As Word
Dim Crc As Long , Crc_sum As Long                           '��� ���������� CRC �����
Dim Rfid_ct As Long
Dim Rfid_tt As Long
Dim Rf_tmp1(40) As Long
Dim Rf_tmp2(40) As Long
Dim Rf_tmp3(40) As Long
Dim Ap_tick As Byte                                         '���-�� ������ ��� ������ Wi-Fi ������ ��� ��� �������� ��� ����������� � ����
Dim Tcp_tick As Byte                                        '���-�� ������ ��� ��������������� � �������
Dim Wdt_tick As Byte                                        '���-�� ������ ��� ������ Wi-Fi ������ ��� ��� ��������

Dim Rfid_del_ignition As Byte                               '�������� �� ���������� ��������� ��� ������ �����
Rfid_del_ignition = 0

Ap_tick = 40
Tcp_tick = 15
Wdt_tick = 200

Dim Wifi As Byte                                            '����� ������� � ������
Dim Ip_s As Byte                                            'IP �������

Wifi = 1

If Wifi = 1 Then                                            '�������
   Ssid_eep = "MJR-Sklad"
   Pass_eep = "DabuDaDe"
   Server_ip(1) = 10 : Server_ip(2) = 11 : Server_ip(3) = 22 : Server_ip(4) = 50
Elseif Wifi = 2 Then                                        '�����
   Ssid_eep = "NETGEAR"
   Pass_eep = "111222333444"
   Server_ip(1) = 192 : Server_ip(2) = 168 : Server_ip(3) = 0 : Server_ip(4) = 74
Elseif Wifi = 3 Then                                        '�����
   Ssid_eep = "kslift"
   Pass_eep = "A0C4B096D4"
   Server_ip(1) = 192 : Server_ip(2) = 168 : Server_ip(3) = 0 : Server_ip(4) = 37
Elseif Wifi = 4 Then                                        '���
   Ssid_eep = "dimaib"
   Pass_eep = "230988DVG"
   Server_ip(1) = 192 : Server_ip(2) = 168 : Server_ip(3) = 0 : Server_ip(4) = 37
End If

Ap_name = Ssid_eep
Pass_ap = Pass_eep
Ip_eep(1) = Server_ip(1) : Ip_eep(2) = Server_ip(2) : : Ip_eep(3) = Server_ip(3) : : Ip_eep(4) = Server_ip(4)



'Ap_name = "kslift"
'Pass_ap = "A0C4B096D4"
'Ssid_eep = Ap_name
'Pass_eep = Pass_ap

'Ap_name = "NETGEAR"
'Pass_ap = "111222333444"



'Server_ip(1) = 10 : Server_ip(2) = 11 : Server_ip(3) = 22 : Server_ip(4) = 50
'Ip_eep(1) = 192 : Ip_eep(2) = 168 : Ip_eep(3) = 0 : Ip_eep(4) = 63

Port_eep = 3333
Server_port = Port_eep
Buf_uart = ""

If Ud_eep = 1 And Ud_on = 1 Then                            '�������� �� EEPROM �������� ����� ����� ��������� ����������
   Id = Udar_eep
   Udar = Id
Else
   Udar = 0
End If


Id = 18
Id_eep = Id
Wd_tim = 0
Rf_it = 1