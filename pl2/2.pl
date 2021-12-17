% only keeping parenthood because gender is a social construct.

% family

parent(grace, phil).
parent(frank, phil).

parent(dede, claire).
parent(jay, claire).

parent(dede, mitchell).
parent(jay, mitchell).

parent(jay, joe).
parent(gloria, joe).

parent(javier, manny).
parent(gloria, manny).

parent(barb, cameron).
parent(merle, cameron).

parent(barb, pameron).
parent(merle, pameron).

parent(phil, haley).
parent(claire, haley).

parent(phil, alex).
parent(claire, alex).

parent(phil, luke).
parent(claire, luke).

parent(mitchell, lily).
parent(cameron, lily).

parent(mitchell, rexford).
parent(cameron, rexford).

parent(pameron, calhoun).
parent(bo, calhoun).

parent(dylan, george).
parent(haley, george).

parent(dylan, poppy).
parent(haley, poppy).


% a)

ancestor(X, Y) :- parent(X, Y).
ancestor(X, Y) :- parent(X, Z), ancestor(Z, Y).


% b)

descendant(X, Y) :- ancestor(Y, X).