package main

import (
	"linked-list/utils"
)

func reverseList(head *utils.ListNode) *utils.ListNode {
	return reverse(head, head)
}

func reverse(root, node *utils.ListNode) *utils.ListNode {
	if root == nil || node.Next == nil {
		return root
	}
	node.Next, node.Next.Next, root = node.Next.Next, root, node.Next
	return reverse(root, node)
}

func main() {
	list := utils.NewFromSlice([]int{3, 2, 1})
	utils.Print(reverseList(list))
}
