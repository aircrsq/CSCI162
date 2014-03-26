% David Burneau
% 575076880
% Sudoku Solver
% solve([_,_,4,_,_,2,_,3,2,_,_,_,_,4,_,1],Solution).
% Input a list of 16 _ and numeric values between 1 and 4

% Define a valid empty puzzle
valid([]).

% Define a valid non-empty puzzle
valid([H|T]) :-
	fd_all_different(H),		% from prolog manual
	valid(T).

% create the solution from Puzzle and return to Solution
solve(Puzzle, Solution) :-
	Solution = Puzzle,
	Puzzle = [A1, A2, A3, A4,
		  B1, B2, B3, B4,
		  C1, C2, C3, C4,
		  D1, D2, D3, D4],
	fd_domain(Puzzle, 1, 4),	% from prolog manual set the values allowable to 1-4

% define rows
RowA = [A1, A2, A3, A4],
RowB = [B1, B2, B3, B4],
RowC = [C1, C2, C3, C4],
RowD = [D1, D2, D3, D4],

% Define columns
Col1 = [A1, B1, C1, D1],
Col2 = [A2, B2, C2, D2],
Col3 = [A3, B3, C3, D3],
Col4 = [A4, B4, C4, D4],

% Define squares
Square1 = [A1, A2, B1, B2],
Square2 = [A3, A4, B3, B4],
Square3 = [C1, C2, D1, D2],
Square4 = [C3, C4, D3, D4],

% check for valid solution

valid([RowA, RowB, RowC, RowD,
	Col1, Col2, Col3, Col4,
	Square1, Square2, Square3, Square4]).
