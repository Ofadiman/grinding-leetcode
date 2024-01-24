import { expect, test } from 'vitest'

function countPoints(points: number[][], queries: number[][]): number[] {
  const result: number[] = []

  queries.forEach((query, index) => {
    result[index] = 0

    points.forEach((point) => {
      const qX = query[0]
      const qY = query[1]
      const qR = query[2]
      const pX = point[0]
      const pY = point[1]

      const distance = Math.sqrt(Math.pow(Math.abs(qX - pX), 2) + Math.pow(Math.abs(qY - pY), 2))
      if (distance <= qR) {
        result[index]++
      }
    })
  })

  return result
}

const testCases = [
  {
    queries: [
      [2, 3, 1],
      [4, 3, 1],
      [1, 1, 2],
    ],
    points: [
      [1, 3],
      [3, 3],
      [5, 3],
      [2, 2],
    ],
    result: [3, 2, 2],
  },
  {
    queries: [
      [1, 2, 2],
      [2, 2, 2],
      [4, 3, 2],
      [4, 3, 3],
    ],
    points: [
      [1, 1],
      [2, 2],
      [3, 3],
      [4, 4],
      [5, 5],
    ],
    result: [2, 3, 2, 4],
  },
]

testCases.forEach((c) => {
  test(`should return ${c.result} for ${c.points} points and ${c.queries} queries`, () => {
    expect(countPoints(c.points, c.queries)).toEqual(c.result)
  })
})
