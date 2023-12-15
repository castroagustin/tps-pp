#include <iostream>
using namespace std;

#include <iostream>

#include "Fila.h"

class IteradorDeFila {
	const Fila &fila;
	Nodo* actual;

public:
	IteradorDeFila(const Fila &f):fila(f),actual(fila.frente){};
	bool hayMasElementos() {
		return actual != NULL;
	}
	int elementoActual() {
		return actual->dato;
	}
	void avanzar() {
		actual = actual->siguiente;
	}
};

