% David Burneau 575076880
% fa1
% usage fa3([a,a,a,a,b,b,a,b,b,b]).
% usage generate(X).

initial(1).
final(2).
final(3).
final(4).
final(6).
final(7).
final(9).
final(10).

transition(1,a,2). transition(1,b,5).
transition(2,a,2). transition(2,b,3).
transition(3,a,4). transition(3,b,5).
transition(4,a,6). transition(4,b,3).
transition(5,a,7). transition(5,b,10).
transition(6,a,11). transition(6,b,7).
transition(7,a,8). transition(7,b,9).
transition(8,a,11). transition(8,b,7).
transition(9,a,7). transition(9,b,10).
transition(10,a,11). transition(10,b,10).

% program
recognize1(Node,[]) :-
	final(Node).
recognize1(Node1,String) :-
	transition(Node1,Label,Node2),
	traverse1(Label,String,NewString),
	recognize1(Node2,NewString).

traverse1(Label,[Label|Symbols],Symbols).

% driver
fa3(Symbols) :-
	initial(Node),
	recognize1(Node,Symbols).

generate1(X) :-
	fa3(X).
