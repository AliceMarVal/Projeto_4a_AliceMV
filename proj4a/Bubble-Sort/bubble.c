#include <stdio.h>
#include <stdlib.h>
#include <time.h>

void generate_random_list(int list[], int size, int max_value) {
    for (int i = 0; i < size; i++) {
        list[i] = rand() % (max_value + 1);
    }
}

void bubble_sort(int list[], int size) {
    for (int i = 0; i < size - 1; i++) {
        for (int j = 0; j < size - i - 1; j++) {
            if (list[j] > list[j + 1]) {
                int temp = list[j];
                list[j] = list[j + 1];
                list[j + 1] = temp;
            }
        }
    }
}

int main() {
    srand(time(NULL));

    long int size = 10000;

    int lists[10][size];
    double execution_times[10];

    // Gerar 10 listas aleatórias
    for (int i = 0; i < 10; i++) {
        generate_random_list(lists[i], size, 100);
    }

    // Medir o tempo de execução para ordenar cada lista individualmente
    for (int i = 0; i < 10; i++) {
        clock_t start_time = clock();
        bubble_sort(lists[i], size);
        clock_t end_time = clock();
        execution_times[i] = ((double) (end_time - start_time)) / CLOCKS_PER_SEC;
    }

    // Exibir os tempos de execução
    for (int i = 0; i < 10; i++) {
        printf("Tempo de execução para a lista %d: %f segundos\n", i + 1, execution_times[i]);
    }

    return 0;
}
