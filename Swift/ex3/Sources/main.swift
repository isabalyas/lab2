import Foundation
import Glibc

if let line = readLine(){
    if let number = Int(line){

        var sum = 0
        var product = 1
        var n = abs(number)

        while n > 0 {
            let digit = n % 10
            sum += digit
            product *= digit
            n /= 10
        }
    print(sum,product,abs(sum-product))
    }
}
