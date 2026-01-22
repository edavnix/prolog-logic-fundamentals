% ==============================================================================
% Exercise: 08_general_menu.pl
% Description: Interactive menu system with recursive mathematical operations
% Platform: SWI-Prolog
% ==============================================================================
% Features:
% - Basic operations: addition, subtraction, multiplication, division
% - Advanced operations: factorial, power calculation
% - Grade averaging: single subject and overall multi-subject averages
% - Input validation and error handling for edge cases
% - Recursive menu system with 9 options
% ==============================================================================

:- encoding(utf8).
:- initialization(main).

factorial(0, 1).
factorial(N, Result) :-
  N > 0,
  N1 is N - 1,
  factorial(N1, Result1),
  Result is N * Result1.

power(_, 0, 1).
power(Base, Exponent, Result) :-
  Exponent > 0,
  Exp1 is Exponent - 1,
  power(Base, Exp1, Result1),
  Result is Result1 * Base.

read_grades(0, 0).
read_grades(N, Sum) :-
  N > 0,
  N1 is N - 1,
  write('Rating: '),
  read(Grade),
  read_grades(N1, Sum1),
  Sum is Sum1 + Grade.

calculate_average(N, Average) :-
  read_grades(N, Sum),
  Average is Sum / N.

display_result(Result) :-
  format('  - The result is: ~w~n', [Result]).

display_average(Average) :-
  format('  - The overall average is: ~w~n', [Average]).

operation_add :-
  write('Enter the value of A: '), read(A),
  write('Enter the value of B: '), read(B),
  Result is A + B,
  display_result(Result).

operation_subtract :-
  write('Enter the value of A: '), read(A),
  write('Enter the value of B: '), read(B),
  Result is A - B,
  display_result(Result).

operation_multiply :-
  write('Enter the value of A: '), read(A),
  write('Enter the value of B: '), read(B),
  Result is A * B,
  display_result(Result).

operation_divide :-
  write('Enter the value of A: '), read(A),
  write('Enter the value of B: '), read(B),
  (
    B =:= 0
    ->  write('  - Error: Division by zero is not allowed'), nl
    ;   Result is A / B,
    display_result(Result)
  ).

operation_factorial :-
  write('Enter the number to calculate the factorial: '), read(N),
  (
    N < 0
    ->  write('  - Error: Enter a number greater than or equal to zero'), nl
    ;   N =:= 0
    ->  write('  - The result is: 1'), nl
    ;   N =:= 1
    ->  write('  - The result is: 1'), nl
    ;   factorial(N, Result),
    display_result(Result)
  ).

operation_power :-
  write('Enter the base: '), read(Base),
  (
    Base =:= 0
    ->  write('  - The power of 0 is always 0'), nl
    ;   Base < 0
    ->  write('  - You cannot calculate the power of negative numbers'), nl
    ;   write('Enter the exponent: '), read(Exp),
    (   Exp < 0
      ->  write('  - Negative power cannot be calculated'), nl
      ;   Exp =:= 0
      ->  write('  - Any number raised to the power of 0 is 1'), nl
      ;   Exp =:= 1
      ->  format('  - The result is: ~w~n', [Base])
      ;   power(Base, Exp, Result),
      display_result(Result)
    )
  ).

read_subjects_averages(0, 0).
read_subjects_averages(N, Sum) :-
  N > 0,
  N1 is N - 1,
  write('Number of grades for this subject: '),
  read(NumGrades),
  calculate_average(NumGrades, Average),
  format('  - Average grade for the subject: ~w~n', [Average]),
  read_subjects_averages(N1, Sum1),
  Sum is Sum1 + Average.

calculate_general_average(NumSubjects, GeneralAverage) :-
  read_subjects_averages(NumSubjects, Sum),
  GeneralAverage is Sum / NumSubjects.

operation_average :-
  write('Number of grades: '), read(N),
  (
    N > 0
    ->  calculate_average(N, Average),
    display_average(Average)
    ;   write('  - Error: You must enter at least one grade'), nl
  ).

operation_general_average :-
  write('Number of subjects: '), read(NumSubjects),
  (
    NumSubjects > 0
    ->  calculate_general_average(NumSubjects, GeneralAverage),
    display_average(GeneralAverage)
    ;   write('  - Error: You must enter at least one subject'), nl
  ).

process_option(1) :- operation_add.
process_option(2) :- operation_subtract.
process_option(3) :- operation_multiply.
process_option(4) :- operation_divide.
process_option(5) :- operation_factorial.
process_option(6) :- operation_power.
process_option(7) :- operation_average.
process_option(8) :- operation_general_average.
process_option(9) :- nl, write('Thank you for using the program.'), nl.
process_option(_) :- write('Invalid option'), nl.

show_menu :- nl,
  write('=== Recursion Menu ==='), nl,
  write('1. Sum of A + B'), nl,
  write('2. Subtraction of A - B'), nl,
  write('3. Multiplication of A * B'), nl,
  write('4. Division of A / B'), nl,
  write('5. Factorial'), nl,
  write('6. Power'), nl,
  write('7. Average'), nl,
  write('8. Overall Average'), nl,
  write('9. Finish'), nl,
  write('Type your choice: '), read(Option),
  process_option(Option), ( Option =:= 9 -> true ; show_menu).

main :- show_menu, nl.
