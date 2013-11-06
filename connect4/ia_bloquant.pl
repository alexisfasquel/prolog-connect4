%Whenever 3 red pawns are in line, the ia blocks the 4th position

ia(X, Y, Color) :- Color == jaune, between(1,7,X) ,height(X, Count), Y is Count+1, win(X,  Y, rouge), add(X, _, jaune), !. 
ia(X, Y, Color) :- Color == rouge, between(1,7,X) ,height(X, Count), Y is Count+1, win(X,  Y, jaune), add(X, _, rouge), !.

%If we don't find 3 in line, we use a random ia :
ia(X, Y, Color) :- X is random(8), add(X, Y, Color), ! .
ia(X, Y, Color) :- ia(X,Y, Color), !. 