package main

import (
	"fmt"
	"strconv"
)

type Info interface {
	Info() string
}

type Person struct {
	Name    string
	Surname string
	Age     int
}

type Car struct {
	Brand string
	Model string
	Year  int
}

func (p Person) Info() string {
	age := ""
	age = strconv.Itoa(p.Age)
	return "Person's name is: " + p.Name + " " + p.Surname + " Person's age is: " + age
}

func (c Car) Info() string {
	year := ""
	year = strconv.Itoa(c.Year)
	return "Car's brand is: " + c.Brand + " Car's model is: " + c.Model + " Car's year is: " + year
}

func printInfo(I Info) {
	fmt.Println(I.Info())
}

func main() {
	person := Person{
		Name:    "John",
		Surname: "Doe",
		Age:     30,
	}

	car := Car{
		Brand: "Toyota",
		Model: "Corolla",
		Year:  2020,
	}

	printInfo(person)
	printInfo(car)
}
