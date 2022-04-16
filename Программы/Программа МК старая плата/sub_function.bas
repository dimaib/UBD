Sub Setup_wifi()                                            '��������� Wifi ������
   Wd_tim = 0
   'Led1 = 0
   Led2 = 0
   Max_buf = 0
   'Print #2 , Lookupstr(0 , Str_uart)
   Print Lookupstr(0 , Str_uart)
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
End Sub


Sub Init_var()
   Udar_porog = Porog_eep
'   If Udar_porog = &HFFFF Or Udar_porog = 0 Then
'      Porog_eep = 500
'      Udar_porog = Porog_eep
'   End If

   Ap_name = Ssid_eep
   Pass_ap = Pass_eep
'   If Ap_name = "" Or Pass_ap = "" Then
'      Ssid_eep = "NETGEAR"
'      Pass_ap = "111222333444"
'      Ap_name = Ssid_eep
'      Pass_ap = Pass_ap
'   End If
'   Ip_eep(1) = 10 : Ip_eep(2) = 11 : Ip_eep(3) = 22 : Ip_eep(4) = 50
   'Ip_eep(1) = 192 : Ip_eep(2) = 168 : Ip_eep(3) = 0 : Ip_eep(4) = 35
   Server_ip(1) = Ip_eep(1) : Server_ip(2) = Ip_eep(2) : Server_ip(3) = Ip_eep(3) : Server_ip(4) = Ip_eep(4)
   'Server_ip(1) = 192 : Server_ip(2) = 168 : Server_ip(3) = 0 : Server_ip(4) = 63

'   If Server_ip(1) = &HFF And Server_ip(2) = &HFF And Server_ip(3) = &HFF And Server_ip(4) = &HFF Then
'      Ip_eep(1) = 192 : Ip_eep(2) = 168 : Ip_eep(3) = 0 : Ip_eep(4) = 77
'      Server_ip(1) = Ip_eep(1) : Server_ip(2) = Ip_eep(2) : Server_ip(3) = Ip_eep(3) : Server_ip(4) = Ip_eep(4)
'   End If

   Server_port = 3333                                       'Port_eep
'   If Server_port = 0 Or Server_port = &HFFFF Then
'      Port_eep = 3333
'      Server_port = Port_eep
'   End If

   Id = Id_eep
'   If Id = 255 Then
'      Id = Id_eep
'      Id = 10
'      Id_eep = Id
'   End If

End Sub

Sub Connect_ap(point As String * 30 , Pass As String * 30)  '��������� Wi-Fi ������ �� ������ � ������ ������� � �� ����������� � ����� �������
   'Print #2 , Lookupstr(1 , Str_uart) ; Point ; "  *  " ; Pass
   Print Lookupstr(1 , Str_uart) ; Point ; "  *  " ; Pass
   Waitms 500
   Print #1 , Lookupstr(5 , Str_at) ; Chr(34) ; Point ; Chr(34) ; "," ; Chr(34) ; Pass ; Chr(34) ; Chr(13) ; Chr(10)
   Waitms 1000
End Sub

