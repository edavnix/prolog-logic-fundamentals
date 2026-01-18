% ==============================================================================
% Exercise: 04_thieves_and_jewels.pl
% Description: Relationships between thieves, merchants, jewels and metals
% Platform: SWI-Prolog
% ==============================================================================
% Features:
% - Defines roles (thieves, merchants, buyers) and items (jewels, metals)
% - Models theft, sales, and relationships between entities
% - Filters items by color and availability
% - Lists stolen items and unsold white-colored items
% ==============================================================================

:- encoding(utf8).
:- initialization(main).

is_thief(peter).
is_thief(john).
is_merchant(charlie).
is_merchant(peter).
is_buyer(john).
is_jewel(pearl).
is_jewel(sapphire).
is_jewel(emerald).
is_jewel(ruby).
is_jewel(diamond).
is_metal(gold).
is_metal(platinum).
is_metal(bronze).
is_metal(rhodium).
is_metal(silver).
has_color(pearl, white).
has_color(diamond, colorless).
has_color(silver, gray).
has_color(gold, yellow).
has_color(ruby, red).
has_color(emerald, green).
has_color(sapphire, blue).
has_color(bronze, brown).
has_color(platinum, gray).
has_color(rhodium, gray).

is_related_to(Person, Item) :- is_buyer(Person), is_jewel(Item).
is_related_to(Person, Item) :- is_merchant(Person), is_metal(Item).
steals(Person, Item) :- is_thief(Person), (is_jewel(Item); is_metal(Item)).
sells(Person, Item) :- is_thief(Person), is_metal(Item).
is_not_sold(Item) :- has_color(Item, white), \+ sells(_, Item).

show_all_thieves :-
  write('List of thieves:'), nl,
  forall(
    is_thief(Person),
    format('  - ~w is a thief~n', [Person])
  ).

show_colored_metals :-
  write('List of metals and their colors:'), nl,
  forall(
    (is_metal(Metal), has_color(Metal, Color)),
    format('  - ~w is a ~w metal~n', [Metal, Color])
  ).

show_not_sold_items :-
  write('List of unsold items:'), nl,
  forall(
    is_not_sold(Item),
    format('  - ~w~n', [Item])
  ).

show_all_relations :-
  write('List of person-object relationships:'), nl,
  forall(
    is_related_to(Person, Item),
    format('  - ~w is related to ~w~n', [Person, Item])
  ).

show_stolen_items :-
  write('List of stolen items:'), nl,
  forall(
    steals(Thief, Item),
    format('  - ~w steals ~w~n', [Thief, Item])
  ).

main :-
  write('=== Thieves, Jewels, and Metals ==='), nl, nl,

  show_all_thieves, nl,
  show_colored_metals, nl,
  show_not_sold_items, nl,
  show_all_relations, nl,
  show_stolen_items, nl.
