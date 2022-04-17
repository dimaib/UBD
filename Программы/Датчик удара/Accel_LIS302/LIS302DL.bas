$regfile = "m8def.dat"
$crystal = 8000000
$baud = 9600

'Фьюзы E4 D9

'настройка входов\выходов
   Config Portb.1 = Output : Led Alias Portb.1
   Config Portd.2 = Output : Rel Alias Portd.2
'настройка входов\выходов

'настройка I2C для акселлерометра
   Config Scl = Portc.4
   Config Sda = Portc.5
   Config I2cdelay = 10
   I2cinit
'настройка I2C для акселлерометра

Open "comb.4:9600,8,n,1" For Output As #1                   'настройка софтового UARTa для меги8
Config Com1 = 9600 , Synchrone = 0 , Parity = None , Stopbits = 1 , Databits = 8 , Clockpol = 0
Open "com1:" For Binary As #2

Dim Cfg As Byte                                             'байт для записи его в I2C, при настройке акселерометра
Dim Xyz_flag As Byte                                        'для проверки работоспособности акселерометра
Dim X As Byte , Y As Byte , Z As Byte                       'для чтения из акселерометра
Dim Xp As Integer , Yp As Integer , Zp As Integer           'для обработки

Dim X_long As Long                                          'среднее значение X из четырёх измерений
Dim Aver_x As Single , Round_aver_x As Byte                 'среднеезначение X
Dim Y_long As Long                                          'среднее значение Y из четырёх измерений
Dim Aver_y As Single , Round_aver_y As Byte                 'среднеезначение Y
Dim Z_long As Long                                          'среднее значение Z из четырёх измерений
Dim Aver_z As Single , Round_aver_z As Byte                 'среднеезначение Z
Dim I As Byte                                               'переменная инкремент для for

Dim X_eep As Byte
Dim Z_eep As Single
Dim Z_eep_int As Byte
Dim Porog_z_eep As Eram Byte                                'переменные порогов в eeprome
Dim Porog_x_eep As Eram Byte                                'переменные порогов в eeprome

Dim Tmp_sing_x As Single
Dim Tmp_sing_y As Single

'поправочный коэф. для условия удара
Const K1 = 154                                              'константа для расчёта поправочного коэф. скорости
Const K2 = 10                                               'константа для расчёта поправочного коэф. скорости
Dim K_tmp As Word                                           'переменная...
'поправочный коэф. для условия удара


'Переменные и константы для расчёта скорости
Const Sp_aver = 30                                          'константа кол-во измерений при усреднении
Const Speed_max = 3000                                      'константа максимального показателя скорости
Const Speed_min = 150                                       'константа минимального показателя скорости
Dim Puls_cout As Long                                       'счётчик импульсов
Dim Freq_cur As Long                                        'текущая частота
Dim Speed_num As Byte                                       'переменная для подсчёта кол-ва измерений
Dim Speed_udar As Long                                      'скорость в момент удара
Dim Speed_del As Long                                       'разность между текущей скоростью и скоростью в момент удара
Dim Speed_pesent As Long                                    'процент на который изменился показатель скорости при ударе

Dim Puls_timer2 As Byte                                     'счётчик срабатывания timer2
'Переменные и константы для расчёта скорости

'Переменные для UARTa
   Const Cmaxchar = 50                                      'размер буфера приёма
   Dim Bc As Word , D As Byte : Bc = 1                      'переменные для UARTa
   Dim Bt(5) As Byte                                        'буфер принятой строки
   Dim Integ As Byte : Dim Int_eep As Integer
   Dim Crc_udar As Byte                                     'вычисление контролькой суммы
'Переменные для UARTa

'Конфигурирование таймера обработки скорости
   On Capture1 T1                                           'прерывание для таймера 1 (16 битный)
   Config Timer1 = Timer , Prescale = 1024 , Capture Edge = Rising       'настройка таймера 1, для измерения, кол-ва импульсов
   Enable Capture1
   On Timer2 T2                                             'прерывание для таймера 2 (8 битный)
   Config Timer2 = Timer , Prescale = 1024                  'настройка таймера 2, для отсчёта временного интервала
   Enable Timer1 : Enable Timer2                            'запуск таймеров 1 и 2
   Config Pinb.0 = Input : Portb.0 = 1
