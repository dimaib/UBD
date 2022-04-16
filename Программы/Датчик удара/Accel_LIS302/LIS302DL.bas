$regfile = "m8def.dat"
$crystal = 8000000
$baud = 9600

'����� E4 D9

'��������� ������\�������
   Config Portb.1 = Output : Led Alias Portb.1
   Config Portd.2 = Output : Rel Alias Portd.2
'��������� ������\�������

'��������� I2C ��� ��������������
   Config Scl = Portc.4
   Config Sda = Portc.5
   Config I2cdelay = 10
   I2cinit
'��������� I2C ��� ��������������

Open "comb.4:9600,8,n,1" For Output As #1                   '��������� ��������� UARTa ��� ����8
Config Com1 = 9600 , Synchrone = 0 , Parity = None , Stopbits = 1 , Databits = 8 , Clockpol = 0
Open "com1:" For Binary As #2

Dim Cfg As Byte                                             '���� ��� ������ ��� � I2C, ��� ��������� �������������
Dim Xyz_flag As Byte                                        '��� �������� ����������������� �������������
Dim X As Byte , Y As Byte , Z As Byte                       '��� ������ �� �������������
Dim Xp As Integer , Yp As Integer , Zp As Integer           '��� ���������

Dim X_long As Long                                          '������� �������� X �� ������ ���������
Dim Aver_x As Single , Round_aver_x As Byte                 '��������������� X
Dim Y_long As Long                                          '������� �������� Y �� ������ ���������
Dim Aver_y As Single , Round_aver_y As Byte                 '��������������� Y
Dim Z_long As Long                                          '������� �������� Z �� ������ ���������
Dim Aver_z As Single , Round_aver_z As Byte                 '��������������� Z
Dim I As Byte                                               '���������� ��������� ��� for

Dim X_eep As Byte
Dim Z_eep As Single
Dim Z_eep_int As Byte
Dim Porog_z_eep As Eram Byte                                '���������� ������� � eeprome
Dim Porog_x_eep As Eram Byte                                '���������� ������� � eeprome

Dim Tmp_sing_x As Single
Dim Tmp_sing_y As Single

'����������� ����. ��� ������� �����
Const K1 = 154                                              '��������� ��� ������� ������������ ����. ��������
Const K2 = 10                                               '��������� ��� ������� ������������ ����. ��������
Dim K_tmp As Word                                           '����������...
'����������� ����. ��� ������� �����


'���������� � ��������� ��� ������� ��������
Const Sp_aver = 30                                          '��������� ���-�� ��������� ��� ����������
Const Speed_max = 3000                                      '��������� ������������� ���������� ��������
Const Speed_min = 150                                       '��������� ������������ ���������� ��������
Dim Puls_cout As Long                                       '������� ���������
Dim Freq_cur As Long                                        '������� �������
Dim Speed_num As Byte                                       '���������� ��� �������� ���-�� ���������
Dim Speed_udar As Long                                      '�������� � ������ �����
Dim Speed_del As Long                                       '�������� ����� ������� ��������� � ��������� � ������ �����
Dim Speed_pesent As Long                                    '������� �� ������� ��������� ���������� �������� ��� �����

Dim Puls_timer2 As Byte                                     '������� ������������ timer2
'���������� � ��������� ��� ������� ��������

'���������� ��� UARTa
   Const Cmaxchar = 50                                      '������ ������ �����
   Dim Bc As Word , D As Byte : Bc = 1                      '���������� ��� UARTa
   Dim Bt(5) As Byte                                        '����� �������� ������
   Dim Integ As Byte : Dim Int_eep As Integer
   Dim Crc_udar As Byte                                     '���������� ����������� �����
'���������� ��� UARTa

'���������������� ������� ��������� ��������
   On Capture1 T1                                           '���������� ��� ������� 1 (16 ������)
   Config Timer1 = Timer , Prescale = 1024 , Capture Edge = Rising       '��������� ������� 1, ��� ���������, ���-�� ���������
   Enable Capture1
   On Timer2 T2                                             '���������� ��� ������� 2 (8 ������)
   Config Timer2 = Timer , Prescale = 1024                  '��������� ������� 2, ��� ������� ���������� ���������
   Enable Timer1 : Enable Timer2                            '������ �������� 1 � 2
   Config Pinb.0 = Input : Portb.0 = 1
