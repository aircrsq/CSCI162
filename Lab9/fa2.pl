% David Burneau 575076880
% fa1
% usage test1([0,1,1,1,1,0,0,1]).
% usage generate(X).

initial(1).
final(5).

transition(1,0,2).
transition(2,0,2).
transition(2,1,3).
transition(1,1,3).
transition(3,0,2).
transition(3,1,4).
transition(4,0,2).
transition(4,1,5).
transition(5,0,5).
transition(5,1,5).


% program
recognize1(Node,[]) :-
	final(Node).
recognize1(Node1,String) :-
	transition(Node1,Label,Node2),
	traverse1(Label,String,NewString),
	recognize1(Node2,NewString).

traverse1(Label,[Label|Symbols],Symbols).

% driver
fa2(Symbols) :-
	initial(Node),
	recognize1(Node,Symbols).

generate1(X) :-
	fa2(X).