'Конфигурирование таймера обработки скорости

'Настройка прерывания по UARTу
   On Urxc Rec_isr                                          'подпрограмма для прерывания на приём UART
'Настройка прерывания по UARTу

Declare Function Start_lis(calib As Byte) As Byte           'Настраивает акселерометр перед работой и возвращает идентификатор устройства
Declare Sub I2c_wr(adrr As Byte , Bt As Byte)               'Запись одного байта в I2C
Declare Function I2c_rd(adrr As Byte) As Byte               'Чтение одного байта из I2C
Declare Function Osi(xyz As Byte) As Integer                'Обработка байта из регистра ускорений по осям. Определение нулевой точки и отклонения
Declare Sub Read_x_y_z()                                    'считывание данных по осям
Declare Sub Position_spase()                                'определение положения акселерометра в пространстве
Declare Function Average_x() As Single                      'подсчёт среднего значения X по 4 последним показаниям
Declare Function Average_y() As Single                      'подсчёт среднего значения Y по 4 последним показаниям
Declare Function Average_z() As Single                      'подсчёт среднего значения Z по 4 последним показаниям
'Константы и переменные для настройки акселерометра
   'константы адресов регистров настроек акселерометра
      Dim Who_am_i As Byte : Who_am_i = &H0F                'идентификатор акселерометра
      Dim Ctrl_reg_1 As Byte : Ctrl_reg_1 = &H20            'регистр конфигурации 1
      Dim Ctrl_reg_2 As Byte : Ctrl_reg_2 = &H21            'регистр конфигурации 2
      Dim Ctrl_reg_3 As Byte : Ctrl_reg_3 = &H22            'регистр конфигурации 3
      Dim Status_reg As Byte : Status_reg = &H27            'регистрор флагов событий
      Dim Ff_wu_cfg_1 As Byte : Ff_wu_cfg_1 = &H30          'Регистр условий прерывания для FF_WU_1
      Dim Ff_wu_cfg_2 As Byte : Ff_wu_cfg_2 = &H34          'Регистр условий прерывания для FF_WU_2
      Dim Ff_wu_src_1 As Byte : Ff_wu_src_1 = &H31          'Флаговый регистр прерываний для FF_WU_1
      Dim Ff_wu_src_2 As Byte : Ff_wu_src_2 = &H35          'Флаговый регистр прерываний для FF_WU_2
      Dim Ff_wu_ths_1 As Byte : Ff_wu_ths_1 = &H32          'Регистр порогового значения для FF_WU_1
      Dim Ff_wu_ths_2 As Byte : Ff_wu_ths_2 = &H36          'Регистр порогового значения для FF_WU_2
      Dim Ff_wu_duration_1 As Byte : Ff_wu_duration_1 = &H33       'Регистр максимального продолжения события для FF_WU_1
      Dim Ff_wu_duration_2 As Byte : Ff_wu_duration_2 = &H37       'Регистр максимального продолжения события для FF_WU_2
      Dim Xout As Byte : Xout = &H29                        'Регистр выхода значения по X
      Dim Yout As Byte : Yout = &H2B                        'Регистр выхода значения по Y
      Dim Zout As Byte : Zout = &H2D                        'Регистр выхода значения по Z
   'константы адресов регистров настроек акселерометра

   'константы параметров для настройки акселерометра
      Const Dr = 0                                          'частота выборки 1=400Гц, 0=100Гц
      Const Pd = 1                                          'бит управления питанием акселерометра
      Const Fs = 1                                          'выбор диапазона питания 1=8g, 0=2g
      Const Stp = 1                                         'самодиагностика stp\stm:
      Const Stm = 0                                         '0\0-выключена, 0\1-режим Р, 1\0 режим М
      Const Zen = 1                                         'бит разрешения тактирования оси Z
      Const Yen = 1                                         'бит разрешения тактирования оси Y
      Const Xen = 1                                         'бит разрешения тактирования оси X
      Const Fds = 1                                         'бит фильтра гравитации 0=реагирует на гравитацию, 1=не реагирует на гравитацию
      Const Hp_ff_wu1 = 1                                   'бит вкл\выкл фильтр верхних частот для генератора прерываний FF_WU1
      Const Hp_ff_wu2 = 1                                   'бит вкл\выкл фильтр верхних частот для генератора прерываний FF_WU2
      Const Hp_coef1 = 0                                    'частота среза фильтра верхних частот DR=0\1  coef1\coef2
      Const Hp_coef2 = 1                                    '0\0=2\8Гц, 1\0=1\4Гц, 0\1=0.5\2Гц, 1\1=0.25\1Гц
      Const Ihl = 0                                         '0=при срабатывании прерывания INT устанавливается в единицу и наоборот
      Const Pp_od = 0                                       'тип выводов. 0=push-pull, 1=открытый коллектор
      Const I1cfg = &B00000001                              'Источник прерывания INT1 и INT2. 000-прерывание выключено, 001-FF_WU_1, 010-FF_WU_2
      Const I2cfg = &B00001000                              '011-FF_WU_1|FF_WU_2, 100-Данные готовы, 111-прерывание от клика
      Const Aoi = 0                                         '0=прерывание происходит при любом из событий, 1=при возникновении всех событий
      Const Lir = 1                                         '1=при чтении регистра FF_WU_SRC_1\2, его дынные обнулятся и наоборот
      Const Xhie = 1                                        '1=событие по превышению порогового значения по оси X, 0=событие отключено
      Const Yhie = 1                                        '1=событие по превышению порогового значения по оси Y, 0=событие отключено
      Const Zhie = 1                                        '1=событие по превышению порогового значения по оси Z, 0=событие отключено
      Const Xlie = 0                                        '1=событие по понижению порогового значения по оси X, 0=событие отключено
      Const Ylie = 0                                        '1=событие по понижению порогового значения по оси Y, 0=событие отключено
      Const Zlie = 0                                        '1=событие по понижению порогового значения по оси Z, 0=событие отключено
      Const Dcrm = 0                                        '0=счётчик сбрасывается, 1=счётчик декриментируется
      Const Ths = 127                                       'пороговое значение по осям. Максимум 127
      Const Ff_wu_duration = 255                            'минимальная продолжительность события. Если частота 100Гц, то 0..2.55с, если
      Const R_lis = &H3B                                    'константа чтения из I2C
      Const W_lis = &H3A                                    'константа записи в I2C
   'константы параметров для настройки акселерометра
