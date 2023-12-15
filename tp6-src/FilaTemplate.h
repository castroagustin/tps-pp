#include <iostream>
using namespace std;


#include <iostream>

template<typename X>
struct NodoG {
    X dato;
    NodoG<X>* siguiente;
};

template <typename X>
class FilaG {
    NodoG<X>* frente;
    NodoG<X>* final;
    int longitud;

public:
    FilaG();
    FilaG(const FilaG<X> &);

    bool FilaVacia();
    X Frente();
    void Defila();
    void Enfila(X valor);
    int Longitud();
    bool Pertenece(X valor);
    ~FilaG();

    friend class IteradorDeFila;
};


template <class X>
FilaG<X>::FilaG() {
	frente = NULL;
	final = NULL;
	longitud = 0;
}
/*
template <class X>
FilaG<X>::FilaG(const FilaG<X> &f) {
	frente = f.frente;
	final = f.final;
	longitud = 0;
}
*/
template <class X>
bool FilaG<X>:: FilaVacia() {
	return frente == NULL;
}

template <class X>
X FilaG<X>::Frente() {
	if (FilaVacia()) {
		cout << "La fila está vacía." << endl;
		return 0;
	}
	return frente->dato;
}

template <class X>
void FilaG<X>::Defila() {
	if (FilaVacia()) {
		cout << "No se puede eliminar, la fila está vacía." << endl;
        return;
	}
	NodoG<X>* aux = frente;
    frente = frente->siguiente;
    delete aux;
    longitud--;

    if (frente == NULL) {
    	final = NULL;
	}
}

template <class X>
void FilaG<X>::Enfila(X valor) {
	NodoG<X>* nuevoNodo = new NodoG<X>();
    nuevoNodo->dato = valor;
    nuevoNodo->siguiente = NULL;

    if (FilaVacia()) {
        frente = nuevoNodo;
        final = nuevoNodo;
    } else {
        final->siguiente = nuevoNodo;
        final = nuevoNodo;
    }
    longitud++;
}

template <class X>
int FilaG<X>::Longitud() {
	return longitud;
}

template <class X>
bool FilaG<X>::Pertenece(X valor) {
	NodoG<X>* aux = frente;
    while (aux != NULL) {
        if (aux->dato == valor) {
            return true;
        }
        aux = aux->siguiente;
    }
    return false;
}

template <class X>
FilaG<X>::~FilaG() {
    while (!FilaVacia()) {
        Defila();
    }
}
