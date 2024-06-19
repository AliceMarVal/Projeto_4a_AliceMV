#include <stdio.h>
#include <stdlib.h>
#include <time.h>

void generate_random_list(int list[], int size, int max_value) {
    for (int i = 0; i < size; i++) {
        list[i] = rand() % (max_value + 1);
    }
}

void insertion_sort(int list[], int size) {
    for (int i = 1; i < size; i++) {
        int key = list[i];
        int j = i - 1;
        while (j >= 0 && list[j] > key) {
            list[j + 1] = list[j];
            j = j - 1;
        }
        list[j + 1] = key;
    }
}

int main() {
    srand(time(NULL));
    int size = 10000;

    int lists[10][size];

    // Gerar 10 listas aleatórias
    for (int i = 0; i < 10; i++) {
        generate_random_list(lists[i], size, 100);
    }

    // Ordenar cada lista e medir o tempo de execução
    for (int i = 0; i < 10; i++) {
        clock_t start_time = clock();

        insertion_sort(lists[i], size);

        clock_t end_time = clock();
        double execution_time = ((double) (end_time - start_time)) / CLOCKS_PER_SEC;

        // Exibir o tempo de execução para a lista atual
        printf("Tempo de execução para lista %d: %f segundos\n", i + 1, execution_time);
    }

    return 0;
}
