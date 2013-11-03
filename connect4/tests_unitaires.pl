%Tests unitaires

%Test de add

testadd :- clear, 
		not(add(O,O,jaune)), %hors limite
		not(add(1,O,jaune)), %hors limite
		not(add(0,1,jaune)), %hors limite
		add(1,1,jaune), %ok
		not(add(1,1,jaune)), %on ne peut pas ajouter deux fois un pion au même endroit
		add(2,1,jaune), %ok
		add(3,1,jaune), %ok
		add(4,1,jaune), %ok
		add(5,1,jaune), %ok
		add(6,1,jaune), %ok
		add(7,1,jaune), %ok
		add(1,2,jaune), %ok
		add(1,3,jaune), %ok
		add(1,4,jaune), %ok
		add(1,5,jaune), %ok
		add(1,6,jaune), %ok
		not(add(1,7,jaune)), %hors limite
		not(add(8,1,jaune)), %hors limite
		not(add(3,f,jaune)), %mauvais argument
		not(add(d,3,jaune)) %mauvais argument
		.
 
 
 
%Test de height

testheight :- clear, height0, height1, height2.

height0 :- height(1,Count), Count =0. %colonne vide
height1 :-add(1,1,jaune), height(1,Count), Count =1 . %colonne avec 1 pion
height2 :-add(1,2,jaune), height(1,Count), Count =2 . %colonne avec 2 pions



			  
% Test de isfull

testisfull :- clear, isfullfaux, isfullvrai.

isfullfaux :- not(isfull(1)). 
isfullvrai :- add(1,1,jaune), 
		add(1,2,jaune),
		add(1,3,jaune),
		add(1,4,jaune),
		add(1,5,jaune), 
		add(1,6,jaune), 
		isfull(1).




%Test de win

testwin :- winvrai1.
%%%%%%%%%%%%%%% MARCHE PAS
winvrai1 :- add(1,1,jaune), %vertical
		add(2,1,jaune),
		add(3,1,jaune),
		add(4,1,jaune),

		win(1,1,jaune).

		%win(1,1,jaune),
		%win(1,2,jaune),
		%win(1,3,jaune),


%Tous les tests 
test :- testadd, testheight, testisfull, testwin .