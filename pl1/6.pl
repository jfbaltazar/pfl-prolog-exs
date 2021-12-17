pairs(X, Y):- d(X), q(Y).
pairs(X, X):- u(X).
u(1).
d(2).
d(4).
q(4).
q(16).

% a)
% pairs(X, Y) :-
%   d(X), q(Y)
%       d(2)
%           q(4) -> X=2, Y=4
%           q(16)-> X=2, Y=16
%       d(4)
%           q(4) -> X=4, Y=4
%           q(16)-> X=4, Y=16
% pairs(X, X) :-
%   u(X)
%       u(1) -> X=1, Y=1