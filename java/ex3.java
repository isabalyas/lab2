import java.util.Scanner;

public class ex3 {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        int N;
        N = scanner.nextInt();

        int sum = 0;
        int product = 1;
        while (N > 0) {
            sum += N % 10;
            product *= N % 10;
            N /= 10;
        }
        System.out.println(sum + " " + product + " " + Math.abs(sum - product));
        scanner.close();
    }
}