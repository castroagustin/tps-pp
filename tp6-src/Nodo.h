/*
 * Nodo.h
 *
 *  Created on: 12/12/2014
 *      Author: Graciela
 */

#ifndef NODO_H_
#define NODO_H_
#include <iostream>
#define INDEFINIDO -9999

typedef int item;
using namespace std;

class Nodo {
	item dato;
	Nodo *sig;
public:
	Nodo(item d, Nodo*s=NULL):dato(d),sig(s){};

	item getDato(){ return dato;};

	Nodo* getSiguiente(){return sig;};

	void setDato(item d){dato=d;};

	void setSiguiente(Nodo* s){sig=s;};

	virtual ~Nodo(){};
};
#endif /* NODO_H_ */
