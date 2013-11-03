%Cette règle permet de jouer quel coup l'ia va jouer, de façon aléatoire.

ia(X, Y) :- X is random(8), Y is random(7), add(X, Y, jaune), ! . 
%Si la première règle est fausse (colonne pleine), l'ia rejoue jusqu'à trouver une solution :
ia(X, Y) :- ia(X,Y), !. 
