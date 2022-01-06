data(one).
data(two).
data(three).
cut_test_a(X):- data(X).
cut_test_a('five').
cut_test_b(X):- data(X), !.
cut_test_b('five').
cut_test_c(X, Y):- data(X), !, data(Y).
cut_test_c('five').

% a)
% cut_test_a(X)
%   data(X)
%     X = one
%       data(one)
%     X = two
%       data(two)
%     X = three
%       data(three)
%   X = 'five'
%     cut_test_a(five)

% b)
% cut_test_b(X)
%   data(X), CUT
%     data(one), CUT
%     CUT
%   ------------------

% c)
% cut_test_c(X, Y)
%   data(X), CUT, data(Y)
%     X = one
%       data(one), CUT, data(Y)
%       CUT, data(Y)
%       data(Y)
%         Y = one
%           data(one)
%         Y = two
%           data(two)
%         Y = three
%           data(three)
%     --------------------------
