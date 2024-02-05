import { test, expect } from 'vitest'

function diagonalSort(mat: number[][]): number[][] {
  let didSwap = true
  while (didSwap === true) {
    didSwap = false

    for (let y = 0; y < mat.length; y++) {
      for (let x = 0; x < mat[0].length; x++) {
        const current = mat[y][x]
        const next = mat[y + 1]?.[x + 1]

        if (next === undefined) {
          continue
        }

        if (current > next) {
          didSwap = true
          mat[y][x] = next
          mat[y + 1][x + 1] = current
        }
      }
    }
  }

  return mat
}

const testCases = [
  {
    input: [
      [3, 3, 1, 1],
      [2, 2, 1, 2],
      [1, 1, 1, 2],
    ],
    output: [
      [1, 1, 1, 1],
      [1, 2, 2, 2],
      [1, 2, 3, 3],
    ],
  },
  {
    input: [
      [11, 25, 66, 1, 69, 7],
      [23, 55, 17, 45, 15, 52],
      [75, 31, 36, 44, 58, 8],
      [22, 27, 33, 25, 68, 4],
      [84, 28, 14, 11, 5, 50],
    ],
    output: [
      [5, 17, 4, 1, 52, 7],
      [11, 11, 25, 45, 8, 69],
      [14, 23, 25, 44, 58, 15],
      [22, 27, 31, 36, 50, 66],
      [84, 28, 75, 33, 55, 68],
    ],
  },
]

testCases.forEach((c) => {
  test(`should return ${c.output} for ${c.input}`, () => {
    expect(diagonalSort(c.input)).toEqual(c.output)
  })
})
