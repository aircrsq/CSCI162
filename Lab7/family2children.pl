/* This file contains a database of parents and children */
parent(hank,ben).       % This means that hank is parent of ben
parent(hank,denise).
parent(irene,ben).
parent(irene,denise).
parent(alice,carl).
parent(ben,carl).
parent(denise,frank).
parent(denise,gary).
parent(earl,frank).
parent(earl,gary).

grandparent(X,Z) :- parent(X,Y) , parent(Y,Z).
ancestor(X,Y) :- parent(X,Y).
ancestor(X,Y) :- parent(Z,Y) , ancestor(X,Z).

twochild(X,Y,Z) :- parent(X,Y) , parent(X,Z), \==(Y,Z).
twochildren(X,Y,Z) :- setof(X,Y^Z^twochild(X,Y,Z), Set), write(Set).

myCounter(INPRO,Count) :- findall(1,INPRO,List), length(List,Count).

