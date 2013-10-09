:- dynamic colonne/2.
colonne(1,[0,0,0,0,0,0]).
colonne(2,[0,0,0,0,0,0]).
colonne(3,[0,0,0,0,0,0]).
colonne(4,[0,0,0,0,0,0]).
colonne(5,[0,0,0,0,0,0]).
colonne(6,[0,0,0,0,0,0]).
colonne(7,[0,0,0,0,0,0]).


ajouterpion(J,C):-
colonne(C,[X|Q]),insertpion(J,[X|Q],R),retract(colonne(C,[X|Q])),assert(colonne(C,R)), afficher.

insertpion(J,[0|Q],[J|Q]):-!.
insertpion(J,[T|Q],[T|R]):-insertpion(J,Q,R).

verifiercolonne([X|Q]):-nth1(4,[X|Q],X),nth1(3,[X|Q],X),nth1(2,[X|Q],X),!.
verifiercolonne([X|Q]):-verifiercolonne(Q).

afficher:-
colonne(1,A),write(A),nl,
colonne(2,B),write(B),nl,
colonne(3,C),write(C),nl,
colonne(4,D),write(D),nl,
colonne(5,E),write(E),nl,
colonne(6,F),write(F),nl,
colonne(7,G),write(G),nl.






