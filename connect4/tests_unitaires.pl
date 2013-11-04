%Tests unitaires

%Test de add

testadd :- clear, 
		not(add(0,Y,jaune)), %hors limite
		add(1,A,jaune), A==1, %ok
		add(2,B,jaune), B==1, %ok
		add(3,C,jaune), C==1, %ok
		add(4,D,jaune), D==1, %ok
		add(5,E,jaune), E==1, %ok
		add(6,F,jaune), F==1, %ok
		add(7,G,jaune), G==1, %ok
		add(1,H,jaune), H==2, %ok
		add(1,I,jaune), I==3, %ok
		add(1,J,jaune), J==4,  %ok
		add(1,K,jaune), K==5, %ok
		add(1,L,jaune), L==6, %ok
		not(add(1,M,jaune)), %hors limite
		not(add(8,N,jaune)), %hors limite
		not(add(d,O,jaune)) %mauvais argument
		.
 
 
 
%Test de height

testheight :- clear, height0, height1, height2.

height0 :- height(1,Count), Count =0. %colonne vide
height1 :-add(1,1,jaune), height(1,Count), Count =1 . %colonne avec 1 pion
height2 :-add(1,2,jaune), height(1,Count), Count =2 . %colonne avec 2 pions



			  




%Test de win

testwin :- clear, winvrai1.
winvrai1 :- add(1,Y,jaune), 
		add(2,Y,jaune),
		add(3,Y,jaune),
		add(4,Y,jaune),
		win(4,Y,jaune).

		%win(1,1,jaune),
		%win(1,2,jaune),
		%win(1,3,jaune),


%Tous les tests 
test :- testadd, testheight, testwin .