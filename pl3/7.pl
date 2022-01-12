% class(Course, ClassType, DayOfWeek, Time, Duration)

class(pfl, t, '1 Seg', 11, 1).
class(pfl, t, '4 Qui', 10, 1).
class(pfl, tp, '2 Ter', 10.5, 2).
class(lbaw, t, '1 Seg', 8, 2).
class(lbaw, tp, '3 Qua', 10.5, 2).
class(ltw, t, '1 Seg', 10, 1).
class(ltw, t, '4 Qui', 11, 1).
class(ltw, tp, '5 Sex', 8.5, 2).
class(fsi, t, '1 Seg', 12, 1).
class(fsi, t, '4 Qui', 12, 1).
class(fsi, tp, '3 Qua', 8.5, 2).
class(rc, t, '4 Qui', 8, 2).
class(rc, tp, '5 Sex', 10.5, 2).


% a)

same_day(UC1, UC2) :- class(UC1, _, Day, _, _),
                      class(UC2, _, Day, _, _).

% b)

daily_courses(Day, Courses) :- findall(Course, class(Course, _, Day, _, _), Courses).

% c)

short_classes(L) :- findall(Course-Day/Time, (class(Course, _, Day, Time, Duration), Duration < 2), L).

% d)

course_classes(Course, Classes) :- findall(Day/Time-Type, class(Course, Type, Day, Time, _), Classes).

% e)

courses(L) :- setof(Course, (CT,D,T,DT)^class(Course, CT, D, T, DT), L).

% f)

print_list([]).
print_list([H | T]) :- write(H), nl,
                       print_list(T).

schedule :- setof(Day/Time/Duration-Course-Type, class(Course, Type, Day, Time, Duration), Classes),
            print_list(Classes).

% g)

convert_day('1 Seg', seg).
convert_day('2 Ter', ter).
convert_day('3 Qua', qua).
convert_day('4 Qui', qui).
convert_day('5 Sex', sex).

show(Day/Time/Duration-Course-Type, ShowableDay/Time/Duration-Course-Type) :- convert_day(Day, ShowableDay).

better_print([]).
better_print([Entry | T]) :- show(Entry, ShowableEntry),
                             write(ShowableEntry), nl,
                             better_print(T).

better_schedule :- setof(Day/Time/Duration-Course-Type, class(Course, Type, Day, Time, Duration), Classes),
                   better_print(Classes).

% h)

find_class :- write('Day = '),
              read(Day), nl,
              write('Time = '),
              read(Time), nl,
              class(Course, _Type, Day, Time, Duration),
              write(Course-Time/Duration).
