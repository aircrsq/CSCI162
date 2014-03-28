% database
initial(1).
final(3).
arc(1,2,h).
arc(2,3,a).
% arc(3,2,h).

% program
recognize1(Node,[]) :-
	final(Node).
recognize1(Node1,String) :-
	arc(Node1,Node2,Label),
	traverse1(Label,String,NewString),
	recognize1(Node2,NewString).

traverse1(Label,[Label|Symbols],Symbols).

% driver
test1(Symbols) :-
	initial(Node),
	recognize1(Node,Symbols).

generate1(X) :-
	test1(X).
