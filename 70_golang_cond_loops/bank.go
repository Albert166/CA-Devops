package main

import (
	"fmt"
)

func main() {
	var exit bool = false
	var balance float64 = 0.0

	for !exit {
		fmt.Println("1. Deposit")
		fmt.Println("2. Withdrawal")
		fmt.Println("3. Balance")
		fmt.Println("4. Exit")

		var choice int
		fmt.Scanln(&choice)

		switch choice {
		case 1:
			var amount float64
			fmt.Println("Enter amount:")
			fmt.Scanln(&amount)
			if amount < 0 {
				fmt.Println("Invalid amount")
			} else {
				balance += amount
				fmt.Println("Deposit successful")
			}
		case 2:
			var amount float64
			fmt.Println("Enter amount:")
			fmt.Scanln(&amount)
			if amount > balance {
				fmt.Println("Insufficient balance")
			} else {
				balance -= amount
				fmt.Println("Withdrawal successful")
			}
		case 3:
			fmt.Println("Balance: ", balance)
		case 4:
			fmt.Println("Exiting...")
			exit = true
		default:
			fmt.Println("Invalid choice")
		}
	}
}
