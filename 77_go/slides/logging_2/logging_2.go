package main

import (
	"log"
	"time"
)

const (
	YYYYMMDD  = "2006-01-02"
	HHMMSS24h = "15:04:05"
)

func main() {
	log.SetFlags(log.Ldate | log.Ltime)
	log.Println("Hello, world!")

	flags := log.Lshortfile

	datetime := time.Now().Format(YYYYMMDD+" "+HHMMSS24h) + " "

	log.Println("Without log levels")

	log.SetFlags(flags)
	log.SetPrefix(datetime + "[INFO] ")
	log.Println("With log levels")

}
