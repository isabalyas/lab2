package main

import (
	"fmt"
)

func transformEmail(input string) string {
	var result []byte
	i := 0

	for i < len(input) && input[i] != '@' {
		if input[i] == '*' {
			for i+1 < len(input) && input[i+1] != '@' {
				i++
			}
			i++
		} else if isValidChar(input[i]) {
			result = append(result, input[i])
		}
		i++
	}

	for ; i < len(input); i++ {
		result = append(result, input[i])
	}

	return string(result)
}

func isValidChar(c byte) bool {
	return c >= 'a' && c <= 'z' || c >= 'A' && c <= 'Z' || c >= '0' && c <= '9'
}

func main() {
	var N int
	fmt.Scan(&N)

	emails := make(map[string]bool)

	for i := 0; i < N; i++ {
		var email string
		fmt.Scanln(&email)
		transformed := transformEmail(email)
		emails[transformed] = true
	}

	fmt.Println(len(emails))
}