'Константы и переменные для настройки акселерометра

'константы вспомогательные
   Const Zero = 0                                           'константа нулевого значения
   'Const Zero = 128
'константы вспомогательные

Dim Start_tmp As Byte                                       'переменная для тестирования положения датчика в пространстве
Start_tmp = 1

If Start_lis(start_tmp) = 0 Then
   Do
      Toggle Led
      Print #1 , "Accel error"
      'Print "Accel error"
      Waitms 100
   Loop
Else
   Print #1 , "Accel OK"
   'Print "Accel OK"
End If

If Porog_x_eep = 1 Then Porog_x_eep = 150
If Porog_z_eep < 100 Then Porog_z_eep = 2000
Integ = Porog_z_eep : Bt(1) = Porog_x_eep
'Print #1 , "Porog X=" ; Bt(1) ; " Z=" ; Integ
Integ = 0 : Bt(1) = 0

Call Position_spase()                                       'определение положения в пространстве
Start_tmp = 0
Start_tmp = Start_lis(start_tmp)                            'повторная инициализация акселерометра

Const Bort_type = 2

#if Bort_type = 1                                           'электротележка jung ere-120 / поводковый jung ejc-212
   Porog = 60 : T_pic = 400
#elseif Bort_type = 2                                       'ричтрак jung etv-320
   Porog_x_eep = 30 : Porog_z_eep = 10
#elseif Bort_type = 3                                       'электропогрузчик jung efg-115
   Porog_x_eep = 7 : Porog_z_eep = 5
#elseif Bort_type = 4                                       'орд. пикер jung eks-312

