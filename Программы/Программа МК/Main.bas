Dim Start_tmp As Byte
Start_tmp = 1
Led1 = 1

#if Plata = 2

   If Start_lis(start_tmp) = 0 Then                         '������������� �������������
      Do                                                    '���� ������������ �� ��������, �� ����������� ��������� �� ����� ��������� �� ������
         Print "Accel error"
      Loop
   Else
      Print "Accel OK"
   End If

   Call Position_spase()                                    '����������� ��������� � ������������
   Start_tmp = 0
   Start_tmp = Start_lis(start_tmp)                         '��������� ������������� �������������
   Waitms 400

   Enable Timer2                                            '����� ������� ��� ��������� ��������� �� ����

   Dim N_speed As Byte
   N_speed = 50
   Dim Cout_n As Byte
   Dim Arr_speed(50) As Long
   Dim Arr_i As Byte
   Dim Summ_speed As Long
#endif

Setup_wifi                                                  '����� � ��������� WiFi ������
Init_rfid

Xyz_max = 0

For I = 1 To 40                                             '�������� ����� RFID-���� �� eeprom ������ �����������
    Rfid_ar(i) = Rfid_eep(i)
Next                                                        '�������� ����� RFID-���� �� eeprom ������ �����������

Do
   If Len(buf_uart) > 0 Then
      For I = 1 To Len(buf_uart)
         Stt = Mid(buf_uart , 1 , 1)
         Uart_com Stt
      Next
   End If
   If Tcp_inc > 0 Then                                      '������� ������ TCP
      Incr Tcp_inc
            If Led3 = 1 And Tcp_inc = 6 Then
               Tmp_send = Lookupstr(12 , Str_uart) + Str(rfid_ct) + ":" + Str(udar)
               Print #1 , Lookupstr(6 , Str_at) ; Len(tmp_send)       'Rfid_cur=   ������� ������� �������� RFIDa
               Waitms 100
               Print #1 , Tmp_send
               Waitms 30
               Print #1 , "+++"
            End If
      If Tcp_inc > Tcp_tick Then
         Tcp_inc = 0
         Tcp_con = 0
         If Ap_con = 1 Then Buf_uart = Buf_uart + "e"
      End If
   End If
   If Ap_inc > 0 Then                                       '������� ������ AP
      Incr Ap_inc
      If Ap_inc > Ap_tick Then
         Setup_wifi
         Ap_inc = 0
         Ap_con = 0
         Buf_uart = Buf_uart + "b"
      End If
   End If
   '(
   If Udar_pin = 0 And Udar = 0 And Ud_on = 1 Then          '������� �����
      Waitms 100
      If Udar_pin = 0 Then
         Udar = 1
         Udar = 0                                           '�������� ��������� ����
         If Ud_eep = 1 Then Udar_eep = 1                    '���������� ����� � EEPROM
         Incr Udar_n
         #if Print_info = 1
         Print Lookupstr(22 , Str_uart) ; Xyz_max ; "/" ; Udar_porog
         #endif

         Str_send = Lookupstr(12 , Str_uart) + Str(rfid_cur) + ":" + Str(udar)

         'Str_send = Lookupstr(12 , Str_uart) + Str(rfid_cur) + ":" + Str(udar)
         'Str_send = Lookupstr(6 , Str_uart) + ":" + Str(id) + "," + Str(rfid_cur) + "," + Str(udar) + ":" + Lookupstr(6 , Str_uart)
         Print #1 , Lookupstr(6 , Str_at) ; Len(str_send)
         Waitms 200
         Print #1 , Str_send
         Waitms 30
         Print #1 , "+++"
      End If
   End If
    ')
   'If Udar = 1 And Ud_on = 1 Then
   '   Toggle Led1                                           '������� �������� ���������� ��� �����
   '   If Ig_ud_off = 1 Then Rel_ig = 0                      '���������� ��������� ��� �����
   'Else
      Led1 = Connect
   'End If
   Incr Wd_tim
   If Wd_tim > Wdt_tick Then Setup_wifi                     '����� WIFI ������ ��� ��� �������� ������ ��� 60 ������
   Rfid_print = ""
   Rfid_cur = Read_matrix()                                 '������ RFIDa
                  'Toggle Rel_ig                             '��� ��������!
   Incr Del_off
   'If Udar = 1 Then Rel_tr = 1 Else Rel_tr = 0              '������� ��������� ��� ���������� ���� ��������
   'If Rfid_cur > 0 And Rfid_cur = 0 Then                    '������� ������� �� �����������!!!
   If Rfid_cur > 0 Then                                     '������� ������� �� �����������!!!
      Led4 = 1
      Del_led4 = 0
      Amount_1 = Rfid_amount_user + Rfid_amout_master
      'Init_rfid                                             '���������� RFID-���� �� EEPROM
      For I = 1 To Amount_1
         'if Rfid_ar(i)>0 then print #2, str(Rfid_cur) ;" "; str(Rfid_ar(i))
         'If Rfid_cur = Rfid_ar(i) Then Exit For             '����� �������� RFIDa � ������ ����
         If Rfid_cur = Rfid_eep(i) Then Exit For            '����� �������� RFIDa � ������ ����
      Next
      Del_off = 0
      Amount_1 = Rfid_amount_user + 1
      If I < Amount_1 And Udar = 0 Then                     '���� RFID ��������� � ������ ������� ����
         Rfid_print = Rfid_print + Lookupstr(23 , Str_uart) 'User
         Led3 = 1
         Rel_ig = 1
         Del_off = 0
         Rfid_ct = Rfid_cur
         Rfid_del_ignition = 0
         Amount_1 = Rfid_amount_user + Rfid_amout_master
         Incr Amount_1
      Elseif I > Rfid_amount_user And I <= 110 Then         '���� RFID ��������� � ������ ������-����
         Rfid_print = Rfid_print + Lookupstr(24 , Str_uart) 'Master
         Toggle Led3
         Rel_ig = 1
         Del_off = 0
         Xyz_max = 0
         Udar = 0
         If Ud_eep = 1 Then Udar_eep = 0                    '����� ����� � eeprom
         Rfid_ct = Rfid_cur
         Rfid_del_ignition = 0
      Else
         If Rfid_del_ignition >= 254 Then                   '80
            Rel_ig = 0 : Led3 = 0 : Del_off = 0 : Rfid_ct = 0
         Else
            Incr Rfid_del_ignition
         End If
      End If
      Incr Rfid_delay
      If Rfid_delay > 7 Then                                '�������� �� ����� �������� RFIDa
         Rfid_delay = 0
         'Print #2 , Rfid_print ; " " ; Xyz_max ; " Connect=" ; Connect
         #if Print_info = 1
         Print Rfid_print ; " " ; Xyz_max ; " Connect=" ; Connect
         #endif
         'Print #2 , Bin(rfid_cur) ; " " ; Xyz_max ; " Connect=" ; Connect
      End If
   Else
      Incr Del_led4
      If Del_led4 > 3 Then
         Led4 = 0
         Del_led4 = 0
      End If
      If Del_off > Del_ignition Then
         Rel_ig = 0 : Led3 = 0 : Del_off = 0 : Rfid_ct = 0
      End If
   End If
   If Del_off > 200 Then Del_off = 0
   Waitms 100
   'If Ap_name <> "" Then Reset Watchdog
   'If Rel_ig = 1 Then Reset Watchdog
Loop