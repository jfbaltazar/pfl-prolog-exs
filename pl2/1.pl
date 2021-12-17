% a)

fatorial(0, 1).
fatorial(N, F) :- N > 0,
                  N1 is N - 1,
                  fatorial(N1, PrevFac),
                  F is PrevFac * N.


% b)

somaRec(0, 0).
somaRec(N, S) :- N > 0,
                 N1 is N - 1,
                 somaRec(N1, PrevSum),
                 S is PrevSum + N.


% c)

fibonacci(0, 0).
fibonacci(1, 1).
fibonacci(N, F) :- N > 1,
                   N1 is N - 1,
                   N2 is N - 2,
                   fibonacci(N1, F1),
                   fibonacci(N2, F2),
                   F is F1 + F2.


% d)

anyDivisible(X, Div) :- Div < X,
                        0 is X rem Div.

anyDivisible(X, Div) :- Div < X,
                        NewDiv is Div + 1,
                        anyDivisible(X, NewDiv).

isPrime(X) :- X >= 2,
              Div is 2,
              \+ anyDivisible(X, Div).
        