#elseif Bort_type = 5                                       'электропогрузчик jung efg-220

#endif

Const Delay_led = 300                                       'задержка удержания удара. Время в мс, сколько будет активен выход удара
Enable Urxc
Enable Interrupts                                           'разрешение прерывания UART



Do
   'Dim Sstt As String * 20
   'If Summ_speed > 30000 Then Summ_speed = 0
   Call Read_x_y_z
   Xp = Abs(xp) : Yp = Abs(yp) : Zp = Abs(zp)               'показания акселерометра берутся по модулю
   If Xp = 0 Then Xp = 1                                    'показания от акселерометра не будут меньше единицы. Для предотвращения деления на ноль
   If Yp = 0 Then Yp = 1                                    'показания от акселерометра не будут меньше единицы. Для предотвращения деления на ноль
   If Zp = 0 Then Zp = 1                                    'показания от акселерометра не будут меньше единицы. Для предотвращения деления на ноль

   Shift X_long , Left , 8 : X_long = X_long Or Xp          '4 бйта предыдущих показаний оси X, для подсчёта среднего
   Aver_x = Average_x() : Round_aver_x = Round(aver_x)      'вычисление среднего и округление до целого
   Shift Y_long , Left , 8 : Y_long = Y_long Or Yp          '4 бйта предыдущих показаний оси Y, для подсчёта среднего
   Aver_y = Average_y() : Round_aver_y = Round(aver_y)      'вычисление среднего и округление до целого

   Shift Z_long , Left , 8 : Z_long = Z_long Or Zp          '4 бйта предыдущих показаний оси Z, для подсчёта среднего
   Aver_z = Average_z() : Round_aver_z = Round(aver_z)      'вычисление среднего и округление до целого

   'Stop Timer1 : Stop Timer2
   'Print #1 , Round_aver_x ; "  " ; Round_aver_y ; "  " ; Round_aver_z ; " " ; Freq_cur
   Print #1 , Xp ; "  " ; Yp ; "  " ; Zp ; " " ; Freq_cur
   'Waitms 10
   'Start Timer1 : Start Timer2
   X_eep = Porog_x_eep                                      'загрузка порога по XY из EEPROMa
   'Print #1 , "->" ; Round_aver_x ; " " ; Round_aver_x ; " " ; X_eep ; " " ; Speed_udar
   'If Round_aver_x >= X_eep Or Round_aver_y >= X_eep And Speed_udar = 0 Then
   If Xp >= X_eep Or Yp >= X_eep And Speed_udar = 0 Then
      Z_eep_int = Porog_z_eep
      Z_eep = Z_eep_int / 10

      'Tmp_sing_x = Round_aver_x / Round_aver_z
      'Tmp_sing_y = Round_aver_y / Round_aver_z

      Tmp_sing_x = Xp / Zp
      Tmp_sing_y = Yp / Zp
      If Tmp_sing_x >= Z_eep Or Tmp_sing_x >= Z_eep Then
         If Freq_cur <= 100 Then
           Rel = 1
           Print #1 , "Udar!"
           For I = 1 To 10
            Toggle Led
            Waitms Delay_led
           Next
           Led = 0
           'Waitms Delay_led
           Rel = 0
         Else
           Speed_udar = Freq_cur
           Incr Speed_num
         End If
      End If
   End If
   'If Speed_udar > 0 Then Incr Speed_num
   If Speed_num >= 7 Then                                   'если после удара произошло 5 измерений скорости
      Speed_num = 0                                         'закончить измерение скоростей
      Speed_del = Speed_udar - Freq_cur                     'разница между текущей скоростью и скоростью в момент удара
      Speed_del = Abs(speed_del)                            'разница по модулю
      'Speed_pesent = Speed_del * 100 : Speed_pesent = Speed_pesent / Speed_udar       'перевод разницы скоростей в процент
      If Freq_cur = 0 Then Freq_cur = 1
      Tmp_sing_x = Speed_del / Freq_cur
      If Tmp_sing_x >= 0.3 Then                             'если текущая скорость изменилась на 50% по отношению к скорости в момент удара
        Rel = 1
        Print #1 , "Udar!"
         For I = 1 To 10
            Toggle Led
            Waitms Delay_led
        Next
        Rel = 0
      End If
      Speed_udar = 0
   End If
