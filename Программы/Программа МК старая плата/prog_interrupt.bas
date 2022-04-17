Rec_isr:                                                    '���������� �� ���� UART
   D = Udr1
   If Bc <= Cmaxchar Then
      If D = Chr(10) And Buf <> "" Then                     '���������� �����
         'Wd_tim = 0
         Rf_shift = 0
         Rf_it = 1
         'Print #2 , ""
         'Print #2 , Buf ; " [" ; Bc ; "]"
         Print Buf ; " [" ; Bc ; "]"
         If Buf = Lookupstr(26 , Str_uart) And Com_a = 0 Then
            Buf_uart = Buf_uart + "a"
            Com_a = 1
         Elseif Buf = Lookupstr(27 , Str_uart) Or Buf = Lookupstr(28 , Str_uart) And Com_b = 0 Then
            Buf_uart = Buf_uart + "b"
            Com_b = 1
         Elseif Buf = Lookupstr(29 , Str_uart) Or Buf = Lookupstr(30 , Str_uart) Or Buf = Lookupstr(31 , Str_uart) And Ap_con = 1 And Com_c = 0 Then
            Buf_uart = Buf_uart + "c"
            Com_c = 1
         Elseif Buf = Lookupstr(32 , Str_uart) Or Buf = Lookupstr(33 , Str_uart) Or Buf = Lookupstr(34 , Str_uart) Or Buf = Lookupstr(35 , Str_uart) And Com_d = 0 Then
            Buf_uart = Buf_uart + "d"
            Com_d = 1
         Elseif Mid(buf , 1 , 5) = "+IPD," And Com_f = 0 Then       '������� ������ �� ������� ������
            If Bc = 200 Then                                '���� ���-�� ���� � ������� 200
               Buf_copy = Buf
               Com_f = 0
               Tm_str = ""
               Tm_char = ""
               Tm1(1) = 0 : Tm1(2) = 0
               If Len(buf_copy) > 5 Then
                  For I = 1 To 10
                     If Mid(buf_copy , I , 1) = ":" Then Exit For
                  Next
                  Incr I
                  Tm_str = Mid(buf_copy , I , 27)
                  Buf_copy = ""
                  Dff = 0
                  If Tm_str = Lookupstr(9 , Str_uart) Then  '  "RFID_List_fixed_len_blabla: ������ ������ ���� �� Wi-Fi"
                     Crc_sum = 0 : Crc = 0
                     'Print #2 , Buf
                     Print Buf
                     For I = 1 To 41
                        ' ������ ��������� ����������� 40 RFID-����, 41� ��� CRC (����������� �����), ������� ������������� ��������� �������:
                        ' ������� ��������� 4 ���� �� ������ ����� (���������� ����� 0..15) � ������������
                        ' ���� ����������� CRC ����� ����������, �� �������, ��� ������� �������� ���������!
                        '������ ������� ����� 1=4, 4=1, 2=3, 3=2 (�������� �������������� ���������� Long)
                        'Temp_long = 0
                        Dff = Rfid_ar(i) : Shift Dff , Left , 24 : Temp_long = Dff       '������ ������ ���� �� ����� ���������
                        Dff = Rfid_ar(i) : Shift Dff , Left , 8 : Dff = Dff And &H00FF0000 : Temp_long = Temp_long Or Dff       '������ ������ ���� �� ����� ��������
                        Dff = Rfid_ar(i) : Shift Dff , Right , 8 : Dff = Dff And &H0000FF00 : Temp_long = Temp_long Or Dff       '������ ������ ���� �� ����� �������
                        Dff = Rfid_ar(i) : Shift Dff , Right , 24 : Dff = Dff And &H000000FF : Temp_long = Temp_long Or Dff       '������ �������� ���� �� ����� �������
                        If I < 41 Then
                           Rfid_ar(i) = Temp_long           '���������� ������� ����
                           'Print #2 , " " ; Rfid_ar(i);
                           Print " " ; Rfid_ar(i);
                           Dff = Temp_long And &B00001111   '���� ��������� 4 ���� �� ����� ��� ���������� � crc
                           Crc_sum = Crc_sum + Dff          '��������� ��������� 4 ���� ����� � crc
                        Else
                           Crc = Temp_long                  '���������� CRC
                           'Crc = Rfid_ar(41)                '���������� CRC
                        End If
                     Next
                     'Print #2 , ""
                     'Print #2 , "CRC=" ; Crc ; "  CRC_sum=" ; Crc_sum
                     Print ""
                     Print "CRC=" ; Crc ; "  CRC_sum=" ; Crc_sum
                     If Crc = Crc_sum And Crc > 0 And Crc_sum > 0 Then       '���� CRC �����
                        Wd_tim = 0
                        For I = 1 To 40                     '����� �������� � ���������� ������ ���� � � ������ eeprom
                           Dff = Rfid_eep(i)
                           If Dff <> Rfid_ar(i) Then Exit For       '���� ���� ���� �� ���� ��������, �� ��������� ����� ������ � eeprom
                        Next

                        If I < 41 Then                      '���� ���� ���� �� ���� ��������, �� ��������� ����� ������ � eeprom
                           For I = 1 To 40
                              Rfid_eep(i) = Rfid_ar(i)      '���������� ����������� ������ � eeprom
                           Next
                           'Print #2 , Lookupstr(10 , Str_uart)
                           Print Lookupstr(10 , Str_uart)
                        Else
                           'Print #2 , Lookupstr(11 , Str_uart)       '���� ������ ���������
                           Print Lookupstr(11 , Str_uart)   '���� ������ ���������
                        End If
                        'Tmp_send = Lookupstr(12 , Str_uart) + Str(rfid_cur) + ":" + Str(udar)
                        Tmp_send = Lookupstr(12 , Str_uart) + Str(rfid_cur) + ":" + Str(udar)
                        Print #1 , Lookupstr(6 , Str_at) ; Len(tmp_send)       'Rfid_cur=   ������� ������� �������� RFIDa
                        Waitms 30
                        Print #1 , Tmp_send
                        Waitms 30
                        Print #1 , "+++"
                     Else                                   '���� CRC �� �����!
                        'Print #2 , Lookupstr(37 , Str_uart)
                        Print Lookupstr(37 , Str_uart)
                        Rfid_tt = 0
                        Waitms 30
                        Print #1 , "+++"
                     End If
                  End If
               End If
            Else
               For I_uart = 1 To 40
                  'Print #2 , Rfid_ar(i_uart) ; " ";
                  Print Rfid_ar(i_uart) ; " ";
                  Rfid_ar(i_uart) = Rfid_eep(i_uart)
               Next
               'Print #2 , ""
               'Print #2 , Lookupstr(37 , Str_uart)
               Print ""
               Print Lookupstr(37 , Str_uart)
            End If
         End If
         Buf = ""
         'D1 = 0 : D2 = 0
         Bc = 0
      Else
          If D <> Chr(10) Then
            If Bc > 35 And Max_buf = 1 Then                 '���� �������� �������� ������ 35 �� ��������, ��� ��������� ������ ����
               If Rf_it < 42 Then
                  If Rf_shift = 0 Then Rfid_ar(rf_it) = 0
                  Incr Rf_shift
                  Rfid_ar(rf_it) = Rfid_ar(rf_it) Or D
                  If Rf_shift > 3 Then
                     Rf_shift = 0
                     Incr Rf_it
                  Else
                     Shift Rfid_ar(rf_it) , Left , 8
                  End If
               End If
            Else
               If D <> Chr(13) Then
                  Buf = Buf + Chr(d)
               Else
                  Bc = Bc - 1
               End If
            End If
            Incr Bc
         End If
      End If
   Else
      'Print #2 , Lookupstr(38 , Str_uart) ; Cmaxchar ; ")"  '�������� ������ ������
      Print Lookupstr(38 , Str_uart) ; Cmaxchar ; ")"       '�������� ������ ������
      Buf = ""
      Bc = 0
   End If
Return                                                      '���������� �� ���� UART

'(
T1:                                                         '���������� ������� 1, ��������� ������� �����
   X = Getadc(3) \ Nit : Y = Getadc(2) \ Nit : Z = Getadc(1) \ Nit
   X = X0 - X : Y = Y0 - Y : Z = Z0 - Z
   If X > 40000 Then X = 0
   If Y > 40000 Then Y = 0
   If Z > 40000 Then Z = 0
   X = X * X : Y = Y * Y : Z = Z * Z
   Tmpxyz = X + Y : Tmpxyz = Tmpxyz + Z : Tmpxyz = Sqr(tmpxyz) * Nit
   If Xyz_max < Tmpxyz Then
      Xyz_max = Tmpxyz
      Print #2 , Lookupstr(39 , Str_uart) ; Xyz_max ; "/" ; Udar_porog
   End If
   Timer1 = 45000
Return
')

T1:                                                         '���������� ������� 1, ��������� ������� �����
   Z = Getadc(1)
   'If Xyz_max < Z Then
   '   Xyz_max = Z
   '   Print #2 , Lookupstr(39 , Str_uart) ; Xyz_max ; "/" ; Udar_porog
   'End If
   'Print #2 , Z
   Timer1 = 30000
Return