% Definição da função de Ackermann em Prolog

% Caso base quando p = 0
ackermann(M, N, 0, Result) :-
    Result is M + N.

% Caso quando N = 0
ackermann(M, 0, P, Result) :-
    P > 0,
    (
        (P =:= 1, Result is 0) ;  % Caso: P = 1
        (P =:= 2, Result is 1) ;  % Caso: P = 2
        (P > 2, Result is M)      % Caso: P > 2
    ).

% Caso recursivo
ackermann(M, N, P, Result) :-
    P > 0, N > 0,
    P1 is P - 1,
    N1 is N - 1,
    ackermann(M, N1, P, Temp),   % Chamada recursiva: ackermann(M, N-1, P)
    ackermann(M, Temp, P1, Result).  % Chamada recursiva: ackermann(M, Temp, P-1)

% Predicado principal para calcular a função de Ackermann e medir o tempo de execução
main :-
    statistics(walltime, [_ | [_]]),  % Inicia a medição do tempo
    ackermann(26, 5, 2, Result),      % Calcula a função de Ackermann
    statistics(walltime, [_ | [ExecutionTime]]),  % Termina a medição do tempo
    format('Resultado = ~d~n', [Result]),  % Exibe o resultado
    format('Tempo de execução: ~3f segundos~n', [ExecutionTime / 1000.0]).  % Exibe o tempo de execução

