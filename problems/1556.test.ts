import { expect, test } from 'vitest'

function thousandSeparator(n: number): string {
  if (n > Number.MAX_SAFE_INTEGER) {
    return '0'
  }

  if (n <= 0) {
    return '0'
  }

  const asString = n.toString()
  const list: string[] = []
  let counter = 0
  for (let i = asString.length - 1; i >= 0; i--) {
    list.push(asString[i]!)
    counter++
    if (counter === 3) {
      if (i === 0) {
        continue
      }
      list.push('.')
      counter = 0
    }
  }

  return list.reverse().join('')
}

const cases: { n: number; result: string }[] = [
  {
    n: Number.MAX_SAFE_INTEGER + 1,
    result: '0',
  },
  {
    n: -1,
    result: '0',
  },
  {
    n: 0,
    result: '0',
  },
  {
    n: 999,
    result: '999',
  },
  {
    n: 1_000,
    result: '1.000',
  },
  {
    n: 9_999,
    result: '9.999',
  },
  {
    n: 10_000,
    result: '10.000',
  },
  {
    n: 99_999,
    result: '99.999',
  },
  {
    n: 100_000,
    result: '100.000',
  },
]

cases.forEach((c) => {
  test(`should return ${c.result} for ${c.n}`, () => {
    expect(thousandSeparator(c.n)).toEqual(c.result)
  })
})
