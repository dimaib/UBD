$regfile = "m8def.dat"
$crystal = 8000000
$baud = 115200
'Фьюзы E4 D9

'настройка входов\выходов
   Config Portd.2 = Output : Led Alias Portd.2
   Config Portd.3 = Output
'настройка входов\выходов

Config Adc = Single , Prescaler = Auto , Reference = Avcc
Start Adc

Open "comb.4:115200,8,n,1" For Output As #1                 'настройка софтового UARTa для меги8
Config Com1 = 115200 , Synchrone = 0 , Parity = None , Stopbits = 1 , Databits = 8 , Clockpol = 0
Open "com1:" For Binary As #2

Config Timer1 = Timer , Prescale = 256

Declare Sub Read_x_y_z()                                    'считывание данных по осям

Dim Cfg As Byte                                             'байт для записи его в I2C, при настройке акселерометра
Dim Xyz_flag As Byte                                        'для проверки работоспособности акселерометра
Dim X As Integer , Y As Integer , Z As Integer              'для чтения из акселерометра
Dim Xp As Integer , Yp As Integer , Zp As Integer           'для обработки
Dim Xl As Long , Yl As Long , Zl As Long , Summ As Word     'для вычесления геометрической суммы

Const X_adc = 0                                             'Номер АЦП для X
Const Y_adc = 7                                             'Номер АЦП для Y
Const Z_adc = 1                                             'Номер АЦП для Z

Dim Porog As Word                                           'порог для фильтрации пиков ускорения. Максимальное значение по каждой из осей 220. _
'Максимальное общее ускорение sqr(127^2 + 127^2 + 127^2)=220
Dim T_pic As Word                                           'продолжительность превышения порога
Dim Bort_type As Byte
Bort_type = 1

If Bort_type = 1 Then                                       'УПШ
   Porog = 100 : T_pic = 400
Elseif Bort_type = 2 Then                                   'ричтрак jung etv320
   Porog = 0 : T_pic = 0
Elseif Bort_type = 3 Then                                   'электропогрузчик jung efg-115
   Porog = 0 : T_pic = 0
End If

Const Delay_led = 10000                                     'задержка удержания удара. Время в мс, сколько будет активен выход удара
dim zero as integer
dim dty as long
dim i as byte

for i=1 to 10                                            'чтение значений осей и обработка их
      X = Getadc(x_adc)
      Y = Getadc(y_adc)
      Z = Getadc(z_adc)
      'X = X - 512 : Y = Y - 512 : Z = Z - 512
      Xl = X ^ 2 : Yl = Y ^ 2 : Zl = Z ^ 2 : Summ = Xl + Yl : Summ = Summ + Zl : Summ = Sqr(summ)       'вычисление геометрической суммы
      dty=dty+summ
next
dty=dty/10


Do
   Call Read_x_y_z                                          'считывание показаний с акселерометра
   waitms 10
   If Summ <= Porog Then                                    'если порог меньше нужного, то ничего считать не надо
      Timer1 = 0
   Else                                                     'если порог больше нужного, считаем до предельного времени T_pic
      If Timer1 > T_pic Then                                'событие удара
         'Print Timer1
         Print #1 , Summ ; " " ; Timer1 ; " " ; Led
         Led = 1
         Waitms Delay_led
         'led=0
         Timer1 = 0
      End If
   End If
   Print #1 , Summ ; " " ; Timer1 ; " " ; Led
   Led = 0
Loop


Sub Read_x_y_z()                                            'чтение значений осей и обработка их
      X = Getadc(x_adc)
      Y = Getadc(y_adc)
      Z = Getadc(z_adc)
      'X = X - 512 : Y = Y - 512 : Z = Z - 512
      Xl = X ^ 2 : Yl = Y ^ 2 : Zl = Z ^ 2 : Summ = Xl + Yl : Summ = Summ + Zl : Summ = Sqr(summ)       'вычисление геометрической суммы
      summ=summ-dty
      if summ>60000 then summ=0
End Sub