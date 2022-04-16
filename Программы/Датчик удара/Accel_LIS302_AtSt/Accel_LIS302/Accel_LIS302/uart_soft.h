///////////////////////////////////////////////////////////////////////
/*****************���������� ��� ������ �������� UART*****************/
///////////////////////////////////////////////////////////////////////

#ifndef	SUART_H
#define SUART_H

#define SUART_DDR_TX					DDRD			//��������� ����� �� ����� ��� TX
#define SUART_PORT_TX					PORTD			//��������� ��������� � ����� ����� ��� TX
#define SUART_PIN_TX					1				//����� ���� ����� ��� TX

#define DELAY_9600						110				//��������� �������� ��� �������� 9600
char del=DELAY_9600;									//���������� �������� ��� �������� 9600
#define DELAY for(int i=0;i<del;i++) asm("nop");		//�������� ����������� �������� ��� �������� ������

void suart_init(){										//������������� SUART
	SUART_DDR_TX |= (1 << SUART_PIN_TX);				//��������� ������
}

void suart_tx(const unsigned char data){				//�������� �����
	SUART_PORT_TX &= ~(1 << SUART_PIN_TX);				//����� ���
	DELAY
	for(unsigned char i = 0; i < 8; i++){				//�������� �����
		if(((data >> i) & 0x01) != 0)/* ���� ������� ��� 1*/SUART_PORT_TX |= (1 << SUART_PIN_TX);else/*���� ������� ��� 0*/SUART_PORT_TX &= ~(1 << SUART_PIN_TX);
		DELAY
	}
	SUART_PORT_TX |= (1 << SUART_PIN_TX);				//���� ���
	DELAY
}

void suart_tx_str(const char *str){						//�������� ������
	while(*str!=0)suart_tx(*str++);
}
#endif /*SUART_H*/
