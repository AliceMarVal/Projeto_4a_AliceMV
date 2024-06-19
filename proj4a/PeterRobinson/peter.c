#include <stdio.h>
#include <time.h>

// Função para calcular a função de Ackermann
int peter(int m, int n) {
    if (m == 0) {
        return n + 1;
    } else if (n == 0) {
        return peter(m - 1, 1);
    } else {
        int temp = peter(m, n - 1);
        return peter(m - 1, temp);
    }
}

// Função para medir o tempo de execução da função de Ackermann
void measure_time(int m, int n) {
    clock_t start_time = clock();
    int result = peter(m, n);
    clock_t end_time = clock();
    double execution_time = ((double)(end_time - start_time)) / CLOCKS_PER_SEC;

    printf("Resultado para A(%d, %d) = %d\n", m, n, result);
    printf("Tempo de execução: %.6f segundos\n", execution_time);
}

// Função principal
int main() {
    measure_time(3, 14);  
    return 0;
}
