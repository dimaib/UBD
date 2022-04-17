Dim Start_tmp As Byte
Start_tmp = 1
Led1 = 1

#if Plata = 2

   If Start_lis(start_tmp) = 0 Then                         'инициализаци€ акселерометра
      Do                                                    'если акселерометр не исправен, то зацикливаем программу на вывод сообщени€ об ошибке
         Print "Accel error"
      Loop
   Else
      Print "Accel OK"
   End If

   Call Position_spase()                                    'определение положени€ в пространстве
   Start_tmp = 0
   Start_tmp = Start_lis(start_tmp)                         'повторна€ инициализаци€ акселерометра
   Waitms 400

   Enable Timer2                                            'запус таймера дл€ измерени€ ускорений по ос€м

   Dim N_speed As Byte
   N_speed = 50
   Dim Cout_n As Byte
   Dim Arr_speed(50) As Long
   Dim Arr_i As Byte
   Dim Summ_speed As Long
#endif

Setup_wifi                                                  'сброс и настройка WiFi модул€
Init_rfid

Xyz_max = 0

For I = 1 To 40                                             'загрузка дампа RFID-карт из eeprom пам€ти контроллера
    Rfid_ar(i) = Rfid_eep(i)
Next                                                        'загрузка дампа RFID-карт из eeprom пам€ти контроллера

Do
   If Len(buf_uart) > 0 Then
      For I = 1 To Len(buf_uart)
         Stt = Mid(buf_uart , 1 , 1)
         Uart_com Stt
      Next
   End If
   If Tcp_inc > 0 Then                                      'счЄтчик ошибок TCP
      Incr Tcp_inc
            If Led3 = 1 And Tcp_inc = 6 Then
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
      End If
   End If
   If Ap_inc > 0 Then                                       'счЄтчик ошибок AP
      Incr Ap_inc
      If Ap_inc > Ap_tick Then
         Setup_wifi
         Ap_inc = 0
         Ap_con = 0
         Buf_uart = Buf_uart + "b"
      End If
   End If
   '(
   If Udar_pin = 0 And Udar = 0 And Ud_on = 1 Then          'событие удара
      Waitms 100
      If Udar_pin = 0 Then
         Udar = 1
         Udar = 0                                           'включить отключить удар
         If Ud_eep = 1 Then Udar_eep = 1                    'сохранение удара в EEPROM
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
   '   Toggle Led1                                           'мигание красного светодиода при ударе
   '   If Ig_ud_off = 1 Then Rel_ig = 0                      'отключение зажигани€ при ударе
   'Else
      Led1 = Connect
   'End If
   Incr Wd_tim
   If Wd_tim > Wdt_tick Then Setup_wifi                     'сброс WIFI модул€ при его молчании больше чем 60 секунд
   Rfid_print = ""
   Rfid_cur = Read_matrix()                                 'чтение RFIDa
                  'Toggle Rel_ig                             'дл€ проверки!
   Incr Del_off
   'If Udar = 1 Then Rel_tr = 1 Else Rel_tr = 0              'условие включени€ или выключени€ реле черепахи
   'If Rfid_cur > 0 And Rfid_cur = 0 Then                    'условие никогда не выполн€етс€!!!
   If Rfid_cur > 0 Then                                     'условие никогда не выполн€етс€!!!
      Led4 = 1
      Del_led4 = 0
      Amount_1 = Rfid_amount_user + Rfid_amout_master
      'Init_rfid                                             'считывание RFID-карт из EEPROM
      For I = 1 To Amount_1
         'if Rfid_ar(i)>0 then print #2, str(Rfid_cur) ;" "; str(Rfid_ar(i))
         'If Rfid_cur = Rfid_ar(i) Then Exit For             'поиск текущего RFIDa в масиве карт
         If Rfid_cur = Rfid_eep(i) Then Exit For            'поиск текущего RFIDa в масиве карт
      Next
      Del_off = 0
      Amount_1 = Rfid_amount_user + 1
      If I < Amount_1 And Udar = 0 Then                     'если RFID находитс€ в списке обычных карт
         Rfid_print = Rfid_print + Lookupstr(23 , Str_uart) 'User
         Led3 = 1
         Rel_ig = 1
         Del_off = 0
         Rfid_ct = Rfid_cur
         Rfid_del_ignition = 0
         Amount_1 = Rfid_amount_user + Rfid_amout_master
         Incr Amount_1
      Elseif I > Rfid_amount_user And I <= 110 Then         'если RFID находитс€ в списке мастер-карт
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