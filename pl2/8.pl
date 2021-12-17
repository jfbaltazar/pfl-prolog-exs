% a)

list_to(0, []).
list_to(N, List) :- N > 0,
                    NewN is N - 1,
                    list_to(NewN, Front),
                    append(Front, [N], List).

% b)

list_from_to(Lim, Lim, [Lim]).
list_from_to(Inf, Sup, List) :- Inf < Sup,
                                NewInf is Inf + 1,
                                list_from_to(NewInf, Sup, Back),
                                append([Inf], Back, List).

% c)

list_from_to_step(Inf, _, Sup, []) :- Inf > Sup.
list_from_to_step(Lim, _, Lim, [Lim]). 
list_from_to_step(Inf, Step, Sup, List) :- Inf < Sup,
                                           NewInf is Inf + Step,
                                           list_from_to_step(NewInf, Step, Sup, Back),
                                           append([Inf], Back, List).

% d)

:- use_module(library(lists)).

list_from_to2(Inf, Sup, List) :- Inf > Sup,
                                 list_from_to(Sup, Inf, RevL),
                                 reverse(RevL, List).
list_from_to2(Inf, Sup, List) :- Inf =< Sup,
                                 list_from_to(Inf, Sup, List).

list_from_to_step2(Inf, Step, Sup, List) :- Inf > Sup,
                                            list_from_to_step(Sup, Step, Inf, RevL),
                                            reverse(RevL, List).
list_from_to_step2(Inf, Step, Sup, List) :- Inf =< Sup,
                                            list_from_to_step(Inf, Step, Sup, List).

% e)

anyDivisible(X, Div) :- Div < X,
                        0 is X rem Div.
anyDivisible(X, Div) :- Div < X,
                        NewDiv is Div + 1,
                        anyDivisible(X, NewDiv).
isPrime(X) :- X >= 2,
              Div is 2,
              \+ anyDivisible(X, Div).

primes(1, []).
primes(N, List) :- N >= 2,
                   \+ isPrime(N),
                   NewN is N - 1,
                   primes(NewN, List).
primes(N, List) :- N >= 2,
                   isPrime(N),
                   NewN is N - 1,
                   primes(NewN, Front),
                   append(Front, [N], List).

% f)

fibonacci(0, 0).
fibonacci(1, 1).
fibonacci(N, F) :- N > 1,
                   N1 is N - 1,
                   N2 is N - 2,
                   fibonacci(N1, F1),
                   fibonacci(N2, F2),
                   F is F1 + F2.

fibs(0, [0]).
fibs(1, [0,1]).
fibs(N, List) :- N > 1,
                 NewN is N - 1,
                 fibonacci(N, FN),
                 fibs(NewN, Front),
                 append(Front, [FN], List).