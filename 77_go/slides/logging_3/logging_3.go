package main

import (
	"log"
	"os"
	"time"
)

const (
	YYYYMMDD  = "2006-01-02"
	HHMMSS24h = "15:04:05"
)

func main() {
	flags := log.Lshortfile
	datetime := time.Now().Format(YYYYMMDD) + " " + time.Now().Format(HHMMSS24h) + ": "
	file, err := os.OpenFile("logs.log", os.O_APPEND|os.O_CREATE|os.O_WRONLY, 0644)
	if err != nil {
		logger := log.New(file, "", flags)
		logger.SetPrefix("FATAL: " + datetime)
		logger.Println(err)
	}
	defer file.Close()
	logger := log.New(file, "", flags)
	logger.SetPrefix(datetime + "[INFO] ")
	logger.Println("Log customdate and time in logs.log file")

}
