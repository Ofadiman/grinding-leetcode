import { test, expect } from 'vitest'

function numberOfBeams(bank: string[]): number {
  let result = 0

  let prev = 0
  bank.forEach((row) => {
    let points = 0
    for (let i = 0; i < row.length; i++) {
      if (row[i] === '1') {
        points++
      }
    }

    if (prev === 0) {
      prev = points
    } else {
      if (points === 0) {
        return
      }
      result += prev * points
      prev = points
    }
  })

  return result
}

const testCases = [
  {
    bank: ['000', '000', '000'],
    result: 0,
  },
  {
    bank: ['111', '111', '111'],
    result: 18,
  },
  {
    bank: ['000', '111', '111'],
    result: 9,
  },
  {
    bank: ['011001', '000000', '010100', '001000'],
    result: 8,
  },
  {
    bank: ['000', '111', '000'],
    result: 0,
  },
]

testCases.forEach((c) => {
  test(`should return ${c.result} for ${c.bank}`, () => {
    expect(numberOfBeams(c.bank)).toEqual(c.result)
  })
})
