$regfile = "m8def.dat"
$crystal = 8000000
$baud = 115200
'����� E4 D9

'��������� ������\�������
   Config Portd.2 = Output : Led Alias Portd.2
   Config Portd.3 = Output
'��������� ������\�������

Config Adc = Single , Prescaler = Auto , Reference = Avcc
Start Adc

Open "comb.4:115200,8,n,1" For Output As #1                 '��������� ��������� UARTa ��� ����8
Config Com1 = 115200 , Synchrone = 0 , Parity = None , Stopbits = 1 , Databits = 8 , Clockpol = 0
Open "com1:" For Binary As #2

Config Timer1 = Timer , Prescale = 256

Declare Sub Read_x_y_z()                                    '���������� ������ �� ����

Dim Cfg As Byte                                             '���� ��� ������ ��� � I2C, ��� ��������� �������������
Dim Xyz_flag As Byte                                        '��� �������� ����������������� �������������
Dim X As Integer , Y As Integer , Z As Integer              '��� ������ �� �������������
Dim Xp As Integer , Yp As Integer , Zp As Integer           '��� ���������
Dim Xl As Long , Yl As Long , Zl As Long , Summ As Word     '��� ���������� �������������� �����

Const X_adc = 0                                             '����� ��� ��� X
Const Y_adc = 7                                             '����� ��� ��� Y
Const Z_adc = 1                                             '����� ��� ��� Z

Dim Porog As Word                                           '����� ��� ���������� ����� ���������. ������������ �������� �� ������ �� ���� 220. _
'������������ ����� ��������� sqr(127^2 + 127^2 + 127^2)=220
Dim T_pic As Word                                           '����������������� ���������� ������
Dim Bort_type As Byte
Bort_type = 1

If Bort_type = 1 Then                                       '���
   Porog = 100 : T_pic = 400
Elseif Bort_type = 2 Then                                   '������� jung etv320
   Porog = 0 : T_pic = 0
Elseif Bort_type = 3 Then                                   '���������������� jung efg-115
   Porog = 0 : T_pic = 0
End If

Const Delay_led = 10000                                     '�������� ��������� �����. ����� � ��, ������� ����� ������� ����� �����
dim zero as integer
dim dty as long
dim i as byte

for i=1 to 10                                            '������ �������� ���� � ��������� ��
      X = Getadc(x_adc)
      Y = Getadc(y_adc)
      Z = Getadc(z_adc)
      'X = X - 512 : Y = Y - 512 : Z = Z - 512
      Xl = X ^ 2 : Yl = Y ^ 2 : Zl = Z ^ 2 : Summ = Xl + Yl : Summ = Summ + Zl : Summ = Sqr(summ)       '���������� �������������� �����
      dty=dty+summ
next
dty=dty/10


Do
   Call Read_x_y_z                                          '���������� ��������� � �������������
   waitms 10
   If Summ <= Porog Then                                    '���� ����� ������ �������, �� ������ ������� �� ����
      Timer1 = 0
   Else                                                     '���� ����� ������ �������, ������� �� ����������� ������� T_pic
      If Timer1 > T_pic Then                                '������� �����
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


Sub Read_x_y_z()                                            '������ �������� ���� � ��������� ��
      X = Getadc(x_adc)
      Y = Getadc(y_adc)
      Z = Getadc(z_adc)
      'X = X - 512 : Y = Y - 512 : Z = Z - 512
      Xl = X ^ 2 : Yl = Y ^ 2 : Zl = Z ^ 2 : Summ = Xl + Yl : Summ = Summ + Zl : Summ = Sqr(summ)       '���������� �������������� �����
      summ=summ-dty
      if summ>60000 then summ=0
End Sub