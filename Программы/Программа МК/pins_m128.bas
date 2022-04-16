'Конфигурация портов для Atmega128
#if Plata = 2                                               'Новая плата
   'Open "comg.4:115200,8,n,1" For Output As #2              'настройка софтового UARTa для меги128

   Config Portd.7 = Output : Rst_wifi Alias Portd.7         'Пин рестарта WI-FI
   Config Portb.7 = Output : Led1 Alias Portb.7             'светодиод 1 красный
   Config Portd.1 = Output : Led2 Alias Portd.1             'светодиод 2 зелёный
   Config Portd.5 = Output : Led3 Alias Portd.5             'светодиод 3 оранжевый
   Config Portd.6 = Output : Led4 Alias Portd.6             'светодиод 4 синий

   Config Portb.4 = Output : Rel_ig Alias Portb.4           'Включение зажигания
   Config Portb.0 = Output : Rel_tr Alias Portb.0           'Включение черепахи
   'config Portb.4 = Output : Rel_ig Alias Portb.0             'Включение зажигания наоборот
   'Config Portd.0 = Output : Rel_tr Alias Portb.4             'Включение черепахи наоборот

   Config Pind.4 = Input : Portd.4 = 1 : Speed Alias Pind.4 'Пин измерения скорости

   Rst_wifi = 1
   'Настройка порта адреса устройства
      Config Pinc.0 = Input
      Config Pinc.1 = Input
      Config Pinc.2 = Input
      Config Pinc.3 = Input
      Config Pinc.4 = Input
      Config Pinc.5 = Input
      Config Pinc.6 = Input
      Config Pinc.7 = Input
      Portc = 255
   'Настройка порта адреса устройства

   Config Pinf.1 = Input : Portf.1 = 1 : Udar_pin Alias Pinf.1

   'настройка I2C
      Config Scl = Portg.3
      Config Sda = Portb.6
      Config I2cdelay = 10
      I2cinit
   'настройка I2C
   Config 1wire = Porta.0                                   'Настройка 1Wire интерфейса для чтения RFID карты
#elseif Plata = 1                                           'старая плата
   Config Portd.4 = Output : Rst_wifi Alias Portd.4         'Пин рестарта WI-FI
   Config Porta.3 = Output : Led1 Alias Porta.3             'светодиод 1 красный
   Config Porta.4 = Output : Led2 Alias Porta.4             'светодиод 2 зелёный
   Config Porta.5 = Output : Led3 Alias Porta.5             'светодиод 3 оранжевый
   Config Porta.6 = Output : Led4 Alias Porta.6             'светодиод 4 синий

   Config Portb.4 = Output : Rel_ig Alias Portb.4           'Включение зажигания
   Config Portb.0 = Output : Rel_tr Alias Portb.0           'Включение черепахи
   'Config Portb.4 = Output : Rel_ig Alias Portb.0           'Включение зажигания наоборот
   'Config Portd.0 = Output : Rel_tr Alias Portb.4           'Включение черепахи наоборот

   Config Pinf.1 = Input : Portf.1 = 1 : Udar_pin Alias Pinf.1
   'Config Pind.4 = Input : Portd.4 = 1 : Speed Alias Pind.4    'Пин измерения скорости
   Rst_wifi = 1
   Config 1wire = Porta.0                                   'Настройка 1Wire интерфейса для чтения RFID карты
#endif
'Конфигурация портов для Atmega128