'���������������� ������� ��������� ��������

'��������� ���������� �� UART�
   On Urxc Rec_isr                                          '������������ ��� ���������� �� ���� UART
'��������� ���������� �� UART�

Declare Function Start_lis(calib As Byte) As Byte           '����������� ������������ ����� ������� � ���������� ������������� ����������
Declare Sub I2c_wr(adrr As Byte , Bt As Byte)               '������ ������ ����� � I2C
Declare Function I2c_rd(adrr As Byte) As Byte               '������ ������ ����� �� I2C
Declare Function Osi(xyz As Byte) As Integer                '��������� ����� �� �������� ��������� �� ����. ����������� ������� ����� � ����������
Declare Sub Read_x_y_z()                                    '���������� ������ �� ����
Declare Sub Position_spase()                                '����������� ��������� ������������� � ������������
Declare Function Average_x() As Single                      '������� �������� �������� X �� 4 ��������� ����������
Declare Function Average_y() As Single                      '������� �������� �������� Y �� 4 ��������� ����������
Declare Function Average_z() As Single                      '������� �������� �������� Z �� 4 ��������� ����������
'��������� � ���������� ��� ��������� �������������
   '��������� ������� ��������� �������� �������������
      Dim Who_am_i As Byte : Who_am_i = &H0F                '������������� �������������
      Dim Ctrl_reg_1 As Byte : Ctrl_reg_1 = &H20            '������� ������������ 1
      Dim Ctrl_reg_2 As Byte : Ctrl_reg_2 = &H21            '������� ������������ 2
      Dim Ctrl_reg_3 As Byte : Ctrl_reg_3 = &H22            '������� ������������ 3
      Dim Status_reg As Byte : Status_reg = &H27            '��������� ������ �������
      Dim Ff_wu_cfg_1 As Byte : Ff_wu_cfg_1 = &H30          '������� ������� ���������� ��� FF_WU_1
      Dim Ff_wu_cfg_2 As Byte : Ff_wu_cfg_2 = &H34          '������� ������� ���������� ��� FF_WU_2
      Dim Ff_wu_src_1 As Byte : Ff_wu_src_1 = &H31          '�������� ������� ���������� ��� FF_WU_1
      Dim Ff_wu_src_2 As Byte : Ff_wu_src_2 = &H35          '�������� ������� ���������� ��� FF_WU_2
      Dim Ff_wu_ths_1 As Byte : Ff_wu_ths_1 = &H32          '������� ���������� �������� ��� FF_WU_1
      Dim Ff_wu_ths_2 As Byte : Ff_wu_ths_2 = &H36          '������� ���������� �������� ��� FF_WU_2
      Dim Ff_wu_duration_1 As Byte : Ff_wu_duration_1 = &H33       '������� ������������� ����������� ������� ��� FF_WU_1
      Dim Ff_wu_duration_2 As Byte : Ff_wu_duration_2 = &H37       '������� ������������� ����������� ������� ��� FF_WU_2
      Dim Xout As Byte : Xout = &H29                        '������� ������ �������� �� X
      Dim Yout As Byte : Yout = &H2B                        '������� ������ �������� �� Y
      Dim Zout As Byte : Zout = &H2D                        '������� ������ �������� �� Z
   '��������� ������� ��������� �������� �������������

   '��������� ���������� ��� ��������� �������������
      Const Dr = 0                                          '������� ������� 1=400��, 0=100��
      Const Pd = 1                                          '��� ���������� �������� �������������
      Const Fs = 1                                          '����� ��������� ������� 1=8g, 0=2g
      Const Stp = 1                                         '��������������� stp\stm:
      Const Stm = 0                                         '0\0-���������, 0\1-����� �, 1\0 ����� �
      Const Zen = 1                                         '��� ���������� ������������ ��� Z
      Const Yen = 1                                         '��� ���������� ������������ ��� Y
      Const Xen = 1                                         '��� ���������� ������������ ��� X
      Const Fds = 1                                         '��� ������� ���������� 0=��������� �� ����������, 1=�� ��������� �� ����������
      Const Hp_ff_wu1 = 1                                   '��� ���\���� ������ ������� ������ ��� ���������� ���������� FF_WU1
      Const Hp_ff_wu2 = 1                                   '��� ���\���� ������ ������� ������ ��� ���������� ���������� FF_WU2
      Const Hp_coef1 = 0                                    '������� ����� ������� ������� ������ DR=0\1  coef1\coef2
      Const Hp_coef2 = 1                                    '0\0=2\8��, 1\0=1\4��, 0\1=0.5\2��, 1\1=0.25\1��
      Const Ihl = 0                                         '0=��� ������������ ���������� INT ��������������� � ������� � ��������
      Const Pp_od = 0                                       '��� �������. 0=push-pull, 1=�������� ���������
      Const I1cfg = &B00000001                              '�������� ���������� INT1 � INT2. 000-���������� ���������, 001-FF_WU_1, 010-FF_WU_2
      Const I2cfg = &B00001000                              '011-FF_WU_1|FF_WU_2, 100-������ ������, 111-���������� �� �����
      Const Aoi = 0                                         '0=���������� ���������� ��� ����� �� �������, 1=��� ������������� ���� �������
      Const Lir = 1                                         '1=��� ������ �������� FF_WU_SRC_1\2, ��� ������ ��������� � ��������
      Const Xhie = 1                                        '1=������� �� ���������� ���������� �������� �� ��� X, 0=������� ���������
      Const Yhie = 1                                        '1=������� �� ���������� ���������� �������� �� ��� Y, 0=������� ���������
      Const Zhie = 1                                        '1=������� �� ���������� ���������� �������� �� ��� Z, 0=������� ���������
      Const Xlie = 0                                        '1=������� �� ��������� ���������� �������� �� ��� X, 0=������� ���������
      Const Ylie = 0                                        '1=������� �� ��������� ���������� �������� �� ��� Y, 0=������� ���������
      Const Zlie = 0                                        '1=������� �� ��������� ���������� �������� �� ��� Z, 0=������� ���������
      Const Dcrm = 0                                        '0=������� ������������, 1=������� ����������������
      Const Ths = 127                                       '��������� �������� �� ����. �������� 127
      Const Ff_wu_duration = 255                            '����������� ����������������� �������. ���� ������� 100��, �� 0..2.55�, ����
      Const R_lis = &H3B                                    '��������� ������ �� I2C
      Const W_lis = &H3A                                    '��������� ������ � I2C
   '��������� ���������� ��� ��������� �������������
