package main

import "log"

const (
	Ldate = iota
	Ltime
	Lmicroseconds
	Llongfile
	Lshortfile
	LUTC
	Lmsgprefix
	LstdFlags = Ldate | Ltime
)

func main() {
	log.Println("Hello, World!")
	log.SetFlags(log.Ldate)
	log.Println("Log to the console with date preopended")
	log.SetFlags(log.Ltime)
	log.Println("Log to the console with time preopended")
	log.SetFlags(log.Ldate | log.Ltime)
	log.Println("Log to the console with date and time preopended")
	log.SetFlags(log.Lshortfile)
	log.Println("Log to the console with the file name and line number preopended")
	log.SetFlags(log.LUTC)
	log.Println("Log to the console with the UTC time preopended")
	log.SetFlags(log.Llongfile)
	log.Println("Log to the console with the full file path and line number preopended")
	log.SetFlags(log.LstdFlags)
	log.Println("Log to the console with the standard flags")
}
