:- dynamic colonne/2.
colonne(1,[0,0,0,0,0,0]).
colonne(2,[0,0,0,0,0,0]).
colonne(3,[0,0,0,0,0,0]).
colonne(4,[0,0,0,0,0,0]).
colonne(5,[0,0,0,0,0,0]).
colonne(6,[0,0,0,0,0,0]).
colonne(7,[0,0,0,0,0,0]).


ajouterpion(J,C,Q,R):-
colonne(C,[X|Q]),insertpion(J,[X|Q],R),retract(colonne(C,[X|Q])),assert(colonne(C,R)).

insertpion(J,[0|Q],[J|Q]):-!.
insertpion(J,[T|Q],[T|R]):-insertpion(J,Q,R).

verifiercolonne([X|Q]):-nth1(4,[X|Q],X),nth1(3,[X|Q],X),nth1(2,[X|Q],X),!.
verifiercolonne([X|Q]):-verifiercolonne(Q).

