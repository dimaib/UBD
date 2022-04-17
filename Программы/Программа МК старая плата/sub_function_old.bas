Sub Setup_wifi()                                            'настройка Wifi модуля
   Wd_tim = 0
   Led1 = 0
   Led2 = 0
   Max_buf = 0
   Print #2 , Lookupstr(0 , Str_uart)
   Rst_wifi = 0
   Waitms 500
   Rst_wifi = 1
   Waitms 500

   Init_var

   Print #1 , Lookupstr(0 , Str_at) : Waitms 200            'ATE0 - эхо отключено. ATE1 - эхо включено
   Print #1 , Lookupstr(1 , Str_at) : Waitms 200
   Print #1 , Lookupstr(2 , Str_at) : Waitms 200
   Print #1 , Lookupstr(3 , Str_at) : Waitms 200
   Print #1 , Lookupstr(4 , Str_at) : Waitms 200
   Connect_ap Ap_name , Pass_ap                             'подключение к точке доступа
   Max_buf = 1
End Sub


Sub Init_var()
   Udar_porog = Porog_eep
   If Udar_porog = &HFFFF Or Udar_porog = 0 Then
      Porog_eep = 500
      Udar_porog = Porog_eep
   End If

   Ap_name = Ssid_eep
   Pass_ap = Pass_eep
   If Ap_name = "" Or Pass_ap = "" Then
      Ssid_eep = "NETGEAR"
      Pass_ap = "111222333444"
      Ap_name = Ssid_eep
      Pass_ap = Pass_ap
   End If
   Ip_eep(1) = 192 : Ip_eep(2) = 168 : Ip_eep(3) = 0 : Ip_eep(4) = 77
   Server_ip(1) = Ip_eep(1) : Server_ip(2) = Ip_eep(2) : Server_ip(3) = Ip_eep(3) : Server_ip(4) = Ip_eep(4)
   If Server_ip(1) = &HFF And Server_ip(2) = &HFF And Server_ip(3) = &HFF And Server_ip(4) = &HFF Then
      Ip_eep(1) = 192 : Ip_eep(2) = 168 : Ip_eep(3) = 0 : Ip_eep(4) = 77
      Server_ip(1) = Ip_eep(1) : Server_ip(2) = Ip_eep(2) : Server_ip(3) = Ip_eep(3) : Server_ip(4) = Ip_eep(4)
   End If

   Server_port = Port_eep
   If Server_port = 0 Or Server_port = &HFFFF Then
      Port_eep = 3333
      Server_port = Port_eep
   End If

   Id = Id_eep
   If Id = 255 Then
      Id = Id_eep
      Id = 10
      Id_eep = Id
   End If

End Sub

Sub Connect_ap(point As String * 30 , Pass As String * 30)  'Настройка Wi-Fi модуля на работу в режиме клиента и на подключение к точке доступа
   Print #2 , Lookupstr(1 , Str_uart) ; Point ; "  *  " ; Pass
   Waitms 500
   Print #1 , Lookupstr(5 , Str_at) ; Chr(34) ; Point ; Chr(34) ; "," ; Chr(34) ; Pass ; Chr(34) ; Chr(13) ; Chr(10)
   Waitms 1000
End Sub

