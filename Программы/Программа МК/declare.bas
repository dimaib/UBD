Declare Sub Setup_wifi()                                    'сброс и настройка WiFi модуля
Declare Sub Connect_ap(point As String * 30 , Pass As String * 30)       'подключение к точке доступа
Declare Sub Uart_com(command As String * 1)                 'функция обработки команды UART
Declare Function Read_matrix() As Long                      'функция для чтения RFIDa и преобразования в Long
Declare Sub Init_var()                                      'инициализация переменных для подключения к серверу и WIFI
Declare Sub Init_rfid()                                     'загрузка RFID карт из EEPROM
Declare Sub Printf(st As String * 100 , Newline As Byte , Msg_status As Byte)       'вывод системных сообщений
'где st-строка для вывода, msg_status-тип сообщения, который можно в последствии отключать или включать. Фильтрация вывода
'Newline-добавлять или нет символ новой строки в конце сообщения

Declare Function Start_lis(calib As Byte) As Byte           'Настраивает акселерометр перед работой и возвращает идентификатор устройства
Declare Sub I2c_wr(adrr As Byte , Bt As Byte)               'Запись одного байта в I2C
Declare Function I2c_rd(adrr As Byte) As Byte               'Чтение одного байта из I2C
Declare Function Osi(xyz As Byte) As Integer                'Обработка байта из регистра ускорений по осям. Определение нулевой точки и отклонения
Declare Sub Read_x_y_z()                                    'считывание данных по осям
Declare Sub Position_spase()                                'определение положения акселерометра в пространстве
Declare Sub Send_porog()                                    'посылка порогов удара в датчик удара
