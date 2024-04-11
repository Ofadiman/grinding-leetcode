import { expect, test } from 'vitest'

function intersection(nums1: number[], nums2: number[]): number[] {
  if (nums1.length === 0 || nums2.length === 0) {
    return []
  }

  const aggregate = nums1.reduce<Record<number, number>>((acc, value) => {
    if (acc[value]) {
      acc[value]++
    } else {
      acc[value] = 1
    }

    return acc
  }, {})

  const set = new Set<number>()

  nums2.forEach((number) => {
    if (aggregate[number]) {
      set.add(number)
    }
  })

  return [...set]
}

const testCases = [
  {
    first: [],
    second: [],
    result: [],
  },
  {
    first: [1],
    second: [],
    result: [],
  },
  {
    first: [],
    second: [1],
    result: [],
  },
  {
    first: [1],
    second: [2],
    result: [],
  },
  {
    first: [1, 2, 3],
    second: [4, 5, 6],
    result: [],
  },
  {
    first: [1],
    second: [1],
    result: [1],
  },
  {
    first: [1, 2, 3],
    second: [3, 4, 5],
    result: [3],
  },
  {
    first: [1, 2, 3],
    second: [3, 4, 5],
    result: [3],
  },
  {
    first: [1, 2, 3],
    second: [1, 2, 3],
    result: [1, 2, 3],
  },
  {
    first: [1, 2, 3, 1, 2, 3],
    second: [1, 2, 3, 1, 2, 3],
    result: [1, 2, 3],
  },
  {
    first: [1, 2, 3, 4, 5],
    second: [3, 4, 5, 6, 7],
    result: [3, 4, 5],
  },
]

testCases.forEach((c) => {
  test(`should return ${JSON.stringify(c.result)} for ${c.first} and ${c.second}`, () => {
    expect(intersection(c.first, c.second)).toEqual(c.result)
  })
})