'(
         Sstt = Str(xp) : Print #1 , "[" ; Format(sstt , "   ") ; " " ;
         Sstt = Str(yp) : Print #1 , Format(sstt , "   ") ; "] " ;
         Sstt = Str(summ_x) : Print #1 , Format(sstt , "       ") ; " " ;
         Sstt = Str(summ_y) : Print #1 , Format(sstt , "       ")
')
   Waitms 20
Loop

Function Average_x() As Single                              'вычисление среднего значения X
   Dim Xlon_tmp As Long : Xlon_tmp = X_long                 'переменная для временного копирования X_long
   Dim Xx As Byte : Xx = Xlon_tmp And 255                   'переменная для извлечения байта из X_long
   Average_x = Xx
   Shift Xlon_tmp , Right , 8 : Average_x = Average_x + Xx  'первый байт
   Shift Xlon_tmp , Right , 8 : Average_x = Average_x + Xx  'второй байт
   Shift Xlon_tmp , Right , 8 : Average_x = Average_x + Xx  'третий байт
   Average_x = Average_x / 4
   'x_eep = Porog_x_eep : Average_z = Average_z * Z_eep      'домножение Z на присланный коэф-т
End Function

Function Average_y() As Single                              'вычисление среднего значения Y
   Dim Ylon_tmp As Long : Ylon_tmp = Y_long                 'переменная для временного копирования Y_long
   Dim Yy As Byte : Yy = Ylon_tmp And 255                   'переменная для извлечения байта из Y_long
   Average_y = Yy
   Shift Ylon_tmp , Right , 8 : Average_y = Average_y + Yy  'первый байт
   Shift Ylon_tmp , Right , 8 : Average_y = Average_y + Yy  'второй байт
   Shift Ylon_tmp , Right , 8 : Average_y = Average_y + Yy  'третий байт
   Average_y = Average_y / 4
   'Z_eep = Porog_z_eep : Average_z = Average_z * Z_eep      'домножение Z на присланный коэф-т
End Function

Function Average_z() As Single                              'вычисление среднего значения X
   Dim Zlon_tmp As Long : Zlon_tmp = Z_long                 'переменная для временного копирования Z_long
   Dim Zz As Byte : Zz = Zlon_tmp And 255                   'переменная для извлечения байта из Z_long
   Average_z = Zz
   Shift Zlon_tmp , Right , 8 : Average_z = Average_z + Zz  'первый байт
   Shift Zlon_tmp , Right , 8 : Average_z = Average_z + Zz  'второй байт
   Shift Zlon_tmp , Right , 8 : Average_z = Average_z + Zz  'третий байт
   Average_z = Average_z / 4
   Z_eep_int = Porog_z_eep : Z_eep = Z_eep_int / 100 : Average_z = Average_z * Z_eep       'домножение Z на присланный коэф-т
End Function

T2:
   Incr Puls_timer2
   If Puls_timer2 > 5 Then                                  '25
      Stop Timer1 : Stop Timer2
      'Print #1 , Puls_cout
      If Puls_cout = 0 Then Puls_cout = 1
      Freq_cur = Puls_cout
      If Speed_num > 0 Then Incr Speed_num                  'если произошёл удар, то начинаем считать измерения скорости
      Puls_cout = 0 : Puls_timer2 = 0
      Timer1 = 0 : Timer2 = 0
      Start Timer1 : Start Timer2
   End If
Return

T1:                                                         'прерывание таймера для подсчёта импульсов
   Toggle Led
   Incr Puls_cout
Return

Sub Read_x_y_z()                                            'чтение значений осей и обработка их
   X = I2c_rd(xout) : Y = I2c_rd(yout) : Z = I2c_rd(zout)   'чтение значений по осям
   Xp = Osi(x) : Yp = Osi(y) : Zp = Osi(z)                  'преобразование считанного байта в корректное значение
   'Xl = Xp ^ 2 : Yl = Yp ^ 2 : Zl = Zp ^ 2 : Summ = Xl + Yl : Summ = Summ + Zl : Summ = Sqr(summ)       'вычисление геометрической суммы
   Xp = Abs(xp) : Yp = Abs(yp) : Zp = Abs(zp)
   If Xp > 5 Or Yp > 5 Or Zp > 5 Then Led = 1 Else Led = 0
