%Assignment 4 - Giorgos Geramoutsos csd3927
%define facts and rules

interconnected(X, Y) :- connect(X, Y).
interconnected(X, Y) :- connect(Y, X).

connect(a, b).
connect(b, c).
connect(b, d).
connect(c, f).
connect(d, c).
connect(f, e).
connect(e, d).


path(Initial, Goal, Route) :-
    path_aux(Initial, Goal, [Goal], Route).

path_aux(Initial, Goal, Visited, [Initial|Visited]) :-
    interconnected(Initial, Goal).

path_aux(Initial, Goal, Visited, Route) :-
    interconnected(Intermediate, Goal), 
    not(member(Intermediate, Visited)), 
    Intermediate \== Initial,
    path_aux(Initial, Intermediate, [Intermediate| Visited], Route). 
