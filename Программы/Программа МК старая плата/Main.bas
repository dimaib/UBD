Setup_wifi                                                  'сброс и настройка WiFi модуля
Init_rfid

Xyz_max = 0
Enable Timer1

For I = 1 To 40                                             'загрузка дампа RFID-карт из eeprom памяти контроллера
    Rfid_ar(i) = Rfid_eep(i)
Next                                                        'загрузка дампа RFID-карт из eeprom памяти контроллера

Do
   If Len(buf_uart) > 0 Then
      For I = 1 To Len(buf_uart)
         Stt = Mid(buf_uart , 1 , 1)
         Uart_com Stt
      Next
   End If
   If Tcp_inc > 0 Then                                      'счётчик ошибок TCP
      Incr Tcp_inc
            If Led3 = 1 And Tcp_inc = 6 Then
               'Tmp_send = Lookupstr(12 , Str_uart) + Str(rfid_cur) + ":" + Str(udar)
               Tmp_send = Lookupstr(12 , Str_uart) + Str(rfid_ct) + ":" + Str(udar)
               Print #1 , Lookupstr(6 , Str_at) ; Len(tmp_send)       'Rfid_cur=   посылка серверу текущего RFIDa
               Waitms 100
               Print #1 , Tmp_send
               Waitms 30
               Print #1 , "+++"
            End If
      If Tcp_inc > Tcp_tick Then
         Tcp_inc = 0
         Tcp_con = 0
         If Ap_con = 1 Then Buf_uart = Buf_uart + "e"
         ''Print #2 , "tcp_inc=" ; Tcp_inc ; " tcp_con=" ; Tcp_con ; " ap_inc=" ; Ap_inc ; " ap_con=" ; Ap_con
      End If
   End If
   'Print #2 , "Ap_inc=" ; Ap_inc ; " Tcp_inc=" ; Tcp_inc ; " Wd_tim=" ; Wd_tim
   If Ap_inc > 0 Then                                       'счётчик ошибок AP
      Incr Ap_inc
      If Ap_inc > Ap_tick Then
         Setup_wifi
         Ap_inc = 0
         Ap_con = 0
         Buf_uart = Buf_uart + "b"
         ''Print #2 , "tcp_inc=" ; Tcp_inc ; " tcp_con=" ; Tcp_con ; " ap_inc=" ; Ap_inc ; " ap_con=" ; Ap_con
      End If
   End If
   '(
   If Set_but = 0 Then                                      'нажатие на системную кнопку
      Waitms 100
      If Set_but = 0 Then
         Udar_porog = Getadc(0)
         Do
            Toggle Led4
            Waitms 300
         Loop Until Set_but = 1
         Led4 = 0
         Porog_eep = Udar_porog
         Xyz_max = 0

         Print #2 , Lookupstr(21 , Str_uart) ; Udar_porog   'Новый порог удара
         Print #2 , "#" ; Id
      End If
   End If
')
   If Z < 5 And Udar = 0 And Ud_on = 1 Then                 'событие удара
      Waitms 100
      If Z < 5 Then
         Udar = 1
         'Udar = 0                                           'включить отключить удар
         If Ud_eep = 1 Then Udar_eep = 1                    'сохранение удара в EEPROM

         Incr Udar_n
         'Print #2 , Lookupstr(22 , Str_uart) ; Xyz_max ; "/" ; Udar_porog
         Print Lookupstr(22 , Str_uart) ; Xyz_max ; "/" ; Udar_porog
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

   If Udar = 1 And Ud_on = 1 Then
      Toggle Led1                                           'мигание красного светодиода при ударе
      If Ig_ud_off = 1 Then Rel_ig = 0                      'отключение зажигания при ударе
   Else
      Led1 = Connect
   End If
   'Print #2 , "RFID_CT=" ; Rfid_ct
   Incr Wd_tim
   If Wd_tim > Wdt_tick Then Setup_wifi                     'сброс WIFI модуля при его молчании больше чем 60 секунд
   Rfid_print = ""
   Rfid_cur = Read_matrix()                                 'чтение RFIDa
                  'Toggle Rel_ig                             'для проверки!
   Incr Del_off
   'If Udar = 1 Then Rel_tr = 1 Else Rel_tr = 0              'условие включения или выключения реле черепахи
   'If Rfid_cur > 0 And Rfid_cur = 0 Then                    'условие никогда не выполняется!!!
   If Rfid_cur > 0 Then                                     'условие никогда не выполняется!!!
      Led4 = 1
      Del_led4 = 0
      Init_rfid                                             'считывание RFID-карт из EEPROM
      'print #2,"=====>";
      For I = 1 To 40
         'if Rfid_ar(i)>0 then print #2, str(Rfid_cur) ;" "; str(Rfid_ar(i))
         If Rfid_cur = Rfid_ar(i) Then Exit For             'поиск текущего RFIDa в масиве карт
      Next
      Del_off = 0
      If I < 35 And Udar = 0 Then                           'если RFID находится в списке обычных карт
         Rfid_print = Rfid_print + Lookupstr(23 , Str_uart) 'User
         Led3 = 1
         Rel_ig = 1
         Del_off = 0
         Rfid_ct = Rfid_cur
         Rfid_del_ignition = 0
      Elseif I > 34 And I < 41 Then                         'если RFID находится в списке мастер-карт
         Rfid_print = Rfid_print + Lookupstr(24 , Str_uart) 'Master
         Toggle Led3
         Rel_ig = 1
         Del_off = 0
         Xyz_max = 0
         Udar = 0
         If Ud_eep = 1 Then Udar_eep = 0                    'сброс удара в eeprom
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
      If Rfid_delay > 7 Then                                'задержка на вывод текущего RFIDa
         Rfid_delay = 0
         'Print #2 , Rfid_print ; " " ; Xyz_max ; " Connect=" ; Connect
         Print Rfid_print ; " " ; Xyz_max ; " Connect=" ; Connect
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