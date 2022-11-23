package utils

import (
	"fmt"
	"math"
	"strings"
)

type ListNode struct {
	Val  int
	Next *ListNode
}

func PrintLinkedList(head *ListNode) {
	var nodes []*ListNode
	current := head

	for i := 0; i < math.MaxInt64; i++ {
		nodes = append(nodes, current)

		if current.Next == nil {
			break
		} else {
			current = current.Next
		}
	}

	formattedNodes := make([]string, len(nodes))
	for index, node := range nodes {
		formattedNodes[index] = fmt.Sprintf("{Node: %v, Val: %v}", index, node.Val)
	}

	fmt.Println(strings.Join(formattedNodes, " => "))
}
