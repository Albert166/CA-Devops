package main

import "fmt"

func main() {
	message := make(chan string)

	go func() { message <- "ping" }()

	msg := <-message

	fmt.Println(msg)

	m2 := make(chan string, 2)
	m2 <- "buffered"
	m2 <- "channel"

	fmt.Println(<-m2)
	fmt.Println(<-m2)

}
