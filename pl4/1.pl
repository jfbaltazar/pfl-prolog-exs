% a)

:- dynamic male/1, female/1, private/1.

save_person(male, Name) :- assert(male(Name)).
save_person(female, Name) :- assert(female(Name)).
save_person(private, Name) :- assert(private(Name)).

add_person :- format('male/female/private?~n', []),
              read(Gender), nl,
              format('first name?~n', []),
              read(Name),
              save_person(Gender, Name).

% b)

:- dynamic parent/2.

add_parents(Person) :- format('who is parent 1?~n', []),    % eu *devia* permitir 0, 1 *ou ate >2* pais para inclusividade, mas provavelmente quebra o codigo do pl1.
                       read(P1), nl,
                       format('who is parent 2?~n', []),
                       read(P2), nl,
                       assert(parent(P1,Person)),
                       assert(parent(P2, Person)).

% c)

remove_gender(Person) :- male(Person),
                         retract(male(Person)).
remove_gender(Person) :- female(Person),
                         retract(female(Person)).
remove_gender(Person) :- private(Person),
                         retract(private(Person)).
remove_gender(_).

remove_person :- format('insert your death note entry, please~n', []),
                 read(Person), nl,
                 remove_gender(Person),
                 retractall(parent(_, Person)),
                 retractall(parent(Person, _)).
