%ncestors(L) :- catch(sys_throw_error(ignore),error(ignore,L),true).

%Creating pawn with 3 args allowing to assert predicates correctly
:- dynamic pawn/3.


play(X, Y,Color) :- 
    integer(X), X >= 0, X < 7,
    integer(Y), Y >= 0, Y < 7,
    not(pawn(X, Y, _)),
    YSouth is Y-1,
    pawn(X, YSouth, _),
    assert(pawn(X, Y, Color)).
              
play(X, Y,Color) :- 
    integer(X), X >= 0, Y =< 7,
    Y = 0,
    not(pawn(X, 0, _)),
    assert(pawn(X, Y, Color)).
              
              
%Main commande to play : X represents the column where you want to play
%This commande will do everything for you =D
%play(X) :- between(0, 6, Y), play(X, Y), display(board), !, gagner(X, Y, rouge), write('You won !!!!').
%play(X) :- ia(X), display(board), !,gagner(X, Y, jaune), write('You lost !!!!').

%Ia contre Joueur:
play(X) :- between(0, 6, Y), play(X, Y,rouge),ia(Q,Z,jaune),display(board),!,verifier(X,Y,Q,Z),display(board).
%IA contre IA:
play :- between(0, 6, Y), ia(R, T,rouge),ia(Q,Z,jaune),display(board),!,verifier(R,T,Q,Z),display(board).

verifier(X,Y,Q,Z):-((gagner(X, Y, rouge),write('You won !!!!'),retract(pawn(Q,Z,jaune)));(gagner(Q, Z, jaune),write('You lost !!!!'))).


%Need to write the ia algorithm
ia(X,Y,Color) :-X is random(6),between(0, 6, Y),play(X,Y,Color),!.

clear:-retractall(pawn(X,Y,Z)).





%Trying something here... leave it alone :p
est(X, Y, Color, D) :- 
    between(1, 3, D),
    DX is D + X, 
    pawn(DX, Y, Color).  


% Horrible way to find out if there is a win
gagner(X,Y, Color) :- 
    X1 is X + 1, X2 is X + 2, X3 is X + 3,
    pawn(X1, Y, Color), pawn(X2, Y, Color), pawn(X3, Y, Color).
gagner(X,Y, Color) :- 
    X1 is X - 1, X2 is X - 2, X3 is X - 3,
    pawn(X1, Y, Color), pawn(X2, Y, Color), pawn(X3, Y, Color).

gagner(X,Y, Color) :- 
    Y1 is Y + 1, Y2 is Y + 2, Y3 is Y + 3,
    pawn(X, Y1, Color), pawn(X, Y2, Color), pawn(X, Y3, Color).
gagner(X,Y, Color) :- 
    Y1 is Y - 1, Y2 is Y - 2, Y3 is Y - 3,
    pawn(X, Y1, Color), pawn(X, Y2, Color), pawn(X, Y3, Color).

gagner(X,Y, Color) :- 
    Y1 is Y + 1, Y2 is Y + 2, Y3 is Y + 3,
    X1 is X + 1, X2 is X + 2, X3 is X + 3,
    pawn(X1, Y1, Color), pawn(X2, Y2, Color), pawn(X3, Y3, Color).
    
gagner(X,Y, Color) :- 
    Y1 is Y - 1, Y2 is Y - 2, Y3 is Y - 3,
    X1 is X + 1, X2 is X + 2, X3 is X + 3,
    pawn(X1, Y1, Color), pawn(X2, Y2, Color), pawn(X3, Y3, Color).

gagner(X,Y, Color) :- 
    Y1 is Y + 1, Y2 is Y + 2, Y3 is Y + 3,
    X1 is X - 1, X2 is X - 2, X3 is X - 3,
    pawn(X1, Y1, Color), pawn(X2, Y2, Color), pawn(X3, Y3, Color).

gagner(X,Y, Color) :- 
    Y1 is Y - 1, Y2 is Y - 2, Y3 is Y - 3,
    X1 is X - 1, X2 is X - 2, X3 is X - 3,
    pawn(X1, Y1, Color), pawn(X2, Y2, Color), pawn(X3, Y3, Color).




%Simples rules of displaying
display(X, Y) :- pawn(X, Y, rouge), write(o).
display(X, Y) :- pawn(X, Y, jaune), write(x).
display(_, _) :- write(-).


%Displaying the grid
display(board) :- 
display(0, 6), display(1, 6), display(2, 6), display(3, 6), display(4, 6), display(5, 6), display(6, 6), nl,
display(0, 5), display(1, 5), display(2, 5), display(3, 5), display(4, 5), display(5, 5), display(6, 5), nl,
display(0, 4), display(1, 4), display(2, 4), display(3, 4), display(4, 4), display(5, 4), display(6, 4), nl,
display(0, 3), display(1, 3), display(2, 3), display(3, 3), display(4, 3), display(5, 3), display(6, 3), nl,
display(0, 2), display(1, 2), display(2, 2), display(3, 2), display(4, 2), display(5, 2), display(6, 2), nl,
display(0, 1), display(1, 1), display(2, 1), display(3, 1), display(4, 1), display(5, 1), display(6, 1), nl,
display(0, 0), display(1, 0), display(2, 0), display(3, 0), display(4, 0), display(5, 0), display(6, 0), nl.
