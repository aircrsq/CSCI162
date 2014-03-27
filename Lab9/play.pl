% David Burneau
% fa1
% usage fa(0110110010)
initial(5).
final(1).
final(2).

transition(5,0,3).
transition(3,1,1).
transition(1,0,3).
transition(3,0,3).
transition(1,1,1).

transition(5,1,4).
transition(4,0,2).
transition(4,1,4).
transition(2,1,4).
transition(2,0,2).

%
walkit(S,[],Y) :- +(S==Y).
walkit(S,[H],Y) :- transition(S,H,Y).
walkit(S,[H|T],Y) :- transition(S,H,Z), walkit(Z,T,Y).

compute(Y):- 
	walkit(S,[],Y),
	Y=='q2'.

compute(Y):-
	walkit(S,[],Y),
	Y=='q4'.

