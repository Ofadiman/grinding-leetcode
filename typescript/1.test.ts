import { expect, test } from 'vitest'

function twoSum(nums: number[], target: number): number[] {
  const acc = nums.reduce(
    (acc, value, index) => {
      acc[value] = index
      return acc
    },
    {} as Record<number, number>,
  )

  const result: number[] = []
  for (let i = 0; i < nums.length; i++) {
    const diff = target - nums[i]

    const index = acc[diff]
    if (index === i) {
      continue
    }

    if (index) {
      if (i > index) {
        result.push(index, i)
      } else {
        result.push(i, index)
      }

      break
    }
  }

  return result
}

const testCases = [
  {
    numbers: [2, 7, 11, 10],
    target: 9,
    output: [0, 1],
  },
  {
    numbers: [3, 2, 4],
    target: 6,
    output: [1, 2],
  },
  {
    numbers: [3, 2, 3],
    target: 6,
    output: [0, 2],
  },
  {
    numbers: [1, 3, 4, 2],
    target: 6,
    output: [2, 3],
  },
]

testCases.forEach((c) => {
  test(`should return ${JSON.stringify(c.output)} for ${JSON.stringify(
    c.numbers,
  )} and target set to ${c.target}`, () => {
    expect(twoSum(c.numbers, c.target)).toEqual(c.output)
  })
})
