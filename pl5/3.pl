:-op(500, xfx, na).
:-op(500, yfx, la).
:-op(500, xfy, ra).

% a explicaçao em https://stackoverflow.com/a/20693625 ajudou-me a entender finalmente como fazer isto!

% a)

a ra b na c.
% a xfy b xfx c
% a xfy (b xfx c)
% OK

% b)

% a la b na c.
% a yfx b xfx c
% [LA wants:] (a yfx b) xfx c // [NA wants:] a yfx (b xfx c)
% CONFLICT

% c)

a na b la c.
% (a xfx b) yfx c
% OK

% d)

% a na b ra c.
% a xfx b xfy c
% [NA wants:] (a xfx b) xfy c // [RA wants:] a xfx (b xfy c)
% CONFLICT

% e)

% a na b na c.
% a xfx b xfx c
% [NA1 wants:] (a xfx b) xfx c // [NA2 wants:] a xfx (b xfx c)
% CONFLICT

% f)

a la b la c.
% (a yfx b) yfx c
% OK

% g)

a ra b ra c.
% a xfy (b xfy c)
% OK
