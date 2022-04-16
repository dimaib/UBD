'Конфигурация портов для Atmega128
Config Portd.4 = Output : Rst_wifi Alias Portd.4            'Пин рестарта WI-FI
Config Porta.3 = Output : Led1 Alias Porta.3                'светодиод 1 красный
Config Porta.4 = Output : Led2 Alias Porta.4                'светодиод 2 зелёный
Config Porta.5 = Output : Led3 Alias Porta.5                'светодиод 3 оранжевый
Config Porta.6 = Output : Led4 Alias Porta.6                'светодиод 4 синий
Config Portb.4 = Output : Rel_ig Alias Portb.4              'Включение зажигания
Config Portd.0 = Output : Rel_tr Alias Portd.0              'Включение черепахи
'config Portb.4 = Output : Rel_ig Alias Portd.0             'Включение зажигания наоборот
'Config Portd.0 = Output : Rel_tr Alias Portb.4             'Включение черепахи наоборот

Rst_wifi = 1

Config Pine.5 = Input : Set_but Alias Pine.0 : Porte.0 = 1  'Отладочная кнопка

Config 1wire = Porta.0                                      'Настройка 1Wire интерфейса для чтения RFID карты