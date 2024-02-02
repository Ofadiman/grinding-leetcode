import { test, expect } from 'vitest'

function onesMinusZeros(grid: number[][]): number[][] {
  const rows: number[] = Array.from({ length: grid.length }).fill(0) as number[]
  const columns: number[] = Array.from({ length: grid[0].length }).fill(0) as number[]

  for (let y = 0; y < grid.length; y++) {
    for (let x = 0; x < grid[0].length; x++) {
      if (grid[y][x] === 1) {
        rows[y]++
        columns[x]++
      } else {
        rows[y]--
        columns[x]--
      }
    }
  }

  const result: number[][] = []
  for (let y = 0; y < grid.length; y++) {
    for (let x = 0; x < grid[0].length; x++) {
      if (result[y] === undefined) {
        result[y] = []
      }

      result[y][x] = columns[x] + rows[y]
    }
  }
  return result
}

const testCases = [
  {
    grid: [[1], [1]],
    output: [[3], [3]],
  },
  {
    grid: [
      [1, 1],
      [1, 1],
    ],
    output: [
      [4, 4],
      [4, 4],
    ],
  },
  {
    grid: [
      [0, 0],
      [0, 0],
    ],
    output: [
      [-4, -4],
      [-4, -4],
    ],
  },
  {
    grid: [
      [0, 1, 1],
      [1, 0, 1],
      [0, 0, 1],
    ],
    output: [
      [0, 0, 4],
      [0, 0, 4],
      [-2, -2, 2],
    ],
  },
  {
    grid: [
      [1, 1, 1],
      [1, 1, 1],
    ],
    output: [
      [5, 5, 5],
      [5, 5, 5],
    ],
  },
]

testCases.forEach((c) => {
  test(`should return ${c.output} for ${c.grid}`, () => {
    expect(onesMinusZeros(c.grid)).toEqual(c.output)
  })
})
