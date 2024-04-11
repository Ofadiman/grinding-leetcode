import { expect, test } from 'vitest'

const euclidianGCD = (a: number, b: number): number => {
  const reminder = a % b
  if (reminder === 0) {
    return b
  }

  return euclidianGCD(b, reminder)
}

function findGCD(nums: number[]): number {
  let a = 0
  let b = Number.MAX_SAFE_INTEGER
  for (let i = 0; i < nums.length; i++) {
    a = Math.max(a, nums[i]!)
    b = Math.min(b, nums[i]!)
  }

  return euclidianGCD(a, b)
}

test('should find greatest common deliminator when smallest number and largest numbers are equal', () => {
  expect(findGCD([1, 1])).toEqual(1)
  expect(findGCD([5, 5, 5])).toEqual(5)
})

test('should find greatest common deliminator when smallest and largest numbers are different', () => {
  expect(findGCD([3, 6])).toEqual(3)
  expect(findGCD([1, 3, 6])).toEqual(1)
  expect(findGCD([4, 5, 6])).toEqual(2)
})

test('should return 1 if there is no bigger common divisor', () => {
  expect(findGCD([3, 5])).toEqual(1)
  expect(findGCD([2, 3, 5])).toEqual(1)
})