End Sub

Function Osi(xyz As Byte) As Integer                        'преобразование считанного байта в корректное значение
      If Xyz.7 = 1 Then
         Xyz = &HFF Xor Xyz : Incr Xyz : Osi = Zero - Xyz
      Else
         Osi = Zero + Xyz
      End If
End Function

Function Start_lis(calib As Byte) As Byte                   'настройка начальных параметров акселерометра
   Cfg = &B01011100                                         'сброс настроек

   Call I2c_wr(ctrl_reg_2 , Cfg)
   Xyz_flag = I2c_rd(ff_wu_src_1) : Xyz_flag = I2c_rd(ff_wu_src_2)       'сброс регистров прерываний

   Cfg = 0 : Cfg.7 = Dr : Cfg.6 = Pd : Cfg.5 = Fs : Cfg.4 = Stp : Cfg.3 = Stm : Cfg.2 = Zen : Cfg.1 = Yen : Cfg.0 = Xen
   Call I2c_wr(ctrl_reg_1 , Cfg)

   Cfg = 0 : Cfg.7 = 0 : Cfg.6 = 0 : Cfg.5 = 0 : Cfg.4 = Fds : Cfg.3 = Hp_ff_wu2 : Cfg.2 = Hp_ff_wu1 : Cfg.1 = Hp_coef2 : Cfg.0 = Hp_coef1
   If Calib = 1 Then Cfg.4 = 0 Else Cfg.4 = Fds
   Call I2c_wr(ctrl_reg_2 , Cfg)

   Cfg = 0 : Cfg.7 = Ihl : Cfg.6 = Pp_od : Cfg = Cfg Or I2cfg : Cfg = Cfg Or I1cfg
   Call I2c_wr(ctrl_reg_3 , Cfg)

   Cfg = 0 : Cfg.7 = Aoi : Cfg.6 = Lir : Cfg.5 = Zhie : Cfg.4 = Zlie : Cfg.3 = Yhie : Cfg.2 = Ylie : Cfg.1 = Xhie : Cfg.0 = Xlie
   Call I2c_wr(ff_wu_cfg_1 , Cfg) : Call I2c_wr(ff_wu_cfg_2 , Cfg)

   Cfg = 0 : Cfg.7 = Dcrm : Cfg = Cfg Or Ths
   Call I2c_wr(ff_wu_ths_1 , Cfg) : Call I2c_wr(ff_wu_ths_2 , Cfg)

   Cfg = Ff_wu_duration
   Call I2c_wr(ff_wu_duration_1 , Cfg) : Call I2c_wr(ff_wu_duration_2 , Cfg)

   Cfg = I2c_rd(who_am_i)
   If Cfg = &H3B Then Start_lis = 1 Else Start_lis = 0
   Waitms 10
End Function                                                'настройка начальных параметров акселерометра

Sub I2c_wr(adrr As Byte , Bt As Byte)                       'процедура записи байта по адресу в i2c
   I2cstart
      I2cwbyte W_lis
      I2cwbyte Adrr
      I2cwbyte Bt
   I2cstop
End Sub

Function I2c_rd(adrr As Byte) As Byte                       'функция чтения байта по адресу в i2c
   I2cstart
      I2cwbyte W_lis
      I2cwbyte Adrr
      I2crepstart
      I2cwbyte R_lis
      I2crbyte I2c_rd , Nack
      I2crepstart
   I2cstop
End Function

