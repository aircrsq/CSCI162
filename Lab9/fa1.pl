% David Burneau 575076880
% fa1
% usage fa1([0,1,1,0,1,1,0,0,1]).
% usage generate(X).

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

% program
recognize1(Node,[]) :-
	final(Node).
recognize1(Node1,String) :-
	transition(Node1,Label,Node2),
	traverse1(Label,String,NewString),
	recognize1(Node2,NewString).

traverse1(Label,[Label|Symbols],Symbols).

% driver
fa1(Symbols) :-
	initial(Node),
	recognize1(Node,Symbols).

generate1(X) :-
	fa1(X).
