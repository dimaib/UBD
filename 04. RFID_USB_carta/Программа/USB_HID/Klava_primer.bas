'$noramclear

$regfile = "m8def.dat"
$hwstack = 40
$swstack = 40
$framesize = 50                                             'ATMEGA8-16PU
$crystal = 12000000                                         'Кварц - 15МГц
'Include the software USB library - NEW
$lib "swusb.LBX"
$external _swusb

Declare Sub Usb_reset()
Declare Sub Usb_processsetup(txstate As Byte)
Declare Sub Usb_send(txstate As Byte , Byval Count As Byte)
Declare Sub Usb_senddescriptor(txstate As Byte , Maxlen As Byte)
Declare Sub Send_key(key As Byte)

'*************************** Конфигурация USB **********************************
'
'Set the following parameters to match your hardware configuration and USB
'device parameters.

'******************************* USB Connections *******************************

'Define the AVR port that the two USB pins are connected to
_usb_port Alias Portd
_usb_pin Alias Pind
_usb_ddr Alias Ddrd

'Define the D+ and D- pins. (put D+ on an interrupt pin)
Const _usb_dplus = 2
Const _usb_dminus = 4

'Config Pinc.5 = Input : Portc.5 = 1                         ': Key_in Alias Pinc.5
Config Pind.2 = Input : Config Pind.4 = Input
Config Portc.3 = Output : Num Alias Portc.3                 'Светодиод NUMLOCK
Config Pind.0 = Input : Portd.0 = 1 : Button Alias Pind.0   'Кнопка переключения режима работы считывателя


Config 1wire = Portc.2                                      '1wire RFID



_usb_port._usb_dplus = 0
_usb_port._usb_dminus = 0

$include "Const_swusb-includes.bas"

'**************************** USB Interrupt And Init ***************************
'Инициализация всех переменных, флагов, и бит синхронизации
Call Usb_reset()
Const _usb_intf = Intf0
Config Int0 = Rising
On Int0 Usb_isr Nosave
Enable Int0

Enable Interrupts                                           'Разрешить все прерывания



'*************************** Завершение концигурации USB ***********************
'*******************************************************************************


Dim Resetcounter As Word
Dim Idlemode As Byte
Dim Flaginputmsg As Byte                                    'Флаг срабатывания таймера
Dim Keymsg(8) As Byte                                       'Передаваемый репорт (8 байт)
Dim Key(35) As Byte                                         'Массив состояния клавиш
Dim Lastkey(35) As Byte                                     'Массив предыдущего состояния клавиш
Dim K As Byte                                               'Счётчик цикла сканирования клавиш
Dim Paus As Byte                                            'Пауза между передаваемыми символами

Paus = 30
'Portc = 1

' Формат передаваемого репорта  - usb_tx_buffer:

   _usb_tx_buffer2(2) = 0                                   ' modifier    - комбинация из 8-ми модификаций (левые и правые Ctrl, Alt, Shift, Win)
   _usb_tx_buffer2(3) = 0                                   ' reserved    - резерв
   _usb_tx_buffer2(4) = 0                                   ' keycode 0 - код клавиши 0
   _usb_tx_buffer2(5) = 0                                   ' keycode 1 - код клавиши 1
   _usb_tx_buffer2(6) = 0                                   ' keycode 2 - код клавиши 2
   _usb_tx_buffer2(7) = 0                                   ' keycode 3 - код клавиши 3
   _usb_tx_buffer2(8) = 0                                   ' keycode 4 - код клавиши 4
   _usb_tx_buffer2(9) = 0                                   ' keycode 5 - код клавиши 5

' modifier
' bit0  LEFT CTRL   (1)
' bit1  LEFT SHIFT  (2)
' bit2  LEFT ALT    (4)
' bit3  LEFT WIN    (8)
' bit4  RIGHT CTRL  (16)
' bit5  RIGHT SHIFT (32)
' bit6  RIGHT ALT   (64)
' bit7  RIGHT WIN   (128)

