%ncestors(L) :- catch(sys_throw_error(ignore),error(ignore,L),true).


:- dynamic pawn/3.


play(X, Y) :- 
    integer(X), X >= 0, X < 6,
    integer(Y), Y >= 0, Y < 5,
    not(pawn(X, Y, _)),
    YSouth is Y-1,
    pawn(X, YSouth, _),
    assert(pawn(X, Y, rouge)).
              
play(X, Y) :- 
    integer(X), X >= 0, Y =< 7,
    Y = 0,
    not(pawn(X, 0, _)),
    assert(pawn(X, Y, rouge)).
              
play(X) :- between(0, 6, Y), play(X, Y), display(board), !.
              
              
gagner(X, Y) :-               
              
display(X, Y) :- pawn(X, Y, rouge), write(o).
display(X, Y) :- pawn(X, Y, jaune), write(x).
display(X, Y) :- write(-).



display(board) :- 
display(0, 6), display(1, 6), display(2, 6), display(3, 6), display(4, 6), display(5, 6), display(6, 6), nl,
display(0, 5), display(1, 5), display(2, 5), display(3, 5), display(4, 5), display(5, 5), display(6, 5), nl,
display(0, 4), display(1, 4), display(2, 4), display(3, 4), display(4, 4), display(5, 4), display(6, 4), nl,
display(0, 3), display(1, 3), display(2, 3), display(3, 3), display(4, 3), display(5, 3), display(6, 3), nl,
display(0, 2), display(1, 2), display(2, 2), display(3, 2), display(4, 2), display(5, 2), display(6, 2), nl,
display(0, 1), display(1, 1), display(2, 1), display(3, 1), display(4, 1), display(5, 1), display(6, 1), nl,
display(0, 0), display(1, 0), display(2, 0), display(3, 0), display(4, 0), display(5, 0), display(6, 0), nl.
