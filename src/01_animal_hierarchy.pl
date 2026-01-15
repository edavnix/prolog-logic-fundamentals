% ==============================================================================
% Exercise: 01_animal_hierarchy.pl
% Description: Animal classification using hierarchical logic rules
% Platform: SWI-Prolog
% ==============================================================================
% Features:
% - Defines hierarchy: animal → mammal → canine/feline → specific animals
% - Verifies classifications with type checking
% - Lists all animals in the knowledge base
% ==============================================================================

:- encoding(utf8).
:- initialization(main).

is_dog(lassie).
is_dog(rin_tin_tin).
is_dog(scooby_doo).
is_cat(garfield).
is_cat(felix).

is_canine(X) :- is_dog(X).
is_feline(X) :- is_cat(X).
is_mammal(X) :- is_canine(X).
is_mammal(X) :- is_feline(X).
is_animal(X) :- is_mammal(X).

type_name(is_canine, canine).
type_name(is_feline, feline).
type_name(is_mammal, mammal).
type_name(is_animal, animal).

verify_and_show(Name, Type) :-
  type_name(Type, TypeName),
  (
    call(Type, Name)
    -> format('[OK] ~w is ~w~n', [Name, TypeName])
    ; format('[NO] ~w is not ~w~n', [Name, TypeName])
  ).

show_all_animals :-
  write('List of animals:'), nl,
  forall(
    is_animal(X),
    format('  - ~w~n', [X])
  ).

main :-
  write('=== Animal Classification ==='), nl, nl,

  verify_and_show(lassie, is_canine),
  verify_and_show(lassie, is_feline),
  verify_and_show(lassie, is_mammal),
  verify_and_show(lassie, is_animal),
  nl,

  show_all_animals, nl.
