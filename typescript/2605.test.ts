import { expect, test } from 'vitest'

function minNumber(nums1: number[], nums2: number[]): number {
  const reducer: Record<number, number> = {}

  let min1 = Number.MAX_SAFE_INTEGER
  nums1.forEach((num) => {
    min1 = Math.min(min1, num)
    if (reducer[num] === undefined) {
      reducer[num] = 1
    } else {
      reducer[num]++
    }
  })

  let min2 = Number.MAX_SAFE_INTEGER
  nums2.forEach((num) => {
    min2 = Math.min(min2, num)
    if (reducer[num] === undefined) {
      reducer[num] = 1
    } else {
      reducer[num]++
    }
  })

  let smallest = Number.MAX_SAFE_INTEGER
  Object.entries(reducer).forEach(([number, count]) => {
    if (count === 2) {
      smallest = Math.min(smallest, Number.parseInt(number))
    }
  })

  if (smallest !== Number.MAX_SAFE_INTEGER) {
    return smallest
  }

  if (min1 > min2) {
    return Number.parseInt(`${min2}${min1}`)
  }

  return Number.parseInt(`${min1}${min2}`)
}

const cases = [
  {
    n1: [1],
    n2: [1],
    result: 1,
  },
  {
    n1: [1, 2, 3],
    n2: [1, 2, 3],
    result: 1,
  },
  {
    n1: [1, 2, 3],
    n2: [1],
    result: 1,
  },
  {
    n1: [1],
    n2: [1, 2, 3],
    result: 1,
  },
  {
    n1: [1],
    n2: [4, 5, 6],
    result: 14,
  },
  {
    n1: [1, 2, 3],
    n2: [4],
    result: 14,
  },
  {
    n1: [4, 5, 6],
    n2: [1, 2, 3],
    result: 14,
  },
  {
    n1: [1, 9],
    n2: [2, 9],
    result: 9,
  },
]

cases.forEach((c) => {
  test(`n1: ${c.n1.toString()}, n2: ${c.n2.toString()}, result: ${c.result}`, () => {
    expect(minNumber(c.n1, c.n2)).toEqual(c.result)
  })
})
