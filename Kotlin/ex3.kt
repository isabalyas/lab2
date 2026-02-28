import java.util.Scanner
fun main() {
    val scanner = Scanner(System.`in`)
    var N: Int
    N = scanner.nextInt()

    var sum = 0
    var product = 1
    while (N > 0) {
        sum += N % 10
        product *= N % 10
        N /= 10
    }
    println("$sum $product ${Math.abs(sum - product)}")
}