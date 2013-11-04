%Unit tests

%All the tests (except "testplay" because of the display)
test :- testadd, testheight, testwin, testplay .


%Add

testadd :- clear, 
		not(add(0,Y,jaune)), %hors limite : pas de colonne 0
		add(1,A,jaune), A==1, %remplit ligne : ok
		add(2,B,jaune), B==1, %remplit ligne : ok
		add(3,C,jaune), C==1, %remplit ligne : ok
		add(4,D,jaune), D==1, %remplit ligne : ok
		add(5,E,jaune), E==1, %remplit ligne : ok
		add(6,F,jaune), F==1, %remplit ligne : ok
		add(7,G,jaune), G==1, %remplit ligne : ok
		add(1,H,jaune), H==2, %remplit colonne : ok
		add(1,I,jaune), I==3, %remplit colonne : ok
		add(1,J,jaune), J==4,  %remplit colonne : ok
		add(1,K,jaune), K==5, %remplit colonne : ok
		add(1,L,jaune), L==6, %remplit colonne : ok
		not(add(1,M,jaune)), %hors limite : colonne pleine
		not(add(8,N,jaune)), %hors limite : pas de colonne 8
		not(add(d,O,jaune)). %mauvais argument : pas un entier
 
 
 
%Height

testheight :- clear, height0, height1, height2.

height0 :- height(1,Count), Count =0. %colonne vide
height1 :-add(1,1,jaune), height(1,Count), Count =1 . %colonne avec 1 pion
height2 :-add(1,2,jaune), height(1,Count), Count =2 . %colonne avec 2 pions

 
%Win

testwin :- clear, winvrai1, 
			clear, winvrai2, 
			clear, winvrai3, 
			clear, winvrai4,
			clear, winfaux1,
			clear, winfaux2.
			
winvrai1 :- % horizontal
		add(1,Y,jaune), add(2,Y,jaune), add(3,Y,jaune), add(4,Y,jaune),
		win(1,Y,jaune), win(2,Y,jaune), win(3,Y,jaune), win(4,Y,jaune), %on gagne avec les jaunes
		not(win(1,Y,rouge)), not(win(2,Y,rouge)), not(win(3,Y,rouge)), not(win(4,Y,rouge)). %on ne gagne pas avec les rouges
winvrai2 :- % vertical
		add(1,A,jaune), add(1,B,jaune), add(1,C,jaune), add(1,D,jaune),
		win(1,A,jaune), win(1,B,jaune), win(1,C,jaune), win(1,D,jaune). %on gagne avec les jaunes
winvrai3 :- % diagonal droite
		add(1,A,jaune), 
		add(2,A,jaune),	add(2,B,jaune),
		add(3,A,jaune),	add(3,B,jaune),add(3,C,jaune),
		add(4,A,jaune), add(4,B,jaune), add(4,C,jaune), add(4,D,jaune),
		win(1,A,jaune), win(2,B,jaune), win(3,C,jaune), win(4,D,jaune). %on gagne avec les jaunes
winvrai4 :- % diagonal gauche
		add(4,A,jaune), 
		add(3,A,jaune), add(3,B,jaune),
		add(2,A,jaune), add(2,B,jaune), add(2,C,jaune),
		add(1,A,jaune), add(1,B,jaune), add(1,C,jaune), add(1,D,jaune),
		win(1,D,jaune), win(2,C,jaune), win(3,B,jaune), win(4,A,jaune). %on gagne avec les jaunes
winfaux1 :- % We don't win until 4 are in line
			not(win(1,1,jaune)),
			add(1,A,jaune),
			add(1,B,jaune), not(win(1,1,jaune)),
			add(1,C,jaune), not(win(1,1,jaune)).
winfaux2 :- %We don't win if a red pawn is between
			add(1,Y,rouge), add(3,Y,rouge), add(4,Y,jaune),	add(5,Y,jaune),	add(6,Y,jaune),		
			not(win(2,Y,jaune)).
			
			
%Play
testplay :- clear, testplay1, clear, testplay2.

testplay1 :- clear, not(play), once(pawn(X,Y,jaune)), X>0, Y>0, X<8, Y<7. %un pion jaune est bien créé par l'IA
testplay2 :- clear, not(play(3)), once(pawn(3,Z,rouge)), Z>0, Z<7,  %un pion rouge est bien créé par le joueur
			once(pawn(X,Y,jaune)), X>0, Y>0, X<8, Y<7. % et un pion jaune est bien créé par l'IA
	
			
			
			
			
			
			