Sub Position_spase()                                        'процедура вычисления положения акселерометра в пространстве
   Dim Xsumm As Long
   Dim Ysumm As Long
   Dim Zsumm As Long
   Dim Xad As Byte : Xad = Xout
   Dim Yad As Byte : Yad = Yout
   Dim Zad As Byte : Zad = Zout
   Xsumm = 0 : Ysumm = 0 : Zsumm = 0
   Print #1 , "Accel position space";
   For I = 1 To 30
      Xp = I2c_rd(xout) : Yp = I2c_rd(yout) : Zp = I2c_rd(zout)       'чтение значений по осям
      Xp = Osi(xp) : Yp = Osi(yp) : Zp = Osi(zp)            'преобразование считанного байта в корректное значение
      Xp = Xp + 10 : Yp = Yp - 9 : Zp = Zp - 8              'коэффециэнты смещения нуля для 8g
      'Xp = Xp + 39 : Yp = Yp - 37 : Zp = Zp - 30             'коэффециэнты смещения нуля для 2g
      Xp = Abs(xp) : Yp = Abs(yp) : Zp = Abs(zp)
      Xsumm = Xsumm + Xp : Ysumm = Ysumm + Yp : Zsumm = Zsumm + Zp
      Print #1 , ".";
      Waitms 20
      Toggle Led
   Next
   Xp = Xsumm / 20 : Yp = Ysumm / 20 : Zp = Zsumm / 20
   If Xp => 10 Then
      Xout = Zad : Yout = Yad : Zout = Xad
      Print #1 , "X -> "
      Led = 0
      For I = 1 To 2
         Toggle Led
         Waitms 200
      Next
   Elseif Yp => 10 Then
      Xout = Zad : Yout = Xad : Zout = Yad
      Print #1 , "Y -> "
      For I = 1 To 4
         Toggle Led
         Waitms 200
      Next
   Elseif Zp => 10 Then
      Xout = Xad : Yout = Yad : Zout = Zad
      Print #1 , "Z -> " ;
      For I = 1 To 6
         Toggle Led
         Waitms 200
      Next
   End If
   Print #1 , "OK" : Led = 0
End Sub

Rec_isr:                                                    'прерывание на приём UART
   D = Udr : Udr = 0
   'Print #1 , D ; " ";

   If Bc < Cmaxchar Then                                    'завершение приёма
       If D = Chr(10) Then
         'Print #1 , Bt(1) ; " " ; Bt(2) ; " " ; Bt(3) ; " " ; Bt(4) ; " " ; Bt(5)
         For I = 1 To 4
            Print #1 , Bt(i) ; " " ;
         Next
         Print #1 , ""
         Bc = 1 : Crc_udar = 0 : D = Bt(1)
         For I = 1 To 3                                     'подсчёт CRC суммы
            Bt(1) = Bt(i) And &B00001111                    'берём последние 4 бита от присланного байта
            Crc_udar = Crc_udar + Bt(1)                     'и прибавляем их к контрольной сумме
         Next
         Bt(1) = D : D = 0
         If Bt(1) = 170 And Bt(4) = Crc_udar Then           'если стартовый байт 10101010 и контрольная сумма верны
           'Integ = Bt(3)                                    'соединение 2 байт в integer
           'Shift Integ , Left , 8                           'соединение 2 байт в integer
           'Integ = Integ Or Bt(2)                           'соединение 2 байт в integer
           Print #1 , "Porog_X=" ; Bt(2) ; "  " ; "Porog_Z=" ; Bt(3)
           If Porog_z_eep <> Bt(3) Or Porog_x_eep <> Bt(2) Then       'если присланные пороги не совпадают с порогами в eeprom
               Porog_z_eep = Bt(3) : Porog_x_eep = Bt(2)    'то записываем новые пороги
               Print #1 , " --> Set new porog..."
               Waitms 3000
           Else
               Print #1 , " --> Sending porog = eeprom porog..."
           End If
         Else
            Print "Start byte or CRC corrupted!"
         End If
         For I = 1 To 5                                     'обнуляем буфер приёма
            Bt(i) = 0
         Next
      Else
          If D <> Chr(10) Then
            If D <> Chr(13) Then Bt(bc) = D                 'Else Bc = Bc - 1
            Incr Bc
         Else
            Bc = 1
         End If
      End If
   Else
      Print "Prevyshen (" ; Cmaxchar ; ")"                  'превышен размер строки
      Bc = 1
   End If
Return