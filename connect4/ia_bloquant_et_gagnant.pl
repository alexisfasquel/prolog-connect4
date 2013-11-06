%Whenever 3 red pawns are in line, the ia blocks the 4th position and if it can't, it checks if 3 yellow paws are in line and put the 4th one.

ia(X, Y, Color) :- between(1,7,X) ,height(X, Count), Y is Count+1, win(X,  Y, rouge), add(X, _, Color), !. 
ia(X, Y, Color) :- between(1,7,X) ,height(X, Count), Y is Count+1, win(X,  Y, jaune), add(X, _, Color), !. 

%If we don't find 3 in line, we use a random ia :
ia(X, Y, Color) :- X is random(8), add(X, Y, jaune), ! .
ia(X, Y, Color) :- ia(X,Y, Color), !. 