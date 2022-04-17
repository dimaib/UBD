Str_terminal:
Data _
   "######################" , _
   "System starting" , _
   "Parametrs device:" , _
   "id device= #" , _
   "Adres and port server= " , _
   "Name SSID: " , _
   "Password SSID: "

Str_at:                                                     'AT команды
Data _
   "ATE0" , _
   "AT+CWMODE=1" , _
   "AT+CIPMODE=0" , _
   "AT+CIPMUX=0" , _
   "AT+CWAUTOCONN=0" , _
   "AT+CWJAP=" , _
   "AT+CIPSEND=" , _
   "AT+CIPSTART=" , _

Str_uart:                                                   'Вывод текста в UART и сравнение текстовых переменных
Data _
   "Reset and setting Wi-Fi modul" , _
   "Connect SSID: " , _
   "Recived IP SSID" , _
   "Lost connect. Reconnect SSID"  , _
   " connection broken!"   , _
   "Connect " , _
   "start" , _
   "Make TCP-connection is " , _
   "TCP" , _
   "RFID_List_fixed_len_blabla:"  , _
   "New list RFID-card add in EEPROM" , _
   "Send by RFID-list = EEPROM-list" , _
   "Rfid_cur=" , _
   "SetAP:" , _
   "SetID:" , _
   "New ID board: #" , _
   "Error id: ", _
   "SetIP:" , _
   "New IP server: " , _
   "RFID = " , _
   "Long = " , _
   "New porog het="  , _
   "Hitting board! Value: "  , _
   " - User", _
   " - Master", _
   " - No find", _
   "WIFI GOT IP", _
   "WIFI DISCONNECT", _
   "WICONNECT", _
   "CLOSED", _
   "CL", _
   "+ICLOSED", _
   "CONNECT", _
   "ALNECTED", _
   "ALD", _
   "AL", _
   "+IPD,", _
   "Invalid RFID-list CRC!", _
   "Receive buffer exceeded! (", _
   "Hit:"