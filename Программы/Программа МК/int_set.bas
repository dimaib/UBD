On Urxc1 Rec_isr                                            'подпрограмма для прерывания на приём UART
Enable Urxc1                                                'разрешение прерывания UART


#if Plata = 2
'Конфигурирование таймера для измерения скорости
On Capture1 T1
Enable Capture1
Config Timer1 = Timer , Prescale = 64 , Capture Edge = Rising
'Конфигурирование таймера для измерения скорости

'Конфигурирование таймера обработки акселерометра
On Timer2 T2
'Enable Timer2
Config Timer2 = Timer , Prescale = 1024
'Конфигурирование таймера обработки акселерометра
#endif

Enable Interrupts