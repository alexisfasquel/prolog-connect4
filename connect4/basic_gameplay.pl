%Creating pawn with 3 args allowing to assert predicates correctly
:- dynamic pawn/3.

%Rule which will clear the "database"
clear :- retractall(pawn(X,Y,Z)).

%Simples rules of displaying
display(X, Y) :- pawn(X, Y, rouge), ansi_format([bold, fg(red)], 'o', []), ansi_format([fg(blue)], '|', []).
display(X, Y) :- pawn(X, Y, jaune), ansi_format([bold, fg(yellow)], 'x', []), ansi_format([fg(blue)], '|', []).
display(_, _) :- write(' '), ansi_format([fg(blue)], '|', []).

%Displaying the grid
%Can use between because display is always true so always not false ;)
display :-
    between(1, 6, Tmp), Y is 7-Tmp, nl, ansi_format([fg(blue)], '|', []),
    between(1, 7, X), not(display(X, Y)) ; true, !.




%Rules allowing to add a pawn while preventing to insert pawn any old way which means :
%   - X and Y are in the correct range
%   - Y position is computed by incrementing the current nb of pawn in the column
%   - The computed value of Y is returned
add(X, Y, Color) :- 
    integer(X), X >= 1, X < 8,
    height(X, Count), Y is Count+1,
    integer(Y), Y >= 1, Y < 7,
    asserta(pawn(X, Y, Color)).

%Rules allowing to remove a pawn
remove(X) :- height(X, Count), retract(pawn(X, Count, _)).

%Rules which return every column number where a pawn can be inserted
playable(X) :- between(1, 7, X), once(not(pawn(X, 6, _)) ; (X is 0, true)).

%Rule used to tell how many pawn there is in a column (returned by Count)
height(X, Count) :- aggregate_all(count, pawn(X, _, _), Count).


%Main command to play : X represents the column where you want to play
%This command will do everything for you =D
play(X) :-
    (add(X, Y, rouge), ! ; write('You can not play there !'), nl, abort), display, nl,      %If pawn was added we display, else we abort
    (win(X, Y, rouge), write('You won !!'), clear, ! ; play).       %Then, if we dont win then IA have to make a move (play)
    

%This rules is called  when we want the IA to play
play :- ia(Xia, Yia), nl, write('IA will now play :'), display, nl, win(Xia, Yia, jaune), write('You Lost !!'), clear.

%Always returns true
%This rules determins what move the ia will do => the move have to be done in any case
%Each rules will be written in an seperate file named after the algorithm used
:- dynamic ia/2.




%This rule will check every line of 4 pawn of the same color starting from (X, Y)
%It will check the 2 vectors assiociated to the same line and check if the sum is 3
%If true, that means that putting a pawn at (X, Y) is a winning move
win(X, Y, C) :- neighborhood(X, Y, 1, 0, C, C1), neighborhood(X, Y, -1, 0, C, C2), Count is C1+C2, Count >= 3, !.
win(X, Y, C) :- neighborhood(X, Y, 0, 1, C, C1), neighborhood(X, Y, 0, -1, C, C2), Count is C1+C2, Count >= 3, !.
win(X, Y, C) :- neighborhood(X, Y, 1, -1, C, C1), neighborhood(X, Y, -1, 1, C, C2), Count is C1+C2, Count >= 3, !.
win(X, Y, C) :- neighborhood(X, Y, 1, 1, C, C1), neighborhood(X, Y, -1, -1, C, C2), Count is C1+C2, Count >= 3, !.

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
