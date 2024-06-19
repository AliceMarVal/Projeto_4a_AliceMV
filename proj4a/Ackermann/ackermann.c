#include <stdio.h>
#include <time.h>

int ackermann(int m, int n, int p) {
    if (p == 0) {
        return m + n;
    } else if (n == 0) {
        if (p == 1) {
            return 0;
        } else if (p == 2) {
            return 1;
        } else {
            return m;
        }
    } else {
        return ackermann(m, ackermann(m, n - 1, p), p - 1);
    }
}

int main() {
    clock_t start = clock();
    int a = ackermann(20,5,2);
    clock_t end = clock();
    printf("Resultado = %d\n", a);
    double elapsed = ((double)(end - start)) / CLOCKS_PER_SEC;
    printf("Tempo de execução: %.3f segundos\n", elapsed);
    return 0;
}

