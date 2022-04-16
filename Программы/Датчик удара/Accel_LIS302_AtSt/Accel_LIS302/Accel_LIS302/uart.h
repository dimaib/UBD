#include "main.h"

#define buffer_MAX 100										//Длина текстового буффера
char buffer[buffer_MAX] = "0"; 								//А вот и он сам
uint8_t buffer_index=0;										//инкремент для отправки
char buffer_rx[buffer_MAX]="";								//буфер для приёма
uint8_t buf_rx_index=0;										//инкремент для приёма

extern uint8_t porog_xy;									//переменная для хранения порога по XY
extern uint16_t porog_z;									//переменная для хранения порога по Z

void init_UART()											//Инициализация UARTa
{
	#define BAUDRATE 9600
	UBRRH = ((unsigned)(F_CPU / (16.0 * BAUDRATE) - 1) >> 8) & 0x0F;
	UBRRL = ((unsigned)(F_CPU / (16.0 * BAUDRATE) - 1) >> 0) & 0xFF;
	UCSRB = 1<<RXEN|1<<TXEN|1<<RXCIE|0<<TXCIE;				//разрешение приёма и передачи. Разрешение прерывания по приёму байта
	UCSRC = 1<<URSEL|1<<UCSZ0|1<<UCSZ1|0<<UCSZ2|0<<UPM0|0<<UPM1|0<<USBS;
	sei();													//разрешение перываний
}

void print_byte(const unsigned char c)						//Отправка байта. С ожиданием
{
	while(!(UCSRA&(1<<UDRE))){}								//Устанавливается, когда регистр свободен
	UDR = c;												//спихиваем в буфер передаваемый байт
}

void print_w(const char *s)									//Отправка строки. С ожиданием
{
	while (*s!=0) print_byte(*s++);
}

ISR(USART_RXC_vect)											//обработка прерывыния по приёму байта
{
	char bf=UDR;											//считывание присланного байта
	UDR=bf;													//отправка в порт присланного байта
	if(buf_rx_index<buffer_MAX){
		if(bf!=13&&bf!=10){
			buffer_rx[buf_rx_index]=bf;						//добавляем в буффер присланный байт
			buf_rx_index++;									//увеличиваем счётчик присланных байтов
			}else{											//завершение приёма, если пришёл символ 13 (возвращение карретки)
			if(buffer_rx[0]==0xAA){							//если стартовый бит равен 10101010 (DEC: 170)
				unsigned int summ_crc=buffer_rx[0]&0x0F;	//инициализация переменной для контрольной
				for(char i=1;i<buf_rx_index-1;i++)
					summ_crc+=(buffer_rx[0]&0x0F);			//подсчёт контрольной суммы
				if(summ_crc==buffer_rx[buf_rx_index]){		//если прислынная crc совпадает с расчитанной
					//формат посылки побайтно:
					//[0]-стартовый байт. Всегда 0xAA
					//[1]-младший байт порога по Z
					//[2]-старший байт порога по Z
					//[3]-байт порога по XY
					//[4]-crc посылки
					uint16_t tmp_porog=(buffer_rx[2]<<8)|buffer_rx[1];	//соединение 1 и 2 байта в одну переменную
					if(porog_xy!=buffer_rx[3]||porog_z!=tmp_porog){		//если присланные пороги не совпадают с текущими
						
					}					
				}	
			}
			
			//if(!strcmp(buffer_rx,"123")) PORTB=0b10101010; else PORTB=0; //сравнение присланного значения
			
			for(int i=0;i<buffer_MAX;i++)  buffer_rx[i]=0; //сброс буффера
			buf_rx_index=0;
		}
	}
}

