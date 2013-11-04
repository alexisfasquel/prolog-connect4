ia(X, Y) :- between(1,7,X) ,height(X, Count), Y is Count+1, win(X,  Y, jaune), add(X, _, jaune), !. 

%Si on ne trouve pas de coup bloquant, on lance l'ia aléatoire : 
ia(X, Y) :- X is random(8), add(X, Y, jaune), ! .
%Si la première règle est fausse (colonne pleine), l'ia rejoue jusqu'à trouver une solution :
ia(X, Y) :- ia(X,Y), !. 