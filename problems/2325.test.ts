import { expect, test } from 'vitest'

function decodeMessage(key: string, message: string): string {
  let startingCharCode = 97
  const acc = key.split('').reduce(
    (acc, current) => {
      if (acc[current] !== undefined) {
        return acc
      }

      if (current === ' ') {
        return acc
      }

      acc[current] = String.fromCharCode(startingCharCode)
      startingCharCode++
      return acc
    },
    {} as Record<string, string>,
  )

  return message
    .split('')
    .map((letter) => {
      if (letter === ' ') {
        return ' '
      }
      return acc[letter]!
    })
    .join('')
}

const testCases = [
  {
    key: 'the quick brown fox jumps over the lazy dog',
    message: 'vkbs bs t suepuv',
    result: 'this is a secret',
  },
  {
    key: 'eljuxhpwnyrdgtqkviszcfmabo',
    message: 'zwx hnfx lqantp mnoeius ycgk vcnjrdb',
    result: 'the five boxing wizards jump quickly',
  },
]

testCases.forEach((testCase) => {
  test('should decode message', () => {
    expect(decodeMessage(testCase.key, testCase.message)).toEqual(testCase.result)
  })
})
