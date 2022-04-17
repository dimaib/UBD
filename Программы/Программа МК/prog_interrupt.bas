Rec_isr:                                                    'прерывание на приём UART
   D = Udr1
   If Bc <= Cmaxchar Then
      If D = Chr(10) And Buf <> "" Then                     'завершение приёма
         'Wd_tim = 0
         Rf_shift = 0
         Rf_it = 1
         #if Print_info = 1
         Print Buf ; " [" ; Bc ; "]"
         #endif
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
         Elseif Mid(buf , 1 , 5) = "+IPD," And Com_f = 0 Then       'приняты данные от сервера модуля
            If Bc = 488 Then                                'если кол-во байт в посылке 200
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
                  If Tm_str = Lookupstr(9 , Str_uart) Then  '  "RFID_List_fixed_len_blabla: принят список карт от Wi-Fi"
                     Crc_sum = 0 : Crc = 0
                     Amount = Rfid_amount_user + Rfid_amout_master
                     Incr Amount
                     Amount_2 = Rfid_amount_user + Rfid_amout_master : Amount_2 = Amount_2 + 3
                     For I = 1 To Amount_2
                        ' Сервер присылает контроллеру 40 RFID-карт, 41я это CRC (контрольная сумма), которая расчитывается следующим образом:
                        ' берутся последние 4 бита от каждой карты (десятичное число 0..15) и складываются
                        ' если расчитанная CRC равна присланной, то считаем, что посылка передана правильно!
                        'меняем местами байты 1=4, 4=1, 2=3, 3=2 (поБАЙТНО переварачиваем переменную Long)
                        Dff = Rfid_ar(i) : Shift Dff , Left , 24 : Temp_long = Dff       'ставим первый байт на место четвёртого
                        Dff = Rfid_ar(i) : Shift Dff , Left , 8 : Dff = Dff And &H00FF0000 : Temp_long = Temp_long Or Dff       'ставим второй байт на место третьего
                        Dff = Rfid_ar(i) : Shift Dff , Right , 8 : Dff = Dff And &H0000FF00 : Temp_long = Temp_long Or Dff       'ставим третий байт на место второго
                        Dff = Rfid_ar(i) : Shift Dff , Right , 24 : Dff = Dff And &H000000FF : Temp_long = Temp_long Or Dff       'ставим четвёртый байт на место первого
                        If I < Amount Then
                           Rfid_ar(i) = Temp_long           'заполнение массива карт
                           #if Print_info = 1
                           Print " " ; Rfid_ar(i);
             #endif
                           Dff = Temp_long And &B00001111   'берём последние 4 бита от карты для добавление в crc
                           Crc_sum = Crc_sum + Dff          'добавляем последние 4 бита карты в crc
                        Elseif I = Amount Then              '4 байта для вычисления CRC
                           Crc = Temp_long
                        Elseif I > Amount And I < Amount_2 Then       '4 байта для вычисления Porog_X
                           Porog_x = Temp_long
                        Elseif I = Amount_2 Then            '4 байта для вычисления Porog_Z
                           Porog_z = Temp_long
                        End If
                     Next
                     #if Print_info = 1
                     Print ""
                     Print "CRC=" ; Crc ; "  CRC_sum=" ; Crc_sum ; "  Porog_X=" ; Porog_x ; "  Porog_Z=" ; Porog_z
                     #endif
                     If Crc = Crc_sum And Crc > 0 And Crc_sum > 0 Then       'если CRC верна
                        Wd_tim = 0
                        Decr Amount
                        For I = 1 To Amount                 'поиск различий в присланном списке карт и в списке eeprom
                           Dff = Rfid_eep(i)
                           If Dff <> Rfid_ar(i) Then Exit For       'если есть хотя бы одно различие, то добавляем новый список в eeprom
                        Next
                        Incr Amount
                        If I < Amount Then                  'если есть хотя бы одно различие, то добавляем новый список в eeprom
                           Decr Amount
                           For I = 1 To Amount
                              Rfid_eep(i) = Rfid_ar(i)      'добавление присланного списка в eeprom
                           Next
                           Incr Amount
                           #if Print_info = 1
                           Print Lookupstr(10 , Str_uart)
                           #endif
                        Else
                           #if Print_info = 1
                           Print Lookupstr(11 , Str_uart)   'если списки совпадают
                           #endif
                        End If

                        If Porog_x <> Porog_x_eep Or Porog_z <> Porog_z_eep Then
                           If Porog_z <> 0 And Porog_x <> 0 Then
                              Porog_x_eep = Porog_x : Porog_z_eep = Porog_z
                              #if Print_info = 1
                              Print "New porog saved..."
                              #endif
                           Else
                              #if Print_info = 1
                              Print "ERROR! New porog is zero..."
                              #endif
                           End If
                        Else
                           #if Print_info = 1
                           Print "Porog = Porog_Eeprom"
                           #endif
                        End If
                        Send_porog
                        Tmp_send = Lookupstr(12 , Str_uart) + Str(rfid_cur) + ":" + Str(udar)
                        Print #1 , Lookupstr(6 , Str_at) ; Len(tmp_send)       'Rfid_cur=   посылка серверу текущего RFIDa
                        Waitms 30
                        Print #1 , Tmp_send
                        Waitms 30
                        Print #1 , "+++"
                     Else                                   'Если CRC не верна!
                        Print Lookupstr(37 , Str_uart)
                        Rfid_tt = 0
                        Waitms 30
                        Print #1 , "+++"
                     End If
                  End If
               End If
            Else
               Decr Amount
               For I_uart = 1 To Amount
                  #if Print_info = 1
                  Print Rfid_ar(i_uart) ; " ";
                  #endif
                  Rfid_ar(i_uart) = Rfid_eep(i_uart)
               Next
               Incr Amount
               #if Print_info = 1
               Print ""
               Print Lookupstr(37 , Str_uart)
               #endif
            End If
         End If
         Buf = ""
         Bc = 0
      Else
          If D <> Chr(10) Then
            If Bc > 35 And Max_buf = 1 Then                 'если принятых символов больше 35 то понимаем, что принимаем список карт
               Incr Amount : Incr Amount : Incr Amount
               If Rf_it < Amount Then
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
               Decr Amount : Decr Amount : Decr Amount
            Else
               If D <> Chr(13) Then
                  Buf = Buf + Chr(d)
               Else
                  Bc = Bc - 1
               End If
            End If
            Incr Bc
         Else
            Bc = 0
         End If
      End If
   Else
      #if Print_info = 1
      Print Lookupstr(38 , Str_uart) ; Cmaxchar ; ")"       'превышен размер строки
      #endif
      Buf = ""
      Bc = 0
   End If
   'Timer1 = 0 : Timer2 = 0
