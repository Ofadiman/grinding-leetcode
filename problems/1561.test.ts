import { test, expect } from 'vitest'

function maxCoins(piles: number[]): number {
  piles.sort((a, b) => a - b)

  let left = piles.length / 3
  let index = piles.length - 2
  let result = 0

  while (left > 0) {
    result += piles[index]
    left -= 1
    index -= 2
  }

  return result
}

const testCases = [
  {
    piles: [1, 1, 1],
    result: 1,
  },
  {
    piles: [2, 4, 5],
    result: 4,
  },
  {
    piles: [2, 4, 1, 2, 7, 8],
    result: 9,
  },
  {
    piles: [9, 5, 6, 8, 10, 1, 4, 10, 7],
    result: 24,
  },
]

testCases.forEach((c) => {
  test(`should return ${c.result} for ${JSON.stringify(c.piles)}`, () => {
    expect(maxCoins(c.piles)).toEqual(c.result)
  })
})
