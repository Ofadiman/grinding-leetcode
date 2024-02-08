import { expect, test } from 'vitest'

const isNiceString = (s: string): boolean => {
  const letters = Array.from({ length: 26 }).reduce<
    Record<string, { uppercase: boolean; lowercase: boolean }>
  >(
    (acc, _, index) => {
      acc[String.fromCharCode(97 + index)] = { uppercase: false, lowercase: false }

      return acc
    },
    {} as Record<string, { uppercase: boolean; lowercase: boolean }>,
  )

  s.split('').forEach((letter) => {
    const charCode = letter.charCodeAt(0)
    // Uppercase letter.
    if (charCode <= 91) {
      letters[letter.toLowerCase()].uppercase = true
    }

    // Lowercase letter.
    if (charCode >= 97) {
      letters[letter].lowercase = true
    }
  })

  return !Object.values(letters).some((value) => value.lowercase !== value.uppercase)
}

const isNiceStringTestCases = [
  {
    input: 'a',
    output: false,
  },
  {
    input: 'aAa',
    output: true,
  },
  {
    input: 'aAbB',
    output: true,
  },
  {
    input: 'aAbBc',
    output: false,
  },
]

isNiceStringTestCases.forEach((c) => {
  test(`should return ${JSON.stringify(c.output)} for ${c.input}`, () => {
    expect(isNiceString(c.input)).toEqual(c.output)
  })
})

const splitByNonNiceLetters = (s: string): string[] => {
  const letters = Array.from({ length: 26 }).reduce<
    Record<string, { uppercase: boolean; lowercase: boolean }>
  >(
    (acc, _, index) => {
      acc[String.fromCharCode(97 + index)] = { uppercase: false, lowercase: false }

      return acc
    },
    {} as Record<string, { uppercase: boolean; lowercase: boolean }>,
  )

  s.split('').forEach((letter) => {
    const charCode = letter.charCodeAt(0)
    // Uppercase letter.
    if (charCode <= 91) {
      letters[letter.toLowerCase()].uppercase = true
    }

    // Lowercase letter.
    if (charCode >= 97) {
      letters[letter].lowercase = true
    }
  })

  const splitted = s
    .split('')
    .map((letter) => {
      const x = letters[letter.toLowerCase()]
      if (x.uppercase && x.lowercase) {
        return letter
      }

      return ' '
    })
    .join('')
    .split(' ')
    .filter((string) => string !== '')

  return splitted
}

const splitByNonNiceLettersTestCases = [
  {
    input: 'abA',
    output: ['a', 'A'],
  },
  {
    input: 'aabbABc',
    output: ['aabbAB'],
  },
]

splitByNonNiceLettersTestCases.forEach((c) => {
  test(`should return ${JSON.stringify(c.output)} for ${c.input}`, () => {
    expect(splitByNonNiceLetters(c.input)).toEqual(c.output)
  })
})

const findNiceStrings = (s: string, results: string[]): string[] => {
  const splitted = splitByNonNiceLetters(s)
  if (splitted.length === 0) {
    return results
  }

  splitted.forEach((string) => {
    if (isNiceString(string)) {
      results.push(string)
    } else {
      findNiceStrings(string, results)
    }
  })

  return results
}

function longestNiceSubstring(s: string): string {
  if (s.length === 0) {
    return ''
  }

  const niceStrings = findNiceStrings(s, [])
  if (niceStrings.length === 0) {
    return ''
  }

  let result = ''
  niceStrings.forEach((niceString) => {
    if (niceString.length > result.length) {
      result = niceString
    }
  })

  return result
}

const testCases = [
  {
    input: 'dDzeE',
    output: 'dD',
  },
  {
    input: 'aAbBzcC',
    output: 'aAbB',
  },
  {
    input: '',
    output: '',
  },
  {
    input: 'c',
    output: '',
  },
  {
    input: 'YazaAay',
    output: 'aAa',
  },
  {
    input: 'Bb',
    output: 'Bb',
  },
]

testCases.forEach((c) => {
  test(`should return ${c.output} for ${c.input}`, () => {
    expect(longestNiceSubstring(c.input)).toEqual(c.output)
  })
})
