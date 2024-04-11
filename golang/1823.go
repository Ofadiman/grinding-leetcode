package main

import "fmt"

func bindTheWinner(n int, k int) int {
	slice := make([]int, n)
	for i := 1; i <= n; i++ {
		slice[i-1] = i
	}

	currentPosition := 0
	movesLeft := k - 1
	for {
		if len(slice) == 1 {
			fmt.Printf("returning because slice has only 1 item: %v\n", slice)
			return slice[0]
		}

		fmt.Printf("current position: %v, moves left: %v, current slice: %v\n", currentPosition, movesLeft, slice)
		if movesLeft == 0 {
			fmt.Printf("there are no moves left, deleting number %v\n", slice[currentPosition])
			slice = append(slice[:currentPosition], slice[currentPosition+1:]...)
			fmt.Printf("slice after deletion: %v\n", slice)
			movesLeft = k - 1
			if currentPosition == len(slice) {
				fmt.Printf("setting current position to 0 because it was equal to the length of the slice\n")
				currentPosition = 0
			}
		} else {
			if currentPosition == len(slice)-1 {
				fmt.Println("decrementing moves left by 1, setting current position to 0")
				currentPosition = 0
				movesLeft--
			} else {
				fmt.Println("decrementing moves left by 1, incrementing current position by 1")
				currentPosition++
				movesLeft--
			}
		}
	}
}
