import { expect, test } from 'vitest'

function minOperations(logs: string[]): number {
  if (logs.length === 0) {
    return 0
  }

  let result = 0
  logs.forEach((log) => {
    if (log === './') {
      return
    }

    if (log === '../') {
      result = Math.max(0, result - 1)
      return
    }

    result++
  })

  return result
}

test('should return 0, no actions', () => {
  expect(minOperations([])).toEqual(0)
})

test('should return 0, if all actions are staying in the current directory', () => {
  expect(minOperations(['./', './', './'])).toEqual(0)
})

test('should return the length of the list, if all actions are to go to the child folder', () => {
  expect(minOperations(['a/', 'b/', 'c/'])).toEqual(3)
})

test('should return 0, if all actions go to upper directory', () => {
  expect(minOperations(['../', '../', '../'])).toEqual(0)
})

test('should return correct number for mixed actions', () => {
  expect(minOperations(['d1/', 'd2/', './', 'd3/', '../', 'd31/'])).toEqual(3)
})
