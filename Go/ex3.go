package main

import "fmt"

func main() {
    var N int
    fmt.Scan(&N)

    var sum int = 0
    var product int = 1

    for N > 0 {
        sum += N % 10
        product *= N % 10
        N /= 10
    }
    fmt.Printf("%d %d %d\n", sum, product, abs(sum-product))
}

func abs(x int) int {
    if x < 0 {
        return -x
    }
    return x
}