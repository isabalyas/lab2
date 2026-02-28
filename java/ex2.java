import java.util.HashSet;
import java.util.Scanner;
import java.util.Set;

public class ex2 {

    public static String transformEmail(String input) {
        StringBuilder result = new StringBuilder();
        int i = 0;

        while (i < input.length() && input.charAt(i) != '@') {
            if (input.charAt(i) == '*') {
                while (i + 1 < input.length() && input.charAt(i + 1) != '@') {
                    i++;
                }
                i++;
            } else if (Character.isLetterOrDigit(input.charAt(i))) {
                result.append(input.charAt(i));
            }
            i++;
        }

        while (i < input.length()) {
            result.append(input.charAt(i));
            i++;
        }
        return result.toString();
    }

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        int N = scanner.nextInt();

        Set<String> emails = new HashSet<>();

        for (int i = 0; i < N; i++) {
            String email = scanner.next();
            String transformed = transformEmail(email);
            emails.add(transformed);
        }

        System.out.println(emails.size());
        scanner.close();
    }
}