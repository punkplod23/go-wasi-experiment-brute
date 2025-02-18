package main

import (
	"flag"
	"fmt"
	"os"
	"strconv"

	wordchecker "github.com/punkplod23/go-wasi-experiment-brute/internal"
)

func main() {

	algorithm := os.Args[1]
	hash := os.Args[2]
	maxAttemptsDefault, err := strconv.Atoi(os.Args[3])
	if err != nil {
		fmt.Println("Invalid value for maxAttempts")
		return
	}
	lengthDefault, err := strconv.Atoi(os.Args[4])
	if err != nil {
		fmt.Println("Invalid value for length")
		return
	}
	maxAttempts := flag.Int("maxAttempts", maxAttemptsDefault, "Maximum number of attempts")
	length := flag.Int("length", lengthDefault, "Length of the string to brute force")

	flag.Parse()
	fmt.Println("Hello world")
	fmt.Println(algorithm, hash, *maxAttempts, *length)
	//print(*algorithm, *hash, *maxAttempts, *length)
	println(wordchecker.BruteForce(algorithm, hash, *maxAttempts, *length))
}
