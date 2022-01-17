:- use_module(library(lists)).

% flight(origin, destination, company, code, hour, duration)

flight(porto, lisbon, tap, tp1949, 1615, 60).
flight(lisbon, madrid, tap, tp1018, 1805, 75).
flight(lisbon, paris, tap, tp440, 1810, 150).
flight(lisbon, london, tap, tp1366, 1955, 165).
flight(london, lisbon, tap, tp1361, 1630, 160).
flight(porto, madrid, iberia, ib3095, 1640, 80).
flight(madrid, porto, iberia, ib3094, 1545, 80).
flight(madrid, lisbon, iberia, ib3106, 1945, 80).
flight(madrid, paris, iberia, ib3444, 1640, 125).
flight(madrid, london, iberia, ib3166, 1550, 145).
flight(london, madrid, iberia, ib3163, 1030, 140).
flight(porto, frankfurt, lufthansa, lh1177, 1230, 165).


% a)

get_all_nodes(ListOfAirports) :- setof(Airport, (Or,Dest,Comp,Code,Hour,Dur)^(flight(Or, Dest, Comp, Code, Hour, Dur), (Or=Airport; Dest=Airport)), ListOfAirports).

% b)

score(Company, Score) :- setof(Destination, (Or, Code, Hour, Dur)^flight(Or, Destination, Company, Code, Hour, Dur), Destinations),
                         length(Destinations, Score).

most_diversified([Company], Company).
most_diversified([Company | T], Company) :- most_diversified(T, NextBest),
                                            score(Company, BestScore),
                                            score(NextBest, NextBestScore),
                                            BestScore >= NextBestScore.
most_diversified([Competitor | T], Company) :- score(Competitor, CompScore),
                                               score(Company, BestScore),
                                               BestScore >= CompScore,
                                               most_diversified(T, Company).

most_diversified(Company) :- setof(Company, (Or,Dest,Code,Hour,Dur)^flight(Or, Dest, Company, Code, Hour, Dur), Companies),
                             most_diversified(Companies, Company).

% c)

already_visited(Location, [Code | T]) :- flight(_, Location, _, Code, _, _);
                                         flight(Location, _, _, Code, _, _);
                                         already_visited(Location, T).

find_flights(Origin, Origin, Acc, Acc).
find_flights(Origin, Destination, Acc, Flights) :- flight(Origin, Intermediate, _, FirstFlight, _, _),
                                                   \+ already_visited(Intermediate, Acc),
                                                   find_flights(Intermediate, Destination, [FirstFlight | Acc], Flights).


find_flights(Origin, Destination, Flights) :- find_flights(Origin, Destination, [], Path),
                                              reverse(Path, Flights).