Sub Uart_com(command As String * 1)                         '��������� ��������� ������ UART
   Id_tmp_s = ""
   Id_tmp_b = 0
   Tmp_send = ""
   Wd_tim = 0
   Id = Id_eep
   If Len(buf_uart) > 1 Then Buf_uart = Mid(buf_uart , 2 , 99) Else Buf_uart = ""
   Select Case Command                                      '���������� ������� ������
      Case "a"                                              '������������ ����������� � ������ �������
         'Print #2 , Lookupstr(2 , Str_uart)                 '�� ����� �������!
         Print Lookupstr(2 , Str_uart)                      '�� ����� �������!
         'Led1 = 1
         Buf_uart = Buf_uart + "e"
         Ap_con = 1
         Ap_inc = 0
         Com_a = 0
         Connect = 1
      Case "b"                                              '������ ���������� � ������ �������
         'Print #2 , Lookupstr(3 , Str_uart)                 '������ ����������
         Print Lookupstr(3 , Str_uart)                      '������ ����������
         'Led1 = 0
         Led2 = 0
         Connect_ap Ap_name , Pass_ap
         Ap_con = 0
         Incr Ap_inc
         Com_b = 0
         Connect = 0
      Case "c"                                              '���������� TCP ���������
         'Print #2 , Server_ip(1) ; "." ; Server_ip(2) ; "." ; Server_ip(3) ; "." ; Server_ip(4) ; ":" ; Server_port ; Lookupstr(4 , Str_uart)
         Print Server_ip(1) ; "." ; Server_ip(2) ; "." ; Server_ip(3) ; "." ; Server_ip(4) ; ":" ; Server_port ; Lookupstr(4 , Str_uart)
         Led2 = 0
         If Ap_con = 1 Then Buf_uart = Buf_uart + "e"
         Tcp_con = 0
         Incr Ap_inc
         Com_c = 0
      Case "d"                                              'TCP ���������� ��������!
         'Print #2 , Lookupstr(5 , Str_uart) ; Server_ip(1) ; "." ; Server_ip(2) ; "." ; Server_ip(3) ; "." ; Server_ip(4) ; ":" ; Server_port
         Print Lookupstr(5 , Str_uart) ; Server_ip(1) ; "." ; Server_ip(2) ; "." ; Server_ip(3) ; "." ; Server_ip(4) ; ":" ; Server_port
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
         Server_ip(1) = Ip_eep(1) : Server_ip(2) = Ip_eep(2) : Server_ip(3) = Ip_eep(3) : Server_ip(4) = Ip_eep(4) : Server_port = Port_eep
         'Print #2 , Lookupstr(7 , Str_uart) ; Server_ip(1) ; "." ; Server_ip(2) ; "." ; Server_ip(3) ; "." ; Server_ip(4) ; ":" ; Server_port
         Print Lookupstr(7 , Str_uart) ; Server_ip(1) ; "." ; Server_ip(2) ; "." ; Server_ip(3) ; "." ; Server_ip(4) ; ":" ; Server_port
         Led2 = 0
         Waitms 1000
         Print #1 , Lookupstr(7 , Str_at) ; Chr(34) ; Lookupstr(8 , Str_uart) ; Chr(34) ; "," ; Chr(34) ; Server_ip(1) ; "." ; Server_ip(2) ; "." ; Server_ip(3) ; "." ; Server_ip(4) ; Chr(34) ; "," ; Server_port ; Chr(13) ; Chr(10)
         Incr Tcp_inc
         Com_e = 0
      Case "f"
   End Select
End Sub                                                     '��������� ��������� ������ UART

Function Read_matrix() As Long                              '������� ��� ������ RFIDa � �������������� � Long
   Test = 0
   Lon = 0
   Increm = 0
   'disable Urxc1
   'disable timer1
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
         'Print #2 , " -> " ; Hex(test );
         Rfid_print = Rfid_print + Hex(test) + " "
         If Increm > 4 Then                                 '��������� ��������� 4 ����� RFIDa � 4 �������� ���������� Long
            Shift Lon , Left , 8                            '�������� ���������� Lon �� 8 ����� �����
            Lon = Lon Or Test                               '��������� � ������� ���� ��������� �������� �� Matrixa
         End If                                             '��� ����� ����� ����� ���������� 4 ���� �� 8 ��� � ���������� Lon ����������� �������
         Waitms 1
      Next                                     '40
      Rfid_print = Rfid_print + "[" + Lookupstr(20 , Str_uart) + Str(lon) + "]"

   End If
   'Enable Urxc1
   'enable timer1
   Read_matrix = Lon
End Function                                                '������� ��� ������ RFIDa � �������������� � Long

Sub Init_rfid()                                             '�������� RFID-���� �� ������
   For I = 1 To 40
      Rfid_ar(i) = Rfid_eep(i)
   Next
End Sub                                                     '�������� RFID-���� �� ������