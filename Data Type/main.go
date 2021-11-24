package main

import (
	"bufio"
	"fmt"
	"os"
	"strconv"
)

func main() {
	var _ = strconv.Itoa // Ignore this comment. You can still use the package "strconv".

	var i uint64 = 4
	var d float64 = 4.0
	var s string = "HackerRank "

	scanner := bufio.NewScanner(os.Stdin)
	// Declare second integer, double, and String variables.
	// Read and save an integer, double, and String to your variables.
	scanner.Scan()
	sc1 := scanner.Text()
	x, _ := strconv.ParseUint(sc1, 10, 64)

	scanner.Scan()
	sc2 := scanner.Text()
	y, _ := strconv.ParseFloat(sc2, 64)

	scanner.Scan()
	st := scanner.Text()
	// Print the sum of both integer variables on a new line.
	t1 := i + x
	fmt.Println(t1)
	// Print the sum of the double variables on a new line.
	t2 := d + y
	fmt.Printf("%.1f\n", t2)
	// Concatenate and print the String variables on a new line
	// The 's' variable above should be printed first.
	fmt.Println(s + st)
}