'��������� � ���������� ��� ��������� �������������

'��������� ���������������
   Const Zero = 0                                           '��������� �������� ��������
   'Const Zero = 128
'��������� ���������������

Dim Start_tmp As Byte                                       '���������� ��� ������������ ��������� ������� � ������������
Start_tmp = 1

If Start_lis(start_tmp) = 0 Then
   Do
      Toggle Led
      Print #1 , "Accel error"
      'Print "Accel error"
      Waitms 100
   Loop
Else
   Print #1 , "Accel OK"
   'Print "Accel OK"
End If

If Porog_x_eep = 1 Then Porog_x_eep = 150
If Porog_z_eep < 100 Then Porog_z_eep = 2000
Integ = Porog_z_eep : Bt(1) = Porog_x_eep
'Print #1 , "Porog X=" ; Bt(1) ; " Z=" ; Integ
Integ = 0 : Bt(1) = 0

Call Position_spase()                                       '����������� ��������� � ������������
Start_tmp = 0
Start_tmp = Start_lis(start_tmp)                            '��������� ������������� �������������

Const Bort_type = 2

#if Bort_type = 1                                           '�������������� jung ere-120 / ���������� jung ejc-212
   Porog = 60 : T_pic = 400
#elseif Bort_type = 2                                       '������� jung etv-320
   Porog_x_eep = 30 : Porog_z_eep = 10
#elseif Bort_type = 3                                       '���������������� jung efg-115
   Porog_x_eep = 7 : Porog_z_eep = 5
#elseif Bort_type = 4                                       '���. ����� jung eks-312

