import { expect, test } from 'vitest'

function sortTheStudents(score: number[][], k: number): number[][] {
  const clone = structuredClone(score)
  clone.sort((left, right) => {
    if (left[k] === right[k]) {
      return 0
    }

    if (left[k] > right[k]) {
      return -1
    }

    return 1
  })
  return clone
}

const testCases = [
  {
    matrix: [
      [10, 6, 9, 1],
      [7, 5, 11, 2],
      [4, 8, 3, 15],
    ],
    k: 2,
    result: [
      [7, 5, 11, 2],
      [10, 6, 9, 1],
      [4, 8, 3, 15],
    ],
  },
  {
    matrix: [
      [3, 4],
      [5, 6],
    ],
    k: 0,
    result: [
      [5, 6],
      [3, 4],
    ],
  },
]

testCases.forEach((c) => {
  test(`should return ${c.result} when k is ${c.k} and input is ${c.matrix}`, () => {
    expect(sortTheStudents(c.matrix, c.k)).toEqual(c.result)
  })
})
