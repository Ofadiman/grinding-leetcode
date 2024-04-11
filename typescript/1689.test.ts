import { expect, test } from 'vitest'

function minPartitions(n: string): number {
  let max = 1
  for (let i = 0; i < n.length; i++) {
    max = Math.max(parseInt(n[i]!), max)
  }
  return max
}

const testCases = [
  {
    n: '82734',
    result: 8,
  },
  {
    n: '27346209830709182346',
    result: 9,
  },
  {
    n: '32',
    result: 3,
  },
]

testCases.forEach((c) => {
  test(`should return ${c.result} for ${c.n}`, () => {
    expect(minPartitions(c.n)).toEqual(c.result)
  })
})
