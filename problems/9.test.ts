import { test, expect } from 'vitest'

function isPalindrome(x: number): boolean {
  if (x < 0) {
    return false
  }

  const s1 = x.toString()
  const s2 = x.toString().split('').reverse().join('')

  return s1 === s2
}

const testCases = [
  {
    input: -121,
    output: false,
  },
  {
    input: -1,
    output: false,
  },
  {
    input: 0,
    output: true,
  },
  {
    input: 9,
    output: true,
  },
  {
    input: 10,
    output: false,
  },
  {
    input: 11,
    output: true,
  },
]

testCases.forEach((c) => {
  test(`should return ${c.output} for ${c.input}`, () => {
    expect(isPalindrome(c.input)).toEqual(c.output)
  })
})
