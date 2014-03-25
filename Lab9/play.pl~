% David Burneau
% fa1

% list([]).
% list([H],H).

computation('s','0','q1').
computation('q1','1','q2').
computation('q2','1','q2').
computation('q2','0','q1').

computation('s','1','q3').
computation('q3','0','q4').
computation('q4','0','q4').
computation('q4','1','q3').

walkit(S,[],Y) :- +(S==Y).
walkit(S,[H],Y) :- computation(S,H,Y).
walkit(S,[H|T],Y) :- computation(S,H,Z), walkit(Z,T,Y).

daccept(Y):- walkit(S,[],Y), Y=='q2'.
daccept(Y):- walkit(S,[],Y), Y=='q4'.

