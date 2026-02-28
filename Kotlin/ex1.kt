
fun main() {
    val input = readLine() ?: return
    val result = ex1(input)
    result.forEach { println(it) }
}

fun ex1(input: String): List<String> {
    var substr = ""
    val res = mutableListOf<String>()
    var state = 0

    for (i in input.indices) {
        when (input[i]) {
            '1' -> {
                when (state) {
                    0 -> {
                        state = 1
                        substr += '1'
                    }
                    1 -> {
                        state = 2
                        substr += '1'
                    }
                    3 -> {
                        substr += '1'
                        res.add(substr)
                        substr = ""
                        state = 0
                    }
                    else -> {
                        state = 0
                        substr = ""
                    }
                }
            }
            '0' -> {
                when (state) {
                    1, 2, 3 -> {
                        state = 3
                        substr += '0'
                    }
                    else -> {
                        state = 0
                        substr = ""
                    }
                }
            }
            else -> {
                state = 0
                substr = ""
            }
        }
    }

    return res
}