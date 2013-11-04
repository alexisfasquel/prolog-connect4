%To find the number of times an ia wins agains an other, you have to have to change the name ("iadifferente") and the colour ("rouge") of one of the ia you chose. Then launch the function fonctiontestqualite(NBtest) to play NBtest games.

%Add a point to the winning ia
victoire(CouleurVictoire,VJ,VR):- CouleurVictoire == jaune,VJ is 1,VR is 0.
victoire(CouleurVictoire,VJ,VR):- CouleurVictoire == rouge,VJ is 0,VR is 1.
victoire(CouleurVictoire,VJ,VR):- CouleurVictoire == none,VJ is 0,VR is 0.

%Makes 2 ia play and count the points of each one.
test(Nombre,V1,V2,V3,V4):- Nombre == 0,write('jaune:'),write(V1),write(' rouge :'),write(V2).
test(Nombre,V1,V2,V3,V4):- testv1(1,1,rouge,CouleurVictoire),victoire(CouleurVictoire,V3,V4),V11 is V1+V3,V22 is V2+V4,Nombre1 is Nombre-1,test(Nombre1,V11,V22,V33,V44).


%Return true if the Xth column is full
isfull(X) :- height(X, Count), Count > 5.

%Find if the board is full
matchnull:- isfull(1),isfull(2),isfull(3),isfull(4),isfull(5),isfull(6),isfull(7).

%Represents the ia playing one against the other
%You have to change the name and the colour of one of the ia you chose.
ia2(Xia,Yia) :- ia(Xia, Yia). %Ia with yellow pawns.
ia1(Xia,Yia) :- iadifferente(Xia, Yia). %Ia with red pawns

%Makes the 2 ia play until one wins.
testv1(X,Y,Color,CouleurVictoire):- (win(X, Y, rouge),pawn(X, Y, rouge),clear,CouleurVictoire = rouge); (win(X, Y, jaune),pawn(X, Y, jaune),clear,CouleurVictoire = jaune);(matchnull,clear,CouleurVictoire = none).
testv1(X,Y,Color,CouleurVictoire):- Color == rouge,ia1(X1,Y1),testv1(X1,Y1,jaune,CouleurVictoire).
testv1(X,Y,Color,CouleurVictoire):- Color == jaune,ia2(X1,Y1),testv1(X1,Y1,rouge,CouleurVictoire).


%play NBtest games between "ia" and "iadifferente"
fonctiontestqualite(NBtest):- integer(NBtest),test(NBtest,0,0,VR,VJ).
