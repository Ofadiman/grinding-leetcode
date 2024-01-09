import { expect, test } from 'vitest'

function semiOrderedPermutation(nums: number[]): number {
  const oneIndex = nums.findIndex((num) => num === 1)
  const lengthIndex = nums.findIndex((num) => num === nums.length)

  if (oneIndex < lengthIndex) {
    return oneIndex + nums.length - 1 - lengthIndex
  }

  return oneIndex + nums.length - 2 - lengthIndex
}

const testCases = [
  {
    list: [1, 2, 3, 4],
    n: 0,
  },
  {
    list: [4, 3, 2, 1],
    n: 5,
  },
  {
    list: [2, 1, 4, 3],
    n: 2,
  },
]

testCases.forEach((testCase) => {
  test(`should return ${testCase.n} for ${testCase.list.toString()}`, () => {
    expect(semiOrderedPermutation(testCase.list)).toEqual(testCase.n)
  })
})
