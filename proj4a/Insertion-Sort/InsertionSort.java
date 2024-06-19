import java.util.Random;

public class InsertionSort {

    // Função para gerar uma lista aleatória
    public static void generateRandomList(int[] list, int maxValue) {
        Random random = new Random();
        for (int i = 0; i < list.length; i++) {
            list[i] = random.nextInt(maxValue + 1);
        }
    }

    // Função para ordenar uma lista usando Insertion Sort
    public static void insertionSort(int[] list) {
        for (int i = 1; i < list.length; i++) {
            int key = list[i];
            int j = i - 1;
            while (j >= 0 && list[j] > key) {
                list[j + 1] = list[j];
                j = j - 1;
            }
            list[j + 1] = key;
        }
    }

    public static void main(String[] args) {
        int size = 100000;

        int[][] lists = new int[10][size];

        // Gerar 10 listas aleatórias
        for (int i = 0; i < 10; i++) {
            generateRandomList(lists[i], 100);
        }

        // Ordenar cada lista usando Insertion Sort e medir o tempo de execução
        for (int i = 0; i < 10; i++) {
            long startTime = System.currentTimeMillis();

            insertionSort(lists[i]);

            long endTime = System.currentTimeMillis();
            double executionTime = (endTime - startTime) / 1000.0;

            // Exibir o tempo de execução para cada lista
            System.out.printf("Tempo de execução para a lista %d: %.3f segundos%n", i + 1, executionTime);
        }
    }
}
