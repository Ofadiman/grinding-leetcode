import { test, expect } from 'vitest'

const toBase = (number: number, base: number): string => {
  if (number === 0) {
    return '0'
  }

  let next = number
  let reminder = 0
  let result = ''

  while (next !== 0) {
    reminder = next % base
    result = reminder + result
    next = Math.floor(next / base)
  }

  return result
}

const toBaseTestCases = [
  {
    number: 0,
    base: 2,
    result: '0',
  },
  {
    number: 1,
    base: 2,
    result: '1',
  },
  {
    number: 5,
    base: 2,
    result: '101',
  },
  {
    number: 8,
    base: 3,
    result: '22',
  },
  {
    number: 9,
    base: 4,
    result: '21',
  },
  {
    number: 19,
    base: 6,
    result: '31',
  },
]

toBaseTestCases.forEach((c) => {
  test(`should return ${c.result} for ${c.number} in base ${c.base} representation`, () => {
    expect(toBase(c.number, c.base)).toEqual(c.result)
  })
})

function isStrictlyPalindromic(n: number): boolean {
  let result = true
  for (let base = 2; base <= n - 2; base++) {
    const based = toBase(n, base)

    const isOdd = based.length % 2 === 1
    const end = isOdd ? (based.length - 1) / 2 : based.length / 2
    for (let start = 0; start < end; start++) {
      if (based[start] !== based[based.length - start - 1]) {
        result = false
        break
      }
    }
  }
  return result
}

const isStrictlyPalindromicTestCases = [
  {
    number: 4,
    result: false,
  },
  {
    number: Math.pow(10, 5),
    result: false,
  },
  {
    number: 5,
    result: false,
  },
]

isStrictlyPalindromicTestCases.forEach((c) => {
  test(`should return ${c.result} for ${c.number}`, () => {
    expect(isStrictlyPalindromic(c.number)).toEqual(c.result)
  })
})
