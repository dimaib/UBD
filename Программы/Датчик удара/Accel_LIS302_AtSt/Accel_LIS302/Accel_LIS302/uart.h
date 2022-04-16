#include "main.h"

#define buffer_MAX 100										//����� ���������� �������
char buffer[buffer_MAX] = "0"; 								//� ��� � �� ���
uint8_t buffer_index=0;										//��������� ��� ��������
char buffer_rx[buffer_MAX]="";								//����� ��� �����
uint8_t buf_rx_index=0;										//��������� ��� �����

extern uint8_t porog_xy;									//���������� ��� �������� ������ �� XY
extern uint16_t porog_z;									//���������� ��� �������� ������ �� Z

void init_UART()											//������������� UARTa
{
	#define BAUDRATE 9600
	UBRRH = ((unsigned)(F_CPU / (16.0 * BAUDRATE) - 1) >> 8) & 0x0F;
	UBRRL = ((unsigned)(F_CPU / (16.0 * BAUDRATE) - 1) >> 0) & 0xFF;
	UCSRB = 1<<RXEN|1<<TXEN|1<<RXCIE|0<<TXCIE;				//���������� ����� � ��������. ���������� ���������� �� ����� �����
	UCSRC = 1<<URSEL|1<<UCSZ0|1<<UCSZ1|0<<UCSZ2|0<<UPM0|0<<UPM1|0<<USBS;
	sei();													//���������� ���������
}

void print_byte(const unsigned char c)						//�������� �����. � ���������
{
	while(!(UCSRA&(1<<UDRE))){}								//���������������, ����� ������� ��������
	UDR = c;												//��������� � ����� ������������ ����
}

void print_w(const char *s)									//�������� ������. � ���������
{
	while (*s!=0) print_byte(*s++);
}

ISR(USART_RXC_vect)											//��������� ���������� �� ����� �����
{
	char bf=UDR;											//���������� ����������� �����
	UDR=bf;													//�������� � ���� ����������� �����
	if(buf_rx_index<buffer_MAX){
		if(bf!=13&&bf!=10){
			buffer_rx[buf_rx_index]=bf;						//��������� � ������ ���������� ����
			buf_rx_index++;									//����������� ������� ���������� ������
			}else{											//���������� �����, ���� ������ ������ 13 (����������� ��������)
			if(buffer_rx[0]==0xAA){							//���� ��������� ��� ����� 10101010 (DEC: 170)
				unsigned int summ_crc=buffer_rx[0]&0x0F;	//������������� ���������� ��� �����������
				for(char i=1;i<buf_rx_index-1;i++)
					summ_crc+=(buffer_rx[0]&0x0F);			//������� ����������� �����
				if(summ_crc==buffer_rx[buf_rx_index]){		//���� ���������� crc ��������� � �����������
					//������ ������� ��������:
					//[0]-��������� ����. ������ 0xAA
					//[1]-������� ���� ������ �� Z
					//[2]-������� ���� ������ �� Z
					//[3]-���� ������ �� XY
					//[4]-crc �������
					uint16_t tmp_porog=(buffer_rx[2]<<8)|buffer_rx[1];	//���������� 1 � 2 ����� � ���� ����������
					if(porog_xy!=buffer_rx[3]||porog_z!=tmp_porog){		//���� ���������� ������ �� ��������� � ��������
						
					}					
				}	
			}
			
			//if(!strcmp(buffer_rx,"123")) PORTB=0b10101010; else PORTB=0; //��������� ����������� ��������
			
			for(int i=0;i<buffer_MAX;i++)  buffer_rx[i]=0; //����� �������
			buf_rx_index=0;
		}
	}
}

