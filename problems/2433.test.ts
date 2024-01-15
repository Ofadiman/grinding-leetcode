import { expect, test } from 'vitest'

function findArray(pref: number[]): number[] {
  const result: number[] = []
  for (let i = 0; i < pref.length; i++) {
    if (result.length === 0) {
      result[i] = pref[i]
    }

    result[i] = pref[i] ^ pref[i - 1]
  }

  return result
}

const testCases = [
  {
    input: [],
    output: [],
  },
  {
    input: [1],
    output: [1],
  },
  {
    input: [5, 2, 0, 3, 1],
    output: [5, 7, 2, 3, 2],
  },
]

testCases.forEach((c) => {
  test(`should return ${c.output} for ${c.input}`, () => {
    expect(findArray(c.input)).toEqual(c.output)
  })
})
