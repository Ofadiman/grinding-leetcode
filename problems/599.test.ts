import { expect, test } from 'vitest'

function find(firstList: string[], secondList: string[]): string[] {
  if (firstList.length === 0 || secondList.length === 0) {
    return []
  }

  const accumulator: Record<string, { l1: number | null; l2: number | null }> = {}

  const iterationsCount = Math.max(firstList.length, secondList.length)

  for (let i = 0; i < iterationsCount; i++) {
    const firstItem = firstList[i]
    if (firstItem !== undefined) {
      if (accumulator[firstItem] === undefined) {
        accumulator[firstItem] = { l1: i, l2: null }
      } else {
        accumulator[firstItem]!.l1 = i
      }
    }

    const secondItem = secondList[i]
    if (secondItem !== undefined) {
      if (accumulator[secondItem] === undefined) {
        accumulator[secondItem] = { l1: null, l2: i }
      } else {
        accumulator[secondItem]!.l2 = i
      }
    }
  }

  let min = Number.MAX_SAFE_INTEGER
  Object.entries(accumulator).forEach(([, value]) => {
    if (value.l1 === null || value.l2 === null) {
      return
    }

    const sum = value.l1 + value.l2

    if (sum < min) {
      min = sum
    }
  })

  const answer: string[] = []
  Object.entries(accumulator).forEach(([key, value]) => {
    if (value.l1 === null || value.l2 === null) {
      return
    }

    if (min === value.l1 + value.l2) {
      answer.push(key)
    }
  })

  return answer
}

test('should handle 2 empty lists', () => {
  expect(find([], [])).toEqual([])
})

test('should handle 1 empty list', () => {
  expect(find(['one', 'two'], [])).toEqual([])
  expect(find([], ['one', 'two'])).toEqual([])
})

test('should handle lists with different lenghts', () => {
  expect(find(['one', 'two', 'three', 'four'], ['two', 'six', 'one'])).toEqual(['two'])
  expect(find(['one', 'two', 'three'], ['two', 'six', 'one', 'four'])).toEqual(['two'])
})

test('should handle lists with no overlapping strings', () => {
  expect(find(['one', 'two'], ['three', 'four'])).toEqual([])
})

test('should return a string that occurs in both lists and the sum of their indexes is the lowest', () => {
  expect(find(['one', 'two', 'three'], ['two', 'six', 'one'])).toEqual(['two'])
})

test('should return 2 strings if sums of their indexes are equal', () => {
  expect(find(['one', 'two', 'three'], ['two', 'one', 'six'])).toEqual(['one', 'two'])
})