Dim Stt As String * 50 , I As Byte , Char As String * 1 , Char_v As Byte , Flag As String * 50
Dim Del_incr As Byte                                        'задержка при нажатой кнопке при переключении режима
Dim Mod_eram As Eram Byte                                   'режим работы хранящийся в eeprom
Dim Mod_ram As Byte                                         'режим работы для обработки в программе
Dim Mod_tmp As Byte
Dim Lon As Long , Test As Byte                              'переменные для перевода RFID в лонг
Mod_ram = Mod_eram                                          'загрузка режима работы из eeprom
Flag = ""
Waitms 300



Dim Aaa As Byte

Do
   If Button = 0 Then                                       'кнопка смены режима
      'Waitms 200
      Del_incr = 0
      For I = 1 To 200
          If Button = 0 Then Incr Del_incr
          waitms 1
      Next
      If Del_incr > 150 Then
         Del_incr = 0
         Num = 1
         Mod_tmp = Mod_ram
         Bt:
            Waitms 100
            If Del_incr < 20 Then
               Incr Del_incr
            Else
               If Mod_tmp = Mod_ram Then
                  If Mod_ram > 1 Then Mod_ram = 1 Else Mod_ram = 2
                  Mod_tmp = 5
               End If
               Toggle Num
            End If
         If Button = 0 Then Goto Bt Else Del_incr = 0
      End If
   Else
      Del_incr = 0
   End If                                                   'кнопка смены режима
   If Mod_tmp = 5 Then                                      'если произошла смена режима, то сохранить его в eeprom и мигнуть 5 раз
      Mod_tmp = Mod_eram
      If Mod_ram <> Mod_tmp Then
         Mod_eram = Mod_ram
         For I = 1 To 10
             Toggle Num
             Waitms 200
         Next
      End If
   End If                                                   'если произошла смена режима, то сохранить его в eeprom и мигнуть 5 раз
   Resetcounter = 0
   While _usb_pin._usb_dminus = 0
      Incr Resetcounter
      If Resetcounter = 1000 Then
         Call Usb_reset()
      End If
   Wend
   If _usb_status._usb_rxc = 1 Then                         'Флаг полученных данных

      If _usb_status._usb_setup = 1 Then
         Call Usb_processsetup(_usb_tx_status)              'Обработка пакет/управление сообщения установки
      Elseif _usb_status._usb_endp1 = 1 Then                ' Пришёл пакет данных с компа
             Portd.0 = _usb_rx_buffer(2).0                  'Состояние светодиодного индикатора CAPS
             Portd.1 = _usb_rx_buffer(2).1                  'Состояние светодиодного индикатора NUM
             Num = _usb_rx_buffer(2).0                      'Состояние светодиодного индикатора NUM
             Portd.3 = _usb_rx_buffer(2).2                  'Состояние светодиодного индикатора LOCK
             '''''''''''1=caps; 0=num
      End If
      _usb_status._usb_rtr = 1                              'Восстановление бита RXC и tустановка бита RTR (готовность получить новый пакет)
      _usb_status._usb_rxc = 0
   End If


   1wreset
   If Err <> 1 Then
      1wwrite &H33
      Stt = ""
      Lon = 0 : Test = 0
      For I = 1 To 8
         Test = 1wread()
         Stt = Stt + Hex(test)                              ' накапливаем строку для RFID в HEX
         '''переводим RFID в лонг
         If I > 4 Then                                      'сохраняем последние 4 байта RFIDa в 4 байтовую переменную Long
            Shift Lon , Left , 8                            'сдвигаем переменную Lon на 8 битов влево
            Lon = Lon Or Test                               'переносим в бладший байт считанное значение из Matrixa
         End If
         If Mod_ram = 1 Then Stt = Str(lon)
         '''переводим RFID в лонг
      Next

      Waitms 30
      If Num = 1 Then
         Keymsg(3) = 0
         Gosub Send_u8
         Waitms 30
         Mod_tmp = Len(stt)
         'For I = 1 To 16
          For I = 1 To Mod_tmp
            Char = Mid(stt , I , 1)
            Char_v = &H2D
            Select Case Char
               Case "0"
                  Char_v = &H27
               Case "1"
                  Char_v = &H1E
               Case "2"
                  Char_v = &H1F
               Case "3"
                  Char_v = &H20
               Case "4"
                  Char_v = &H21
               Case "5"
                  Char_v = &H22
               Case "6"
                  Char_v = &H23
               Case "7"
                  Char_v = &H24
               Case "8"
                  Char_v = &H25
               Case "9"
                  Char_v = &H26
               Case "A"
                  Char_v = &H04
               Case "B"
                  Char_v = &H05
               Case "C"
                  Char_v = &H06
               Case "D"
                  Char_v = &H07
               Case "E"
                  Char_v = &H08
               Case "F"
                  Char_v = &H09
               Case " "
                  Char_v = &H2C
            End Select
            Call Send_key(char_v)
         Next
         Waitms 30
         Keymsg(3) = 0
         Gosub Send_u8
         Waitms 500
      End If
   End If

Loop
'*************************** Конец основного цикла *****************************


'************************ Посылка кода одной клавиши ***************************
Send_u8:
  If Flaginputmsg = 0 Then
         If _usb_tx_status._usb_txc = 1 Then
            _usb_tx_buffer2(4) = Keymsg(3)
           Call Usb_send(_usb_tx_status2 , 8)               ' Сообщение в компьютер
         End If
   End If
Return


End

'*******************************************************************************
'**************** Дескрипторы, сохранённые в EEPROM или FLASH ******************
'                     Не изменять порядок дескрипторов!
'
#if _usb_use_eeprom = 1
   $eeprom
#else
   $data
#endif

'Дескрипторы устройства
_usb_devicedescriptor:
Data 18 , 18 , _usb_desc_device , _usb_specl , _usb_spech , _usb_devclass
Data _usb_devsubclass , _usb_devprot , 8 , _usb_vidl , _usb_vidh , _usb_pidl
Data _usb_pidh , _usb_devrell , _usb_devrelh , _usb_imanufacturer
Data _usb_iproduct , _usb_iserial , _usb_numconfigs


'Retrieving the configuration descriptor also gets all the interface and
'endpoint descriptors for that configuration.  It is not possible to retrieve
'only an interface or only an endpoint descriptor.  Consequently, this is a
'large transaction of variable size.

_usb_configdescriptor:
Data _usb_descr_total , 9 , _usb_desc_config , _usb_descr_totall
Data _usb_descr_totalh , _usb_numifaces , _usb_confignum , _usb_iconfig
Data _usb_powered , _usb_maxpower

'_usb_IFaceDescriptor
Data 9 , _usb_desc_iface , _usb_ifaceaddr , _usb_alternate
Data _usb_ifaceendpoints , _usb_ifclass , _usb_ifsubclass , _usb_ifprotocol
Data _usb_iiface

#if _usb_hids > 0
'_usb_HIDDescriptor
Data _usb_hid_descr_len , _usb_desc_hid , _usb_hid_releasel , _usb_hid_releaseh
Data _usb_hid_country , _usb_hid_numdescriptors

'Next follows a list of bType and wLength bytes/words for each report and
'physical descriptor.  There must be at least 1 report descriptor.  In practice,
'There are usually 0 physical descriptors and only 1 report descriptor.

Data _usb_desc_report
Data 63 , 0                                                 ' первое число должно быть таким же, как количество данных дескриптора HID - _usb_hid_reportdescriptor
'End of report/physical descriptor list
#endif

#if _usb_endpoints > 1
'_usb_EndpointDescriptor
Data 7 , _usb_desc_endpoint , _usb_endp2attr , _usb_endp2type , 8 , 0
Data _usb_endp2interval
#endif

#if _usb_endpoints > 2
'_usb_EndpointDescriptor
Data 7 , _usb_desc_endpoint , _usb_endp3attr , _usb_endp3type , 8 , 0
Data _usb_endp3interval
#endif

#if _usb_hids > 0
_usb_hid_reportdescriptor:

Data 63                                                     'Количество данных дескриптора HID, установить такое же в _usb_desc_report
Data &H05 , &H01                                            '   USAGE_PAGE (Generic Desktop)
Data &H09 , &H06                                            '   USAGE (Keyboard)
Data &HA1 , &H01                                            '   COLLECTION (Application)
Data &H05 , &H07                                            '   USAGE_PAGE (Keyboard)
Data &H19 , &HE0                                            '   USAGE_MINIMUM (Keyboard LeftControl)
Data &H29 , &HE7                                            '   USAGE_MAXIMUM (Keyboard Right GUI)
Data &H15 , &H00                                            '   LOGICAL_MINIMUM (0)
Data &H25 , &H01                                            '   LOGICAL_MAXIMUM (1)
Data &H75 , &H01                                            '   REPORT_SIZE (1)
Data &H95 , &H08                                            '   REPORT_COUNT (8)
Data &H81 , &H02                                            '   INPUT (Data,Var,Abs) ** Modifier Byte **
Data &H95 , &H01                                            '   REPORT_COUNT (1)
Data &H75 , &H08                                            '   REPORT_SIZE (8)
Data &H81 , &H03                                            '   INPUT (Cnst,Var,Abs) ** Reserved Byte **
Data &H95 , &H05                                            '   REPORT_COUNT (5)
Data &H75 , &H01                                            '   REPORT_SIZE (1)
Data &H05 , &H08                                            '   USAGE_PAGE (LEDs)
Data &H19 , &H01                                            '   USAGE_MINIMUM (Num Lock)
Data &H29 , &H05                                            '   USAGE_MAXIMUM (Kana)
Data &H91 , &H02                                            '   OUTPUT (Data,Var,Abs) ** LED Report **
Data &H95 , &H01                                            '   REPORT_COUNT (1)
Data &H75 , &H03                                            '   REPORT_SIZE (3)
Data &H91 , &H03                                            '   OUTPUT (Cnst,Var,Abs) ** LED Report Padding **
Data &H95 , &H06                                            '   REPORT_COUNT (6) ** here we define the maximum number of simultaneous keystrokes we can detect **
Data &H75 , &H08                                            '   REPORT_SIZE (8)
Data &H15 , &H00                                            '   LOGICAL_MINIMUM (0)
Data &H25 , &H65                                            '   LOGICAL_MAXIMUM (101)
Data &H05 , &H07                                            '   USAGE_PAGE (Keyboard)
Data &H19 , &H00                                            '   USAGE_MINIMUM (Reserved (no event indicated))
Data &H29 , &H65                                            '   USAGE_MAXIMUM (Keyboard Application)
Data &H81 , &H00                                            '   INPUT (Data,Ary,Abs) ** Key arrays (6 bytes) **
Data &HC0                                                   '   END_COLLECTION


#endif

'*****************************String descriptors********************************
' Yes, they MUST be written like "t","e","s","t".  Doing so pads them with
' 0's.  If you write it like "test," I promise you it won't work.
' Нужно писать так: "t","e","s","t".
' Если написать "test," - работать не будет

'Default language descriptor (index 0)
'Дескриптор языка по умолчанию (индекс 0)
_usb_langdescriptor:
Data 4 , 4 , _usb_desc_string , 09 , 04                     '&h0409 = English
'Data 4 , 4 , _usb_desc_string , 19 , 04                     '&h0419 = Русский

'Manufacturer Descriptor (unicode)
'Дескриптор изготовителя (unicode)
_usb_mandescriptor:
Data 14 , 14 , _usb_desc_string
Data "R" , "a" , "d" , "a" , "n" , 0 , 0

'Product Descriptor (unicode)
'Дескриптор продукта (unicode)
_usb_proddescriptor:
Data 24 , 24 , _usb_desc_string
Data "K" , "L" , "A" , "V" , "A" , " " , "A" , "T" , "O" , "M" , 0 , 0


'Дескриптор номера
_usb_numdescriptor:
Data 6 , 6 , _usb_desc_string
Data "1" , 0 , 0

'*******************************************************************************
'************************* Subroutines - Подпрограммы ***************************
'*******************************************************************************

Sub Send_key(key As Byte)
   Keymsg(3) = Key
   Gosub Send_u8
   Waitms 15
   Keymsg(3) = 0
   Gosub Send_u8
   Waitms 15
End Sub

Sub Usb_processsetup(txstate As Byte)
Senddescriptor = 0

   'Control transfers reset the sync bits like so
   Txstate = _usb_setup_sync

   'These are the standard device, interface, and endpoint requests that the
   'USB spec requires that we support.
   Select Case _usb_rx_buffer(2)
      'Стандартные запросы устройств
      Case &B10000000:
         Select Case _usb_rx_buffer(3)
           ' Case _usb_req_get_status:                       ' 00 - Определение состояния устройства

            Case _usb_req_get_descriptor:
               Select Case _usb_rx_buffer(5)
                  Case _usb_desc_device:
                     'Отправка дескриптора устроства
                     #if _usb_use_eeprom = 1
                        Readeeprom _usb_eepromaddrl , _usb_devicedescriptor
                     #else
                        Restore _usb_devicedescriptor
                     #endif
                     Senddescriptor = 1
                  Case _usb_desc_config:
                     'Отправка дескриптора конфигурации
                     #if _usb_use_eeprom = 1
                        Readeeprom _usb_eepromaddrl , _usb_configdescriptor
                     #else
                        Restore _usb_configdescriptor
                     #endif
                     Senddescriptor = 1
                  Case _usb_desc_string:
                     Select Case _usb_rx_buffer(4)
                        Case 0:
                           'Отправка дескриптора выбраного языка
                           #if _usb_use_eeprom = 1
                              Readeeprom _usb_eepromaddrl , _usb_langdescriptor
                           #else
                              Restore _usb_langdescriptor
                           #endif
                           Senddescriptor = 1
                        Case 1:
                           'Отправка дескриптора изготовителя
                           #if _usb_use_eeprom = 1
                              Readeeprom _usb_eepromaddrl , _usb_mandescriptor
                           #else
                              Restore _usb_mandescriptor
                           #endif
                           Senddescriptor = 1
                        Case 2:
                           'Отправка дескриптора продукта
                           #if _usb_use_eeprom = 1
                              Readeeprom _usb_eepromaddrl , _usb_proddescriptor
                           #else
                              Restore _usb_proddescriptor
                           #endif
                           Senddescriptor = 1
                        Case 3:
                           'Отправка дескриптора номера
                           #if _usb_use_eeprom = 1
                              Readeeprom _usb_eepromaddrl , _usb_numdescriptor
                           #else
                              Restore _usb_numdescriptor
                           #endif
                           Senddescriptor = 1

                     End Select
               End Select
'            CASE _usb_REQ_GET_CONFIG:
         End Select
      Case &B00000000:
         Select Case _usb_rx_buffer(3)
'            CASE _usb_REQ_CLEAR_FEATURE: ' 01 Сброс устройства
'            CASE _usb_REQ_SET_FEATURE:   ' 03 Установить свойство
            Case _usb_req_set_address:
               'USB status reporting for control writes
               Call Usb_send(txstate , 0)
               While Txstate._usb_txc = 0 : Wend
               'We are now addressed.
               _usb_deviceid = _usb_rx_buffer(4)
'            CASE _usb_REQ_SET_DESCRIPTOR:
            Case _usb_req_set_config:
               'Have to do status reporting
               Call Usb_send(txstate , 0)
         End Select
      'Стандартные запросы интерфейса
      Case &B10000001:
         Select Case _usb_rx_buffer(3)
'            CASE _usb_REQ_GET_STATUS:
'            CASE _usb_REQ_GET_IFACE:
            Case _usb_req_get_descriptor
            '_usb_rx_buffer(4) Индекс дескриптора и (5) его тип
               Select Case _usb_rx_buffer(5)
                  Case _usb_desc_report:
                     #if _usb_use_eeprom = 1
                        Readeeprom _usb_eepromaddrl , _usb_hid_reportdescriptor
                     #else
                        Restore _usb_hid_reportdescriptor
                     #endif
                     Senddescriptor = 1

'                  CASE _usb_DESC_PHYSICAL

'                  CASE _USB_DESC_HID

               End Select
         End Select
      Case &B00100001:
         'Class specific SET requests
         Select Case _usb_rx_buffer(3)
            'CASE _usb_REQ_SET_REPORT:
            Case _usb_req_set_idle:
               Idlemode = 1
               'Do status reporting
               Call Usb_send(txstate , 0)
            'CASE _usb_REQ_SET_PROTOCOL:
         End Select
   End Select

   If Senddescriptor = 1 Then
      Call Usb_senddescriptor(txstate , _usb_rx_buffer(8))
   End If

End Sub

Sub Usb_senddescriptor(txstate As Byte , Maxlen As Byte)

   'Break the descriptor into packets and send to TxState
   Local Size As Byte
   Local I As Byte
   Local J As Byte
   Local Timeout As Word

   #if _usb_use_eeprom = 1
      'EEPROM access is a little funky.  The size has already been fetched
      'and stored in _usb_EEPROMADDRL, and the address of the descriptor
      'is now in the EEAR register pair.

      Size = _usb_eepromaddrl

      'Fetch the location of the descriptor and use it as an address pointer
      push R24
      in R24, EEARL
      sts {_USB_EEPROMADDRL}, R24
      in R24, eearH
      sts {_USB_EEPROMADDRH}, R24
      pop R24

   #else
      Read Size
   #endif


   If Maxlen < Size Then Size = Maxlen

   I = 2
   For J = 1 To Size
      Incr I
      #if _usb_use_eeprom = 1
         Incr _usb_eepromaddr
         Readeeprom Txstate(i) , _usb_eepromaddr
      #else
         Read Txstate(i)
      #endif

      If I = 10 Or J = Size Then
         I = I - 2
         Call Usb_send(txstate , I)
         While Txstate._usb_txc = 0
            Timeout = 0
            'To prevent an infinite loop, check for reset here
            While _usb_pin._usb_dminus = 0
               Incr Timeout
               If Timeout = 1000 Then                       '
                  Call Usb_reset()
                  Exit Sub
               End If
            Wend
         Wend
         I = 2
      End If
   Next
End Sub

Sub Usb_send(txstate As Byte , Byval Count As Byte)

   'Calculates and adds the CRC16,adds the DATAx PID,
   'and signals to the ISR that the data is ready to be sent.
   '
   '"Count" is the DATA payload size.  Range is 0 to 8. Do not exceed 8!

   'Reset all the flags except TxSync and RxSync
   Txstate = Txstate And _usb_syncmask
   'Calculate the 16-bit CRC
   _usb_crc = 0
   If Count <> 0 Then
      _usb_crc = Crc16uni(txstate(3) , Count , &HFFFF , &H8005 , 1 , 1)
      Toggle _usb_crc
   End If
   'Bytes to transmit will be PID + DATA payload + CRC16
   Count = Count + 3
   Txstate = Txstate + Count
   Txstate(count) = Low(_usb_crc)
   Incr Count
   Txstate(count) = High(_usb_crc)
   'Add the appropriate DATAx PID
   Txstate(2) = _usb_pid_data1
   If Txstate._usb_txsync = 0 Then
      Txstate(2) = _usb_pid_data0
   End If
   'The last step is to signal that the packet is Ready To Transmit
   Txstate._usb_rtt = 1
   Txstate._usb_txc = 0
End Sub

Sub Usb_reset()
   'Reset the receive flags
   _usb_status._usb_rtr = 1
   _usb_status._usb_rxc = 0
   'Reset the transmit flags
   _usb_tx_status = _usb_endp_init
   #if Varexist( "_usb_Endp2Addr")
   _usb_tx_status2 = _usb_endp_init
   #endif
   #if Varexist( "_usb_Endp3Addr")
   _usb_tx_status3 = _usb_endp_init
   #endif
   'Reset the device ID to 0
   _usb_deviceid = 0
   Idlemode = 0
End Sub