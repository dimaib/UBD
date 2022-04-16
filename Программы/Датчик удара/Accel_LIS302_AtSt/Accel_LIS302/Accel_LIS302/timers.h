#include <avr/interrupt.h>
#include <util/delay.h>

//#include "main.h"

#ifndef TIMERS_H
#define  TIMERS_H

#define PRESC_1					(0<<CS12)|(0<<CS11)|(1<<CS10)	//делитель частоты процессора на 1
#define PRESC_8					(0<<CS12)|(1<<CS11)|(0<<CS10)	//делитель частоты процессора на 8
#define PRESC_64				(0<<CS12)|(1<<CS11)|(1<<CS10)	//делитель частоты процессора на 64
#define PRESC_256				(1<<CS12)|(0<<CS11)|(0<<CS10)	//делитель частоты процессора на 256
#define PRESC_1024				(1<<CS12)|(0<<CS11)|(1<<CS10)	//делитель частоты процессора на 1024
#define	FALLING					(1<<CS12)|(1<<CS11)|(0<<CS10)	//константа захвата по falling (110)
#define	RISSING					(1<<CS12)|(1<<CS11)|(1<<CS10)	//константа захвата по rissing (111)
#define TIM0_MAX				255								//разрешение 8 битного таймера
#define TIM1_MAX				65536							//разрешение 16 битного таймера
#define T0_PRESC				1024							//предделитель частоты таймера 0
#define T1_PRESC				8								//предделитель частоты таймера 1
#define T0_SEC					F_CPU/T0_PRESC					//тактов в секунду таймера 0
#define T1_SEC					F_CPU/T1_PRESC					//тактов в секунду таймера 1
#define T0_NUM_INT				T0_SEC/TIM0_MAX					//кол-во прерываний в секунду таймера 0

char tim0_int=0;												//переменная для подсчёта циклов таймера 0
extern unsigned int freq;										//переменная для подсчёта частоты	
extern unsigned int freq_cur;									//переменная хранения текущей частоты	

ISR(TIMER0_OVF_vect)											//прерывание таймера 0 по переполнению
{
	tim0_int++;													//подсчёт циклов таймера
	TCNT0=T0_SEC;												//начальное значение счёта
	if(tim0_int>=T0_NUM_INT) {									//если ждали секунду, то 
		freq_cur=freq*2;
		freq=0;
		tim0_int=0;
	}
}

ISR(TIMER1_CAPT_vect){											//прерывание таймера 1 по захвату импульса
	freq++;
}

void timers_init(){
	TCCR0|=PRESC_1024;											//настройка предделителя частоты таймера 0
	TCCR1B|=RISSING;											//настройка предделителя частоты таймера 1
	TIMSK|=(1<<TOIE0)|(1<<TICIE1);								//разрешение прерывания таймера 0 по переполнению и таймера 1 по захвату
	TCNT0=T0_SEC;												//начальное значение счёта
	sei();														//разрешить глобальные прерывания
}
#endif /*TIMERS_H*/