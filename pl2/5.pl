% a)

list_size([], 0).
list_size([_|T], S) :- list_size(T, ST),
                       S is ST + 1.


% b)

list_sum([], 0).
list_sum([H | T], S) :- list_sum(T, ST),
                        S is ST + H.


% c)

list_prod([], 1).
list_prod([H | T], P) :- list_prod(T, PT),
                         P is PT * H.


% d)

inner_product([], [], 0).
inner_product([H1 | T1], [H2 | T2], IP) :- inner_product(T1, T2, IPT),
                                           IP is IPT + H1 * H2.


% e)

count(_, [], 0).
count(E, [E | T], N) :- count(E, T, NT),
                        N is NT + 1.
count(E, [H | T], N) :- H =\= E,
                        count(E, T, N).

                        