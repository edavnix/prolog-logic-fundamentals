% ==============================================================================
% Exercise: 03_weather_activities.pl
% Description: Determines available activities based on weather conditions
% Platform: SWI-Prolog
% ==============================================================================
% Features:
% - Defines weather state (rainy/pleasant)
% - Infers available activities based on weather
% - Lists all possible activities
% ==============================================================================

:- encoding(utf8).
:- initialization(main).

is_rainy.

is_pleasant :- \+ is_rainy.
can_picnic :- is_pleasant.
can_swim :- is_pleasant.

descriptor(is_rainy, 'rainy', weather).
descriptor(is_pleasant, 'pleasant', weather).
descriptor(can_picnic, 'have a picnic', activity).
descriptor(can_swim, 'go swimming', activity).

verify_descriptor(Descriptor) :-
  descriptor(Descriptor, Name, Type),
  (
    call(Descriptor)
    -> (Type = weather
        -> format('[OK] the weather is ~w~n', [Name])
        ;  format('[OK] you can ~w~n', [Name]))
    ; (Type = weather
       -> format('[NO] the weather is not ~w~n', [Name])
       ;  format('[NO] you cannot ~w~n', [Name]))
  ).

show_all_activities :-
  write('List of activities:'), nl,
  forall(
    descriptor(_, Name, activity),
    format('  - ~w~n', [Name])
  ).

main :-
  write('=== Climate Activity ==='), nl, nl,

  verify_descriptor(is_rainy),
  verify_descriptor(is_pleasant),
  verify_descriptor(can_picnic),
  verify_descriptor(can_swim),
  nl,

  show_all_activities, nl.
