Const Cmaxchar = 500                                        '������ ������ �����
Const Del_ignition = 20                                     '��������� �������� ���������� ��������� ����� �������� �����
Const Nit = 10                                              '�������� ��� ��������� ��������� �������������
Const Accel_arr = 5                                         '������ ������ ��� �������� ��������� �������������
Const Rfid_amount_user = 100                                '���������� ���������������� rfid-����, ������� ����� ���� ��������� � �����
Const Rfid_amout_master = 10                                '���������� ������ rfid-����, ������� ����� ���� ��������� � �����
Const Start_b = &B10101010                                  '��������� ���� ��� ������� � ������ �����

'���������� ���������� � EEPROM
Dim Porog_x_eep As Eram Byte                                '����� ������������ �����
Dim Porog_z_eep As Eram Integer                             '����� ������������ �����
Dim Settings_eep(7) As Eram Byte                            '�������������� ���������
Dim Rfid_eep(rfid_amount_user + Rfid_amout_master) As Eram Long       'RFID ����� ����������
Dim Udar_eep As Eram Byte                                   '���������� ������� ����� � EEPROM'e
'���������� ���������� � EEPROM

Dim Bc As Word , Buf As String * Cmaxchar , D As Byte       '���������� ��� UARTa
Dim Stt As String * 2
Dim Buf_copy As String * Cmaxchar                           '����������� ������ ��� ����������� ��������� �������� ������ �� WIFI ������
Bc = 0
Dim Rfid_ar(rfid_amount_user + Rfid_amout_master + 3) As Long       '������ RFID-����
Dim Rfid_cur As Long                                        '������� ��������� RFID
Dim I As Integer , I_uart As Byte                           '����������
Dim Wd_tim As Long                                          '������� ��� ������������ ��������� WIFI ������ '3 ���� �������� ����� 1 �������
Dim Tcp_inc As Byte , Tcp_con As Bit                        '������� �������� ����������� � �������
Dim Ap_inc As Byte , Ap_con As Bit                          '������� �������� ����������� � ����� �������
Dim Id As Byte                                              'ID �����
Dim Ap_name As String * 30                                  '��� ����� �������
Dim Pass_ap As String * 30                                  '������ ����� �������
Dim Server_ip As String * 15                                '����� �������
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

Wifi = 0
Ap_name = Lookupstr(wifi , Wifi_ap)
Pass_ap = Lookupstr(wifi , Wifi_pass)
Server_ip = Lookupstr(wifi , Ip_adr)
Server_port = 3333
Buf_uart = ""


Dim Ud_eep As Bit : Ud_eep = 0                              '���� 0 - �� ��������� ���� � eeprom, ���� 1 - ��������� ���� � eeprom
Dim Ud_on As Bit : Ud_on = 0                                '���� 0 - ���� ��������, ���� 1 - ���� �������
Dim Ig_ud_off As Bit : Ig_ud_off = 0                        '���� 0 - ��������� ��� ����� �� �����������, ���� 1 - ��������� ��� ����� �����������
Dim Amount As Byte                                          '�������� ����������
Dim Amount_1 As Byte                                        '�������� ����������
Dim Amount_2 As Byte                                        '�������� ����������
Dim Porog_tmp As Long
Dim Porog_x As Byte
Dim Porog_z As Integer
Dim Xxx As Byte , Zzz As Integer                            '���������� ��� �������� � �������
Dim Tmp_crc As Integer : Dim Crc_udar As Byte               '������ crc ��� �������� � ������ �����

#if Plata = 2
   Dim Freq_tmp As Word
   Const T = 0.000008
   Dim Freq As Single
'��������� �����
   Dim Accel_buf_x(accel_arr) As Byte                       '������\������ ��� �������� ������� ������ ������������� ��� X
   Dim Accel_buf_y(accel_arr) As Byte                       '������\������ ��� �������� ������� ������ ������������� ��� Y
   Dim Accel_buf_z(accel_arr) As Byte                       '������\������ ��� �������� ������� ������ ������������� ��� Z
   Dim Accel_buf_s(accel_arr) As Byte                       '������\������ ��� �������� ������� ������ � ��������
   Dim Summ_x As Long                                       '���������� ��� ���������� ����������� �������� �� X
   Dim Summ_y As Long                                       '���������� ��� ���������� ����������� �������� �� Y
   Dim Summ_z As Word                                       '���������� ��� ���������� ����������� �������� �� Z
   Dim Summ_xyz As Single
   '������ ������� ��������� ��� ���������� ���������� ������ � ��������� �����. �������� ������ ������� (Accel_arr), ��� ������
   '������������ ���������� => ���������� ��������� � ������� ������� �����������.
'��������� �����

