% This ia plays randomly

ia(X, Y) :- X is random(8), add(X, Y, jaune), ! .
%If the first rules is false (full column), the ia plays again until finding a solution  :
ia(X, Y) :- ia(X,Y), !. 
