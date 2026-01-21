% ==============================================================================
% Exercise: 07_multiplication_table.pl
% Description: Generates multiplication tables using recursive predicates
% Platform: SWI-Prolog
% ==============================================================================
% Features:
% - Reads base number and limit from user input
% - Generates multiplication table recursively
% - Displays formatted results from 1 to specified limit
% ==============================================================================

:- encoding(utf8).
:- initialization(main).

multiply_table(_, Counter, Limit) :-
  Counter > Limit.

multiply_table(Base, Counter, Limit) :-
  Counter =< Limit,
  Result is Base * Counter,
  format('  - ~w x ~w = ~w~n', [Base, Counter, Result]),
  NextCounter is Counter + 1,
  multiply_table(Base, NextCounter, Limit).

show_table(Base, Limit) :-
  multiply_table(Base, 1, Limit).

main :-
  write('=== Multiplication Table Generator ==='), nl, nl,
  write('Enter the desired table: '), read(Base),
  write('Enter the limit: '), read(Limit), nl,
  write('Table of '), write(Base), write(':'), nl,
  show_table(Base, Limit), nl.
