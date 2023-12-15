progenitor(jamesPotter, harry).
progenitor(lilyEvans, harry).
progenitor(mollyWeasley, ginny).
progenitor(arthurWeasley, ginny).
progenitor(mollyWeasley, fred).
progenitor(arthurWeasley, fred).
progenitor(mollyWeasley, george).
progenitor(arthurWeasley, george).
progenitor(mollyWeasley, ron).
progenitor(arthurWeasley, ron).
progenitor(harry, jamesSirius).
progenitor(ginny, jamesSirius).
progenitor(harry, albusSeverus).
progenitor(ginny, albusSeverus).
progenitor(harry, lilyLuna).
progenitor(ginny, lilyLuna).
progenitor(ron, rose).
progenitor(hermonie, rose).
progenitor(ron, hugo).
progenitor(hermonie, hugo).
% femenino(lilyEvans).
% femenino(mollyWeasley).
% femenino(ginny).
% femenino(hermonie).
% femenino(lilyLuna).
% femenino(rose).
% masculino(jamesPotter).
% masculino(arthurWeasley).
% masculino(harry).
% masculino(fred).
% masculino(george).
% masculino(ron).
% masculino(jamesSirius).
% masculino(albusSeverus).
% masculino(hugo).

padreDe(Y, X) :- progenitor(Y, X), masculino(Y).
madreDe(Y, X) :- progenitor(Y, X), femenino(Y).
hijoDe(X, Y) :- progenitor(Y, X).
abueloDe(X, Y) :- progenitor(X, Z), progenitor(Z, Y).
hermanoDe(X, Y) :- progenitor(Z, X), progenitor(Z, Y), \+ (X = Y).
primoDe(X, Y) :- progenitor(Z, X), hermanoDe(Z, W), progenitor(W, Y), \+ hermanoDe(X, Y).
tioDe(X, Y) :- progenitor(Z, Y), hermanoDe(Z, X).



talento(juan, cantar).
talento(pedro, cantar).
talento(maria, cantar).
talento(juan, pintar).
talento(patricia, pintar).
talento(lucas, bailar).
talento(pedro, escribir).
talento(luisa, escribir).
talento(ana, escribir).

talentoso(X) :- talento(X, Y), talento(X, Z), Y \= Z.
semejantes(X, Y) :- talento(X, Z), talento(Y, Z), X \= Y.



edad(luis, 20).
edad(juan, 72).
edad(pedro, 40).
edad(julia, 17).
edad(maria, 46).
edad(andres, 50).
edad(rocio, 67).
edad(joaquin, 15).
estadoCivil(luis, soltero).
estadoCivil(juan, viudo).
estadoCivil(pedro, casado).
estadoCivil(julia, casada).
estadoCivil(maria, soltera).
estadoCivil(andres, casado).
estadoCivil(rocio, soltera).
estadoCivil(joaquin, soltero).
masculino(luis).
masculino(juan).
masculino(pedro).
masculino(andres).
masculino(joaquin).
femenino(julia).
femenino(maria).
femenino(rocio).

menorDeEdad(X) :- edad(X, Y), Y < 18.
jubilacion(X) :- (femenino(X), edad(X, Y), Y >= 60) ; (masculino(X), edad(X, Y), Y >= 65).
mayorQue(X, Y) :- edad(X, Z), edad(Y, W), Z > W.
coetaneo(X, Y) :- edad(X, Z), edad(Y, W), abs(Z - W) < 10, X \= Y.



% Base de Conocimiento ALMACEN DON MANOLO

producto(lacteo, leche).
producto(lacteo, manteca).
producto(lacteo, crema).
producto(lacteo, yogurt).
producto(fiambre, queso).
producto(fiambre, jamonCrudo).
producto(fiambre, jamonCocido).
producto(fiambre, salame).
producto(panaderia, pan).
producto(panaderia, factura).
producto(panaderia, tortilla).
producto(panaderia, galleta).
producto(bebida, agua).
producto(bebida, gaseosa).
producto(bebida, jugo).
producto(bebida, soda).
producto(golosina, chocolate).
producto(golosina, caramelo).
producto(golosina, mantecol).
producto(golosina, bombones).
producto(golosina, nugaton).

precio(leche, 77).
precio(manteca, 62).
precio(crema, 95).
precio(yogurt, 53).
precio(queso, 80).
precio(jamonCrudo, 170).
precio(jamonCocido, 100).
precio(salame, 85).
precio(pan, 80).
precio(factura, 20).
precio(tortilla, 10).
precio(galleta, 75).
precio(agua, 86).
precio(gaseosa, 130).
precio(jugo, 98).
precio(soda, 100).
precio(chocolate, 116).
precio(caramelo, 35).
precio(mantecol, 87).
precio(bombones, 140).
precio(nugaton, 51).

lacteosMasCarosQue(X, Y) :- producto(lacteo, X), precio(X, Z), Z > Y.
promo(X, Y) :- producto(Z, X), producto(Z, Y), precio(X, S), precio(Y, T), (S + T) / 2 < 200.



nPares(0) :- write(0).
nPares(X) :- X1 is X - 1, nPares(X1), Z is X * 2, write(Z).

sumDig(X, R) :- X < 10, R is X.
sumDig(X, R) :-
    X > 9,
    Digito is X mod 10,
    RestoNro is X // 10,
    sumDig(RestoNro, Y),
    R is Y + Digito.

mayorDigito(X, R) :- X < 10, R is X.
mayorDigito(X, R) :-
    X > 9,
    Digito is X mod 10,
    RestoNro is X // 10,
    mayorDigito(RestoNro, Y),
    R is max(Y, Digito).


crearLista(0, []).
crearLista(N, [N|T]) :-
    N > 0,
    N1 is N - 1,
    crearLista(N1, T).

eliminarDeLista(X, [], []).
eliminarDeLista(X, [X | T], R) :- eliminarDeLista(X, T, R).
eliminarDeLista(X, [Y | T], [Y | R]) :- eliminarDeLista(X, T, R).