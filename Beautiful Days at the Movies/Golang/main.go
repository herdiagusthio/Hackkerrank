package main

import (
	"bufio"
	"fmt"
	"io"
	"os"
	"strconv"
	"strings"
)

/*
 * Complete the 'beautifulDays' function below.
 *
 * The function is expected to return an INTEGER.
 * The function accepts following parameters:
 *  1. INTEGER i
 *  2. INTEGER j
 *  3. INTEGER k
 */

func beautifulDays(i int32, j int32, k int32) int32 {
	// Write your code here
	var counter, reverseNumber, sum int32
	var i64 int64
	var temp_string string

	for n := i; n <= j; n++ {
		temp_string = strconv.Itoa(int(n))
		temp_string = reverseString(temp_string)
		i64, _ = strconv.ParseInt(temp_string, 10, 32)
		reverseNumber = int32(i64)
		if reverseNumber > n {
			sum = reverseNumber - n
		} else {
			sum = n - reverseNumber
		}
		if sum%k == 0 {
			counter++
		}
	}

	return counter
}

func reverseString(str string) string {
	rune_string := []rune(str)
	for i, j := 0, len(str)-1; i < j; i, j = i+1, j-1 {
		rune_string[i], rune_string[j] = rune_string[j], rune_string[i]
	}
	return string(rune_string)
}

func main() {
	reader := bufio.NewReaderSize(os.Stdin, 16*1024*1024)

	stdout, err := os.Create(os.Getenv("OUTPUT_PATH"))
	checkError(err)

	defer stdout.Close()

	writer := bufio.NewWriterSize(stdout, 16*1024*1024)

	firstMultipleInput := strings.Split(strings.TrimSpace(readLine(reader)), " ")

	iTemp, err := strconv.ParseInt(firstMultipleInput[0], 10, 64)
	checkError(err)
	i := int32(iTemp)

	jTemp, err := strconv.ParseInt(firstMultipleInput[1], 10, 64)
	checkError(err)
	j := int32(jTemp)

	kTemp, err := strconv.ParseInt(firstMultipleInput[2], 10, 64)
	checkError(err)
	k := int32(kTemp)

	result := beautifulDays(i, j, k)

	fmt.Fprintf(writer, "%d\n", result)

	writer.Flush()
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
