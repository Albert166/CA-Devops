package main

import (
	"fmt"
)

func zeroval(ival int) {
	ival = 0

}

func zeroptr(iptr *int) {
	*iptr = 0
}

func main() {
	i := 1

	fmt.Println("i =", i)

	zeroval(1)

	fmt.Println("zeroval:", 1)

	zeroptr(&i)
	fmt.Println("zeroptr:", i)

	fmt.Println("pointer:", &i)
}
