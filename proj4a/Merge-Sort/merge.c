#include <stdio.h>
#include <stdlib.h>
#include <time.h>

void generate_random_list(int list[], int size, int max_value) {
    for (int i = 0; i < size; i++) {
        list[i] = rand() % (max_value + 1);
    }
}

void merge(int list[], int left, int mid, int right) {
    int n1 = mid - left + 1;
    int n2 = right - mid;
    int leftArr[n1], rightArr[n2];
    
    for (int i = 0; i < n1; i++)
        leftArr[i] = list[left + i];
    for (int j = 0; j < n2; j++)
        rightArr[j] = list[mid + 1 + j];
    
    int i = 0, j = 0, k = left;
    while (i < n1 && j < n2) {
        if (leftArr[i] <= rightArr[j]) {
            list[k] = leftArr[i];
            i++;
        } else {
            list[k] = rightArr[j];
            j++;
        }
        k++;
    }
    
    while (i < n1) {
        list[k] = leftArr[i];
        i++;
        k++;
    }
    
    while (j < n2) {
        list[k] = rightArr[j];
        j++;
        k++;
    }
}

void merge_sort(int list[], int left, int right) {
    if (left < right) {
        int mid = left + (right - left) / 2;
        
        merge_sort(list, left, mid);
        merge_sort(list, mid + 1, right);
        
        merge(list, left, mid, right);
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

    // Ordenar cada lista usando Merge Sort e medir o tempo de execução para cada uma
    for (int i = 0; i < 10; i++) {
        clock_t start_time = clock();
        merge_sort(lists[i], 0, size - 1);
        clock_t end_time = clock();
        double execution_time = ((double) (end_time - start_time)) / CLOCKS_PER_SEC;
        printf("Tempo de execução para a lista %d: %f \n", i + 1, execution_time);
    }

    return 0;
}
