package main

import (
	"fmt"
	"linked-list/utils"
	"math"
	"strconv"
)

func getDecimalValue(head *utils.ListNode) int {
	base2 := ""

	node := head
	for i := 0; i < math.MaxInt64; i++ {
		base2 += strconv.Itoa(node.Val)

		if node.Next == nil {
			break
		} else {
			node = node.Next
		}
	}

	result, _ := strconv.ParseInt(base2, 2, 64)

	return int(result)
}

func main() {
	tail := utils.ListNode{
		Val:  1,
		Next: nil,
	}
	second := utils.ListNode{
		Val:  0,
		Next: &tail,
	}
	head := utils.ListNode{
		Val:  1,
		Next: &second,
	}

	fmt.Println(getDecimalValue(&head))
}
