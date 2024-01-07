%Assignment 4 - Giorgos Geramoutsos csd3927
%define facts and rules

interconnected(X, Y, C) :- connect(X, Y, C).
interconnected(X, Y, C) :- connect(Y, X, C).

connect(a, b, 3).
connect(b, c, 12).
connect(b, d, 4).
connect(c, f, 11).
connect(d, c, 7).
connect(f, e, 15).
connect(e, d, 5).

% cost_path rule that uses the auxiliary rule to account for visited nodes and path cost
cost_path(Initial, Goal, Route, Cost) :-
	cost_path_aux(Initial, Goal, [Goal], 0, Route, Cost).

% auxiliary cost_path rule accounting for visited nodes and path cost
cost_path_aux(Initial, Goal, Visited, CostSoFar, [Initial|Visited], CurrentCost) :-
	interconnected(Initial, Goal, Cost),
    CurrentCost is CostSoFar + Cost.

cost_path_aux(Initial, Goal, Visited, CurrentCost, Route, TotalCost) :-
	interconnected(Intermediate, Goal, Cost), % Check if intermediate node exists and get its cost
	not(member(Intermediate, Visited)), % Check if intermediate not already visited
	Intermediate \== Initial,
	NewCost is CurrentCost + Cost, % Update the current path cost
	% Add Intermediate node in visited list and recursively call
	cost_path_aux(Initial, Intermediate, [Intermediate| Visited], NewCost, Route, TotalCost).
