valid([]).
valid([Head|Tail]) :-
  fd_all_different(Head),
  valid(Tail).

sudoku(Puzzle, Solution) :-
  Solution = Puzzle,
  Puzzle = [A1, A2, A3, A4,
            B1, B2, B3, B4,
            C1, C2, C3, C4,
            D1, D2, D3, D4],
  fd_domain(Puzzle, 1, 4),

  Row1 = [A1, A2, A3, A4],
  Row2 = [B1, B2, B3, B4],
  Row3 = [C1, C2, C3, C4],
  Row4 = [D1, D2, D3, D4],

  Col1 = [A1, B1, C1, D1],
  Col2 = [A2, B2, C2, D2],
  Col3 = [A3, B3, C3, D3],
  Col4 = [A4, B4, C4, D4],

  Square1 = [A1, A2, B1, B2],
  Square2 = [A3, A4, B3, B4],
  Square3 = [C1, C2, D1, D2],
  Square4 = [C3, C4, D3, D4],

  valid([Row1, Row2, Row3, Row4,
         Col1, Col2, Col3, Col4,
         Square1, Square2, Square3, Square4]).
