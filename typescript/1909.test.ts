import { expect, test } from 'vitest'

function canBeIncreasing(nums: number[]): boolean {
  let removedIndexes = []

  for (let i = 0; i < nums.length; i++) {
    const previous = nums[i - 1] || Number.MIN_SAFE_INTEGER
    const current = nums[i]
    const next = nums[i + 1] || Number.MAX_SAFE_INTEGER
    const nextNext = nums[i + 2] || Number.MAX_SAFE_INTEGER

    if (next > current) {
      continue
    }

    if (next > previous) {
      removedIndexes.push(i)
      continue
    }

    if (nextNext > current) {
      removedIndexes.push(i + 1)
      i++
      continue
    }

    return false
  }

  return removedIndexes.length <= 1
}

const testCases = [
  {
    input: [1, 3, 2, 4],
    output: true,
  },
  {
    input: [2, 3, 1, 4],
    output: true,
  },
  {
    input: [2, 3, 3, 4],
    output: true,
  },
  {
    input: [2, 1, 2],
    output: true,
  },
  {
    input: [2, 1, 3, 4],
    output: true,
  },
  {
    input: [1, 1, 1],
    output: false,
  },
  {
    input: [1, 2, 3],
    output: true,
  },
  {
    input: [1, 2, 5, 3, 4],
    output: true,
  },
  {
    input: [1, 3, 5, 2, 4],
    output: false,
  },
  {
    input: [1, 2, 10, 3, 1, 4],
    output: false,
  },
  {
    input: [1, 2, 7, 10, 3, 4],
    output: false,
  },
  {
    input: [1, 2, 10, 3, 4, 15, 5, 6],
    output: false,
  },
  {
    input: [1, 2, 10, 5, 7],
    output: true,
  },
  {
    input: [2, 3, 1, 2],
    output: false,
  },
]

testCases.forEach((c) => {
  test(`should return ${JSON.stringify(c.output)} for ${JSON.stringify(c.input)}`, () => {
    expect(canBeIncreasing(c.input)).toEqual(c.output)
  })
})
