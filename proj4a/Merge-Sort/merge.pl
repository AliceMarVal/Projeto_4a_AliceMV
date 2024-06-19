:- use_module(library(random)).
:- use_module(library(statistics)).

% Gera uma lista de números aleatórios de tamanho N com elementos entre 0 e MaxValue
generate_random_list(N, MaxValue, List) :-
    length(List, N),
    maplist(random_between(0, MaxValue), List).

% Gera 10 listas aleatórias do mesmo tamanho
generate_random_lists(10, Length, MaxValue, Lists) :-
    length(Lists, 10),
    maplist(generate_random_list(Length, MaxValue), Lists).

% Merge Sort
merge_sort([], []).
merge_sort([X], [X]).
merge_sort(List, Sorted) :-
    List = [_, _|_],  % ensures List has at least two elements
    divide(List, L1, L2),
    merge_sort(L1, Sorted1),
    merge_sort(L2, Sorted2),
    merge(Sorted1, Sorted2, Sorted).

divide(List, L1, L2) :-
    length(List, N),
    Half is N // 2,
    length(L1, Half),
    append(L1, L2, List).

merge([], L, L).
merge(L, [], L).
merge([X|T1], [Y|T2], [X|T]) :-
    X =< Y,
    merge(T1, [Y|T2], T).
merge([X|T1], [Y|T2], [Y|T]) :-
    X > Y,
    merge([X|T1], T2, T).

% Ordena e mede o tempo de execução de uma lista
sort_and_time_list(List) :-
    statistics(walltime, [_ | [_]]),
    merge_sort(List, _Sorted),
    statistics(walltime, [_ | [ExecutionTime]]),
    format('Tempo de execução para lista: ~3f segundos~n', [ExecutionTime / 1000.0]).

% Predicado principal para gerar e ordenar as listas
main :-
    % Definir o tamanho e valor máximo dos elementos das listas
    Length = 1000,
    MaxValue = 100,

    % Gerar 10 listas aleatórias
    generate_random_lists(10, Length, MaxValue, Lists),

    % Ordenar e medir o tempo de execução de cada lista
    maplist(sort_and_time_list, Lists).

