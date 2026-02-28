package main

import (
	"fmt"
)

func ex1(input string) []string {
	var substr string
	var res []string
	state := 0

	for i := 0; i < len(input); i++ {
		switch input[i] {
		case '1':
			switch state {
			case 0:
				state = 1
				substr += "1"
			case 1:
				state = 2
				substr += "1"
			case 3:
				substr += "1"
				res = append(res, substr)
				substr = ""
				state = 0
			default:
				state = 0
				substr = ""
			}
		case '0':
			switch state {
			case 1, 2, 3:
				state = 3
				substr += "0"
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
	var input string
	fmt.Scanln(&input)

	result := ex1(input)

	for _, str := range result {
		fmt.Println(str)
	}
}