#elseif Bort_type = 5                                       '���������������� jung efg-220

#endif

Const Delay_led = 300                                       '�������� ��������� �����. ����� � ��, ������� ����� ������� ����� �����
Enable Urxc
Enable Interrupts                                           '���������� ���������� UART



Do
   'Dim Sstt As String * 20
   'If Summ_speed > 30000 Then Summ_speed = 0
   Call Read_x_y_z
   Xp = Abs(xp) : Yp = Abs(yp) : Zp = Abs(zp)               '��������� ������������� ������� �� ������
   If Xp = 0 Then Xp = 1                                    '��������� �� ������������� �� ����� ������ �������. ��� �������������� ������� �� ����
   If Yp = 0 Then Yp = 1                                    '��������� �� ������������� �� ����� ������ �������. ��� �������������� ������� �� ����
   If Zp = 0 Then Zp = 1                                    '��������� �� ������������� �� ����� ������ �������. ��� �������������� ������� �� ����

   Shift X_long , Left , 8 : X_long = X_long Or Xp          '4 ���� ���������� ��������� ��� X, ��� �������� ��������
   Aver_x = Average_x() : Round_aver_x = Round(aver_x)      '���������� �������� � ���������� �� ������
   Shift Y_long , Left , 8 : Y_long = Y_long Or Yp          '4 ���� ���������� ��������� ��� Y, ��� �������� ��������
   Aver_y = Average_y() : Round_aver_y = Round(aver_y)      '���������� �������� � ���������� �� ������

   Shift Z_long , Left , 8 : Z_long = Z_long Or Zp          '4 ���� ���������� ��������� ��� Z, ��� �������� ��������
   Aver_z = Average_z() : Round_aver_z = Round(aver_z)      '���������� �������� � ���������� �� ������

   'Stop Timer1 : Stop Timer2
   'Print #1 , Round_aver_x ; "  " ; Round_aver_y ; "  " ; Round_aver_z ; " " ; Freq_cur
   Print #1 , Xp ; "  " ; Yp ; "  " ; Zp ; " " ; Freq_cur
   'Waitms 10
   'Start Timer1 : Start Timer2
   X_eep = Porog_x_eep                                      '�������� ������ �� XY �� EEPROMa
   'Print #1 , "->" ; Round_aver_x ; " " ; Round_aver_x ; " " ; X_eep ; " " ; Speed_udar
   'If Round_aver_x >= X_eep Or Round_aver_y >= X_eep And Speed_udar = 0 Then
   If Xp >= X_eep Or Yp >= X_eep And Speed_udar = 0 Then
      Z_eep_int = Porog_z_eep
      Z_eep = Z_eep_int / 10

      'Tmp_sing_x = Round_aver_x / Round_aver_z
      'Tmp_sing_y = Round_aver_y / Round_aver_z

      Tmp_sing_x = Xp / Zp
      Tmp_sing_y = Yp / Zp
      If Tmp_sing_x >= Z_eep Or Tmp_sing_x >= Z_eep Then
         If Freq_cur <= 100 Then
           Rel = 1
           Print #1 , "Udar!"
           For I = 1 To 10
            Toggle Led
            Waitms Delay_led
           Next
           Led = 0
           'Waitms Delay_led
           Rel = 0
         Else
           Speed_udar = Freq_cur
           Incr Speed_num
         End If
      End If
   End If
   'If Speed_udar > 0 Then Incr Speed_num
   If Speed_num >= 7 Then                                   '���� ����� ����� ��������� 5 ��������� ��������
      Speed_num = 0                                         '��������� ��������� ���������
      Speed_del = Speed_udar - Freq_cur                     '������� ����� ������� ��������� � ��������� � ������ �����
      Speed_del = Abs(speed_del)                            '������� �� ������
      'Speed_pesent = Speed_del * 100 : Speed_pesent = Speed_pesent / Speed_udar       '������� ������� ��������� � �������
      If Freq_cur = 0 Then Freq_cur = 1
      Tmp_sing_x = Speed_del / Freq_cur
      If Tmp_sing_x >= 0.3 Then                             '���� ������� �������� ���������� �� 50% �� ��������� � �������� � ������ �����
        Rel = 1
        Print #1 , "Udar!"
         For I = 1 To 10
            Toggle Led
            Waitms Delay_led
        Next
        Rel = 0
      End If
      Speed_udar = 0
   End If
