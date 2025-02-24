package main

import (
	"encoding/csv"
	"fmt"
	"log"
	"net/http"
	"os"
	"strconv"
	"time"
)

const (
	YYYYMMDD  = "2006-01-02"
	HHMMSS24H = "15:04:05"
)

var datetime string = time.Now().Format(YYYYMMDD + " " + HHMMSS24H)
var flags int = log.Lshortfile

type Person struct {
	Name             string
	Age              int
	HairColor        string
	EyeColor         string
	Height           float64
	CountryResidence string
	Occupation       string
}

func homePage(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintf(w, "<html><body><h1>Welcome to the HomePage!</h1></body></html>")
	log.SetPrefix(datetime + " [INFO] ")
	log.Println("Endpoint Hit: homePage")
	file, err := os.OpenFile("web_server.log", os.O_CREATE|os.O_APPEND|os.O_WRONLY, 0644)
	if err != nil {
		logger := log.New(file, "", flags)
		logger.SetPrefix(datetime + " [ERROR] ")
		logger.Println(err)
	}
	defer file.Close()
	logger := log.New(file, "", flags)
	logger.SetPrefix(datetime + " [INFO] ")
	logger.Println("Endpoint Hit: homePage")

}

func aboutPage(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintf(w, "<html><body><h1>Ip of the client is: %s<h1></body></html>", r.RemoteAddr)
	log.SetPrefix(datetime + "[INFO] ")
	log.Println("Endpoint Hit: clientIpPage")
	file, err := os.OpenFile("web_server.log", os.O_CREATE|os.O_APPEND|os.O_WRONLY, 0644)
	if err != nil {
		logger := log.New(file, "", flags)
		logger.SetPrefix(datetime + " [ERROR] ")
		logger.Println(err)
	}
	defer file.Close()
	logger := log.New(file, "", flags)
	logger.SetPrefix(datetime + " [INFO] ")
	logger.Println("Endpoint Hit: clientIpPage")
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

func peoplePage(w http.ResponseWriter, r *http.Request) {
	people, err := ReadCSV("people.csv")
	if err != nil {
		log.SetPrefix(datetime + "[ERROR] ")
		log.Println("Error reading CSV file:", err)
		file, error := os.OpenFile("web_server.log", os.O_CREATE|os.O_APPEND|os.O_WRONLY, 0644)
		if error != nil {
			logger := log.New(file, "", flags)
			logger.SetPrefix(datetime + " [ERROR] ")
			logger.Println(error)
		}
		defer file.Close()
		logger := log.New(file, "", flags)
		logger.SetPrefix(datetime + " [ERROR] ")
		logger.Println("Error reading CSV file:", err)
		return
	}

	fmt.Fprintf(w, "<html><body><h1>People</h1><table border='1'><tr><th>Name</th><th>Age</th><th>Hair Color</th><th>Eye Color</th><th>Height</th><th>Country Residence</th><th>Occupation</th></tr>")
	for _, person := range people {
		fmt.Fprintf(w, "<tr><td>%s</td><td>%d</td><td>%s</td><td>%s</td><td>%.1f</td><td>%s</td><td>%s</td></tr>", person.Name, person.Age, person.HairColor, person.EyeColor, person.Height, person.CountryResidence, person.Occupation)
	}
	fmt.Fprintf(w, "</table></body></html>")
	log.SetPrefix(datetime + "[INFO] ")
	log.Println("Endpoint Hit: peoplePage")
	file, err := os.OpenFile("web_server.log", os.O_CREATE|os.O_APPEND|os.O_WRONLY, 0644)
	if err != nil {
		logger := log.New(file, "", flags)
		logger.SetPrefix(datetime + " [ERROR] ")
		logger.Println(err)
	}
	defer file.Close()
	logger := log.New(file, "", flags)
	logger.SetPrefix(datetime + " [INFO] ")
	logger.Println("Endpoint Hit: peoplePage")
}

func handleRequests() {
	http.HandleFunc("/", homePage)
	http.HandleFunc("/about", aboutPage)
	http.HandleFunc("/people", peoplePage)
	log.SetPrefix(datetime + "[ERROR] ")
	log.Fatal(http.ListenAndServe(":8080", nil))
}

func main() {
	handleRequests()
}
