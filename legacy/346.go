package main

import (
	"fmt"
	"math"
)

type MovingAverage struct {
	size  float64
	items []float64
}

func Constructor346(size int) MovingAverage {
	return MovingAverage{size: float64(size), items: []float64{}}
}

func (r *MovingAverage) Next(val int) float64 {
	r.items = append(r.items, float64(val))

	if len(r.items) > int(r.size) {
		r.items = r.items[1:]
	}

	sum := float64(0)
	for i := 0; i < len(r.items); i++ {
		sum += r.items[i]
	}

	return sum / math.Min(r.size, float64(len(r.items)))
}

func main() {
	movingAverage := Constructor346(3)
	fmt.Println(movingAverage.Next(1))
	fmt.Println(movingAverage.Next(10))
	fmt.Println(movingAverage.Next(3))
	fmt.Println(movingAverage.Next(5))
}
