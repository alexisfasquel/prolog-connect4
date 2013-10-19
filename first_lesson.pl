% 1. Theme de la genealogie

human(eleosdad, male, eleosgrandadDad, eleogranmaDad).
human(eleosmum, female, eleosgrandadMum, eleogranmaMumd).
human(eleosis, female, eleosdad, eleosmum).

human(leo, male, leosdad, leosmum).
human(aleks, male, aleksdad, aleksmum).
human(rv, male, rvsdad, rvsmum).
human(claire, female, clairesdad, clairesmum).
human(eleo, female, eleosdad, eleosmum).
human(al, female, alsdad, alsmum). 

dad(Child, Dady) :- human(Child, _, Dady, _).

% dad(leo, X) -> X = leosdad
% dad(X, eleosdad) -> X = eleo

mum(Child, Mumy) :- man(Child, _, _, Mumy).

% mum(leo, X) -> X = leosmum ...

parents(Child, Dady, Mumy) :- human(Child, _, Dady, Mumy).

% parents(eleo, X, Y) -> X = eleosdad, Y = eleosmum

ancesters(Child, Dad, Mum) :- parents(Child, Dad, Mum).
ancesters(Child, Granpa, Granma) :- parents(Child, Dad, _), parents(Dad, Granpa, Granma).
ancesters(Child, Granpa, Granma) :- parents(Child, _, Mum), parents(Mum, Granpa, Granma).

%ancester(Child, Dad, Mum) :- ancester(Dad, GrampaD, GramaD), ancester(Mum, GrampaM, GramaM).
%ancester(Child, Granpa, Granma) :- parents(Child, Dad, Mum), parents(Dad, Granpa, Granma).

siblings(Somebody, Someone) :-  parents(Somebody, Sdad, Smum), human(Someone, _, Sdad, Smum), Somebody \= Someone.

% 2. Manipulation de listes

elem(Obj, [Obj|R], R).
elem(Obj, [T|Q], [T|R]) :- elem(Obj, Q, R).

%extraire deux éléments d'une liste
extract(L,[X,Y]):-member(X,L),elem(X,L,S),member(Y,S).

% Concatenation de listes
appnd([], L, L).
appnd([Head|T], Lo, [Head|Ln]) :- appnd(T, Lo, Ln).

% Inversion de liste
inv([], []). 
inv([Head|Tail], Res) :- inv(Tail, Inv), appnd(Inv,[Head], Res). 

% substitution dans une liste
replaceAll(O, N, [], Res).
replaceAll(O, N, [O|Q], [N|T]) :- replaceAll(O, N, Q, T).
replaceAll(O, N, [H|T1], [H|T2]) :- H \= O, replaceAll(O, N, T1, T2).


% 3. Theme arithmetique

element(1,X,[X|_]).
element(I,X,[_|Q]):- (integer(I), I1 is I-1, element(I1,X,Q)), ! ;(element(I1,X,Q), I is I1+1).


% 4. Theme des ensemblies

enlever_doublon([],[]).
enlever_doublon([X|L],R):- enlever_doublon(L,R), member(X,R).
enlever_doublon([X|L],[X|R]):- enlever_doublon(L,R), not(member(X,R)).

has_duplicates([X|T]):- member(X,T).
has_duplicates([_|T]):- has_duplicates(T).

long([], 0).
long([_|Q], N) :-long(Q, N1), N is N1 + 1.

equal(L1, L2) :- long(L1, N1), long(L2,N2), N1 is N2.
equal([L1|R1], L2) :- member(L1,L2), equal(R1,L2).

% -> pb vu que la taille de L1 diminue donc le premier prÈdicat est faux a la 2eme itÈration...

