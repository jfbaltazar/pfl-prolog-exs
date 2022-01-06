%% recordando...

% conhecimento

leciona(algoritmos, adalberto).
leciona(bases_de_dados, bernardete).
leciona(compiladores, capitolino).
leciona(estatistica, diogenes).
leciona(redes, ermelinda).


frequenta(algoritmos, alberto).
frequenta(algoritmos, bruna).
frequenta(algoritmos, cristina).
frequenta(algoritmos, diogo).
frequenta(algoritmos, eduarda).

frequenta(bases_de_dados, antonio).
frequenta(bases_de_dados, bruno).
frequenta(bases_de_dados, cristina).
frequenta(bases_de_dados, duarte).
frequenta(bases_de_dados, eduardo).

frequenta(compiladores, alberto).
frequenta(compiladores, bernardo).
frequenta(compiladores, clara).
frequenta(compiladores, diana).
frequenta(compiladores, eurico).

frequenta(estatistica, antonio).
frequenta(estatistica, bruna).
frequenta(estatistica, claudio).
frequenta(estatistica, duarte).
frequenta(estatistica, eva).

frequenta(redes, alvaro).
frequenta(redes, beatriz).
frequenta(redes, claudio).
frequenta(redes, diana).
frequenta(redes, eduardo).

aluno(X, Y) :- frequenta(UC, X), leciona(UC, Y).

colega(X, Y, UC) :- frequenta(UC, X), frequenta(UC, Y), (X \= Y).


% a)

teachers(T) :- setof(Professor, Cadeira^leciona(Cadeira, Professor), T).

% b) ja estou a evitar duplicados com o setof, mas com bagof haveria esse problema.

% c)

students_of(T, S) :- setof(Estudante, aluno(Estudante, T), S).

% d)

teachers_of(S, T) :- setof(Professor, aluno(S, Professor), T).

% e)

common_courses(S1, S2, C) :- setof(UC, (frequenta(UC, S1), frequenta(UC, S2)), C).

% f)

more_than_one_course(L) :- setof(Estudante, (UC1,UC2)^(frequenta(UC1, Estudante), frequenta(UC2, Estudante), UC1 \= UC2), L).

% g) nao estou a conseguir fazer este :((((

strangers(S1, S2) :- S1 \= S2,
                     \+ colega(S1, S2, _).
                     

strangers(L) :- setof(S1-S2, strangers(S1, S2), L).

% h)

good_groups(L) :- setof(S1-S2, (UC1,UC2)^(frequenta(UC1, S1), frequenta(UC2, S1), frequenta(UC1, S2), frequenta(UC2, S2), UC1 \= UC2, S1 \= S2), L).