'объявление переменных в EEPROM
Dim Id_eep As Eram Byte                                     'ID борта
Dim Ip_eep(4) As Eram Byte                                  'IP сервера
Dim Port_eep As Eram Word                                   'Порт сервера
Dim Ssid_eep As Eram String * 30                            'Имя точки доступа (SSID)
Dim Pass_eep As Eram String * 30                            'Пароль для точки доступа
Dim Porog_eep As Eram Word                                  'порог срабатывания удара
Dim Settings_eep(7) As Eram Byte                            'Дополнительные настройки
Dim Rfid_eep(40) As Eram Long                               'RFID карты операторов
Dim Rfid_mast_eep(5) As Eram Long                           'RFID мастер-карты
Dim Udar_eep As Eram Byte                                   'Сохранение удара в EEPROM'e
'объявление переменных в EEPROM

Const Cmaxchar = 400                                        'размер буфера приёма
Const Del_ignition = 200                                    'константа задержки выключения зажигания после удаления карты
Const Nit = 10                                              'делитель при измерении показаний акселерометра

'Настройка удара
   Dim Ig_ud_off As Bit : Ig_ud_off = 0                     'если 0 - зажигание при ударе не отключается, если 1 - зажигание при ударе отключается
   Dim Ud_eep As Bit : Ud_eep = 0                           'если 0 - не сохранять удар в eeprom, если 1 - сохранять удар в eeprom
   Dim Ud_on As Bit : Ud_on = 0                             'если 0 - удар отключен, если 1 - удар включен
'Настройка удара


Dim Bc As Word , Buf As String * Cmaxchar , D As Byte       'переменные для UARTa
Dim Stt As String * 2
Dim Buf_copy As String * Cmaxchar                           'копирование буфера для дальнейшеой обработки принятых данных от WIFI модуля
Bc = 0
Dim Rfid_ar(41) As Long                                     'массив RFID-карт
Dim Rfid_cur As Long                                        'текущий считанный RFID
Dim I As Integer , I_uart As Byte                           'инкременты
Dim Wd_tim As Long                                          'счётчик для отслеживания зависания WIFI модуля '3 тика примерно равно 1 секунде
Dim Tcp_inc As Byte , Tcp_con As Bit                        'счётчик задержки подключения к серверу
Dim Ap_inc As Byte , Ap_con As Bit                          'счётчик задержки подключения к точке доступа
Dim Id As Byte                                              'ID борта
Dim Ap_name As String * 30                                  'имя точки доступа
Dim Pass_ap As String * 30                                  'пароль точки доступа
Dim Server_ip(4) As Byte                                    'адрес сервера
Dim Server_port As Word                                     'порт сервера
Dim Buf_uart As String * 100                                'буфер приёма команд по UART
Dim Rf_shift As Byte , Rf_it As Byte
Dim Temp_long As Long
Dim Max_buf As Bit                                          'переменная для отброса первой большой строки ответа после сброса WiFi
Dim Str_send As String * 30                                 'строка для посылки серверу
Dim Com_a As Bit , Com_b As Bit , Com_c As Bit , Com_d As Bit , Com_e As Bit , Com_f As Bit       'взведение данных флагов не даёт командам в буфере дублироваться
Dim Id_tmp_s As String * 5 , Id_tmp_b As Byte , Tmp_send As String * 30       'переменные для функции
Dim Tm_str As String * Cmaxchar
Dim Tm_char As String * 1
Dim Tm1(2) As Byte
Dim Connect As Bit                                          'флаг для определения статуса подключения к WiFi точке доступа
Dim Del_led4 As Integer


Dim Rfid_delay As Byte                                      'задержка на вывод активного RFIDa
Dim Rfid_print As String * 70

Dim Dff As Long
Dim Increm As Byte , Lon As Long , Test As Byte
Dim Del_off As Integer                                      'задержка выключения зажигания
Dim Z As Word                                               'переменные для вычисления удара
Dim Udar_porog As Word                                      'порог для удара
Dim Xyz_max As Word
Dim Udar As Bit                                             'флаг удара
Dim Udar_n As Word
Dim Crc As Long , Crc_sum As Long                           'для вычисления CRC суммы
Dim Rfid_ct As Long
Dim Rfid_tt As Long
Dim Rf_tmp1(40) As Long
Dim Rf_tmp2(40) As Long
Dim Rf_tmp3(40) As Long
Dim Ap_tick As Byte                                         'кол-во циклов для сброса Wi-Fi модуля при его молчании при подключении к нему
Dim Tcp_tick As Byte                                        'кол-во циклов для переподключения к серверу
Dim Wdt_tick As Byte                                        'кол-во циклов для сброса Wi-Fi модуля при его молчании

Dim Rfid_del_ignition As Byte                               'задержка на выключение зажигания при замене карты
Rfid_del_ignition = 0

Ap_tick = 40
Tcp_tick = 15
Wdt_tick = 200

Dim Wifi As Byte                                            'точка доступа и пароль
Dim Ip_s As Byte                                            'IP сервера

Wifi = 1

If Wifi = 1 Then                                            'мэйджер
   Ssid_eep = "MJR-Sklad"
   Pass_eep = "DabuDaDe"
   Server_ip(1) = 10 : Server_ip(2) = 11 : Server_ip(3) = 22 : Server_ip(4) = 50
Elseif Wifi = 2 Then                                        'оффис
   Ssid_eep = "NETGEAR"
   Pass_eep = "111222333444"
   Server_ip(1) = 192 : Server_ip(2) = 168 : Server_ip(3) = 0 : Server_ip(4) = 74
Elseif Wifi = 3 Then                                        'оффис
   Ssid_eep = "kslift"
   Pass_eep = "A0C4B096D4"
   Server_ip(1) = 192 : Server_ip(2) = 168 : Server_ip(3) = 0 : Server_ip(4) = 37
Elseif Wifi = 4 Then                                        'дом
   Ssid_eep = "dimaib"
   Pass_eep = "230988DVG"
   Server_ip(1) = 192 : Server_ip(2) = 168 : Server_ip(3) = 0 : Server_ip(4) = 37
End If

Ap_name = Ssid_eep
Pass_ap = Pass_eep
Ip_eep(1) = Server_ip(1) : Ip_eep(2) = Server_ip(2) : : Ip_eep(3) = Server_ip(3) : : Ip_eep(4) = Server_ip(4)



'Ap_name = "kslift"
'Pass_ap = "A0C4B096D4"
'Ssid_eep = Ap_name
'Pass_eep = Pass_ap

'Ap_name = "NETGEAR"
'Pass_ap = "111222333444"



'Server_ip(1) = 10 : Server_ip(2) = 11 : Server_ip(3) = 22 : Server_ip(4) = 50
'Ip_eep(1) = 192 : Ip_eep(2) = 168 : Ip_eep(3) = 0 : Ip_eep(4) = 63

Port_eep = 3333
Server_port = Port_eep
Buf_uart = ""

If Ud_eep = 1 And Ud_on = 1 Then                            'выгрузка из EEPROM значения удара через стороннюю переменную
   Id = Udar_eep
   Udar = Id
Else
   Udar = 0
End If


Id = 18
Id_eep = Id
Wd_tim = 0
Rf_it = 1