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
 * Complete the 'countPairs' function below.
 *
 * The function is expected to return an INTEGER.
 * The function accepts following parameters:
 *  1. INTEGER_ARRAY numbers
 *  2. INTEGER k
 */

func countPairs(numbers []int32, k int32) int32 {
	// Write your code here
	sortNumbers := mergeSort(numbers)
	mapsPairs := make(map[[2]int32]int32)
	var tempSlice [2]int32
	i, j := 0, 1
	for i < len(sortNumbers)-1 {
		if j < len(sortNumbers) {
			if sortNumbers[j]-sortNumbers[i] > k {
				i++
				j = i + 1
				continue
			}
			if sortNumbers[i]+k == sortNumbers[j] {
				tempSlice[0] = sortNumbers[i]
				tempSlice[1] = sortNumbers[j]
				mapsPairs[tempSlice]++
			}
			j++
		} else {
			i++
			j = i + 1
		}
	}

	return int32(len(mapsPairs))
}

func mergeSort(items []int32) []int32 {
	var num = len(items)

	if num == 1 {
		return items
	}

	middle := int(num / 2)
	var (
		left  = make([]int32, middle)
		right = make([]int32, num-middle)
	)
	for i := 0; i < num; i++ {
		if i < middle {
			left[i] = items[i]
		} else {
			right[i-middle] = items[i]
		}
	}

	return merge(mergeSort(left), mergeSort(right))
}

func merge(left, right []int32) (result []int32) {
	result = make([]int32, len(left)+len(right))

	i := 0
	for len(left) > 0 && len(right) > 0 {
		if left[0] < right[0] {
			result[i] = left[0]
			left = left[1:]
		} else {
			result[i] = right[0]
			right = right[1:]
		}
		i++
	}

	for j := 0; j < len(left); j++ {
		result[i] = left[j]
		i++
	}
	for j := 0; j < len(right); j++ {
		result[i] = right[j]
		i++
	}

	return
}
func main() {
	reader := bufio.NewReaderSize(os.Stdin, 16*1024*1024)

	stdout, err := os.Create(os.Getenv("OUTPUT_PATH"))
	checkError(err)

	defer stdout.Close()

	writer := bufio.NewWriterSize(stdout, 16*1024*1024)

	numbersCount, err := strconv.ParseInt(strings.TrimSpace(readLine(reader)), 10, 64)
	checkError(err)

	var numbers []int32

	for i := 0; i < int(numbersCount); i++ {
		numbersItemTemp, err := strconv.ParseInt(strings.TrimSpace(readLine(reader)), 10, 64)
		checkError(err)
		numbersItem := int32(numbersItemTemp)
		numbers = append(numbers, numbersItem)
	}

	kTemp, err := strconv.ParseInt(strings.TrimSpace(readLine(reader)), 10, 64)
	checkError(err)
	k := int32(kTemp)

	result := countPairs(numbers, k)

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
