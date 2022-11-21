package main

import "fmt"

type ParkingSystemCounter struct {
	count int
	max   int
}

type ParkingSystem struct {
	small  ParkingSystemCounter
	medium ParkingSystemCounter
	big    ParkingSystemCounter
}

func NewParkingSystem(big int, medium int, small int) ParkingSystem {
	return ParkingSystem{
		small: ParkingSystemCounter{
			count: 0,
			max:   small,
		},
		medium: ParkingSystemCounter{
			count: 0,
			max:   medium,
		},
		big: ParkingSystemCounter{
			count: 0,
			max:   big,
		},
	}
}

func (this *ParkingSystem) AddCar(carType int) bool {
	switch carType {
	case 1:
		{
			if this.big.count+1 > this.big.max {
				return false
			} else {
				this.big.count++
				return true
			}
		}

	case 2:
		{
			if this.medium.count+1 > this.medium.max {
				return false
			} else {
				this.medium.count++
				return true
			}
		}

	case 3:
		{
			if this.small.count+1 > this.small.max {
				return false
			} else {
				this.small.count++
				return true
			}
		}
	default:
		{
			panic(fmt.Sprintf("unhandled scenario %v", carType))
		}
	}
}

func main() {
	parkingSystem := NewParkingSystem(1, 1, 0)
	fmt.Println(parkingSystem.AddCar(1))
	fmt.Println(parkingSystem.AddCar(2))
	fmt.Println(parkingSystem.AddCar(3))
	fmt.Println(parkingSystem.AddCar(1))
}
