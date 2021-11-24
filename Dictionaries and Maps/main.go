package main

import (
	"bufio"
	"fmt"
	"os"
	"strings"
)

func main() {
	//Enter your code here. Read input from STDIN. Print output to STDOUT
	var T int
	scanner := bufio.NewScanner(os.Stdin)

	fmt.Scan(&T)
	if T > 0 {
		dictionary := make(map[string]string)
		for i := 0; i < T; i++ {
			scanner.Scan()
			s := strings.Split(scanner.Text(), " ")
			dictionary[s[0]] = s[1]
		}

		for scanner.Scan() {
			ipt := scanner.Text()
			v, prs := dictionary[ipt]
			if prs == true {
				fmt.Printf("%s=%s\n", ipt, v)
			} else {
				fmt.Println("Not found")
			}
		}
	}
}
