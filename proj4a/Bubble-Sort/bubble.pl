% Predicado para gerar uma lista de comprimento LENGTH com números aleatórios entre 0 e MAX-VALUE
generate_random_list(Length, MaxValue, List) :-
    length(List, Length),
    maplist(random_between(0, MaxValue), List).

% Predicado para gerar NUM-LISTS listas aleatórias, cada uma com comprimento LENGTH e valores até MAX-VALUE
generate_random_lists(NumLists, Length, MaxValue, Lists) :-
    length(Lists, NumLists),
    maplist(generate_random_list(Length, MaxValue), Lists).

% Predicado para ordenar uma lista usando Bubble Sort
bubble_sort(List, Sorted) :-
    bubble_sort(List, [], Sorted).

bubble_sort([], Acc, Acc).
bubble_sort([X], Acc, [X|Acc]).
bubble_sort([X,Y|Rest], Acc, Sorted) :-
    X > Y,
    bubble_sort([X|Rest], [Y|Acc], Sorted).
bubble_sort([X,Y|Rest], Acc, Sorted) :-
    X =< Y,
    bubble_sort([Y|Rest], [X|Acc], Sorted).

% Predicado para ordenar todas as listas e medir o tempo de execução
sort_and_time_lists(Lists) :-
    length(Lists, NumLists),
    sort_and_time_lists(Lists, 1, NumLists).

sort_and_time_lists([], _, _).
sort_and_time_lists([List|Rest], Idx, NumLists) :-
    statistics(walltime, [_ | [_]]),
    bubble_sort(List, _Sorted),
    statistics(walltime, [_ | [ExecutionTime]]),
    format('Tempo de execucao para a lista ~d: ~3f segundos~n', [Idx, ExecutionTime / 1000.0]),
    NextIdx is Idx + 1,
    sort_and_time_lists(Rest, NextIdx, NumLists).

% Predicado principal para gerar listas aleatórias, ordená-las e medir o tempo de execução
main :-
    generate_random_lists(10, 1000, 100, RandomLists), % 10 listas, comprimento 1000, valores até 100
    sort_and_time_lists(RandomLists).

