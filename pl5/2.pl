:- use_module(library(lists)).

% a)

my_arg(Index, Term, Arg) :- Term =.. [_Name | Args],
                            nth1(Index,Args,Arg).

my_functor(Term, Name, Arity) :- Term =.. [Name | Args],
                                 length(Args, Arity).

% b)

get_args(0, _, []).
get_args(Arity, Term, [H | T]) :- arg(Arity, Term, H),
                                  NewVal is Arity - 1,
                                  get_args(NewVal, Term, T).

univ(Term, [Name | Args]) :- functor(Term, Name, Arity),
                             get_args(Arity, Term, RevArgs),
                             reverse(RevArgs, Args).

% c)

:- op(1, xfx, univ).