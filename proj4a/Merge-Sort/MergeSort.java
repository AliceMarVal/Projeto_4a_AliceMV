import java.util.Random;

public class MergeSort {

    // Função para gerar uma lista aleatória
    public static void generateRandomList(int[] list, int maxValue) {
        Random random = new Random();
        for (int i = 0; i < list.length; i++) {
            list[i] = random.nextInt(maxValue + 1);
        }
    }

    // Função para ordenar uma lista usando Merge Sort
    public static void mergeSort(int[] list) {
        if (list.length < 2) {
            return;
        }
        int mid = list.length / 2;
        int[] left = new int[mid];
        int[] right = new int[list.length - mid];

        System.arraycopy(list, 0, left, 0, mid);
        System.arraycopy(list, mid, right, 0, list.length - mid);

        mergeSort(left);
        mergeSort(right);

        merge(list, left, right);
    }

    // Função para mesclar duas sublistas ordenadas
    public static void merge(int[] list, int[] left, int[] right) {
        int i = 0, j = 0, k = 0;
        while (i < left.length && j < right.length) {
            if (left[i] <= right[j]) {
                list[k++] = left[i++];
            } else {
                list[k++] = right[j++];
            }
        }
        while (i < left.length) {
            list[k++] = left[i++];
        }
        while (j < right.length) {
            list[k++] = right[j++];
        }
    }

    public static void main(String[] args) {
        int size = 10000000;  // Ajuste o tamanho da lista conforme necessário

        int[][] lists = new int[10][size];

        // Gerar 10 listas aleatórias
        for (int i = 0; i < 10; i++) {
            generateRandomList(lists[i], 100);
        }

        // Ordenar cada lista usando Merge Sort e medir o tempo de execução individualmente
        for (int i = 0; i < 10; i++) {
            long startTime = System.currentTimeMillis();
            mergeSort(lists[i]);
            long endTime = System.currentTimeMillis();
            double executionTime = (endTime - startTime) / 1000.0;
            System.out.printf("Tempo de execução da lista %d: %.3f segundos%n", i + 1, executionTime);
        }
    }
}
