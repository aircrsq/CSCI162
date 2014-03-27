% initial nodes
% initial(nodename)
initial(0).

% final nodes
% final(nodename)
final(1).

% edges:
% arc(from-node,label,to-node).
arc(0,c,6).
arc(6,o,5).
arc(5,l,4).
arc(4,o,2).
arc(2,r,1).
arc(2,u,3).
arc(3,r,1).

test(Words) :-
	initial(Node),
	recognize(Node, Words).

recognized(Node, []) :-
	final(Node).

recognize(FromNode, String) :-
	arc(FromNode,Label,ToNode),
	traverse(Label,String,NewString),
	recognize(ToNode,NewString).

traverse(First, [First|Rest], Rest).

generate :-
	test(X),
	write(X),
	nl,
	fail.

