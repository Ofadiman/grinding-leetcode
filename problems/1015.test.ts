import { expect, test } from 'vitest'

function smallestRepunitDivByK(k: number): number {
  let result = -1
  if (k % 2 === 0 || k % 5 === 0) {
    return result
  }

  const rests: number[] = []
  let number = '1'
  while (true) {
    const rest = Number(number) % k
    if (rest === 0) {
      result = number.length
      break
    }

    if (rests.includes(rest)) {
      break
    }

    number = number.concat('1')
  }

  return result
}

const testCases = [
  {
    input: 1,
    output: 1,
  },
  {
    input: 2,
    output: -1,
  },
  {
    input: 4,
    output: -1,
  },
  {
    input: 5,
    output: -1,
  },
  {
    input: 10,
    output: -1,
  },
  {
    input: 11,
    output: 2,
  },
]

testCases.forEach((c) => {
  test(`should return ${c.output} for ${c.input}`, () => {
    expect(smallestRepunitDivByK(c.input)).toEqual(c.output)
  })
})
