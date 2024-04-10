import { expect, test } from 'vitest'

function sumOfMultiples(n: number): number {
  let result = 0

  for (let i = 1; i <= n; i++) {
    if (i % 3 === 0) {
      result += i
      continue
    }

    if (i % 5 === 0) {
      result += i
      continue
    }

    if (i % 7 === 0) {
      result += i
      continue
    }
  }

  return result
}

const testCases = [
  {
    input: 1,
    output: 0,
  },
  {
    input: 2,
    output: 0,
  },
  {
    input: 3,
    output: 3,
  },
  {
    input: 4,
    output: 3,
  },
  {
    input: 5,
    output: 8,
  },
  {
    input: 6,
    output: 14,
  },
  {
    input: 7,
    output: 21,
  },
  {
    input: 8,
    output: 21,
  },
  {
    input: 9,
    output: 30,
  },
  {
    input: 10,
    output: 40,
  },
  {
    input: 11,
    output: 40,
  },
]

testCases.forEach((c) => {
  test(`should return ${c.output} for ${c.input}`, () => {
    expect(sumOfMultiples(c.input)).toEqual(c.output)
  })
})
