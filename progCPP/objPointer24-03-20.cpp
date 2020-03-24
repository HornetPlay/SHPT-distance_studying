#include <iostream>
using namespace std;
class simpleClass {
	int closed;
public:
	int bam = 29;
	double div(double a, double b) {
		double out = (double)(a / b);
		return out;
	}
	void show() {
		cout << "bam = " << bam << endl;
	}

} simpleObj;
int main() {
	int simpleClass::* pointer; // указатель на любое поле с типом int класса simpleClass
	int simpleClass::* pointerCls;
	simpleClass* objp;// указатель на объект
	objp = &simpleObj; // присваиваем указателю объект
	pointer = &simpleClass::bam;  // указатель на публичную переменную bam

	/* pointerCls = &simpleClass::closed; */  // закрытое свойство недоступно

	/*можно вывести что так:*/
	cout << "pointer before = " << objp->*pointer << endl; // вывод = 29
	simpleObj.*pointer = 15; // переопределяем через указатель
	/*и так :*/
	cout << "pointer after = " << simpleObj.*pointer << endl;// вывод = 15
	
	double x = 65, y = 127;
	double (simpleClass::* func)(double a, double b); // создание указателя на метод
	func = &simpleClass::div;  // присваиваем указателю метод
	cout << "divide1 = " << (double)(simpleObj.*func)(x, y) << endl; // вывод ч/з объект
	cout << "divide2 = " << (double)(objp->*func)(x, y) << endl; // вывод ч/з указатель на объект
	return 0;
}