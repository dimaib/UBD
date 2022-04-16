//////////////////////////////////////////////////////////////
/************���������� ��� ������ � �������� i2c************/
//////////////////////////////////////////////////////////////

//    		 ����������� � ������� ��, ��������
#define SDA			5									//����� ������, SDA
#define SCL			4									//����� ������������, SCL
#define I2C_PORT	PORTC								//��� ������� ����, �������� PORTB ��� PORTC
#define I2C_PIN		PINC								//��� ������� ����, �������� PINB ��� PINC
#define I2C_DDR		DDRC								//��� ������� ����, �������� DDRB ��� DDRC
// ��� �������� ��� ������ ���� i2c, ��������� ��� ����� ������ ���� ������, ��� �������!!!
#define I2C_DELAY	_delay_us(10);						//�� ��������� �������� 10 �����������
//           ��������� ���������� � ����������
#include <util/delay.h>
volatile unsigned char i2c_frame_error=0; //���� > 0, ������ ��������� �����-������ (����� STOP-�������, ����� SDA � SCL �� ������� � ��������� HIGH, �� ����������� � + �������)

//��������� �������
void i2c_init (void);									//����������� ������ ����������������
void i2c_start_cond (void);								//���������� ������� ������
void i2c_restart_cond (void);							//���������� ������� ���������� ������
void i2c_stop_cond (void);								//���������� ������� ����
unsigned char i2c_send_byte (unsigned char data);		//���������� ACK, ���� = 1 ������ ������ �������� ���������, ���� = 0 ������ ������ �������� �������, data ��� ������������ ����
unsigned char i2c_get_byte (unsigned char last_byte);	//���������� ��������� ����, last_byte = 1 �������� ��� ��������� ��������� ����, last_byte = 0 �������� ��� ����� ��������� ��� ����

void i2c_stop_cond(void)								//��������� ������� ����
{
	I2C_DDR |= (1<<SCL);	I2C_DELAY					//��������� SCL (���.0)
	I2C_DDR |= (1<<SDA);	I2C_DELAY					//��������� SDA (���.0)
	I2C_DDR &= ~(1<<SCL);	I2C_DELAY					//��������� SCL (���.1)
	I2C_DDR &= ~(1<<SDA);	I2C_DELAY					//��������� SDA (���.1)
	//�������� �����-������
	i2c_frame_error=0;									//����� �������� �����-������
	if ((I2C_PIN & (1<<SDA)) == 0) i2c_frame_error++;	//���������, ����� �� ���� SDA ���� ���.1, ����� ����� ������ ������
	if ((I2C_PIN & (1<<SCL)) == 0) i2c_frame_error++;	//���������, ����� �� ���� SCL ���� ���.1, ����� ����� ������ ������
	I2C_DELAY	I2C_DELAY	I2C_DELAY	I2C_DELAY
}

void i2c_init (void) {									//������������� ���� I2C
	I2C_DDR &= ~(1<<SDA);								//����� DDR=0, ����� SDA ����� � �������, ����� DDR=1 �� SDA ��������� � ����� (��������� DDR �� � ����� ��������������)
	I2C_DDR &= ~(1<<SCL);								//����� DDR=0, ����� SCL ����� � �������, ����� DDR=1 �� SCL ��������� � ����� (��������� DDR �� � ����� ��������������)
	I2C_PORT &= ~(1<<SDA);								//PORT=0 ��������, ��� ����� DDR=1 �� SDA ��������� � �����, ����� DDR=0, �� SDA ����� � �������
	I2C_PORT &= ~(1<<SCL);								//PORT=0 ��������, ��� ����� DDR=1 �� SCL ��������� � �����, ����� DDR=0, �� SCL ����� � �������
	i2c_stop_cond();									//���� ���� �� ������ �����
	i2c_stop_cond();									//���� ���� �� ������ �����
}

void i2c_start_cond (void)								//��������� ������� �����
{	
	I2C_DDR |= (1<<SDA);	I2C_DELAY					//��������� SDA (���.0)
	I2C_DDR |= (1<<SCL);	I2C_DELAY							//��������� SCL (���.0)
}

void i2c_restart_cond (void)							//��������� ������� �������
{	
	I2C_DDR &= ~(1<<SDA);	I2C_DELAY					//��������� SDA (���.1)
	I2C_DDR &= ~(1<<SCL);	I2C_DELAY					//��������� SCL (���.1)
	I2C_DDR |= (1<<SDA);	I2C_DELAY					//��������� SDA (���.0)
	I2C_DDR |= (1<<SCL);	I2C_DELAY					//��������� SCL (���.0)
}

unsigned char i2c_send_byte (unsigned char data)		//�������� ����� �� I2�	
{	
	unsigned char ack=1;								//���, ���� ���=1 � ��������� ������
	for (unsigned char i=0;i<8;i++){
		if ((data&0x80)==0x00) I2C_DDR |= (1<<SDA);		//��������� ��� �� SDA (���.0)
		else I2C_DDR &= ~(1<<SDA); // ���.1
		I2C_DELAY	I2C_DDR &= ~(1<<SCL);	I2C_DELAY	//�������� ��� ��������� �� SCL       // ��������� SCL (���.1)
		I2C_DDR |= (1<<SCL);							//�������� SCL (���.0)
		data=data<<1;
	}
	I2C_DDR &= ~(1<<SDA);	I2C_DELAY					//��������� SDA (���.1), ����� ������� ���������� ������ ������������� ACK
	I2C_DDR &= ~(1<<SCL);	I2C_DELAY					//��������� SCL (���.1), ����� ������� ���������� �������� ACK
	if ((I2C_PIN&(1<<SDA))==(1<<SDA)) ack=1; else ack=0;//������� ACK
	I2C_DDR |= (1<<SCL);								// ��������� SCL (���.0)  // ���� ACK ��������
	return ack;											// ������� ACK (0) ��� NACK (1)
}

unsigned char i2c_get_byte (unsigned char last_byte)	//���������� ����� �� I2C
{	
	unsigned char res=0;
	I2C_DDR &= ~(1<<SDA);								//��������� SDA (���.1)
	for (char i=0;i<8;i++){
		res=res<<1;
		I2C_DDR &= ~(1<<SCL);	I2C_DELAY				// ��������� SCL (���.1)		//������� �� SCL
		if ((I2C_PIN&(1<<SDA))==(1<<SDA)) res=res|0x01; // ������ SDA � ����������
		I2C_DDR |= (1<<SCL);	I2C_DELAY				// ��������� SCL (���.0)
	}
	if (last_byte==0) I2C_DDR |= (1<<SDA);				// ��������� SDA (���.0)		// �������������, ACK, ����� ��������� ��� ���� ����
	else I2C_DDR &= ~(1<<SDA);							// ��������� SDA (���.1)
	I2C_DELAY											// ��� �������������, NACK, ��� ��������� ��������� ����
	I2C_DDR &= ~(1<<SCL);		I2C_DELAY				// ��������� SCL (���.1)
	I2C_DDR |= (1<<SCL);		I2C_DELAY				// ��������� SCL (���.0)
	I2C_DDR &= ~(1<<SDA);								// ��������� SDA (���.1)
	return res;											// ������� ��������� ��������
}