'(
         Sstt = Str(xp) : Print #1 , "[" ; Format(sstt , "   ") ; " " ;
         Sstt = Str(yp) : Print #1 , Format(sstt , "   ") ; "] " ;
         Sstt = Str(summ_x) : Print #1 , Format(sstt , "       ") ; " " ;
         Sstt = Str(summ_y) : Print #1 , Format(sstt , "       ")
')
   Waitms 20
Loop

Function Average_x() As Single                              '���������� �������� �������� X
   Dim Xlon_tmp As Long : Xlon_tmp = X_long                 '���������� ��� ���������� ����������� X_long
   Dim Xx As Byte : Xx = Xlon_tmp And 255                   '���������� ��� ���������� ����� �� X_long
   Average_x = Xx
   Shift Xlon_tmp , Right , 8 : Average_x = Average_x + Xx  '������ ����
   Shift Xlon_tmp , Right , 8 : Average_x = Average_x + Xx  '������ ����
   Shift Xlon_tmp , Right , 8 : Average_x = Average_x + Xx  '������ ����
   Average_x = Average_x / 4
   'x_eep = Porog_x_eep : Average_z = Average_z * Z_eep      '���������� Z �� ���������� ����-�
End Function

Function Average_y() As Single                              '���������� �������� �������� Y
   Dim Ylon_tmp As Long : Ylon_tmp = Y_long                 '���������� ��� ���������� ����������� Y_long
   Dim Yy As Byte : Yy = Ylon_tmp And 255                   '���������� ��� ���������� ����� �� Y_long
   Average_y = Yy
   Shift Ylon_tmp , Right , 8 : Average_y = Average_y + Yy  '������ ����
   Shift Ylon_tmp , Right , 8 : Average_y = Average_y + Yy  '������ ����
   Shift Ylon_tmp , Right , 8 : Average_y = Average_y + Yy  '������ ����
   Average_y = Average_y / 4
   'Z_eep = Porog_z_eep : Average_z = Average_z * Z_eep      '���������� Z �� ���������� ����-�
End Function

Function Average_z() As Single                              '���������� �������� �������� X
   Dim Zlon_tmp As Long : Zlon_tmp = Z_long                 '���������� ��� ���������� ����������� Z_long
   Dim Zz As Byte : Zz = Zlon_tmp And 255                   '���������� ��� ���������� ����� �� Z_long
   Average_z = Zz
   Shift Zlon_tmp , Right , 8 : Average_z = Average_z + Zz  '������ ����
   Shift Zlon_tmp , Right , 8 : Average_z = Average_z + Zz  '������ ����
   Shift Zlon_tmp , Right , 8 : Average_z = Average_z + Zz  '������ ����
   Average_z = Average_z / 4
   Z_eep_int = Porog_z_eep : Z_eep = Z_eep_int / 100 : Average_z = Average_z * Z_eep       '���������� Z �� ���������� ����-�
End Function

T2:
   Incr Puls_timer2
   If Puls_timer2 > 5 Then                                  '25
      Stop Timer1 : Stop Timer2
      'Print #1 , Puls_cout
      If Puls_cout = 0 Then Puls_cout = 1
      Freq_cur = Puls_cout
      If Speed_num > 0 Then Incr Speed_num                  '���� ��������� ����, �� �������� ������� ��������� ��������
      Puls_cout = 0 : Puls_timer2 = 0
      Timer1 = 0 : Timer2 = 0
      Start Timer1 : Start Timer2
   End If
Return

T1:                                                         '���������� ������� ��� �������� ���������
   Toggle Led
   Incr Puls_cout
Return

