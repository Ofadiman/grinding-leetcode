package main

import "fmt"

type OrderedStream struct {
	length  int
	chunks  []string
	current int
}

func NewOrderedStream(n int) OrderedStream {
	return OrderedStream{
		length:  n,
		chunks:  make([]string, n),
		current: 0,
	}
}

func (this *OrderedStream) Insert(idKey int, value string) []string {
	index := idKey - 1

	this.chunks[index] = value

	if index > this.current {
		return this.chunks[:0]
	}

	for i := this.current; i < this.length && this.chunks[i] != ""; i++ {
		this.current++
	}

	return this.chunks[idKey-1 : this.current]
}

func main() {
	stream := NewOrderedStream(5)
	r1 := stream.Insert(3, "ccccc")
	fmt.Println(r1)
	r2 := stream.Insert(1, "aaaaa")
	fmt.Println(r2)
	r3 := stream.Insert(2, "bbbbb")
	fmt.Println(r3)
	r4 := stream.Insert(5, "eeeee")
	fmt.Println(r4)
	r5 := stream.Insert(4, "ddddd")
	fmt.Println(r5)
}
