/* Création et initialisation de la liste des positions*/

:- dynamic (liste_jeu/1).
liste_jeu(L):- length(L, 42), fill(L,-,42).



/* Prédicats utiles */


fill([], _, 0).
fill([X|Xs], X, N) :- N0 is N-1, fill(Xs, X, N0).

take([], N, []) :- N > 0, !.  
take(_, 0, []) :-!.  
take([H|T], N1, [H|Rest]) :- N1 > 0, succ(N0, N1), take(T, N0, Rest).

compte([],0).
compte([_|R],N) :- compte(R,N1), N is N1+1, N>0.


afficher_jeu:- liste_jeu(L),take(L,7,R),write(R),nl,take(R,7,S),write(S),nl,take

(S,7,T),write(T),nl,take(T,7,U),write(U),nl,take(U,7,V),write(V),nl,take

(V,7,W),write(W),nl.




