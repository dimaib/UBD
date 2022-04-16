Sub Setup_wifi()                                            '��������� Wifi ������
   Wd_tim = 0
   'Led1 = 0
   Led2 = 0
   Max_buf = 0
   'Print #2 , Lookupstr(0 , Str_uart)
   #if Print_info = 1
   Print Lookupstr(0 , Str_uart)
   #endif

   Rst_wifi = 0
   Waitms 500
   Rst_wifi = 1
   Waitms 500

   Init_var

   Print #1 , Lookupstr(0 , Str_at) : Waitms 200            'ATE0 - ��� ���������. ATE1 - ��� ��������
   Print #1 , Lookupstr(1 , Str_at) : Waitms 200
   Print #1 , Lookupstr(2 , Str_at) : Waitms 200
   Print #1 , Lookupstr(3 , Str_at) : Waitms 200
   Print #1 , Lookupstr(4 , Str_at) : Waitms 200
   Connect_ap Ap_name , Pass_ap                             '����������� � ����� �������
   Max_buf = 1
   Connect = 0
   Send_porog
End Sub


Sub Init_var()
   Ap_name = Lookupstr(wifi , Wifi_ap)
   Pass_ap = Lookupstr(wifi , Wifi_pass)
   Server_ip = Lookupstr(wifi , Ip_adr)
   #if Plata = 1
      Id = 59
   #else
      Id = Pinc
   #endif
   Send_porog
End Sub

Sub Connect_ap(point As String * 30 , Pass As String * 30)  '��������� Wi-Fi ������ �� ������ � ������ ������� � �� ����������� � ����� �������
   'Print #2 , Lookupstr(1 , Str_uart) ; Point ; "  *  " ; Pass
   #if Print_info = 1
   Print Lookupstr(1 , Str_uart) ; Point ; "  *  " ; Pass
   #endif
   Waitms 500
   Print #1 , Lookupstr(5 , Str_at) ; Chr(34) ; Point ; Chr(34) ; "," ; Chr(34) ; Pass ; Chr(34) ; Chr(13) ; Chr(10)
   Waitms 1000
End Sub

Sub Uart_com(command As String * 1)                         '��������� ��������� ������ UART
   Id_tmp_s = ""
   Id_tmp_b = 0
   Tmp_send = ""
   Wd_tim = 0
   'Id = Id_eep
   If Len(buf_uart) > 1 Then Buf_uart = Mid(buf_uart , 2 , 99) Else Buf_uart = ""
   Select Case Command                                      '���������� ������� ������
      Case "a"                                              '������������ ����������� � ������ �������
         #if Print_info = 1
         Print Lookupstr(2 , Str_uart)                      '�� ����� �������!
         #endif
         'Led1 = 1
         Buf_uart = Buf_uart + "e"
         Ap_con = 1
         Ap_inc = 0
         Com_a = 0
         Connect = 1
      Case "b"                                              '������ ���������� � ������ �������
         #if Print_info = 1
         Print Lookupstr(3 , Str_uart)                      '������ ����������
         #endif
         'Led1 = 0
         Led2 = 0
         Connect_ap Ap_name , Pass_ap
         Ap_con = 0
         Incr Ap_inc
         Com_b = 0
         Connect = 0
      Case "c"                                              '���������� TCP ���������
         #if Print_info = 1
         Print Lookupstr(wifi , Ip_adr) ; ":" ; Server_port ; Lookupstr(4 , Str_uart)
         #endif
         Led2 = 0
         If Ap_con = 1 Then Buf_uart = Buf_uart + "e"
         Tcp_con = 0
         Incr Ap_inc
         Com_c = 0
      Case "d"                                              'TCP ���������� ��������!
         #if Print_info = 1
         Print Lookupstr(5 , Str_uart) ; Lookupstr(wifi , Ip_adr) ; ":" ; Server_port
         #endif
         Led2 = 1
         Tcp_con = 1
         Tcp_inc = 0
         Ap_inc = 0
         Com_d = 0
         Str_send = ""
         Str_send = Lookupstr(6 , Str_uart) + ":" + Str(id) + "," + Str(rfid_cur) + "," + Str(udar) + ":" + Lookupstr(6 , Str_uart)
         Print #1 , Lookupstr(6 , Str_at) ; Len(str_send)
         Waitms 200
         Print #1 , Str_send                                '�������  ������ ������� � �������� id, rfid � ������ �����. start:id,34546774,1:start
      Case "e"                                              '�������� ���������� TCP

         #if Print_info = 1
         Print Lookupstr(7 , Str_uart) ; Lookupstr(wifi , Ip_adr) ; ":" ; Server_port
         #endif
         Led2 = 0
         Waitms 1000
         Print #1 , Lookupstr(7 , Str_at) ; Chr(34) ; Lookupstr(8 , Str_uart) ; Chr(34) ; "," ; Chr(34) ; Lookupstr(wifi , Ip_adr) ; Chr(34) ; "," ; Server_port ; Chr(13) ; Chr(10)
         Incr Tcp_inc
         Com_e = 0
      Case "f"
   End Select
End Sub                                                     '��������� ��������� ������ UART

