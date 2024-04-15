import { test, expect } from 'vitest'

function scoreOfString(s: string): number {
  let score: number = 0

  for (let i = 0; i < s.length - 1; i++) {
    score += Math.abs(s[i].charCodeAt(0) - s[i + 1].charCodeAt(0))
  }

  return score
}

const testCases = [
  {
    input: 'hello',
    output: 13,
  },
  {
    input: 'zaz',
    output: 50,
  },
]

testCases.forEach((c) => {
  test(`should return ${c.output} for ${c.input}`, () => {
    expect(scoreOfString(c.input)).toEqual(c.output)
  })
})
