import { expect, test } from 'vitest'

const findArithmeticRanges = (nums: number[]): Array<{ from: number; to: number }> => {
  const result: { from: number; to: number }[] = []

  let start = 0
  let prevDiff = nums[1] - nums[0]
  let current = 2

  while (current < nums.length) {
    const isLastIteration = current === nums.length - 1

    const tempDiff = nums[current] - nums[current - 1]
    if (tempDiff !== prevDiff) {
      if (current - 1 - start >= 2) {
        result.push({
          from: start,
          to: current - 1,
        })
      }

      start = current - 1
      prevDiff = tempDiff
    } else {
      if (isLastIteration) {
        result.push({
          from: start,
          to: current,
        })
      }
    }

    current++
  }

  return result
}

const rangesTestCases = [
  {
    nums: [1, 2, 3, 6, 10],
    result: [{ from: 0, to: 2 }],
  },
  {
    nums: [1, 2, 4, 6],
    result: [{ from: 1, to: 3 }],
  },
  {
    nums: [1, 2, 3, 5, 5, 6, 7, 10, 13],
    result: [
      { from: 0, to: 2 },
      { from: 4, to: 6 },
      { from: 6, to: 8 },
    ],
  },
  {
    nums: [-25, -20, -15, -12, -12, -10, -9, -6, -3, 15, 20],
    result: [
      { from: 0, to: 2 },
      { from: 6, to: 8 },
    ],
  },
]

rangesTestCases.forEach((c) => {
  test(`should return ${JSON.stringify(c.result)} for ${JSON.stringify(c.nums)}`, () => {
    expect(findArithmeticRanges(c.nums)).toEqual(c.result)
  })
})

function checkArithmeticSubarrays(nums: number[], l: number[], r: number[]): boolean[] {
  const result: boolean[] = []

  for (let i = 0; i < l.length; i++) {
    const from = l[i]
    const to = r[i]
    const slice = nums.slice(from, to + 1)
    slice.sort((left, right) => left - right)

    let diff = slice[1] - slice[0]
    let local = true
    for (let j = 2; j < slice.length; j++) {
      const tempDiff = slice[j] - slice[j - 1]
      if (tempDiff !== diff) {
        local = false
        break
      }
    }

    result.push(local)
  }

  return result
}

const testCases = [
  {
    nums: [4, 6, 5, 9, 3, 7],
    l: [0, 0, 2],
    r: [2, 3, 5],
    result: [true, false, true],
  },
  {
    nums: [-12, -9, -3, -12, -6, 15, 20, -25, -20, -15, -10],
    l: [0, 1, 6, 4, 8, 7],
    r: [4, 4, 9, 7, 9, 10],
    result: [false, true, false, false, true, true],
  },
]

testCases.forEach((c) => {
  test(`should return ${JSON.stringify(c.result)} for nums: ${JSON.stringify(
    c.nums,
  )}, l: ${JSON.stringify(c.l)}, r: ${JSON.stringify(c.r)}`, () => {
    expect(checkArithmeticSubarrays(c.nums, c.l, c.r)).toEqual(c.result)
  })
})
