On Urxc1 Rec_isr                                            '������������ ��� ���������� �� ���� UART
Enable Urxc1                                                '���������� ���������� UART


#if Plata = 2
'���������������� ������� ��� ��������� ��������
On Capture1 T1
Enable Capture1
Config Timer1 = Timer , Prescale = 64 , Capture Edge = Rising
'���������������� ������� ��� ��������� ��������

'���������������� ������� ��������� �������������
On Timer2 T2
'Enable Timer2
Config Timer2 = Timer , Prescale = 1024
'���������������� ������� ��������� �������������
#endif

Enable Interrupts