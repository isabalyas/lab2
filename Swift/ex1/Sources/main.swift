import Foundation

func ex1(_ input: String) -> [String] {
    var substr = ""
    var res: [String] = []
    var state = 0

    for char in input {
        switch char {
        case "1":
            switch state {
            case 0:
                state = 1
                substr.append("1")
            case 1:
                state = 2
                substr.append("1")
            case 3:
                substr.append("1")
                res.append(substr)
                substr = ""
                state = 0
            default:
                state = 0
                substr = ""
            }
        case "0":
            switch state {
            case 1, 2, 3:
                state = 3
                substr.append("0")
            default:
                state = 0
                substr = ""
            }
        default:
            state = 0
            substr = ""
        }
    }
    return res
}

func main() {
    guard let input = readLine()

    let result = ex1(input)
    result.forEach { print($0) }
}

main()