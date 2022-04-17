///////////////////////////////////////////////////////////////////////
/*****************Библиотека для работы софтовым UART*****************/
///////////////////////////////////////////////////////////////////////

#ifndef	SUART_H
#define SUART_H

#define SUART_DDR_TX					DDRD			//настройка порта на выход для TX
#define SUART_PORT_TX					PORTD			//константа обращения к байту порта для TX
#define SUART_PIN_TX					1				//номер бита порта для TX

#define DELAY_9600						110				//Константа задержки для скорости 9600
char del=DELAY_9600;									//Переменная задержки для скорости 9600
#define DELAY for(int i=0;i<del;i++) asm("nop");		//Дурацкая конструкция задержки для передачи данных

void suart_init(){										//Инициализация SUART
	SUART_DDR_TX |= (1 << SUART_PIN_TX);				//Настройка портов
}

void suart_tx(const unsigned char data){				//Передача байта
	SUART_PORT_TX &= ~(1 << SUART_PIN_TX);				//Старт бит
	DELAY
	for(unsigned char i = 0; i < 8; i++){				//Передача байта
		if(((data >> i) & 0x01) != 0)/* Если текущий бит 1*/SUART_PORT_TX |= (1 << SUART_PIN_TX);else/*Если текущий бит 0*/SUART_PORT_TX &= ~(1 << SUART_PIN_TX);
		DELAY
	}
	SUART_PORT_TX |= (1 << SUART_PIN_TX);				//Стоп бит
	DELAY
}

void suart_tx_str(const char *str){						//Передача строки
	while(*str!=0)suart_tx(*str++);
}
#endif /*SUART_H*/
