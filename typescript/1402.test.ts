import { test, expect } from 'vitest'

function maxSatisfaction(satisfaction: number[]): number {
  let sorted = satisfaction.sort((a, b) => a - b)
  let total = sorted.reduce((a, b) => a + b)
  let remove = 0
  while (total < 0) {
    total -= sorted[remove]
    remove++
  }
  let result = 0
  for (let i = remove; i < sorted.length; i++) {
    result += sorted[i] * (i - remove + 1)
  }
  return result
}

const testCases = [
  {
    satisfaction: [
      76, 83, 55, -36, -8, 40, -60, -72, 27, -32, 37, 1, 77, 24, -46, -26, 20, -89, -35, -99, 58,
      -7,
    ],
    result: 7281,
  },
  {
    satisfaction: [-5, 0, 2],
    result: 4,
  },
  {
    satisfaction: [-1, 0, 2],
    result: 5,
  },
  {
    satisfaction: [-1, 2],
    result: 3,
  },
  {
    satisfaction: [-5, -4, -3, -2, -1, 0, 1000],
    result: 6965,
  },
  {
    satisfaction: [0, 2],
    result: 4,
  },
  {
    satisfaction: [-2, -1, 0, 2],
    result: 5,
  },
  {
    satisfaction: [-1, -8, 0, 5, -9],
    result: 14,
  },
  {
    satisfaction: [4, 3, 2],
    result: 20,
  },
  {
    satisfaction: [-1, -4, -5],
    result: 0,
  },
  {
    satisfaction: [0, 0, 0],
    result: 0,
  },
]

testCases.forEach((c, i) => {
  test(`should return ${c.result} for ${c.satisfaction}`, () => {
    expect(maxSatisfaction(c.satisfaction)).toEqual(c.result)
  })
})