''��������� ��� ������ �������������
   '��������� ������� ��������� �������� �������������
   Dim Who_am_i As Byte : Who_am_i = &H0F                   '������������� �������������
   Dim Ctrl_reg_1 As Byte : Ctrl_reg_1 = &H20               '������� ������������ 1
   Dim Ctrl_reg_2 As Byte : Ctrl_reg_2 = &H21               '������� ������������ 2
   Dim Ctrl_reg_3 As Byte : Ctrl_reg_3 = &H22               '������� ������������ 3
   Dim Status_reg As Byte : Status_reg = &H27               '��������� ������ �������
   Dim Ff_wu_cfg_1 As Byte : Ff_wu_cfg_1 = &H30             '������� ������� ���������� ��� FF_WU_1
   Dim Ff_wu_cfg_2 As Byte : Ff_wu_cfg_2 = &H34             '������� ������� ���������� ��� FF_WU_2
   Dim Ff_wu_src_1 As Byte : Ff_wu_src_1 = &H31             '�������� ������� ���������� ��� FF_WU_1
   Dim Ff_wu_src_2 As Byte : Ff_wu_src_2 = &H35             '�������� ������� ���������� ��� FF_WU_2
   Dim Ff_wu_ths_1 As Byte : Ff_wu_ths_1 = &H32             '������� ���������� �������� ��� FF_WU_1
   Dim Ff_wu_ths_2 As Byte : Ff_wu_ths_2 = &H36             '������� ���������� �������� ��� FF_WU_2
   Dim Ff_wu_duration_1 As Byte : Ff_wu_duration_1 = &H33   '������� ������������� ����������� ������� ��� FF_WU_1
   Dim Ff_wu_duration_2 As Byte : Ff_wu_duration_2 = &H37   '������� ������������� ����������� ������� ��� FF_WU_2
   Dim Xout As Byte : Xout = &H29                           '������� ������ �������� �� X
   Dim Yout As Byte : Yout = &H2B                           '������� ������ �������� �� Y
   Dim Zout As Byte : Zout = &H2D                           '������� ������ �������� �� Z
   '��������� ������� ��������� �������� �������������

   '��������� ���������� ��� ��������� �������������
   Const Dr = 0                                             '������� ������� 1=400��, 0=100��
   Const Pd = 1                                             '��� ���������� �������� �������������
   Const Fs = 1                                             '����� ��������� ������� 1=8g, 0=2g
   Const Stp = 1                                            '��������������� stp\stm:
   Const Stm = 0                                            '0\0-���������, 0\1-����� �, 1\0 ����� �
   Const Zen = 1                                            '��� ���������� ������������ ��� Z
   Const Yen = 1                                            '��� ���������� ������������ ��� Y
   Const Xen = 1                                            '��� ���������� ������������ ��� X
   Const Fds = 1                                            '��� ������� ���������� 0=��������� �� ����������, 1=�� ��������� �� ����������
   Const Hp_ff_wu1 = 1                                      '��� ���\���� ������ ������� ������ ��� ���������� ���������� FF_WU1
   Const Hp_ff_wu2 = 1                                      '��� ���\���� ������ ������� ������ ��� ���������� ���������� FF_WU2
   Const Hp_coef1 = 0                                       '������� ����� ������� ������� ������ DR=0\1  coef1\coef2
   Const Hp_coef2 = 1                                       '0\0=2\8��, 1\0=1\4��, 0\1=0.5\2��, 1\1=0.25\1��
   Const Ihl = 0                                            '0=��� ������������ ���������� INT ��������������� � ������� � ��������
   Const Pp_od = 0                                          '��� �������. 0=push-pull, 1=�������� ���������
   Const I1cfg = &B00000001                                 '�������� ���������� INT1 � INT2. 000-���������� ���������, 001-FF_WU_1, 010-FF_WU_2
   Const I2cfg = &B00001000                                 '011-FF_WU_1|FF_WU_2, 100-������ ������, 111-���������� �� �����
   Const Aoi = 0                                            '0=���������� ���������� ��� ����� �� �������, 1=��� ������������� ���� �������
   Const Lir = 1                                            '1=��� ������ �������� FF_WU_SRC_1\2, ��� ������ ��������� � ��������
   Const Xhie = 1                                           '1=������� �� ���������� ���������� �������� �� ��� X, 0=������� ���������
   Const Yhie = 1                                           '1=������� �� ���������� ���������� �������� �� ��� Y, 0=������� ���������
   Const Zhie = 1                                           '1=������� �� ���������� ���������� �������� �� ��� Z, 0=������� ���������
   Const Xlie = 0                                           '1=������� �� ��������� ���������� �������� �� ��� X, 0=������� ���������
   Const Ylie = 0                                           '1=������� �� ��������� ���������� �������� �� ��� Y, 0=������� ���������
   Const Zlie = 0                                           '1=������� �� ��������� ���������� �������� �� ��� Z, 0=������� ���������
   Const Dcrm = 0                                           '0=������� ������������, 1=������� ����������������
   Const Ths = 127                                          '��������� �������� �� ����. �������� 127
   Const Ff_wu_duration = 255                               '����������� ����������������� �������. ���� ������� 100��, �� 0..2.55�, ����
   Const R_lis = &H3B                                       '��������� ������ �� I2C
   Const W_lis = &H3A                                       '��������� ������ � I2C
   '��������� ���������� ��� ��������� �������������
   Const Zero = 0
   Dim Cfg As Byte                                          '���� ��� ������ ��� � I2C, ��� ��������� �������������
   Dim Xyz_flag As Byte                                     '��� �������� ����������������� �������������
   Dim X11 As Byte , Y11 As Byte , Z11 As Byte              '��� ������ �� �������������
   Dim Xp As Integer , Yp As Integer , Zp As Integer        '��� ���������
   Dim Xl As Long , Yl As Long , Zl As Long , Summ As Word  '��� ���������� �������������� �����
''��������� ��� ������ �������������
#endif

If Ud_eep = 1 And Ud_on = 1 Then                            '�������� �� EEPROM �������� ����� ����� ��������� ����������
   Id = Udar_eep
   Udar = Id
Else
   Udar = 0
End If

Wd_tim = 0
Rf_it = 1