Function Read_matrix() As Long                              '������� ��� ������ RFIDa � �������������� � Long
   Test = 0
   Lon = 0
   Increm = 0
   For Increm = 1 To 10                                     '10 ������� �����������, � ���� ���� ���� ��� ������ ������������ ���

      1wreset
      If Err <> 1 Then Exit For
      Waitms 20
   Next
   If Increm < 11 Then                                      '���� ��������� ����� �� �����, �� ��� ����������, �� �������� �� ����������� RFID
      1wwrite &H33
      Rfid_print = Lookupstr(19 , Str_uart)
      For Increm = 1 To 8                                   '�������� 8 ���� �� �����������
         Test = 1wread()
         Rfid_print = Rfid_print + Hex(test) + " "
         If Increm > 4 Then                                 '��������� ��������� 4 ����� RFIDa � 4 �������� ���������� Long
            Shift Lon , Left , 8                            '�������� ���������� Lon �� 8 ����� �����
            Lon = Lon Or Test                               '��������� � ������� ���� ��������� �������� �� Matrixa
         End If                                             '��� ����� ����� ����� ���������� 4 ���� �� 8 ��� � ���������� Lon ����������� �������
         Waitms 1
      Next                                                  '40
      Rfid_print = Rfid_print + "[" + Lookupstr(20 , Str_uart) + Str(lon) + "]"

   End If
   Read_matrix = Lon
End Function                                                '������� ��� ������ RFIDa � �������������� � Long

Sub Init_rfid()                                             '�������� RFID-���� �� ������
   For I = 1 To Amount_1
      Rfid_ar(i) = Rfid_eep(i)
   Next
End Sub

#if Plata = 2
''������� ��� �������������
Sub Read_x_y_z()                                            '������ �������� ���� � ��������� ��                                    '���� ���� ��������� �� ����, �� ������ ��� ��������
      X11 = I2c_rd(xout) : Y11 = I2c_rd(yout) : Z11 = I2c_rd(zout)       '������ �������� �� ����
      Xp = Osi(x11) : Yp = Osi(y11) : Zp = Osi(z11)         '�������������� ���������� ����� � ���������� ��������
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
   'Waitms 1
End Sub                                                     '��������� ������ ����� �� ������ � i2c

Function I2c_rd(adrr As Byte) As Byte                       '������� ������ ����� �� ������ � i2c
   I2cstart
      I2cwbyte W_lis
      I2cwbyte Adrr
      I2crepstart
      I2cwbyte R_lis
      I2crbyte I2c_rd , Nack
      I2crepstart
   I2cstop
   'Waitms 1
End Function                                                '������� ������ ����� �� ������ � i2c

Sub Position_spase()                                        '��������� ���������� ��������� ������������� � ������������
   Dim Xsumm As Long
   Dim Ysumm As Long
   Dim Zsumm As Long
   Dim Xad As Byte : Xad = Xout
   Dim Yad As Byte : Yad = Yout
   Dim Zad As Byte : Zad = Zout
   Xsumm = 0 : Ysumm = 0 : Zsumm = 0
   #if Print_info = 1
   Print "Accel position space";
   #endif
   For I = 1 To 30
      X11 = I2c_rd(xout) : Y11 = I2c_rd(yout) : Z11 = I2c_rd(zout)       '������ �������� �� ����
      Xp = Osi(x11) : Yp = Osi(y11) : Zp = Osi(z11)         '�������������� ���������� ����� � ���������� ��������
      Xp = Xp + 10 : Yp = Yp - 9 : Zp = Zp - 8              '������������ �������� ���� ��� 8g
      'Xp = Xp + 39 : Yp = Yp - 37 : Zp = Zp - 30             '������������ �������� ���� ��� 2g
      Xp = Abs(xp) : Yp = Abs(yp) : Zp = Abs(zp)
      Xsumm = Xsumm + Xp : Ysumm = Ysumm + Yp : Zsumm = Zsumm + Zp
      #if Print_info = 1
      Print ".";
      #endif
      Waitms 20
   Next
   Xp = Xsumm / 20 : Yp = Ysumm / 20 : Zp = Zsumm / 20
   If Xp => 10 Then
      Xout = Zad : Yout = Yad : Zout = Xad
      #if Print_info = 1
      Print "X -> "
      #endif
   Elseif Yp => 10 Then
      Xout = Zad : Yout = Xad : Zout = Yad
      #if Print_info = 1
      Print "Y -> "
      #endif
   Elseif Zp => 10 Then
      Xout = Xad : Yout = Yad : Zout = Zad
      #if Print_info = 1
      Print "Z -> " ;
      #endif
   End If
   #if Print_info = 1
   Print "OK"
   #endif
End Sub                                                     '��������� ���������� ��������� ������������� � ������������

Sub Printf(st As String * 100 , Newline As Byte , Msg_status As Byte)       '����� ��������� ���������
   If Newline = 1 Then Print St Else Print St;
End Sub
#endif

Sub Send_porog()                                            '������� ������� ������� �����
   Xxx = Porog_x_eep : Zzz = Porog_z_eep                    '�������� ������� �� eeprom
   Tmp_crc = 0 : Crc_udar = 10                              '������������� ����������
   Tmp_crc = Zzz And &B0000111100000000                     '���������� crc �� ������ Z
   Shift Tmp_crc , Right , 8 : Crc_udar = Crc_udar + Tmp_crc       '���������� crc �� ������ Z
   Tmp_crc = Zzz And &B0000000000001111 : Crc_udar = Crc_udar + Tmp_crc       '���������� crc �� ������ Z
   Tmp_crc = Xxx And &B00001111 : Crc_udar = Crc_udar + Tmp_crc       '���������� crc �� ������ X

   Printbin #2 , Start_b ; Zzz ; Xxx ; Crc_udar             '������� ������� ������� [10101010][yyyyyyyy yyyyyyyy][xxxxxxxx][cccccccc][cl+cr]
   Print #2 , ""                                            '��� y - 2 ����� ������ �� Z, x - ���� ������ �� X, � - ����������� �����
   #if Print_info = 1
   Print "Send porog in accel X & Z " ; Xxx ; " & " ; Zzz
   #endif
End Sub                                                     '������� ������� ������� �����
''������� ��� �������������

''��������� ����������