Return                                                      'прерывание на приём UART




#if Plata = 2
T1:                                                         'прерывание таймера 1, посчёт скорости
   Freq_tmp = Timer1
   Freq = Freq_tmp * T
   Freq = 1 / Freq
   Freq_tmp = Abs(freq)
   If Freq_tmp > 70000 Then Freq_tmp = 0
   Summ_speed = 0
   For Arr_i = 1 To N_speed -1
         Arr_speed(arr_i) = Arr_speed(arr_i + 1)
         Toggle Led4
         Summ_speed = Summ_speed + Arr_speed(arr_i)
   Next
   Arr_i = 0
   If Freq_tmp < 70000 Then Arr_speed(n_speed) = Freq_tmp Else Arr_speed(n_speed) = 0
   Arr_speed(n_speed) = Freq_tmp
   Summ_speed = Summ_speed + Arr_speed(n_speed)
   Summ_speed = Summ_speed \ N_speed
   Timer1 = 0
Return                                                      'прерывание таймера 1, посчёт скорости

T2:
   Const Alpha = 100
   Dim Xy_por As Word                                       'порог для расчёта соотношения векторов
   Dim Zpor As Word                                         'порог для отсечения оси Z
   Dim Alpaxz As Word                                       'соотношение векторов XZ
   Dim Sing As Word
   Dim Tmp_accel As Byte : Tmp_accel = 5
   Dim Sstt As String * 20
   Incr Arr_i
   If Arr_i > 30 Then
      Arr_i = 0
      Summ_speed = 0
   End If
   'If Summ_speed > 30000 Then Summ_speed = 0

   Call Read_x_y_z

   Xp = Abs(xp) : Yp = Abs(yp) : Zp = Abs(zp)
   If Xp = 0 Then Xp = 1
   If Yp = 0 Then Yp = 1
   If Zp = 0 Then Zp = 1
   'If Xp > Tmp_accel Or Yp > Tmp_accel Or Zp > Tmp_accel Then Led1 = 1 Else Led1 = 0
   If Xp > Tmp_accel Then Led2 = 1 Else Led2 = 0
   If Yp > Tmp_accel Then Led3 = 1 Else Led3 = 0
   If Zp > Tmp_accel Then Led4 = 1 Else Led4 = 0
   Summ_xyz = Xp / Zp : Summ_x = Summ_xyz * 100
   Summ_xyz = Yp / Zp : Summ_y = Summ_xyz * 100
   #if Debug_info = 1
      Sstt = Str(xp) : Print Format(sstt , "   ") ; " " ;
      Sstt = Str(yp) : Print Format(sstt , "   ") ; " " ;
      Sstt = Str(zp) : Print Format(sstt , "   ") ; " " ;

      'Sstt = Str(summ_x) : Print Format(sstt , "     ") ; " " ;
      'Sstt = Str(summ_y) : Print Format(sstt , "     ") ;
      Print ""
   #endif
Return
#endif