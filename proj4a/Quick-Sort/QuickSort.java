import java.util.Random;

public class QuickSort {

    // Função para gerar uma lista aleatória
    public static void generateRandomList(int[] list, int maxValue) {
        Random random = new Random();
        for (int i = 0; i < list.length; i++) {
            list[i] = random.nextInt(maxValue + 1);
        }
    }

    // Função para ordenar uma lista usando Quick Sort
    public static void quickSort(int[] list, int low, int high) {
        if (low < high) {
            int pi = partition(list, low, high);

            quickSort(list, low, pi - 1);  // Ordena os elementos antes da partição
            quickSort(list, pi + 1, high); // Ordena os elementos após a partição
        }
    }

    // Função para particionar a lista
    public static int partition(int[] list, int low, int high) {
        int pivot = list[high];
        int i = (low - 1); // Índice do menor elemento

        for (int j = low; j < high; j++) {
            if (list[j] < pivot) {
                i++;

                // Troca list[i] e list[j]
                int temp = list[i];
                list[i] = list[j];
                list[j] = temp;
            }
        }

        // Troca list[i + 1] e list[high] (ou pivot)
        int temp = list[i + 1];
        list[i + 1] = list[high];
        list[high] = temp;

        return i + 1;
    }

    public static void main(String[] args) {
        int size = 1000000;

        int[][] lists = new int[10][size];

        // Gerar 10 listas aleatórias
        for (int i = 0; i < 10; i++) {
            generateRandomList(lists[i], 100);
        }

        // Medir o tempo de execução
        long startTime;
        long endTime;
        double executionTime;
        // Ordenar cada lista usando Quick Sort
        for (int i = 0; i < 10; i++) {
            startTime = System.currentTimeMillis();
            quickSort(lists[i], 0, lists[i].length - 1);
            endTime = System.currentTimeMillis();
            executionTime = (endTime - startTime) / 1000.0;
            System.out.printf("Tempo de execução: %.3f,%n", executionTime);
        }

    }
}
