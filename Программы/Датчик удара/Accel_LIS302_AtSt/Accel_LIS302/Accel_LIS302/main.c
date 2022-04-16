
#include "main.h"														//библиотека хранения общих констант проекта
#include <avr/io.h>
#include <util/delay.h>
#include <stdlib.h>
#include <string.h>
#include <stdio.h>
#include <avr/interrupt.h>
#include <avr/eeprom.h>

#include "lis302.h"														//библиотека констант и функций для работы с акселерометром
#include "uart.h"														//библиотека констант и функций для работы с UARTом
#include "uart_soft.h"													//библиотека констант и функций для работы с софтовым UARTом
#include "timers.h"														//библиотека настройки и работы с таймерами

//переменные для акселерометра глобальные
signed char x, y, z;													//для чтения значений осей из акселерометра
char x_pos=Xout, y_pos=Yout, z_pos=Zout;								//для переопределения осей при сканировании положения в пространстве
unsigned int freq=0;													//переменная для подсчёта частоты
unsigned int freq_cur=0;												//переменная хранения текущей частоты
//переменные для акселерометра глобальные

uint8_t EEMEM porog_xy_eep;												//порог XY в EEPROM
uint16_t EEMEM porog_z_eep;												//порог Z в EEPROM

uint8_t porog_xy=0;														//переменная для хранения порога по XY
uint16_t porog_z=0;														//переменная для хранения порога по Z

int main(void)
{
	char x_buf[AVER_NUM]={0};											//массив хранения AVER_NUM измерений для вычисления среднего значения
	char y_buf[AVER_NUM]={0};											//массив хранения AVER_NUM измерений для вычисления среднего значения
	char z_buf[AVER_NUM]={0};											//массив хранения AVER_NUM измерений для вычисления среднего значения
	char x_aver=0,y_aver=0,z_aver=0;									//переменные для хранения среднего значения измерений по осям
	porog_xy=POROG_XY_R;												//чтение порога XY из eeprom
	porog_z=POROG_Z_R;													//чтение порога Z из eeprom
	DDRB|=(1<<1)|(0<<0);												//настройка PORTB1 на выход, настройка PORTB0 на вход
	PORTB|=(1<<0);														//подтяжка входа к питанию
	i2c_init();															//инициализация софтового i2c
	//init_UART();														//инициализация UARTa
	suart_init();														//инициализация софтового юарта
	timers_init();														//инициализация таймеров
	char buf[100]; for(int i=0;i<100;i++) buf[i]=0;						//буффер строки для вывода сообщений в терминал и его обнуление
	if(init_lis302(0)==OK_ACCEL){										//если акселеромтр ответил, то продолжаем работу, если нет, то зацикливаемся
		print_w("ACCEL OK\r\n");
		}else{
		do{print_w("ACCEL ERROR\r\n"); _delay_ms(200);}while (1);		//зацикливаемся и выдаём сообщение об ошибке
	}	
	position_space();													//определение устройства в пространстве
	init_lis302(1);														//инициализация акселерометра без гравитации
	while (1)
	{
		read_xyz();														//чтение значений акселерометра по осям
		x_aver=aver_arr(x_buf,x);										//вычисление среднего значения по X
		y_aver=aver_arr(y_buf,y);										//вычисление среднего значения по Y
		z_aver=aver_arr(z_buf,z);										//вычисление среднего значения по Z
		sprintf(buf,"%d\t%d\t%d\t%d\t%d\t%d\r\n",x,x_aver,y,y_aver,z,z_aver);	//компановка обычных значений и средних
		//sprintf(buf,"%d\t%d\t%d\r\n",x,y,z);							//компановка только обчных значений
		//print_w(buf);
		suart_tx_str(buf);
		_delay_ms(20);
    }
}