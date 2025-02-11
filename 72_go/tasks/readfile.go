package main

import (
	"encoding/csv"
	"fmt"
	"os"
	"strconv"
)

type Person struct {
	Name             string
	Age              int
	HairColor        string
	EyeColor         string
	Height           float64
	CountryResidence string
	Occupation       string
}

func ReadCSV(filename string) ([]Person, error) {
	file, err := os.Open(filename)
	if err != nil {
		return nil, err
	}
	defer file.Close()

	reader := csv.NewReader(file)
	records, err := reader.ReadAll()
	if err != nil {
		return nil, err
	}

	var people []Person
	for i, record := range records {
		if i == 0 {
			continue // Skip header row
		}
		age, _ := strconv.Atoi(record[1])
		height, _ := strconv.ParseFloat(record[4], 64)

		person := Person{
			Name:             record[0],
			Age:              age,
			HairColor:        record[2],
			EyeColor:         record[3],
			Height:           height,
			CountryResidence: record[5],
			Occupation:       record[6],
		}
		people = append(people, person)
	}

	return people, nil
}

func main() {
	people, err := ReadCSV("people.csv")
	if err != nil {
		fmt.Println("Error reading CSV:", err)
		return
	}

	var exit bool = false
	for !exit {
		fmt.Println("1. Search Profession")
		fmt.Println("2. Age statistics")
		fmt.Println("3. Add a new person to the list")
		fmt.Println("4. Delete a person from list")
		fmt.Println("5. Search by country")
		fmt.Println("6. Exit")
		fmt.Println("Input your choice:")

		var choice int
		fmt.Scanln(&choice)
		switch choice {
		case 1:
			var profession string
			fmt.Println("Enter profession: ")
			fmt.Scanln(&profession)
			found := false
			for _, person := range people {
				if profession == person.Occupation {
					fmt.Println(person)
					found = true
				}
			}
			if !found {
				fmt.Println("No one with such profession")
			}
		case 2:
			var youngest_person *Person
			youngest_age := 200
			for _, person := range people {
				if youngest_age > person.Age {
					youngest_person = &person
					youngest_age = person.Age
				}
			}
			fmt.Println("Youngest person:", youngest_person.Name, youngest_person.Age)

			var oldest_person *Person
			oldest_age := 0
			for _, person := range people {
				if oldest_age < person.Age {
					oldest_person = &person
					oldest_age = person.Age
				}
			}
			fmt.Println("Oldest person:", oldest_person.Name, oldest_person.Age)

			sum := 0
			for _, person := range people {
				sum += person.Age
			}
			fmt.Println("Average age: ", sum/len(people))
		case 3:
			var namechoice string
			fmt.Println("Enter name: ")
			fmt.Scanln(&namechoice)
			var agechoice int
			fmt.Println("Enter persons age:")
			fmt.Scanln(&agechoice)
			var haircolorchoice string
			fmt.Println("Enter person's hair color")
			fmt.Scanln(&haircolorchoice)
			var eyecolorchoice string
			fmt.Println("Enter person's eye color:")
			fmt.Scanln(&eyecolorchoice)
			var heightchoice float64
			fmt.Println("Enter person's height:")
			fmt.Scanln(&heightchoice)
			var countrychoice string
			fmt.Println("Enter person's country of residence:")
			fmt.Scanln(&countrychoice)
			var professionchoice string
			fmt.Println("Enter person's occupation:")
			fmt.Scanln(&professionchoice)

			addedperson := Person{
				Name:             namechoice,
				Age:              agechoice,
				HairColor:        haircolorchoice,
				EyeColor:         eyecolorchoice,
				Height:           heightchoice,
				CountryResidence: countrychoice,
				Occupation:       professionchoice,
			}
			people = append(people, addedperson)
			fmt.Println("Added new person:", addedperson)

		case 4:
			var deletechoice string
			fmt.Println("Enter person's name which you want to delete:")
			fmt.Scanln(&deletechoice)

			for i, person := range people {
				if person.Name == deletechoice {
					people = append(people[:i], people[i+1:]...)
					break
				}
			}

		case 5:
			var countrychoice string
			fmt.Println("Enter country to search:")
			fmt.Scanln(&countrychoice)
			for _, person := range people {
				if countrychoice == person.CountryResidence {
					fmt.Println(person)
				}
			}
		case 6:
			exit = true
			fmt.Println("Exiting...")
		default:
			fmt.Println("Invalid choice. Please enter a number between 1 and 6.")
		}

	}
}
