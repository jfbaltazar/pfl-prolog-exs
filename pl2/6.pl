% a)

invert(Xs, Rev) :- invert(Xs, [], Rev).
invert([X|Xs], Acc, Rev) :- invert(Xs, [X|Acc], Rev).
invert([], Rev, Rev).

% b)

del_one(E, [E | T], T).
del_one(E, [H | T], L2) :- E \= H,
                           del_one(E, T, L),
                           L2 = [H | L].

% c)

del_all(_, [], []).
del_all(E, [E | T], L2) :- del_all(E, T, L2).
del_all(E, [H | T], L2) :- E \= H,
                           del_all(E, T, L),
                           L2 = [H | L].

% d)

del_all_list(_, [], []).
del_all_list(LE, [H | T], L2) :- member(H, LE),
                                 del_all_list(LE, T, L2).
del_all_list(LE, [H | T], L2) :- \+ member(H, LE),
                                 del_all_list(LE, T, L),
                                 L2 = [H | L].

% e)

del_dups([], []).
del_dups([H | T], L2) :- member(H, T),
                         del_all(H, T, L),
                         del_dups(L, NoDups),
                         L2 = [H | NoDups].
del_dups([H | T], L2) :- \+ member(H, T),
                         del_one(H, L2, L),
                         del_dups(T, L).

% f)

list_perm([], []).
list_perm([H1 | T1], L2) :- del_one(H1, L2, DelL2),
                            list_perm(T1, DelL2).

% g)

replicate(0, _, []).
replicate(A, E, [H | T]) :- A > 0,
                            E = H,
                            NewA is A - 1,
                            replicate(NewA, E, T).

% h)

intersperse(_, [], []).
intersperse(_, [H1 | []], [H1]).
intersperse(E, [H1 | T1], L2) :- T1 \= [],
                                 intersperse(E, T1, LRem),
                                 L2 = [H1, E | LRem].

% i)

insert_elem(0, [H1 | T1], E, [E, H1 | T1]).
insert_elem(I, [H1 | T1], E, [H2 | T2]) :- I > 0,
                                           H1 = H2,
                                           NewI is I - 1,
                                           insert_elem(NewI, T1, E, T2).

% j)

delete_elem(0, [E | T1], E, T1).
delete_elem(I, [H1 | T1], E, [H2 | T2]) :- I > 0,
                                           H1 = H2,
                                           NewI is I - 1,
                                           delete_elem(NewI, T1, E, T2).

% com um predicado:
chng_elem(0, [H1 | T1], E, [E, H1 | T1], ins).
chng_elem(0, [E | T1], E, T1, del).
chng_elem(I, [H1 | T1], E, [H2 | T2], Mode) :- I > 0,
                                 H1 = H2,
                                 NewI is I - 1,
                                 chng_elem(NewI, T1, E, T2, Mode).

% k)

replace([H1 | T1], 0, O, N, [H2 | T2]) :- O = H1,
                                          N = H2,
                                          T1 = T2.
replace([H1 | T1], I, O, N, [H2 | T2]) :- I > 0,
                            H1 = H2,
                            NewI is I - 1,
                            replace(T1, NewI, O, N, T2).