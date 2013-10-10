/* Création et initialisation de la liste des positions*/

:-dynamic (liste_jeu/1).
liste_jeu(L):- length(L, 42), fill(L,-,42).

/* Prédicats utiles */


fill([], _, 0).
fill([X|Xs], X, N) :- N0 is N-1, fill(Xs, X, N0).

------------------en cours en dessous, au dessus ça marche !-----------

afficher_jeu([X|R]) :- liste_jeu([X|R]), write(X), nl, afficher_jeu(R).
