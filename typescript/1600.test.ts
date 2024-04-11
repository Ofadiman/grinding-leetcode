import { test, expect } from 'vitest'

function kItemsWithMaximumSum(
  numOnes: number,
  numZeros: number,
  numNegOnes: number,
  k: number,
): number {
  if (k === 0) {
    return 0
  }

  let left = k
  let sum = 0

  if (numOnes > 0 && left > 0) {
    if (numOnes >= left) {
      sum += left
      left = 0
    } else {
      sum += numOnes
      left -= numOnes
    }
  }

  if (numZeros > 0 && left > 0) {
    if (numZeros >= left) {
      left = 0
    } else {
      left -= numZeros
    }
  }

  if (numNegOnes > 0 && left > 0) {
    if (numNegOnes >= left) {
      sum -= left
      left = 0
    } else {
      sum -= numNegOnes
    }
  }

  return sum
}

const testCases = [
  {
    numOnes: 0,
    numZeros: 0,
    numNegOnes: 0,
    k: 0,
    result: 0,
  },
  {
    numOnes: 0,
    numZeros: 0,
    numNegOnes: 0,
    k: 3,
    result: 0,
  },
  {
    numOnes: 3,
    numZeros: 0,
    numNegOnes: 0,
    k: 3,
    result: 3,
  },
  {
    numOnes: 4,
    numZeros: 0,
    numNegOnes: 0,
    k: 3,
    result: 3,
  },
  {
    numOnes: 0,
    numZeros: 3,
    numNegOnes: 0,
    k: 3,
    result: 0,
  },
  {
    numOnes: 0,
    numZeros: 4,
    numNegOnes: 0,
    k: 3,
    result: 0,
  },
  {
    numOnes: 0,
    numZeros: 0,
    numNegOnes: 3,
    k: 3,
    result: -3,
  },
  {
    numOnes: 0,
    numZeros: 0,
    numNegOnes: 4,
    k: 3,
    result: -3,
  },
  {
    numOnes: 1,
    numZeros: 1,
    numNegOnes: 1,
    k: 3,
    result: 0,
  },
  {
    numOnes: 1,
    numZeros: 1,
    numNegOnes: 1,
    k: 4,
    result: 0,
  },
  {
    numOnes: 4,
    numZeros: 0,
    numNegOnes: 0,
    k: 3,
    result: 3,
  },
  {
    numOnes: 4,
    numZeros: 4,
    numNegOnes: 0,
    k: 5,
    result: 4,
  },
  {
    numOnes: 4,
    numZeros: 4,
    numNegOnes: 4,
    k: 9,
    result: 3,
  },
]

testCases.forEach((c) => {
  test(`should return ${c.result} for ${c.numOnes} ones, ${c.numZeros} zeros, ${c.numNegOnes} negative ones and k=${c.k}`, () => {
    expect(kItemsWithMaximumSum(c.numOnes, c.numZeros, c.numNegOnes, c.k)).toEqual(c.result)
  })
})
