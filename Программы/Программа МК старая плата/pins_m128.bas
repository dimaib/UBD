'������������ ������ ��� Atmega128
Config Portd.4 = Output : Rst_wifi Alias Portd.4            '��� �������� WI-FI
Config Porta.3 = Output : Led1 Alias Porta.3                '��������� 1 �������
Config Porta.4 = Output : Led2 Alias Porta.4                '��������� 2 ������
Config Porta.5 = Output : Led3 Alias Porta.5                '��������� 3 ���������
Config Porta.6 = Output : Led4 Alias Porta.6                '��������� 4 �����
Config Portb.4 = Output : Rel_ig Alias Portb.4              '��������� ���������
Config Portd.0 = Output : Rel_tr Alias Portd.0              '��������� ��������
'config Portb.4 = Output : Rel_ig Alias Portd.0             '��������� ��������� ��������
'Config Portd.0 = Output : Rel_tr Alias Portb.4             '��������� �������� ��������

Rst_wifi = 1

Config Pine.5 = Input : Set_but Alias Pine.0 : Porte.0 = 1  '���������� ������

Config 1wire = Porta.0                                      '��������� 1Wire ���������� ��� ������ RFID �����