%Have to always returns true -> vérifier si le coup est jouable sinon problème
%This rules determins what move the ia will do.

ia(X, Y) :- X is random(6), Y is random(5), add(X, Y, jaune), ! ; ia(X, Y).
