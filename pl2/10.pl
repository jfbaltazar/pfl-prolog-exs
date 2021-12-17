% a)

is_ordered([_]).
is_ordered([N1, N2 | T]) :- N1 =< N2, is_ordered([N2 | T]).

% b)

insert_ordered(Value, [], [Value]).
insert_ordered(Value, [N | T], [Value, N | T]) :- Value =< N.
insert_ordered(Value, [N | T], [N | T2]) :- Value > N, insert_ordered(Value, T, T2).

% c)

insert_sort([], []).
insert_sort([H | T], OrderedList) :- insert_sort(T, OrderedTail),
                                     insert_ordered(H, OrderedTail, OrderedList).