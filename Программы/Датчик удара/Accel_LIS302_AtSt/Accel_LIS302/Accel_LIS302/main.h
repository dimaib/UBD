///////////////////////////////////////////////////////////////////////
/*********************************************************************/
///////////////////////////////////////////////////////////////////////
#include <stdlib.h>
#include <avr/eeprom.h>


#define F_CPU			8000000UL												//частота работы контроллера

#define TOGGLE_LED		PORTB^=(1<<1);											//мигнуть светодиодом
#define SET_LED			PORTB|=(1<<1);											//включить светодиод
#define RES_LED			PORTB&=~(1<<1);											//выключить светодиод
#define AVER_NUM		4														//кол-во измерений длЯ усреднения значений
#define POROG_XY_R		eeprom_read_byte(&porog_xy_eep)							//чтение порога XY из eeprom
#define POROG_Z_R		eeprom_read_word(&porog_z_eep)							//чтение порога Z из eeprom



#ifndef MAIN_H
#define MAIN_H

char aver_arr(char *arr/*массив*/, char xyz/*текущее значение акселерометра*/)	//функция вычисляющая среднее значение
{
	unsigned int summ=xyz;														//переменная для хранения суммы
	for(int i=1;i<AVER_NUM;i++){												//цикл смещения массива и суммирования показаний акселерометра
		arr[i-1]=arr[i];														//смещение массива влево
		summ+=arr[i];															//суммирование показаний
	}
	arr[AVER_NUM-1]=xyz;														//добавление в конец массива текущего показания акселерометра
	return summ/AVER_NUM;
}
#endif

