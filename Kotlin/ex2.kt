import java.util.Scanner
fun transformEmail(input: String): String {
    val result = StringBuilder()
    var i = 0

    while (i < input.length && input[i] != '@') {
        if (input[i] == '*') {
            while (i + 1 < input.length && input[i + 1] != '@') {
                i++
            }
            i++
        } else if (input[i].isLetterOrDigit()) {
            result.append(input[i])
        }
        i++
    }
    while (i < input.length) {
        result.append(input[i])
        i++
    }

    return result.toString()
}

fun main() {
    val scanner = Scanner(System.`in`)
    val N = scanner.nextInt()

    val emails = mutableSetOf<String>()

    for (i in 0 until N) {
        val email = scanner.next()
        val transformed = transformEmail(email)
        emails.add(transformed)
    }

    println("${emails.size}")
}

fun Char.isLetterOrDigit(): Boolean {
    return this in 'a'..'z' || this in 'A'..'Z' || this in '0'..'9'
}