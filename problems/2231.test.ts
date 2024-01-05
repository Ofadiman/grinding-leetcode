import { test, expect } from 'vitest'

function largestInteger(num: number): number {
  const asString = num.toString()
  const odd: number[] = []
  const even: number[] = []
  const order: boolean[] = []

  for (let i = 0; i < asString.length; i++) {
    const number = Number.parseInt(asString[i]!)
    if (number % 2 === 0) {
      even.push(number)
      order.push(true)
    } else {
      odd.push(number)
      order.push(false)
    }
  }

  odd.sort((left, right) => (left > right ? 1 : -1))
  even.sort((left, right) => (left > right ? 1 : -1))

  const all = [...odd, ...even]
  const result: number[] = []

  for (let i = 0; i < all.length; i++) {
    if (order[i]! === true) {
      result.push(even.pop()!)
    } else {
      result.push(odd.pop()!)
    }
  }

  return Number.parseInt(result.join(''))
}

test('should handle numbers consisting of 1 even number', () => {
  expect(largestInteger(2)).toEqual(2)
})

test('should handle numbers consisting of 1 odd number', () => {
  expect(largestInteger(1)).toEqual(1)
})

test('should handle numbers consisting of odd numbers', () => {
  expect(largestInteger(1357)).toEqual(7531)
})

test('should handle numbers consisting of even numbers only', () => {
  expect(largestInteger(2468)).toEqual(8642)
})

test('should handle numbers consisting of even and odd numbers', () => {
  expect(largestInteger(1234)).toEqual(3412)
  expect(largestInteger(132574)).toEqual(754312)
  expect(largestInteger(241683)).toEqual(863421)
})

test('should handle palindrome numbers', () => {
  expect(largestInteger(1111)).toEqual(1111)
  expect(largestInteger(2222)).toEqual(2222)
})
