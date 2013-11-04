%Whenever 3 red pawns are in line, the ia blocks the 4th position

ia(X, Y) :- between(1,7,X) ,height(X, Count), Y is Count+1, win(X,  Y, rouge), add(X, _, jaune), !. 

%If we don't find 3 in line, we use a random ia :
ia(X, Y) :- X is random(8), add(X, Y, jaune), ! .
ia(X, Y) :- ia(X,Y), !. 