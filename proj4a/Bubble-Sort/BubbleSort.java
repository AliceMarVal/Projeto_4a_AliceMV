import java.util.Random;

public class BubbleSort {

    // Função para gerar uma lista aleatória
    public static void generateRandomList(int[] list, int maxValue) {
        Random random = new Random();
        for (int i = 0; i < list.length; i++) {
            list[i] = random.nextInt(maxValue + 1);
        }
    }

    // Função para ordenar uma lista usando Bubble Sort
    public static void bubbleSort(int[] list) {
        int n = list.length;
        for (int i = 0; i < n - 1; i++) {
            for (int j = 0; j < n - i - 1; j++) {
                if (list[j] > list[j + 1]) {
                    int temp = list[j];
                    list[j] = list[j + 1];
                    list[j + 1] = temp;
                }
            }
        }
    }

    public static void main(String[] args) {
        final int size = 10000;

        int[][] lists = new int[10][size];

        // Gerar 10 listas aleatórias
        for (int i = 0; i < 10; i++) {
            generateRandomList(lists[i], 100);
        }

        // Ordenar e medir o tempo de execução para cada lista
        for (int i = 0; i < 10; i++) {
            long startTime = System.currentTimeMillis();

            bubbleSort(lists[i]);

            long endTime = System.currentTimeMillis();
            double executionTime = (endTime - startTime) / 1000.0;

            // Exibir o tempo de execução para cada lista
            System.out.printf("Tempo de execução para lista %d: %.3f, ", i + 1, executionTime);
        }
    }
}
