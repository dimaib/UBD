#include <avr/interrupt.h>
#include <util/delay.h>

//#include "main.h"

#ifndef TIMERS_H
#define  TIMERS_H

#define PRESC_1					(0<<CS12)|(0<<CS11)|(1<<CS10)	//�������� ������� ���������� �� 1
#define PRESC_8					(0<<CS12)|(1<<CS11)|(0<<CS10)	//�������� ������� ���������� �� 8
#define PRESC_64				(0<<CS12)|(1<<CS11)|(1<<CS10)	//�������� ������� ���������� �� 64
#define PRESC_256				(1<<CS12)|(0<<CS11)|(0<<CS10)	//�������� ������� ���������� �� 256
#define PRESC_1024				(1<<CS12)|(0<<CS11)|(1<<CS10)	//�������� ������� ���������� �� 1024
#define	FALLING					(1<<CS12)|(1<<CS11)|(0<<CS10)	//��������� ������� �� falling (110)
#define	RISSING					(1<<CS12)|(1<<CS11)|(1<<CS10)	//��������� ������� �� rissing (111)
#define TIM0_MAX				255								//���������� 8 ������� �������
#define TIM1_MAX				65536							//���������� 16 ������� �������
#define T0_PRESC				1024							//������������ ������� ������� 0
#define T1_PRESC				8								//������������ ������� ������� 1
#define T0_SEC					F_CPU/T0_PRESC					//������ � ������� ������� 0
#define T1_SEC					F_CPU/T1_PRESC					//������ � ������� ������� 1
#define T0_NUM_INT				T0_SEC/TIM0_MAX					//���-�� ���������� � ������� ������� 0

char tim0_int=0;												//���������� ��� �������� ������ ������� 0
extern unsigned int freq;										//���������� ��� �������� �������	
extern unsigned int freq_cur;									//���������� �������� ������� �������	

ISR(TIMER0_OVF_vect)											//���������� ������� 0 �� ������������
{
	tim0_int++;													//������� ������ �������
	TCNT0=T0_SEC;												//��������� �������� �����
	if(tim0_int>=T0_NUM_INT) {									//���� ����� �������, �� 
		freq_cur=freq*2;
		freq=0;
		tim0_int=0;
	}
}

ISR(TIMER1_CAPT_vect){											//���������� ������� 1 �� ������� ��������
	freq++;
}

void timers_init(){
	TCCR0|=PRESC_1024;											//��������� ������������ ������� ������� 0
	TCCR1B|=RISSING;											//��������� ������������ ������� ������� 1
	TIMSK|=(1<<TOIE0)|(1<<TICIE1);								//���������� ���������� ������� 0 �� ������������ � ������� 1 �� �������
	TCNT0=T0_SEC;												//��������� �������� �����
	sei();														//��������� ���������� ����������
}
#endif /*TIMERS_H*/