import { test, expect } from 'vitest'

function equalFrequency(word: string): boolean {
  const frequency = word.split('').reduce(
    (acc, current) => {
      if (acc[current]) {
        acc[current]++
      } else {
        acc[current] = 1
      }

      return acc
    },
    {} as Record<string, number>,
  )

  const pivot = Object.entries(frequency).reduce(
    (acc, [letter, count]) => {
      if (acc[count]) {
        acc[count].push(letter)
      } else {
        acc[count] = [letter]
      }

      return acc
    },
    {} as Record<string, string[]>,
  )

  const keys = Object.keys(pivot)
  if (keys.length === 1) {
    if (pivot[keys[0]].length === 1) {
      return true
    }

    if (Number(keys[0]) === 1) {
      return true
    } else {
      return false
    }
  }

  if (keys.length > 2) {
    return false
  }

  const array = Object.entries(pivot)
  array.sort((left, right) => left[0].length - right[0].length)

  const [[firstCount, firstLetters], [secondCount, secondLetters]] = array

  if (secondLetters.length > firstLetters.length) {
    if (firstCount === '1' && firstLetters.length === 1) {
      return true
    } else {
      return false
    }
  }

  const diff = Number(secondCount) - Number(firstCount)

  if (secondLetters.length === firstLetters.length) {
    if (firstCount === '1' && firstLetters.length === 1) {
      return true
    }

    return diff * firstLetters.length === 1
  }

  return diff * secondLetters.length === 1
}

const testCases = [
  {
    input: 'cccd',
    output: true,
  },
  {
    input: 'aa',
    output: true,
  },
  {
    input: 'ddaccb',
    output: false,
  },
  {
    input: 'cccaa',
    output: true,
  },
  {
    input: 'abbccc',
    output: false,
  },
  {
    input: 'abbcc',
    output: true,
  },
  {
    input: 'abbbccc',
    output: true,
  },
  {
    input: 'abcc',
    output: true,
  },
  {
    input: 'aaabbcc',
    output: true,
  },
  {
    input: 'cccaabbb',
    output: false,
  },
  {
    input: 'cccaabb',
    output: true,
  },
  {
    input: 'abcc',
    output: true,
  },
  {
    input: 'abc',
    output: true,
  },
  {
    input: 'aabbcc',
    output: false,
  },
  {
    input: 'aabb',
    output: false,
  },
]

testCases.forEach((c) => {
  test(`should return ${JSON.stringify(c.output)} for ${c.input}`, () => {
    expect(equalFrequency(c.input)).toEqual(c.output)
  })
})
