//============================================================================
// Name        : tp6.cpp
// Author      : 
// Version     :
// Copyright   : Your copyright notice
// Description : Hello World in C++, Ansi-style
//============================================================================

#include <iostream>
using namespace std;

#include "Fila.h"
#include "FilaTemplate.h"
#include "Iterador.h"

int contarX(IteradorDeFila it, int x);
template <class ITEM>
int contarXGen(IteradorDeFila it, ITEM x);

int main() {
	Fila fila;
	fila.Enfila(3);
	fila.Enfila(4);
	fila.Enfila(3);
	fila.Enfila(5);

	IteradorDeFila it(fila);
	/*
	int cant = fila.Longitud();
	for (int i = 0; i < cant; i++) {
		cout<<fila.Frente()<<endl;
		fila.Defila();
	}

	int cant = fila.Longitud();
	for (int i = 0; i < cant; i++) {
		cout<<it.elementoActual()<<endl;
		it.avanzar();
	}

	cout<<"elementos iguales: "<< contarX(it, 3)<<endl;
	*/

	FilaG<char> fChar;

	fChar.Enfila('a');
	fChar.Enfila('e');
	fChar.Enfila('i');



	int cant = fChar.Longitud();
	for (int i = 0; i < cant; i++) {
		cout<<fChar.Frente()<<endl;
		fChar.Defila();
	}

	FilaG<string> fString;
	fString.Enfila("Agustin");
	fString.Enfila("Juan");
	fString.Enfila("Pedro");

	int cant2 = fString.Longitud();
	for (int i = 0; i < cant2; i++) {
		cout<<fString.Frente()<<endl;
		fString.Defila();
	}

	FilaG<int> fInt;
	fInt.Enfila(1);
	fInt.Enfila(2);
	fInt.Enfila(3);

	int cant3 = fInt.Longitud();
	for (int i = 0; i < cant3; i++) {
		cout<<fInt.Frente()<<endl;
		fInt.Defila();
	}


	return 0;
}

int contarX(IteradorDeFila it, int x) {
	int cant = 0;
	while (it.hayMasElementos()) {
		if (it.elementoActual() == x) {
			cant++;
		}
		it.avanzar();
	}
	return cant;
}
