import Foundation

func transform(_ input: String) -> String {
    var res = ""
    var i = input.startIndex
    while i < input.endIndex && input[i] != "@" {
        if input[i] == "*" {
            while i < input.endIndex && input[input.index(after: i)] != "@" {
                i = input.index(after: i)
            }
        } else if input[i].isLetter || input[i].isNumber {
            res.append(input[i])
        }
        i = input.index(after: i)
    }

    while i < input.endIndex {
        res.append(input[i])
        i = input.index(after: i)
    }

    return res
}

var emails = Set<String>()
let N = Int(readLine()!)!

for _ in 0..<N {
    let email = readLine()!
    let transformedEmail = transform(email)
    emails.insert(transformedEmail)
}

print(emails.count)