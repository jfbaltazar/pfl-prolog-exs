% a)

list_append([], L2, L2).
list_append([H1 | T1], L2, [H1 | T3]) :- list_append(T1, L2, T3).

% b)

list_member(Elem, List) :- list_append(_Part1, [Elem | _Part2], List).

% c)

list_last(List, Last) :- list_append(_ExceptLast, [Last | []], List).

% d)

list_nth(N, List, Elem) :- list_append(Part1, [Elem | _Part2], List),
                           length(Part1, N).

% e)

list_append([L1 | []], List) :- L1 = List.
list_append([L1 | LN], List) :- list_append(L1, LRem, List),
                                list_append(LN, LRem).

% f)

list_del(List, Elem, Res) :- list_append(Part1, [Elem | Part2], List),
                             list_append(Part1, Part2, Res).

% g)

list_before(First, Second, List) :- list_append(_Part1, [First | Rem], List),
                                    list_append(_Part2, [Second | _Part3], Rem).

% h)

list_replace_one(X, Y, L1, L2) :- list_append(Part1, [X | Part2], L1),
                                  list_append(Part1, [Y | Part2], L2).

% i)

list_repeated(X, List) :- list_before(X, X, List).

% j)

list_slice(L1, Index, Size, Slice) :- list_append(Front, Rem, L1),
                                   length(Front, Index),
                                   list_append(Slice, _Back, Rem),
                                   length(Slice, Size).

% k)

list_shift_rotate(L1, N, L2) :- list_append(ToRotate, ToKeep, L1),
                                list_append(ToKeep, ToRotate, L2),
                                length(ToRotate, N).
                                