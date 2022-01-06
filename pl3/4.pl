% a)

print_n(_, 0).
print_n(Symbol, N) :- N > 0,
                      NewN is N-1,
                      write(Symbol),
                      print_n(Symbol, NewN).

% b)

print_string("").
print_string([Code | T]) :- char_code(Char, Code),
                            write(Char),
                            print_string(T).

print_text(Text, Symbol, Padding) :- write(Symbol),
                                     print_n(' ', Padding),
                                     print_string(Text),
                                     print_n(' ', Padding),
                                     write(Symbol).

% c)

print_banner_edge(Text, Symbol, Padding) :- length(Text, Len),
                                            Width is Len + Padding*2 + 2,
                                            print_n(Symbol, Width).

print_banner_empty(Text, Symbol, Padding) :- length(Text, Len),
                                             NSpaces is Len + Padding*2,
                                             write(Symbol),
                                             print_n(' ', NSpaces),
                                             write(Symbol).


print_banner(Text, Symbol, Padding) :- Padding >= 0,
                                       print_banner_edge(Text, Symbol, Padding), nl,
                                       print_banner_empty(Text, Symbol, Padding), nl,
                                       print_text(Text, Symbol, Padding), nl,
                                       print_banner_empty(Text, Symbol, Padding), nl,
                                       print_banner_edge(Text, Symbol, Padding).

% d)

read_number_acc(X, X) :- peek_code(10), !.
read_number_acc(Acc, X) :- \+ peek_code(10),
                           get_code(Code),
                           char_code('0', Zero),
                           Digit is Code-Zero,
                           Digit >= 0,
                           Digit < 10,
                           NewAcc is Acc*10 + Digit,
                           read_number_acc(NewAcc, X).
read_number(X) :- read_number_acc(0, X),
                  get_code(10).

% e)

read_until_between(Min, Max, Value) :- repeat,
                                       read_number(Value),
                                       Value >= Min,
                                       Value =< Max,
                                       !.

% f)

read_string("") :- peek_code(10),
                   !,
                   get_code(_).
read_string([Char | T]) :- get_code(Char),
                           read_string(T).

% g)

banner :- print_string("Text = "),
          read_string(Text), nl,
          print_string("Symbol = "),
          get_char(Symbol), get_char(_), nl,
          print_string("Padding = "),
          read_number(Padding), nl,
          print_string("Here comes your banner!"), nl, nl,
          print_banner(Text, Symbol, Padding).

% h)

repeat(0, _, []).
repeat(N, Elem, [Elem | T]) :- N > 0,
                               N1 is N-1,
                               repeat(N1, Elem, T).

%space_fill(Text, Size, StuffedText) :- length(StuffedText, Size),
%                                       length(Text, OldSize),
%                                       NSpaces is Size-OldSize,
%                                       char_code(' ', Space),
%                                       repeat(NSpaces, Space, Spaces),
%                                       append(Text, Spaces, StuffedText).

adjust_alignment(Text, Size, Text) :- length(Text, TextSize),
                                      0 is (Size - TextSize) mod 2.
adjust_alignment(Text, Size, [32 | Text]) :- length(Text, TextSize),
                                             1 is (Size - TextSize) mod 2.  % sim, o 32 está como número magico, eu sei. mas fica mesmo elegante assim! é o código ascii do espaço.

print_texts([], _, _, _).
print_texts([Text | T], Size, Symbol, Padding) :- adjust_alignment(Text, Size, EffectiveText),
                                                  length(Text, TextSize),
                                                  EffectivePadding is Padding + (Size - TextSize) div 2,
                                                  print_text(EffectiveText, Symbol, EffectivePadding), nl,
                                                  print_texts(T, Size, Symbol, Padding).

biggest([], []).
biggest([Biggest | T], Biggest) :- length(Biggest, BiggestLen),
                                   biggest(T, SecondBiggest),
                                   length(SecondBiggest, SecondBiggestLen),
                                   SecondBiggestLen =< BiggestLen,
                                   !.
biggest([_ | T], Biggest) :- biggest(T, Biggest).

print_multi_banner(Texts, Symbol, Padding) :- Padding >= 0,
                                              biggest(Texts, BiggestText),
                                              print_banner_edge(BiggestText, Symbol, Padding), nl,
                                              print_banner_empty(BiggestText, Symbol, Padding), nl,
                                              length(BiggestText, TextSize),
                                              print_texts(Texts, TextSize, Symbol, Padding),
                                              print_banner_empty(BiggestText, Symbol, Padding), nl,
                                              print_banner_edge(BiggestText, Symbol, Padding).

% i)

oh_christmas_tree(N) :- oh_christmas_tree(0, N).
oh_christmas_tree(Acc, N) :- Acc is N,
                             print_text("*", '', N),
                             !.
oh_christmas_tree(Acc, N) :- char_code('*', Asterisk),
                             NLeaves is Acc*2,
                             repeat(NLeaves, Asterisk, Leaves),
                             append(Leaves, [Asterisk], Section),
                             Padding is N-Acc,
                             print_text(Section, '', Padding), nl,
                             NewAcc is Acc+1,
                             oh_christmas_tree(NewAcc, N).
