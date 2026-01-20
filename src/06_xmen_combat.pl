% ==============================================================================
% Exercise: 06_xmen_combat.pl
% Description: X-Men combat based on character types, levels and powers
% Platform: SWI-Prolog
% ==============================================================================
% Features:
% - Defines mutants, robots, and humans with power levels (0-4)
% - Assigns powers (telepathy, matter manipulation, super strength, etc.)
% - Determines elimination rules based on character type and power level
% - Lists characters, levels, powers, and combat outcomes
% ==============================================================================

:- encoding(utf8).
:- initialization(main).

is_mutant(archangel).
is_mutant(captainAmerica).
is_mutant(charles).
is_mutant(colossus).
is_mutant(cyclops).
is_mutant(deadpool).
is_mutant(hope).
is_mutant(jeanGray).
is_mutant(magneto).
is_mutant(mole).
is_mutant(mystique).
is_mutant(rogue).
is_mutant(storm).
is_mutant(titania).
is_mutant(volcano).
is_mutant(wolwerine).
is_robot(sentinel).
is_human(doctorMoyra).
is_human(generalWatson).
level_value(zero, 0).
level_value(one, 1).
level_value(two, 2).
level_value(three, 3).
level_value(maximum, 4).
has_level(archangel, zero).
has_level(captainAmerica, zero).
has_level(charles, one).
has_level(colossus, two).
has_level(cyclops, zero).
has_level(deadpool, one).
has_level(hope, three).
has_level(jeanGray, maximum).
has_level(magneto, three).
has_level(mole, zero).
has_level(mystique, zero).
has_level(rogue, one).
has_level(storm, three).
has_level(titania, two).
has_level(volcano, three).
has_level(wolwerine, one).
has_power(archangel, physicalAlteration).
has_power(captainAmerica, physicalAlteration).
has_power(charles, extrasensory).
has_power(colossus, superStrength).
has_power(cyclops, physicalAlteration).
has_power(deadpool, extrasensory).
has_power(hope, matterManipulation).
has_power(jeanGray, telepathy).
has_power(jeanGray, matterManipulation).
has_power(jeanGray, superStrength).
has_power(jeanGray, extrasensory).
has_power(jeanGray, physicalAlteration).
has_power(magneto, matterManipulation).
has_power(mole, physicalAlteration).
has_power(mystique, physicalAlteration).
has_power(rogue, extrasensory).
has_power(storm, matterManipulation).
has_power(titania, superStrength).
has_power(volcano, matterManipulation).
has_power(wolwerine, extrasensory).
has_power(doctorMoyra, none).
has_power(generalWatson, none).

eliminates(Attacker, Target) :-
  is_robot(Attacker),
  (is_robot(Target); is_mutant(Target); is_human(Target)).

eliminates(Attacker, Target) :-
    is_mutant(Attacker),
    is_human(Target).

eliminates(Attacker, Target) :-
  is_human(Attacker),
  (is_human(Target); is_robot(Target)).

eliminates(Attacker, Target) :-
  (is_mutant(Attacker); is_robot(Attacker)),
  (is_mutant(Target); is_robot(Target); is_human(Target)),
  has_level(Attacker, LevelA),
  has_level(Target, LevelT),
  level_value(LevelA, ValueA),
  level_value(LevelT, ValueT),
  ValueA >= ValueT.

show_all_characters :-
  write('List of characters:'), nl,
  forall(
    (is_mutant(Character); is_robot(Character); is_human(Character)),
    (
      is_mutant(Character) -> format('  - ~w is a mutant~n', [Character]);
      is_robot(Character)  -> format('  - ~w is a robot~n', [Character]);
      format('  - ~w is a human~n', [Character])
    )
  ).

show_all_levels :-
  write('List of levels:'), nl,
  forall(
    has_level(Character, Level),
    format('  - ~w has the level ~w~n', [Character, Level])
  ).

show_mutant_powers :-
  write('List of powers:'), nl,
  forall(
    (has_power(Character, Power), is_mutant(Character)),
    format('  - ~w has the power to ~w~n', [Character, Power])
  ).

show_rogue_level :-
  write('Rogue Level:'), nl,
  forall(
    has_level(rogue, Level),
    format('  - ~w~n', [Level])
  ).

show_moyra_powers :-
  write('List of Dr. Moyras powers:'), nl,
  forall(
    has_power(doctorMoyra, Power),
    format('  - ~w~n', [Power])
  ).

show_who_eliminates_watson :-
  write('Who eliminates General Watson?:'), nl,
  forall(
    eliminates(Character, generalWatson),
    format('  - ~w~n', [Character])
  ).

show_level_zero_characters :-
  write('List of characters with level zero (physical alterations):'), nl,
  forall(
    has_level(Character, zero),
    format('  - ~w~n', [Character])
  ).

show_eliminated_by_robots :-
  write('List of those eliminated by sentinels:'), nl,
  forall(
    eliminates(sentinel, Character),
    format('  - ~w is eliminated by sentinels~n', [Character])
  ).

main :-
  write('=== X-Men Combat ==='), nl, nl,

  show_all_characters, nl,
  show_all_levels, nl,
  show_mutant_powers, nl,
  show_rogue_level, nl,
  show_moyra_powers, nl,
  show_who_eliminates_watson, nl,
  show_level_zero_characters, nl,
  show_eliminated_by_robots, nl.
