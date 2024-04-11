import { test, expect } from 'vitest'

type JSONValue = null | boolean | number | string | JSONValue[] | { [key: string]: JSONValue }
type Fn = (value: JSONValue) => number

function sortBy(arr: JSONValue[], fn: Fn): JSONValue[] {
  const ordered: Array<{ index: number; value: number }> = []
  arr.forEach((element, index) => {
    ordered.push({ index, value: fn(element) })
  })
  ordered.sort((left, right) => left.value - right.value)

  const result: JSONValue[] = []
  ordered.forEach((element, index) => {
    result[index] = arr[element.index]
  })
  return result
}

void [
  {
    array: [5, 4, 1, 2, 3],
    fn: (x: any): number => x,
    result: [1, 2, 3, 4, 5],
  },
  {
    array: [{ x: 1 }, { x: 0 }, { x: -1 }],
    fn: (d: any): number => d.x,
    result: [{ x: -1 }, { x: 0 }, { x: 1 }],
  },
].forEach((c) => {
  test(`should return ${JSON.stringify(c.array)} for ${c.fn}`, () => {
    expect(sortBy(c.array, c.fn)).toEqual(c.result)
  })
})
