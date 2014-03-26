subset(_,[],_).
subset(RCS,[H|T],List):-
    member(H,List),
    valid(RCS),
    subset(RCS,T,List).

% Like \+member(H,T) but unbound cells are ignored
nonmember(_, []).
nonmember(H1, [H2|T]) :-
    (var(H2); H1 \= H2),
    nonmember(H1, T).

different([]).
different([H|T]):-
    (var(H); nonmember(H,T)),
    different(T),!.

valid([]).
valid([Head|Tail]) :- 
    different(Head), 
    valid(Tail),!.

sudoku(Puzzle) :-
    Puzzle = [S11, S12, S13, S14,
              S21, S22, S23, S24,
              S31, S32, S33, S34,
              S41, S42, S43, S44],

    Row1 = [S11, S12, S13, S14],
    Row2 = [S21, S22, S23, S24],
    Row3 = [S31, S32, S33, S34],
    Row4 = [S41, S42, S43, S44],

    Col1 = [S11, S21, S31, S41],
    Col2 = [S12, S22, S32, S42],
    Col3 = [S13, S23, S33, S43],
    Col4 = [S14, S24, S34, S44],

    Square1 = [S11, S12, S21, S22],
    Square2 = [S13, S14, S23, S24],
    Square3 = [S31, S32, S41, S42],
    Square4 = [S33, S34, S43, S44], 

    RCS = [Row1, Row2, Row3, Row4, 
           Col1, Col2, Col3, Col4, 
           Square1, Square2, Square3, Square4],

    subset(RCS, Puzzle, [1,2,3,4]).
