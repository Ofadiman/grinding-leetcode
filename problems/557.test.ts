import { expect, test } from 'vitest'

function reverseWords(s: string): string {
  return s
    .split(' ')
    .map((w) => w.split('').reverse().join(''))
    .join(' ')
}

test('should reverse words in sentence', () => {
  expect(reverseWords(`Let's take LeetCode contest`)).toEqual(`s'teL ekat edoCteeL tsetnoc`)
})
