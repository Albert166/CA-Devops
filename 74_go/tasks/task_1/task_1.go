package main

import "fmt"

type Person struct {
	height float64
	weight float64
	name   string
	age    int
}

func (p Person) BMI() float64 {
	return p.weight / (p.height * p.height)
}

func main() {
	p := Person{height: 1.75, weight: 70, name: "John", age: 30}
	fmt.Println("Persons:", p.name, "Aged:", "BMI is:", p.BMI())
}
