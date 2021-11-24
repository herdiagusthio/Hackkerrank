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
 * Complete the 'priceCheck' function below.
 *
 * The function is expected to return an INTEGER.
 * The function accepts following parameters:
 *  1. STRING_ARRAY products
 *  2. FLOAT_ARRAY productPrices
 *  3. STRING_ARRAY productSold
 *  4. FLOAT_ARRAY soldPrice
 */

func priceCheck(products []string, productPrices []float32, productSold []string, soldPrice []float32) int32 {
	// Write your code here
	var errorCount int32
	productMaps := make(map[string]float32)

	for i, product := range products {
		productMaps[product] = productPrices[i]
	}

	for i, pSold := range productSold {
		if productMaps[pSold] != soldPrice[i] {
			errorCount++
		}
	}

	return errorCount
}
func main() {
	reader := bufio.NewReaderSize(os.Stdin, 16*1024*1024)

	stdout, err := os.Create(os.Getenv("OUTPUT_PATH"))
	checkError(err)

	defer stdout.Close()

	writer := bufio.NewWriterSize(stdout, 16*1024*1024)

	productsCount, err := strconv.ParseInt(strings.TrimSpace(readLine(reader)), 10, 64)
	checkError(err)

	var products []string

	for i := 0; i < int(productsCount); i++ {
		productsItem := readLine(reader)
		products = append(products, productsItem)
	}

	productPricesCount, err := strconv.ParseInt(strings.TrimSpace(readLine(reader)), 10, 64)
	checkError(err)

	var productPrices []float32

	for i := 0; i < int(productPricesCount); i++ {
		productPricesItemTemp, err := strconv.ParseFloat(strings.TrimSpace(readLine(reader)), 64)
		checkError(err)
		productPricesItem := float32(productPricesItemTemp)
		productPrices = append(productPrices, productPricesItem)
	}

	productSoldCount, err := strconv.ParseInt(strings.TrimSpace(readLine(reader)), 10, 64)
	checkError(err)

	var productSold []string

	for i := 0; i < int(productSoldCount); i++ {
		productSoldItem := readLine(reader)
		productSold = append(productSold, productSoldItem)
	}

	soldPriceCount, err := strconv.ParseInt(strings.TrimSpace(readLine(reader)), 10, 64)
	checkError(err)

	var soldPrice []float32

	for i := 0; i < int(soldPriceCount); i++ {
		soldPriceItemTemp, err := strconv.ParseFloat(strings.TrimSpace(readLine(reader)), 64)
		checkError(err)
		soldPriceItem := float32(soldPriceItemTemp)
		soldPrice = append(soldPrice, soldPriceItem)
	}

	result := priceCheck(products, productPrices, productSold, soldPrice)

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
