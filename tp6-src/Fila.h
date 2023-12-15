#include <iostream>
using namespace std;

#ifndef FILAINT_H_
#define FILAINT_H_

#include <iostream>

// Definición de la estructura del nodo
struct Nodo {
    int dato;
    Nodo* siguiente;
};

class Fila {
    Nodo* frente;
    Nodo* final;
    int longitud;

public:
    Fila() : frente(NULL), final(NULL), longitud(0) {}

    // Verifica si la fila está vacía
    bool FilaVacia() {
        return frente == NULL;
    }

    // Devuelve el elemento en el frente de la fila
    int Frente() {
        if (FilaVacia()) {
            cout << "La fila está vacía." << endl;
            return -1;
        }
        return frente->dato;
    }

    // Elimina el elemento en el frente de la fila
    void Defila() {
        if (FilaVacia()) {
            cout << "No se puede eliminar, la fila está vacía." << endl;
            return;
        }
        Nodo* aux = frente;
        frente = frente->siguiente;
        delete aux;
        longitud--;

        if (frente == NULL) {
            final = NULL;
        }
    }

    // Añade un elemento al final de la fila
    void Enfila(int valor) {
        Nodo* nuevoNodo = new Nodo();
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

    // Devuelve la longitud de la fila
    int Longitud() {
        return longitud;
    }

    // Verifica si un elemento está en la fila
    bool Pertenece(int valor) {
        Nodo* aux = frente;
        while (aux != NULL) {
            if (aux->dato == valor) {
                return true;
            }
            aux = aux->siguiente;
        }
        return false;
    }

    // Destructor para liberar la memoria de los nodos
    ~Fila() {
        while (!FilaVacia()) {
            Defila();
        }
    }

    friend class IteradorDeFila;
};

#endif /* FILA_H_ */
