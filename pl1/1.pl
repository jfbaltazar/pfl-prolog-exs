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

% rules

father(X,Y) :- parent(X,Y), male(X).
grandparent(X,Y) :- parent(X,Z), parent(Z,Y).
grandmother(X,Y) :- grandparent(X,Y), female(X).
siblings(X,Y) :- parent(P1,X), parent(P1,Y), parent(P2,X), parent(P2,Y), (X \= Y), (P1 \= P2).
halfSiblings(X,Y) :- \+ siblings(X,Y), parent(P,X), parent(P,Y), (X \= Y).
cousins(X,Y) :- parent(PX, X), parent(PY, Y), siblings(PX, PY), (X \= Y), (PX \= PY).
genderlessUncle(X,Y) :- parent(P, Y), siblings(X, P).
uncle(X,Y) :- genderlessUncle(X,Y), male(X).

% marriages and divorces

married(jay, gloria, 2008).
married(jay, dede, 1968).
divorced(jay, dede, 2003).

%% bonus points:

married(A, B, Y) :- married(B, A, Y).
divorced(A, B, Y) :- divorced(B, A, Y).