package main

import "fmt"

type Person struct {
	Name string
	Age  int
}

func ModifyAge(p *Person, age int) {
	originalAge := p.Age
	p.Age = age
	fmt.Println("Age modification original age:", originalAge, "Modified to:", p.Age)
}

func main() {
	p := &Person{"John", 10}
	fmt.Println("Original Age:", p.Age)
	ModifyAge(p, 20)
	fmt.Println("Modified Age:", p.Age)

}
