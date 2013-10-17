%Always returns true
%This rules determins what move the ia will do.
%Issue when the move can be done
ia(X, Y) :- X is random(6), Y is random(5), add(X, Y, jaune), ! ; ia(X, Y).
