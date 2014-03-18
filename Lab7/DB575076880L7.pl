/*Name: David Burneau*/
/*Student Number: 575076880*/
/*Calling program*/

/*parents(X,Y,Z) where X is the father, Y is the mother, and Z is child*/
/*parent(X,Y) where X is the parent of Y*/
/*sibling(X,Y) where X is the sibling of Y*/
/*grandparent(G,Y) where G is the grandparent of Y*/
/*brother(X,Y) where Y is the brother of X*/
/*sister(X,Y) where Y is the sister of X*/
/*cousin(X,Y) where Y is the cousin of X*/
/*ancestor(X,Y) where Y is the ancestor of X*/
/*triplegrand(G) where G has more than three grandchildren*/

male(ali).      male(carl).    male(ed).      male(frank).   male(hugo).
male(kurt).     male(rene).    male(vico).    male(tino).

female(berta).  female(dora).  female(guna).  female(ina).   female(jane).
female(laura).  female(mia).   female(olga).  female(wera).  female(susan).
female(uta).

whale(X) :- female(X).
whale(X) :- male(X).

father(ali,guna).   father(ali,hugo).   father(carl,ina).   father(carl,jane).
father(ed,kurt).    father(frank,mia).  father(frank,olga). father(hugo,wera).
father(hugo,rene).  father(hugo,vico).  father(kurt,tino).  father(kurt,uta).    

mother(berta,guna). mother(berta,hugo). mother(dora,ina).   mother(dora,jane).
mother(guna,mia).   mother(guna,olga).  mother(ina,wera).   mother(ina,rene).
mother(ina,vico).   mother(jane,susan). mother(laura,tino). mother(laura,uta). 

parents(X,Y,Z) :- father(X,Z) , mother(Y,Z).
parent(X,Y) :- father(X,Y).
parent(X,Y) :- mother(X,Y).
sibling(Y,Z) :- parents(A,B,Y) , parents(A,B,Z), \==(Y,Z).
grandparent(X,Z) :- parent(X,Y) , parent(Y,Z).
brother(X,Y) :- sibling(X,Y) , male(Y).
sister(X,Y) :- sibling(X,Y) , female(Y).
cousin(X,Y) :- parent(P,X) , parent(Q,Y) , sibling(P,Q).
ancestor(X,Y) :- parent(X,Y).
ancestor(X,Y) :- parent(Z,Y) , ancestor(X,Z).
triplegrand(G) :- 
    whale(G), whale(X), \+(G==X),
    whale(Y), \+(G==Y), \+(Y==X),
    whale(Z), \+(G==Z), \+(Z==X), \+(Z==Y),
    grandparent(G,X) , grandparent(G,Y) , grandparent(G,Z).

three(G) :- setof(G,triplegrand(G), Set), write(Set).
/*Copyright (C) 1999-2007 Daniel Diaz*/
/*| ?- [family].*/
/*compiling /home/student/burneadf/csci162/Lab7/family.pl for byte code...*/
/*/home/student/burneadf/csci162/Lab7/family.pl compiled, 50 lines read - 8075 bytes written, 21 ms*/

/*yes*/
/*| ?- three(G).*/
/*[ali,berta,carl,dora]*/

/*(544 ms) yes*/