Sub Uart_com(command As String * 1)                         'процедура обработки команд UART

   Id_tmp_s = ""
   Id_tmp_b = 0
   Tmp_send = ""
   Wd_tim = 0
   Id = Id_eep
   If Len(buf_uart) > 1 Then Buf_uart = Mid(buf_uart , 2 , 99) Else Buf_uart = ""
   Select Case Command                                      'обработчик очереди команд
      Case "a"                                              'установленно подключение с точкой доступа
         Print #2 , Lookupstr(2 , Str_uart)                 'ип адрес получен!
         Led1 = 1
         Buf_uart = Buf_uart + "e"
         Ap_con = 1
         Ap_inc = 0
         Com_a = 0
      Case "b"                                              'потеря соединения с точкой доступа
         Print #2 , Lookupstr(3 , Str_uart)                 'потеря соединения
         Led1 = 0
         Led2 = 0
         Connect_ap Ap_name , Pass_ap
         Ap_con = 0
         Incr Ap_inc
         Com_b = 0
      Case "c"                                              'соединение TCP разорвано
         Print #2 , Server_ip(1) ; "." ; Server_ip(2) ; "." ; Server_ip(3) ; "." ; Server_ip(4) ; ":" ; Server_port ; Lookupstr(4 , Str_uart)
         Led2 = 0
         If Ap_con = 1 Then Buf_uart = Buf_uart + "e"
         Tcp_con = 0
         Com_c = 0
      Case "d"                                              'TCP соединение созданно!
         Print #2 , Lookupstr(5 , Str_uart) ; Server_ip(1) ; "." ; Server_ip(2) ; "." ; Server_ip(3) ; "." ; Server_ip(4) ; ":" ; Server_port
         Led2 = 1
         Tcp_con = 1
         Tcp_inc = 0
         Com_d = 0
         Str_send = ""
         Str_send = Lookupstr(6 , Str_uart) + ":" + Str(id) + "," + Str(rfid_cur) + "," + Str(udar) + ":" + Lookupstr(6 , Str_uart)
         Print #1 , Lookupstr(6 , Str_at) ; Len(str_send)
         Waitms 200
         Print #1 , Str_send                                'посылка  ответа серверу с текущеми id, rfid и флагом удара. start:id,34546774,1:start

      Case "e"                                              'создание соединения TCP
         Print #2 , Lookupstr(7 , Str_uart) ; Server_ip(1) ; "." ; Server_ip(2) ; "." ; Server_ip(3) ; "." ; Server_ip(4) ; ":" ; Server_port
         Led2 = 0
         Waitms 1000
         Print #1 , Lookupstr(7 , Str_at) ; Chr(34) ; Lookupstr(8 , Str_uart) ; Chr(34) ; "," ; Chr(34) ; Server_ip(1) ; "." ; Server_ip(2) ; "." ; Server_ip(3) ; "." ; Server_ip(4) ; Chr(34) ; "," ; Server_port ; Chr(13) ; Chr(10)
         Incr Tcp_inc
         Com_e = 0
      Case "f"
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
            If Tm_str = Lookupstr(9 , Str_uart) Then        '  "RFID_List_fixed_len_blabla:"
               Crc_sum = 0 : Crc = 0
               For I = 1 To 41
                  ' Сервер присылает контроллеру 40 RFID-карт, 41я это CRC (контрольная сумма), которая расчитывается следующим образом:
                  ' берутся последние 4 бита от каждой карты (десятичное число 0..15) и складываются
                  ' если расчитанная CRC равна присланной, то считаем, что посылка передана правильно!
                  Temp_long = 0 : Dff = Rfid_ar(i) : Shift Dff , Left , 24 : Temp_long = Dff
                  Dff = Rfid_ar(i) : Shift Dff , Left , 8 : Dff = Dff And &H00FF0000 : Temp_long = Temp_long Or Dff : Temp_long = Dff
                  Dff = Rfid_ar(i) : Shift Dff , Right , 8 : Dff = Dff And &H0000FF00 : Temp_long = Temp_long Or Dff
                  Dff = Rfid_ar(i) : Shift Dff , Right , 24 : Dff = Dff And &H000000FF : Temp_long = Temp_long Or Dff
                  If I < 41 Then
                     Rfid_ar(i) = Temp_long                 'заполнение массива карт
                     Dff = Temp_long And &B00001111
                     Crc_sum = Crc_sum + Dff
                  Else
                     Crc = Temp_long                        'вычисление CRC
                  End If
               Next
               Print #2 , "CRC=" ; Crc ; "  CRC_sum=" ; Crc_sum
               If Crc = Crc_sum Then                        'если CRC верна
                  For I = 1 To 40
                     Dff = Rfid_eep(i)
                     If Dff <> Rfid_ar(i) Then Exit For
                  Next
                  If I < 41 Then
                     For I = 1 To 40
                        Rfid_eep(i) = Rfid_ar(i)
                     Next
                     Print #2 , Lookupstr(10 , Str_uart)
                  Else
                     Print #2 , Lookupstr(11 , Str_uart)
                  End If
                  Tmp_send = Lookupstr(12 , Str_uart) + Str(rfid_cur)
                  Print #1 , Lookupstr(6 , Str_at) ; Len(tmp_send)       'Rfid_cur=   посылка серверу текущего RFIDa
                  Waitms 200
                  Print #1 , Tmp_send
               Else                                         'Если CRC не верна!
                  Print #2 , Lookupstr(37 , Str_uart)
               End If

            End If

            If Mid(tm_str , 1 , 6) = Lookupstr(13 , Str_uart) Then       'Смена точки доступа и пароля   "SetAP"
               Tm_str = Mid(tm_str , 7 , Cmaxchar)
               For I = 1 To 35
                  If Mid(tm_str , I , 1) = ":" Then Exit For
               Next
               Decr I
               Print #2 , "ap=" ; Mid(tm_str , 1 , I)
               I = I + 2
               Print #2 , "ps=" ; Mid(tm_str , I , 40)
            End If
            If Mid(tm_str , 1 , 6) = Lookupstr(14 , Str_uart) Then       'Смена ID устройства "SetID:"
               Id_tmp_s = Mid(tm_str , 7 , 3)
               Id_tmp_b = Val(id_tmp_s)
               If Id_tmp_b > 0 Then
                  Print #2 , Lookupstr(15 , Str_uart) ; Mid(tm_str , 7 , 3)
                  Id_eep = Id_tmp_b
                  Id = Id_tmp_b
               Else
                  Print #2 , Lookupstr(16 , Str_uart) ; Id_tmp_b
               End If

            End If
            If Mid(tm_str , 1 , 6) = Lookupstr(17 , Str_uart) Then
               Print #2 , Lookupstr(18 , Str_uart) ; Mid(tm_str , 7 , 20)
            End If
         End If
   End Select
