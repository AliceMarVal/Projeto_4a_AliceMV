#include <stdio.h>
#include <stdlib.h>
#include <time.h>

void generate_random_list(int list[], int size, int max_value) {
    for (int i = 0; i < size; i++) {
        list[i] = rand() % (max_value + 1);
    }
}

void swap(int* a, int* b) {
    int temp = *a;
    *a = *b;
    *b = temp;
}

int partition(int list[], int low, int high) {
    int pivot = list[high];  // pivot
    int i = (low - 1);       // Index of smaller element

    for (int j = low; j <= high - 1; j++) {
        if (list[j] < pivot) {
            i++;
            swap(&list[i], &list[j]);
        }
    }
    swap(&list[i + 1], &list[high]);
    return (i + 1);
}

void quick_sort(int list[], int low, int high) {
    if (low < high) {
        int pi = partition(list, low, high);

        quick_sort(list, low, pi - 1);
        quick_sort(list, pi + 1, high);
    }
}

int main() {
    srand(time(NULL));
    long int size = 100000;

    int lists[10][size];

    // Gerar 10 listas aleatórias
    for (int i = 0; i < 10; i++) {
        generate_random_list(lists[i], size, 100);
    }

    // Ordenar cada lista usando Quick Sort e medir o tempo de execução individualmente
    for (int i = 0; i < 10; i++) {
        clock_t start_time = clock();
        quick_sort(lists[i], 0, size - 1);
        clock_t end_time = clock();
        double execution_time = ((double) (end_time - start_time)) / CLOCKS_PER_SEC;
        printf("Tempo de execução para a lista %d: %f segundos\n", i + 1, execution_time);
    }

    return 0;
}
