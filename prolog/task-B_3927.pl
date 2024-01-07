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

exists_path(Inital, Goal) :-
    Inital = Goal,  % Return true if Inital and Goal are the same
    !.
exists_path(Inital, Goal) :-
    interconnected(Inital, Goal),  % Return true if directly connected
	!.
exists_path(Inital, Goal) :-
    (interconnected(Inital, Next) ; interconnected(Goal, Prev)),  % Check for nodes between Initial and Goal
    exists_path(Next, Prev).  % Add a base case to return true when Next and Prev are the same node.

