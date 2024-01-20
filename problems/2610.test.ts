import { expect, test } from 'vitest'

function findMatrix(nums: number[]): number[][] {
  if (nums.length === 0) {
    return []
  }

  const result: number[][] = []
  const accumulator: Record<string, number> = {}
  for (let i = 0; i < nums.length; i++) {
    const current = nums[i]
    if (accumulator[current] === undefined) {
      accumulator[current] = 0
    } else {
      accumulator[current]++
    }

    if (result[accumulator[current]] === undefined) {
      result.push([current])
    } else {
      result[accumulator[current]].push(current)
    }
  }

  return result
}

const testCases = [
  {
    input: [],
    output: [],
  },
  {
    input: [1],
    output: [[1]],
  },
  {
    input: [1, 1, 1],
    output: [[1], [1], [1]],
  },
  {
    input: [1, 2, 1],
    output: [[1, 2], [1]],
  },
  {
    input: [1, 2, 3],
    output: [[1, 2, 3]],
  },
]

testCases.forEach((c) => {
  test(`should return ${c.output} for ${c.input}`, () => {
    expect(findMatrix(c.input)).toEqual(c.output)
  })
})
