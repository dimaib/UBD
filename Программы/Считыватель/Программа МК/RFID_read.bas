'FUSES: H=E4, L=D9

$regfile = "m8adef.dat"
$crystal = 8000000
$baud = 9600

'Объявление функций
Declare Function Read_matrix() As Long                      'функция для чтения RFIDa и преобразования в Long

Config 1wire = Portd.2                                      'Настройка 1Wire интерфейса для чтения RFID карты

Open "comc.0:9600,8,n,1" For Output As #2                   'настройка софтового UARTa для меги328
'Config Com2 = 9600 , Synchrone = 0 , Parity = None , Stopbits = 1 , Databits = 8 , Clockpol = 0
'Open "com2:" For Binary As #2

Config Portc.1 = Output : Led Alias Portc.1

Dim Increm As Byte , Test As Byte , Lon As Long , Rfid_cur As Long

Do
   Rfid_cur = Read_matrix()
   If Rfid_cur > 0 Then Led = 1 Else Led = 0
   Print #2 , "RFID_CUR=" ; Rfid_cur
   Waitms 50
Loop

Function Read_matrix() As Long                              'функция для чтения RFIDa и преобразования в Long
   Test = 0
   Lon = 0
   Increm = 0
   For Increm = 1 To 10                                     '10 опросов считываетля, и если хоть один без ошибки обрабатываем его
      1wreset
      If Err <> 1 Then Exit For
      Waitms 10
   Next
   If Increm < 11 Then                                      'если произошёл вылет из цикла, до его завершения, то получаем от считывателя RFID
      1wwrite &H33
      'Rfid_print = Lookupstr(19 , Str_uart)
      For Increm = 1 To 8                                   'получаем 8 байт из считываетля
         Test = 1wread()
         'Print #2 , " -> " ; Hex(test );
         'Rfid_print = Rfid_print + Hex(test) + " "
         If Increm > 4 Then                                 'сохраняем последние 4 байта RFIDa в 4 байтовую переменную Long
            Shift Lon , Left , 8                            'сдвигаем переменную Lon на 8 битов влево
            Lon = Lon Or Test                               'переносим в бладший байт считанное значение из Matrixa
         End If                                             'тем самым сдвиг влево происходит 4 раза по 8 бит и переменная Lon заполняется байтами
         Waitms 1
      Next
      'Rfid_print = Rfid_print + "[" + Lookupstr(20 , Str_uart) + Str(lon) + "]"
   End If
   Read_matrix = Lon
End Function