import { test, expect } from 'vitest'

function largestLocal(grid: number[][]): number[][] {
  const n = grid[0].length

  let result: number[][] = []

  for (let y = 1; y < n - 1; y++) {
    for (let x = 1; x < n - 1; x++) {
      const max = Math.max(
        grid[y - 1][x - 1],
        grid[y - 1][x],
        grid[y - 1][x + 1],
        grid[y][x - 1],
        grid[y][x],
        grid[y][x + 1],
        grid[y + 1][x - 1],
        grid[y + 1][x],
        grid[y + 1][x + 1],
      )

      if (result[y - 1] === undefined) {
        result[y - 1] = []
      }

      result[y - 1][x - 1] = max
    }
  }

  return result
}

const testCases = [
  {
    grid: [
      [9, 9, 8, 1],
      [5, 6, 2, 6],
      [8, 2, 6, 4],
      [6, 2, 2, 2],
    ],
    output: [
      [9, 9],
      [8, 6],
    ],
  },
  {
    grid: [
      [1, 1, 1, 1, 1],
      [1, 1, 1, 1, 1],
      [1, 1, 2, 1, 1],
      [1, 1, 1, 1, 1],
      [1, 1, 1, 1, 1],
    ],
    output: [
      [2, 2, 2],
      [2, 2, 2],
      [2, 2, 2],
    ],
  },
]

testCases.forEach((c) => {
  test(`should return ${JSON.stringify(c.output)} for ${JSON.stringify(c.grid)}`, () => {
    expect(largestLocal(c.grid)).toEqual(c.output)
  })
})
