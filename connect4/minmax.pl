%Cette règle détermine quel coup l'IA va jouer, utilisation de l'alorithme minmax.


ia(X, Y) :- minmax(5, jaune, _, X), write(X), height(X, Count), Y is Count+1, add(X, Y, jaune).


% Rules used to find a
%minmax(X, Y, P, Color, Value) :- integer(Y), isTerminal(X, Y, Value).
minmax(P, Color, Value, Coup) :- P == 0, Value = 0, !.
minmax(P, Color, Value, Coup) :-
    Color == jaune, aggregate_all(max(V, X), simulate(P, Color, V, X), max(Value, Coup)), write('max'), write(Value), nl, nl, !.
minmax(P, Color, Value, Coup) :-
    Color == rouge, aggregate_all(min(V, X), simulate(P, Color, V, X), min(Value, Coup)), write('min'), write(Value), nl, nl, !.


simulate(P, Color, Value, X) :-
    canPlay(X),
    once((isTerminal(X, Color, Value), nl, write(Value)) ; (
    (minmaxPlay(X, Color),
    display, Pm is P - 1,
    (Color == jaune, minmax(Pm, rouge, Value, _) ;
    Color == rouge, minmax(Pm, jaune, Value, _) ),
    minmaxRemove(X) ; true ))).

    %Pm is P - 1, minmax(X, Y, Pm, Color, Value),

    %minmaxPlay(X, Y, Color), display, Pm is P - 1,
    %(Color == jaune, minmax(X, Y, Pm, rouge, Value), ! ;
    %Color == rouge, minmax(X, Y, Pm, jaune, Value) ),


% random_permutation([1,2,3,4,5,6,7], P).
 canPlay(X) :- between(1, 7, X), once(not(pawn(X, 6, Color)) ; (X is 0, true)).



% A move is terminal if it is :
%   - a winning move
%   - the last move possible
isTerminal(X,Color, Value) :- Color == rouge, height(X, Count), Y is Count+1, Y < 7, win(X, Y, rouge), Value = -1000000, !.
isTerminal(X, Color, Value) :- Color == jaune, height(X, Count), Y is Count+1, Y < 7, win(X, Y, jaune), Value = 1000000, !.


minmaxPlay(X, C) :- height(X, Count), Y is Count+1, Y < 7, assert(pawn(X, Y, C)).

minmaxRemove(X) :- height(X, Count), retract(pawn(X, Count, _)).