Sub Read_x_y_z()                                            '������ �������� ���� � ��������� ��
   X = I2c_rd(xout) : Y = I2c_rd(yout) : Z = I2c_rd(zout)   '������ �������� �� ����
   Xp = Osi(x) : Yp = Osi(y) : Zp = Osi(z)                  '�������������� ���������� ����� � ���������� ��������
   'Xl = Xp ^ 2 : Yl = Yp ^ 2 : Zl = Zp ^ 2 : Summ = Xl + Yl : Summ = Summ + Zl : Summ = Sqr(summ)       '���������� �������������� �����
   Xp = Abs(xp) : Yp = Abs(yp) : Zp = Abs(zp)
   If Xp > 5 Or Yp > 5 Or Zp > 5 Then Led = 1 Else Led = 0
End Sub

Function Osi(xyz As Byte) As Integer                        '�������������� ���������� ����� � ���������� ��������
      If Xyz.7 = 1 Then
         Xyz = &HFF Xor Xyz : Incr Xyz : Osi = Zero - Xyz
      Else
         Osi = Zero + Xyz
      End If
End Function

Function Start_lis(calib As Byte) As Byte                   '��������� ��������� ���������� �������������
   Cfg = &B01011100                                         '����� ��������

   Call I2c_wr(ctrl_reg_2 , Cfg)
   Xyz_flag = I2c_rd(ff_wu_src_1) : Xyz_flag = I2c_rd(ff_wu_src_2)       '����� ��������� ����������

   Cfg = 0 : Cfg.7 = Dr : Cfg.6 = Pd : Cfg.5 = Fs : Cfg.4 = Stp : Cfg.3 = Stm : Cfg.2 = Zen : Cfg.1 = Yen : Cfg.0 = Xen
   Call I2c_wr(ctrl_reg_1 , Cfg)

   Cfg = 0 : Cfg.7 = 0 : Cfg.6 = 0 : Cfg.5 = 0 : Cfg.4 = Fds : Cfg.3 = Hp_ff_wu2 : Cfg.2 = Hp_ff_wu1 : Cfg.1 = Hp_coef2 : Cfg.0 = Hp_coef1
   If Calib = 1 Then Cfg.4 = 0 Else Cfg.4 = Fds
   Call I2c_wr(ctrl_reg_2 , Cfg)

   Cfg = 0 : Cfg.7 = Ihl : Cfg.6 = Pp_od : Cfg = Cfg Or I2cfg : Cfg = Cfg Or I1cfg
   Call I2c_wr(ctrl_reg_3 , Cfg)

   Cfg = 0 : Cfg.7 = Aoi : Cfg.6 = Lir : Cfg.5 = Zhie : Cfg.4 = Zlie : Cfg.3 = Yhie : Cfg.2 = Ylie : Cfg.1 = Xhie : Cfg.0 = Xlie
   Call I2c_wr(ff_wu_cfg_1 , Cfg) : Call I2c_wr(ff_wu_cfg_2 , Cfg)

   Cfg = 0 : Cfg.7 = Dcrm : Cfg = Cfg Or Ths
   Call I2c_wr(ff_wu_ths_1 , Cfg) : Call I2c_wr(ff_wu_ths_2 , Cfg)

   Cfg = Ff_wu_duration
   Call I2c_wr(ff_wu_duration_1 , Cfg) : Call I2c_wr(ff_wu_duration_2 , Cfg)

   Cfg = I2c_rd(who_am_i)
   If Cfg = &H3B Then Start_lis = 1 Else Start_lis = 0
   Waitms 10
End Function                                                '��������� ��������� ���������� �������������

Sub I2c_wr(adrr As Byte , Bt As Byte)                       '��������� ������ ����� �� ������ � i2c
   I2cstart
      I2cwbyte W_lis
      I2cwbyte Adrr
      I2cwbyte Bt
   I2cstop
End Sub

Function I2c_rd(adrr As Byte) As Byte                       '������� ������ ����� �� ������ � i2c
   I2cstart
      I2cwbyte W_lis
      I2cwbyte Adrr
      I2crepstart
      I2cwbyte R_lis
      I2crbyte I2c_rd , Nack
      I2crepstart
   I2cstop
End Function

