public class Peter {

    // Função de Ackermann
    public static int peter(int m, int n) {
        if (m == 0) {
            return n + 1;
        } else if (n == 0) {
            return peter(m - 1, 1);
        } else {
            return peter(m - 1, peter(m, n - 1));
        }
    }

    // Função para medir o tempo de execução da função de Ackermann
    public static void measureTime(int m, int n) {
        long startTime = System.nanoTime();
        int result = peter(m, n);
        long endTime = System.nanoTime();
        double executionTime = (endTime - startTime) / 1e9; // Convertendo para segundos

        System.out.println("Resultado para A(" + m + ", " + n + ") = " + result);
        System.out.printf("Tempo de execução: %.6f segundos%n", executionTime);
    }

    // Função principal
    public static void main(String[] args) {
        measureTime(3, 12);
    }
}
