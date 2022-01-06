s(1).
s(2) :- !.
s(3).

% a)
% s(X)
%   X = 1
%     s(1)
%   X = 2
%     s(2)
%       CUT
%   -----------

% b)
% s(X), s(Y)
%   X = 1
%     s(1), s(Y)
%     yes, s(Y)
%     s(Y)
%       Y = 1
%         s(1)
%       Y = 2
%         s(2)
%           CUT
%     -------------
%   X = 2
%     s(2), s(Y)
%     CUT, s(Y)
%     s(Y)
%       Y = 1
%         s(1)
%       Y = 2
%         s(2)
%           CUT
%     -------------
%   ---------------

% c)
% s(X), CUT, s(Y)
%   X = 1
%     s(1), CUT, s(Y)
%     CUT, s(Y)
%     s(Y)
%       Y = 1
%         s(1)
%       Y = 2
%         s(2)
%           CUT
%     ----------------
%   ------------------