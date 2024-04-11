package main

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
