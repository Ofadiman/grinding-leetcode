import { expect, test } from 'vitest'

function maximumOddBinaryNumber(s: string): string {
  const list = s.split('')
  const onesCount = list.reduce((acc, current) => {
    if (current === '1') {
      acc++
    }
    return acc
  }, 0)

  list.sort((a, b) => parseInt(b) - parseInt(a))

  let result = ''
  const biggestNumberFromBinary = parseInt(list.join(''), 2)
  for (let i = biggestNumberFromBinary; i > 0; i--) {
    if (i % 2 === 0) {
      continue
    }

    const binary = i.toString(2)
    const currentOnesCount = binary.split('').reduce((acc, current) => {
      if (current === '1') {
        acc++
      }
      return acc
    }, 0)

    if (currentOnesCount === onesCount) {
      result = binary.padStart(s.length, '0')
      break
    }
  }

  return result
}

const testCases = [
  {
    string: '1',
    result: '1',
  },
  {
    string: '10',
    result: '01',
  },
  {
    string: '010',
    result: '001',
  },
  {
    string: '0101',
    result: '1001',
  },
]

testCases.forEach((testCase) => {
  test(`should return ${testCase.result} for ${testCase.string}`, () => {
    expect(maximumOddBinaryNumber(testCase.string)).toEqual(testCase.result)
  })
})