Sub Position_spase()                                        '��������� ���������� ��������� ������������� � ������������
   Dim Xsumm As Long
   Dim Ysumm As Long
   Dim Zsumm As Long
   Dim Xad As Byte : Xad = Xout
   Dim Yad As Byte : Yad = Yout
   Dim Zad As Byte : Zad = Zout
   Xsumm = 0 : Ysumm = 0 : Zsumm = 0
   Print #1 , "Accel position space";
   For I = 1 To 30
      Xp = I2c_rd(xout) : Yp = I2c_rd(yout) : Zp = I2c_rd(zout)       '������ �������� �� ����
      Xp = Osi(xp) : Yp = Osi(yp) : Zp = Osi(zp)            '�������������� ���������� ����� � ���������� ��������
      Xp = Xp + 10 : Yp = Yp - 9 : Zp = Zp - 8              '������������ �������� ���� ��� 8g
      'Xp = Xp + 39 : Yp = Yp - 37 : Zp = Zp - 30             '������������ �������� ���� ��� 2g
      Xp = Abs(xp) : Yp = Abs(yp) : Zp = Abs(zp)
      Xsumm = Xsumm + Xp : Ysumm = Ysumm + Yp : Zsumm = Zsumm + Zp
      Print #1 , ".";
      Waitms 20
      Toggle Led
   Next
   Xp = Xsumm / 20 : Yp = Ysumm / 20 : Zp = Zsumm / 20
   If Xp => 10 Then
      Xout = Zad : Yout = Yad : Zout = Xad
      Print #1 , "X -> "
      Led = 0
      For I = 1 To 2
         Toggle Led
         Waitms 200
      Next
   Elseif Yp => 10 Then
      Xout = Zad : Yout = Xad : Zout = Yad
      Print #1 , "Y -> "
      For I = 1 To 4
         Toggle Led
         Waitms 200
      Next
   Elseif Zp => 10 Then
      Xout = Xad : Yout = Yad : Zout = Zad
      Print #1 , "Z -> " ;
      For I = 1 To 6
         Toggle Led
         Waitms 200
      Next
   End If
   Print #1 , "OK" : Led = 0
End Sub

Rec_isr:                                                    '���������� �� ���� UART
   D = Udr : Udr = 0
   'Print #1 , D ; " ";

   If Bc < Cmaxchar Then                                    '���������� �����
       If D = Chr(10) Then
         'Print #1 , Bt(1) ; " " ; Bt(2) ; " " ; Bt(3) ; " " ; Bt(4) ; " " ; Bt(5)
         For I = 1 To 4
            Print #1 , Bt(i) ; " " ;
         Next
         Print #1 , ""
         Bc = 1 : Crc_udar = 0 : D = Bt(1)
         For I = 1 To 3                                     '������� CRC �����
            Bt(1) = Bt(i) And &B00001111                    '���� ��������� 4 ���� �� ����������� �����
            Crc_udar = Crc_udar + Bt(1)                     '� ���������� �� � ����������� �����
         Next
         Bt(1) = D : D = 0
         If Bt(1) = 170 And Bt(4) = Crc_udar Then           '���� ��������� ���� 10101010 � ����������� ����� �����
           'Integ = Bt(3)                                    '���������� 2 ���� � integer
           'Shift Integ , Left , 8                           '���������� 2 ���� � integer
           'Integ = Integ Or Bt(2)                           '���������� 2 ���� � integer
           Print #1 , "Porog_X=" ; Bt(2) ; "  " ; "Porog_Z=" ; Bt(3)
           If Porog_z_eep <> Bt(3) Or Porog_x_eep <> Bt(2) Then       '���� ���������� ������ �� ��������� � �������� � eeprom
               Porog_z_eep = Bt(3) : Porog_x_eep = Bt(2)    '�� ���������� ����� ������
               Print #1 , " --> Set new porog..."
               Waitms 3000
           Else
               Print #1 , " --> Sending porog = eeprom porog..."
           End If
         Else
            Print "Start byte or CRC corrupted!"
         End If
         For I = 1 To 5                                     '�������� ����� �����
            Bt(i) = 0
         Next
      Else
          If D <> Chr(10) Then
            If D <> Chr(13) Then Bt(bc) = D                 'Else Bc = Bc - 1
            Incr Bc
         Else
            Bc = 1
         End If
      End If
   Else
      Print "Prevyshen (" ; Cmaxchar ; ")"                  '�������� ������ ������
      Bc = 1
   End If
Return