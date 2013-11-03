test(Nombre,V1,V2):- Nombre == 0.
test(Nombre,V1,V2):- testv1(1,1,rouge),Nombre1 is Nombre-1,test(Nombre1,V1,V2).

%Fonction qui fait jouer une ia contre une autre jusqu'a ce qu une des deux ia gagne
%Voir encas de match nul

testv1(X,Y,Color):- (win(X, Y, rouge),pawn(X, Y, rouge),write('rouge'),display,clear); (win(X, Y, jaune),pawn(X, Y, jaune),write('jaune'),display,clear).
testv1(X,Y,Color):- Color == rouge,iarandom(X1,Y1),testv1(X1,Y1,jaune).
testv1(X,Y,Color):- Color == jaune,play2(X1,Y1),testv1(X1,Y1,rouge).
