import { expect, test } from 'vitest'

function rearrangeArray(nums: number[]): number[] {
  // 2. swap the integer with previous integer until the integer is in correct position
  // 3. move 1 number right and look for number with opposite sign

  // currently trying to figure out the correct number for that index
  let indexToFill = 0
  while (indexToFill < nums.length - 1) {
    // find the index of the number that should be at current position
    let indexHoldingNextNumber = -1
    const isLookingForPositiveNumber = indexToFill % 2 === 0
    for (let i = indexToFill; i < nums.length; i++) {
      if (isLookingForPositiveNumber) {
        if (nums[i] > 0) {
          indexHoldingNextNumber = i
          break
        }
      } else {
        if (nums[i] < 0) {
          indexHoldingNextNumber = i
          break
        }
      }
    }

    const distance = indexHoldingNextNumber - indexToFill
    if (distance <= 0) {
      indexToFill++
      continue
    }

    for (let j = indexHoldingNextNumber; j > indexToFill; j--) {
      const left = nums[j - 1]
      const right = nums[j]
      nums[j - 1] = right
      nums[j] = left
    }

    indexToFill++
  }

  return nums
}

const testCases = [
  {
    input: [-1, -2, 3, 4],
    output: [3, -1, 4, -2],
  },
  {
    input: [3, 1, -2, -5, 2, -4],
    output: [3, -2, 1, -5, 2, -4],
  },
  {
    input: [-1, 1],
    output: [1, -1],
  },
]

testCases.forEach((c) => {
  test(`should return ${JSON.stringify(c.output)} for ${JSON.stringify(c.input)}`, () => {
    rearrangeArray(c.input)
    expect(c.input).toEqual(c.output)
  })
})
