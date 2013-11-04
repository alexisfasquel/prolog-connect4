%The minmax algorythm is used to determine what pawn the ia is going to choose.


ia(X, Y) :- minmax(5, jaune, _, X), add(X, Y, jaune).


% Rules used to find a move using minmax algorithm
minmax(P, _, Value, _) :- P == 0, Value = 0, !.
minmax(P, Color, Value, Coup) :-
    Color == jaune, aggregate_all(max(V, X), simulate(P, Color, V, X), max(Value, Coup)), !.
minmax(P, Color, Value, Coup) :-
    Color == rouge, aggregate_all(min(V, X), simulate(P, Color, V, X), min(Value, Coup)), !.


%
simulate(P, Color, Value, X) :-
    (playable(X),
        Coeff is 10-P,
        once((isTerminal(X, Color, V), Value is Coeff*V ) 
        ; ((add(X, _, Color),  Pm is P - 1,
        ( Color == jaune, minmax(Pm, rouge, Value, _) 
            ; Color == rouge, minmax(Pm, jaune, Value, _)),
        remove(X) ; true )))   
    ; Value is 0
    ).

% random_permutation([1,2,3,4,5,6,7], P).



% A move is terminal if it is :
%   - a winning move
%   - the last move possible
isTerminal(X, Color, Value) :- Color == rouge, height(X, Count), Y is Count+1, Y < 7, win(X, Y, rouge), Value = -1000000, !.
isTerminal(X, Color, Value) :- Color == jaune, height(X, Count), Y is Count+1, Y < 7, win(X, Y, jaune), Value = 1000000, !.



