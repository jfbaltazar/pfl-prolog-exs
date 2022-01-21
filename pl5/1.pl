% a)

double(X, Y):- Y is X*2.

map(_, [], []).
map(Pred, [H1 | T1], [H2 | T2]) :- G =.. [Pred, H1, H2],
                                   G,
                                   map(Pred, T1, T2).

% b)

sum(A, B, S):- S is A+B.

fold(_, Final, [], Final).
fold(Pred, Start, [H | T], Final) :- G =.. [Pred, Start, H, Intermediate],
                                     G,
                                     fold(Pred, Intermediate, T, Final).

% c)

even(X):- 0 is X mod 2.

separate([], _, [], []).
separate([H | T], Pred, [H | Yes], No) :- G =.. [Pred, H],
                                          G, !,
                                          separate(T, Pred, Yes, No).
separate([H | T], Pred, Yes, [H | No]) :- separate(T, Pred, Yes, No).

% d)

ask_execute :- write('Insira o que deseja executar'), nl,
               read(Goal),
               Goal.