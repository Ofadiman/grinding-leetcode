import { expect, test } from 'vitest'

function interpret(command: string): string {
  const result: string[] = []

  for (let i = 0; i < command.length; i++) {
    const current = command[i]
    if (current === 'G') {
      result.push('G')
      continue
    }

    const next = command[i + 1]
    if (next === 'G') {
      continue
    }

    if (next === ')') {
      result.push('o')
      i++
    }

    if (next === 'a') {
      result.push('al')
      i += 3
    }
  }

  return result.join('')
}

const testCases = [
  {
    input: 'G()(al)',
    output: 'Goal',
  },
  {
    input: 'G()()()()(al)',
    output: 'Gooooal',
  },
]

testCases.forEach((c) => {
  test(`should return ${c.output} for ${c.input}`, () => {
    expect(interpret(c.input)).toEqual(c.output)
  })
})
