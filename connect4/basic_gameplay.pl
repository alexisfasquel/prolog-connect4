%Creating pawn with 3 args allowing to assert predicates correctly
:- dynamic pawn/3.

%Rule which will clear the "database"
clear :- retractall(pawn(X,Y,Z)).

%Simples rules of displaying
display(X, Y) :- pawn(X, Y, rouge), write(o).
display(X, Y) :- pawn(X, Y, jaune), write(x).
display(_, _) :- write(-).

%Displaying the grid
%Can use between because display is always true so always not false ;)
display :-
    between(1, 6, Tmp), Y is 7-Tmp, nl,
    between(1, 7, X), not(display(X, Y)) ; true, !.


%Rules which prevents to insert pawn any old way which means :
%   - X and Y are in the correct range
%   - There is not already a pawn at the same place
%   - There is a pawn below or this is the fisrt pawn of the column
add(X, Y, Color) :- 
    integer(X), X >= 1, X < 8,
    integer(Y), Y >= 1, Y < 7,
    not(pawn(X, Y, _)),
    ((   
        Y == 1, 
        asserta(pawn(X, 1, Color))
    );
    (   
        YSouth is Y-1,
        pawn(X, YSouth, _),
        asserta(pawn(X, Y, Color))
    )), !.
    
%if we divide in 2 the previous rule
%add(X, 0) :-     
%   integer(X), X >= 1, X < 8, 
%   assert(pawn(X, 1, rouge)).


%Rule used to tell how many pawn there is in a column (returned by Count)
height(X, Count) :- aggregate_all(count, pawn(X, _, _), Count).

%Return true if the Xth column is full
isfull(X) :- height(X, Count), Count > 5.


%Main command to play : X represents the column where you want to play
%This command will do everything for you =D
play(X) :- 
    height(X, Count), Y is Count+1,                                                     %Finding out where to put the pawn.
    (add(X, Y, rouge), ! ; write('You can play there !'), nl, abort), display, nl,      %If pawn was added we display, else we abort
    (win(X, Y, rouge), write('You won !!'), clear, ! ; play).                           %Then, if we dont win then IA have to make a move (play)
    
%This rules is called  when we want the IA to play    
play :- ia(Xia, Yia), display, nl, win(Xia, Yia, jaune), write('You Lost !!'), clear.

%Always returns true
%This rules determins what move the ia will do => the move have to be done in any case
%Each rules will be written in an seperate file named after the algorithm used
:- dynamic ia/2.


%This rule will check every line of 4 pawn of the same color starting from (X, Y)
%It will check the 2 vectors assiociated to the same line and check if the sum is 3
%If true, that means that putting a pawn at (X, Y) is a winning move
win(X, Y, C) :- neighborhood(X, Y, 1, 0, C, C1), neighborhood(X, Y, -1, 0, C, C2), Count is C1+C2, Count == 3, !.
win(X, Y, C) :- neighborhood(X, Y, 0, 1, C, C1), neighborhood(X, Y, 0, -1, C, C2), Count is C1+C2, Count == 3, !.
win(X, Y, C) :- neighborhood(X, Y, 1, -1, C, C1), neighborhood(X, Y, -1, 1, C, C2), Count is C1+C2, Count == 3, !.
win(X, Y, C) :- neighborhood(X, Y, 1, 1, C, C1), neighborhood(X, Y, -1, -1, C, C2), Count is C1+C2, Count == 3, !.

%This rule allows to know how many pawns of the same color Color
%we will find in  the line define by the vector(DX, DY), starting from the pawn(X, Y) excluded
%The max values is 3 knowing that if we add a 4th at (X,Y) then we win
neighborhood(X, Y, DX, DY, Color, Count) :- 
    (
        between(1, 3, Cpt), 
        XNext is DX*Cpt+X, YNext is DY*Cpt+Y,
        not(pawn(XNext, YNext, Color)),
        Count is Cpt-1, !
    ) ; Count is 3, true.