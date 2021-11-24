package main

import (
	"bufio"
	"fmt"
	"os"
	"strings"
)

func main() {
	var T int
	scanner := bufio.NewScanner(os.Stdin)

	fmt.Scan(&T)
	if T > 0 && T <= 10 {
		theArray := make([]string, T)
		for i := 0; i < T; i++ {
			scanner.Scan()
			theArray[i] = scanner.Text()
		}
		printMessage(theArray)
	}

}

func printMessage(arr []string) {
	for x := 0; x < len(arr); x++ {
		if len(arr[x]) > 1 && len(arr[x]) <= 10000 {
			var s1 []string
			var s2 []string
			for j, c := range arr[x] {
				if j == 0 || j%2 == 0 {
					s1 = append(s1, string(c))
				} else {
					s2 = append(s2, string(c))
				}
			}
			fmt.Printf("%s %s\n", strings.Join(s1, ""), strings.Join(s2, ""))
		}
	}
}
