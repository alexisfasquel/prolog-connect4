:- dynamic colonne/2.
colonne(1,[0,0,0,0,0,0]).
colonne(2,[0,0,0,0,0,0]).
colonne(3,[1,0,0,0,0,0]).
colonne(4,[1,0,0,0,0,0]).
colonne(5,[1,0,0,0,0,0]).
colonne(6,[1,0,0,0,0,0]).
colonne(7,[0,0,0,0,0,0]).


ajouterpion(J,C):-
colonne(C,[X|Q]),insertpion(J,[X|Q],R),retract(colonne(C,[X|Q])),assert(colonne(C,R)), afficher.

insertpion(J,[0|Q],[J|Q]):-!.
insertpion(J,[T|Q],[T|R]):-insertpion(J,Q,R).



element(1,X,[X|_]).
element(I,X,[_|Q]):- (integer(I), I1 is I-1, element(I1,X,Q)), ! ;(element(I1,X,Q), I is I1+1).

vecteurligne(I,X):-
colonne(1,A), element(I,A1,A),
colonne(2,B), element(I,B1,B),
colonne(3,C), element(I,C1,C),
colonne(4,D), element(I,D1,D),
colonne(5,E), element(I,E1,E),
colonne(6,F), element(I,F1,F),
colonne(7,G), element(I,G1,G),
X=[A1,B1,C1,D1,E1,F1,G1].


afficher:-
colonne(1,A),write(A),nl,
colonne(2,B),write(B),nl,
colonne(3,C),write(C),nl,
colonne(4,D),write(D),nl,
colonne(5,E),write(E),nl,
colonne(6,F),write(F),nl,
colonne(7,G),write(G),nl.

verifiercolonne([X|Q]):-nth1(4,[X|Q],X),nth1(3,[X|Q],X),nth1(2,[X|Q],X),X>0,!.
verifiercolonne([X|Q]):-verifiercolonne(Q).

verifierligne(I):-vecteurligne(I,X), verifiercolonne(X).
