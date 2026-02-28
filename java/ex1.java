import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class ex1 {
    public static List<String> ex1(String inputStr) {
        StringBuilder substr = new StringBuilder();
        List<String> res = new ArrayList<>();
        int state = 0;

        for (char ch : inputStr.toCharArray()) {
            if (ch == '1') {
                if (state == 0) {
                    state = 1;
                    substr.append('1');
                } else if (state == 1) {
                    state = 2;
                    substr.append('1');
                } else if (state == 3) {
                    substr.append('1');
                    res.add(substr.toString());
                    substr.setLength(0);
                    state = 0;
                } else {
                    state = 0;
                    substr.setLength(0);
                }
            } else if (ch == '0') {
                if (state == 1 || state == 2 || state == 3) {
                    state = 3;
                    substr.append('0');
                } else {
                    state = 0;
                    substr.setLength(0);
                }
            } else {
                state = 0;
                substr.setLength(0);
            }
        }
        return res;
    }

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        String inputStr = scanner.nextLine();
        List<String> res = ex1(inputStr);
        for (String item : res) {
            System.out.println(item);
        }
    }
}