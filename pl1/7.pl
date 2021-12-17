a(a1, 1).
a(A2, 2).
a(a3, N).
b(1, b1).
b(2, B2).
b(N, b3).
c(X, Y):- a(X, Z), b(Z, Y).
d(X, Y):- a(X, Z), b(Y, Z).
d(X, Y):- a(Z, X), b(Z, Y).

% b)
% i. A=2
% ii. A=2
% iii. c(A, b3) :- a(A, Z), b(Z, b3) -> a(A,N) -> A=a1; yes
% iv. c(A, B) :- a(A, Z), b(Z, B) -> A=a1,B=b1; A=a1,B=b3; yes
% v. d(A, B) :- a(A, Z), b(B, Z) -> A=a1,B=2; B=2; A=a3,B=1; A=a3,B=2; A=a3
%               a(Z, X), b(Z, Y) -> A=1,B=b3; A=2,B=b1; A=2; A=2,B=b3; B=b3