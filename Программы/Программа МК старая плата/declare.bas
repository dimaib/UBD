Declare Sub Setup_wifi()                                    'сброс и настройка WiFi модуля
Declare Sub Connect_ap(point As String * 30 , Pass As String * 30)       'подключение к точке доступа
Declare Sub Uart_com(command As String * 1)                 'функция обработки команды UART
Declare Function Read_matrix() As Long                      'функция для чтения RFIDa и преобразования в Long
Declare Sub Init_var()                                      'инициализация переменных для подключения к серверу и WIFI
Declare Sub Init_rfid()                                     'загрузка RFID карт из EEPROM