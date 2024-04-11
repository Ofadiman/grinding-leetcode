import { test, expect } from 'vitest'

function lengthOfLastWord(s: string): number {
  const parts = s.split(' ').filter((str) => /[a-zA-Z]/g.test(str))
  return parts[parts.length - 1].length
}

const testCases = [
  {
    input: 'Hello World',
    output: 5,
  },
  {
    input: '   fly me   to   the moon  ',
    output: 4,
  },
  {
    input: 'luffy is still joyboy',
    output: 6,
  },
  {
    input: 'fluffy """"',
    output: 6,
  },
]

testCases.forEach((c) => {
  test(`should return ${c.output} for "${c.input}"`, () => {
    expect(lengthOfLastWord(c.input)).toEqual(c.output)
  })
})
