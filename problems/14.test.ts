import { test, expect } from 'vitest'

function longestCommonPrefix(strings: string[]): string {
  if (strings.length === 0) {
    return ''
  }

  let prefix: string = strings[0]
  for (let i = 1; i < strings.length; i++) {
    for (let j = 0; j < prefix.length; j++) {
      if (prefix[j] !== strings[i][j]) {
        if (prefix.length > j) {
          prefix = strings[i].slice(0, j)
        }

        break
      }
    }
  }

  return prefix
}

const testCases = [
  {
    input: [],
    output: '',
  },
  {
    input: ['a'],
    output: 'a',
  },
  {
    input: ['flower', 'flow', 'flight'],
    output: 'fl',
  },
  {
    input: ['dog', 'racecar', 'car'],
    output: '',
  },
]

testCases.forEach((c) => {
  test(`should return ${c.output} for ${JSON.stringify(c.input)}`, () => {
    expect(longestCommonPrefix(c.input)).toEqual(c.output)
  })
})
