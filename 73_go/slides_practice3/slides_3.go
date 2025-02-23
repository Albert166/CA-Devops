package main

import "fmt"

type Person struct {
	Name string
	Age  int
}

func ValueReceiver(p Person) {
	p.Name = "John"
	fmt.Println("Inside ValueReceiver function", p)
}

func PointerReceiver(p *Person) {
	p.Age = 24
	fmt.Println("Inside PointerReceiver function", p.Age)
}

func main() {
	p := Person{"Tom", 28}
	p1 := &Person{"Patric", 68}
	ValueReceiver(p)
	fmt.Println("Inside Main after value receiver:", p.Name)
	PointerReceiver(p1)
	fmt.Println("Inside Main after value receiver:", p1.Age)
}
