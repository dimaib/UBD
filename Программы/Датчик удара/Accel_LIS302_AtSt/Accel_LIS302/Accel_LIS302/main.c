
#include "main.h"														//���������� �������� ����� �������� �������
#include <avr/io.h>
#include <util/delay.h>
#include <stdlib.h>
#include <string.h>
#include <stdio.h>
#include <avr/interrupt.h>
#include <avr/eeprom.h>

#include "lis302.h"														//���������� �������� � ������� ��� ������ � ��������������
#include "uart.h"														//���������� �������� � ������� ��� ������ � UART��
#include "uart_soft.h"													//���������� �������� � ������� ��� ������ � �������� UART��
#include "timers.h"														//���������� ��������� � ������ � ���������

//���������� ��� ������������� ����������
signed char x, y, z;													//��� ������ �������� ���� �� �������������
char x_pos=Xout, y_pos=Yout, z_pos=Zout;								//��� ��������������� ���� ��� ������������ ��������� � ������������
unsigned int freq=0;													//���������� ��� �������� �������
unsigned int freq_cur=0;												//���������� �������� ������� �������
//���������� ��� ������������� ����������

uint8_t EEMEM porog_xy_eep;												//����� XY � EEPROM
uint16_t EEMEM porog_z_eep;												//����� Z � EEPROM

uint8_t porog_xy=0;														//���������� ��� �������� ������ �� XY
uint16_t porog_z=0;														//���������� ��� �������� ������ �� Z

int main(void)
{
	char x_buf[AVER_NUM]={0};											//������ �������� AVER_NUM ��������� ��� ���������� �������� ��������
	char y_buf[AVER_NUM]={0};											//������ �������� AVER_NUM ��������� ��� ���������� �������� ��������
	char z_buf[AVER_NUM]={0};											//������ �������� AVER_NUM ��������� ��� ���������� �������� ��������
	char x_aver=0,y_aver=0,z_aver=0;									//���������� ��� �������� �������� �������� ��������� �� ����
	porog_xy=POROG_XY_R;												//������ ������ XY �� eeprom
	porog_z=POROG_Z_R;													//������ ������ Z �� eeprom
	DDRB|=(1<<1)|(0<<0);												//��������� PORTB1 �� �����, ��������� PORTB0 �� ����
	PORTB|=(1<<0);														//�������� ����� � �������
	i2c_init();															//������������� ��������� i2c
	//init_UART();														//������������� UARTa
	suart_init();														//������������� ��������� �����
	timers_init();														//������������� ��������
	char buf[100]; for(int i=0;i<100;i++) buf[i]=0;						//������ ������ ��� ������ ��������� � �������� � ��� ���������
	if(init_lis302(0)==OK_ACCEL){										//���� ����������� �������, �� ���������� ������, ���� ���, �� �������������
		print_w("ACCEL OK\r\n");
		}else{
		do{print_w("ACCEL ERROR\r\n"); _delay_ms(200);}while (1);		//������������� � ����� ��������� �� ������
	}	
	position_space();													//����������� ���������� � ������������
	init_lis302(1);														//������������� ������������� ��� ����������
	while (1)
	{
		read_xyz();														//������ �������� ������������� �� ����
		x_aver=aver_arr(x_buf,x);										//���������� �������� �������� �� X
		y_aver=aver_arr(y_buf,y);										//���������� �������� �������� �� Y
		z_aver=aver_arr(z_buf,z);										//���������� �������� �������� �� Z
		sprintf(buf,"%d\t%d\t%d\t%d\t%d\t%d\r\n",x,x_aver,y,y_aver,z,z_aver);	//���������� ������� �������� � �������
		//sprintf(buf,"%d\t%d\t%d\r\n",x,y,z);							//���������� ������ ������ ��������
		//print_w(buf);
		suart_tx_str(buf);
		_delay_ms(20);
    }
}