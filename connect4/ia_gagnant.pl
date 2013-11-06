%Whenever 3 yellow pawns are in line, the ia puts the 4th position

ia(X, Y, Color) :- between(1,7,X) ,height(X, Count), Y is Count+1, win(X, Y, Color), add(X, _, Color), !. 

%If we don't find 3 in line, we use a random ia :
ia(X, Y, Color) :- X is random(8), add(X, Y, Color), ! .
ia(X, Y, Color) :- ia(X, Y, Color), !. 