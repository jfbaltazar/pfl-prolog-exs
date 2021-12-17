% a)

:-use_module(library(lists)).

accRun(Info, [OtherInfo | _], N, N) :- Info \= OtherInfo.
accRun(_Info, [], N, N).
accRun(Info, [Info | T], N, Acc) :- NewAcc is Acc + 1,
                                    accRun(Info, T, N, NewAcc).

run(Info, [Info | T], N) :- accRun(Info, [Info | T], N, 0).

rle([], []).
rle([Info | T1], [Info-Reps | T2]) :- run(Info, [Info | T1], Reps),
                                      sublist([Info | T1], RemList, Reps, _, 0), % remove esta run da lista
                                      rle(RemList, T2).

% b)

un_rle([], []).
un_rle([_Info-1 | T1], [_Info | T2]) :- un_rle(T1, T2).
un_rle([Info-Reps | T1], [Info | T2]) :- Reps > 1,
                                         NewReps is Reps - 1,
                                         un_rle([Info-NewReps | T1], T2).