% Definição da função de Ackermann em Prolog
peter(0, N, A) :-
    A is N + 1.

peter(M, 0, A) :-
    M > 0,
    M1 is M - 1,
    peter(M1, 1, A).

peter(M, N, A) :-
    M > 0,
    N > 0,
    N1 is N - 1,
    peter(M, N1, Temp),
    M1 is M - 1,
    peter(M1, Temp, A).

% Função para medir o tempo de execução da função de Ackermann
measure_time(M, N) :-
    statistics(walltime, [_ | [_]]),
    peter(M, N, Result),
    statistics(walltime, [_ | [ExecutionTime]]),
    format('Resultado para A(~d, ~d) = ~d~n', [M, N, Result]),
    format('Tempo de execução: ~3f segundos~n', [ExecutionTime / 1000.0]).

% Função principal para calcular a função de Ackermann e medir o tempo de execução
main :-
    measure_time(3, 7).
