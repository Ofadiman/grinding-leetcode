import { expect, test } from 'vitest'

function groupThePeople(groupSizes: number[]): number[][] {
  const acc: Record<number, number[]> = {}
  const groups: number[][] = []

  groupSizes.forEach((size, index) => {
    if (acc[size] === undefined) {
      acc[size] = [index]
    } else {
      acc[size].push(index)
    }

    if (acc[size].length === size) {
      groups.push(acc[size])
      acc[size] = []
    }
  })

  return groups
}

const testCases = [
  {
    groupSizes: [3, 3, 3, 3, 3, 1, 3],
    answer: [[0, 1, 2], [5], [3, 4, 6]],
  },
  {
    groupSizes: [2, 1, 3, 3, 3, 2],
    answer: [[1], [2, 3, 4], [0, 5]],
  },
]

testCases.forEach((c) => {
  test('should return correct answer', () => {
    expect(groupThePeople(c.groupSizes)).toEqual(c.answer)
  })
})
