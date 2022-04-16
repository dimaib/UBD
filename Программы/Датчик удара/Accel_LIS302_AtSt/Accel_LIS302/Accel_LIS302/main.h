///////////////////////////////////////////////////////////////////////
/*********************************************************************/
///////////////////////////////////////////////////////////////////////
#include <stdlib.h>
#include <avr/eeprom.h>


#define F_CPU			8000000UL												//������� ������ �����������

#define TOGGLE_LED		PORTB^=(1<<1);											//������� �����������
#define SET_LED			PORTB|=(1<<1);											//�������� ���������
#define RES_LED			PORTB&=~(1<<1);											//��������� ���������
#define AVER_NUM		4														//���-�� ��������� ��� ���������� ��������
#define POROG_XY_R		eeprom_read_byte(&porog_xy_eep)							//������ ������ XY �� eeprom
#define POROG_Z_R		eeprom_read_word(&porog_z_eep)							//������ ������ Z �� eeprom



#ifndef MAIN_H
#define MAIN_H

char aver_arr(char *arr/*������*/, char xyz/*������� �������� �������������*/)	//������� ����������� ������� ��������
{
	unsigned int summ=xyz;														//���������� ��� �������� �����
	for(int i=1;i<AVER_NUM;i++){												//���� �������� ������� � ������������ ��������� �������������
		arr[i-1]=arr[i];														//�������� ������� �����
		summ+=arr[i];															//������������ ���������
	}
	arr[AVER_NUM-1]=xyz;														//���������� � ����� ������� �������� ��������� �������������
	return summ/AVER_NUM;
}
#endif

