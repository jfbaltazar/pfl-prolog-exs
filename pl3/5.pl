%% recordando...

% gender

female(grace).
female(dede).
female(gloria).
female(barb).
female(claire).
female(pameron).
female(haley).
female(alex).
female(lily).
female(poppy).

male(frank).
male(jay).
male(javier).
male(merle).
male(phil).
male(mitchell).
male(joe).
male(manny).
male(cameron).
male(bo).
male(dylan).
male(luke).
male(rexford).
male(calhoun).
male(george).

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

children(Person, Children) :- findall(Child, parent(Person, Child), Children).

% b)

children_of([], []).
children_of([Person | People], [Person-Children | Pairs]) :- children(Person, Children),
                                                             children_of(People, Pairs).

% c)

connected(P1, P2) :- parent(P1, P2); parent(P2, P1).

family(F) :- setof(Person, Relative^connected(Relative, Person), F).

% d)

couple(P1-P2) :- parent(P1, Child), parent(P2, Child), P1 \= P2.

% e)

couples(Couples) :- setof(Couple, couple(Couple), Couples).

% f)

spouse_children(Person, Spouse/Children) :- couple(Person-Spouse),
                                            children(Person, Children).

% g)

immediate_family(Person, Parents-SC) :- findall(Parent, parent(Parent, Person), Parents),
                                        spouse_children(Person, SC).

% h)

parent_of_two(Parent) :- setof(Child, parent(Parent, Child), Children),
                         length(Children, NChildren),
                         NChildren >= 2.

parents_of_two(Parents) :- setof(Parent, parent_of_two(Parent), Parents).
