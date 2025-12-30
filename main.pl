:- module(main, [hello_world/0, list_member/2, list_length/2, factorial/2]).

/** <module> Starter Prolog Patterns
    This module contains common recursive patterns and utility predicates 
    to jumpstart a new SWI-Prolog project.
*/

%!  hello_world
%   A simple entry point to test if the file loaded correctly.
hello_world :-
    write('Hello, Prolog! The Knowledge Base is active.'), nl.

% ---------------------------------------------------------
% LIST PROCESSING PATTERNS
% ---------------------------------------------------------

%!  list_member(?Element, +List)
%   Classic membership check using recursion.
list_member(X, [X|_]).                  % Base case: X is the head of the list.
list_member(X, [_|Tail]) :-             % Recursive step: check the tail.
    list_member(X, Tail).

%!  list_length(+List, -Length)
%   Calculates the number of elements in a list.
list_length([], 0).                     % Base case: empty list is length 0.
list_length([_|Tail], N) :-
    list_length(Tail, N1),
    N is N1 + 1.

% ---------------------------------------------------------
% ARITHMETIC RECURSION
% ---------------------------------------------------------

%!  factorial(+N, -Result)
%   Calculates the factorial of N.
factorial(0, 1) :- !.                   % Base case: 0! is 1 (with cut to prevent backtracking).
factorial(N, Result) :-
    N > 0,
    Prev is N - 1,
    factorial(Prev, PrevResult),
    Result is N * PrevResult.

% ---------------------------------------------------------
% INITIALIZATION
% ---------------------------------------------------------

% This directive runs the hello_world predicate automatically when the file is loaded.
:- initialization(hello_world).
