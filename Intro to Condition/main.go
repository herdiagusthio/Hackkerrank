package main

import (
	"bufio"
	"fmt"
	"io"
	"os"
	"strconv"
	"strings"
)

func main() {
	reader := bufio.NewReaderSize(os.Stdin, 1024*1024)

	NTemp, err := strconv.ParseInt(readLine(reader), 10, 64)
	checkError(err)
	N := int32(NTemp)

	if N > 0 && N < 101 {
		a := check(N)
		if !a || (a && (N >= 6 && N <= 20)) {
			fmt.Println("Weird")
		} else if N > 20 || (a && (N >= 2 && N <= 5)) {
			fmt.Println("Not Weird")
		}
	}
}

func readLine(reader *bufio.Reader) string {
	str, _, err := reader.ReadLine()
	if err == io.EOF {
		return ""
	}

	return strings.TrimRight(string(str), "\r\n")
}

func checkError(err error) {
	if err != nil {
		panic(err)
	}
}

func check(number int32) bool {
	if number%2 == 0 {
		return true
	}

	return false
}
