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

	nTemp, err := strconv.ParseInt(readLine(reader), 10, 64)
	checkError(err)
	n := int64(nTemp)

	s := strconv.FormatInt(n, 2)
	var str1 string

	str1 = "1"
	count := 0
	pointer := 0
	for i := 0; i < len(s); i++ {
		if string(s[i]) == str1 {
			pointer++
			if count < pointer {
				count = pointer
			}
		} else {
			pointer = 0
		}
	}

	fmt.Println(count)
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
