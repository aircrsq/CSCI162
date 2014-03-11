male(ali).      male(carl).    male(ed).      male(frank).   male(hugo).
male(kurt).     male(rene).    male(vico).    male(tino).

female(berta).  female(dora).  female(guna).  female(ina).   female(jane).
female(laura).  female(mia).   female(olga).  female(wera).  female(susan).
female(uta).

father(ali,guna).   father(ali,hugo).   father(carl,ina).   father(carl,jane).
father(ed,kurt).    father(frank,mia).  father(frank,olga). father(hugo,wera).
father(hugo,rene).  father(hugo,vico).  father(kurt,tino).  father(kurt,uta).    

mother(berta,guna). mother(berta,hugo). mother(dora,ina).   mother(dora,jane).
mother(guna,mia).   mother(guna,olga).  mother(ina,wera).   mother(ina,rene).
mother(ina,vico).   mother(jane,susan). mother(laura,tino). mother(laura,uta). 

parent(X,Y) :- father(X,Y).
parent(X,Y) :- mother(X,Y).
sibling(Y,Z) :- parent(X,Y) , parent(X,Z).
grandparent(G,Z) :- parent(Y,Z) , parent(G,Y).
brother(X,Y) :- sibling(X,Y) , male(Y).
sister(X,Y) :- sibling(X,Y) , female(Y).
cousin(X,Y) :- parent(P,X) , parent(Q,Y) , sibling(P,Q).
ancestor(X,Y) :- parent(X,Y).
ancestor(X,Y) :- parent(Z,Y) , ancestor(X,Z).

