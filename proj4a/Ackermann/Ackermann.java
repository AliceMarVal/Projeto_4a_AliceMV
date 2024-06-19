import java.time.Duration;
import java.time.Instant;

public class Ackermann {

    public static int ackermann(int m, int n, int p) {
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

    public static void main(String[] args) {
        Instant start = Instant.now();
        int a = ackermann(10, 5, 2);
        Instant end = Instant.now();
        System.out.println("Resultado = " + a);
        double elapsed = Duration.between(start, end).toMillis() / 1000.0;
        System.out.printf("Tempo de execução: %.3f segundos%n", elapsed);
    }
}
