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

% Insertion Sort
insertion_sort(List, Sorted) :-
    insertion_sort_helper(List, [], Sorted).

insertion_sort_helper([], Acc, Acc).
insertion_sort_helper([H|T], Acc, Sorted) :-
    insert(H, Acc, NewAcc),
    insertion_sort_helper(T, NewAcc, Sorted).

insert(X, [], [X]).
insert(X, [Y|T], [X,Y|T]) :-
    X =< Y.
insert(X, [Y|T], [Y|Sorted]) :-
    X > Y,
    insert(X, T, Sorted).

% Ordena e mede o tempo de execução de uma lista
sort_and_time_list(List) :-
    statistics(walltime, [_ | [_]]),
    insertion_sort(List, _Sorted),
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