End Sub                                                     'процедура обработки команд UART

Function Read_matrix() As Long                              'функция для чтения RFIDa и преобразования в Long
   Test = 0
   Lon = 0
   Increm = 0
   For Increm = 1 To 10                                     '10 опросов считываетля, и если хоть один без ошибки обрабатываем его
      1wreset
      If Err <> 1 Then Exit For
      Waitms 20
   Next
   If Increm < 11 Then                                      'если произошёл вылет из цикла, до его завершения, то получаем от считывателя RFID
      1wwrite &H33
      Print #2 , Lookupstr(19 , Str_uart);
      For Increm = 1 To 8                                   'получаем 8 байт из считываетля
         Test = 1wread()
         Print #2 , Hex(test) ; " ";
         If Increm > 4 Then                                 'сохраняем последние 4 байта RFIDa в 4 байтовую переменную Long
            Shift Lon , Left , 8                            'сдвигаем переменную Lon на 8 битов влево
            Lon = Lon Or Test                               'переносим в бладший байт считанное значение из Matrixa
         End If                                             'тем самым сдвиг влево происходит 4 раза по 8 бит и переменная Lon заполняется байтами
         Waitms 1
      Next
      Print #2 , "[" ; Lookupstr(20 , Str_uart);
      Print #2 , Lon ; "]" ;
   End If
   Read_matrix = Lon
End Function                                                'функция для чтения RFIDa и преобразования в Long

Sub Init_rfid()
   For I = 1 To 40
      Rfid_ar(i) = Rfid_eep(i)
   Next
End Sub