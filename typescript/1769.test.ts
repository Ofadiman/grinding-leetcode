import { expect, test } from 'vitest'

function minOperations(boxes: string): number[] {
  const result: number[] = []

  for (let i = 0; i < boxes.length; i++) {
    let current = 0

    for (let j = 0; j < boxes.length; j++) {
      if (i === j) {
        continue
      }

      if (boxes[j] === '1') {
        current += Math.abs(i - j)
      }
    }

    result[i] = current
  }

  return result
}

const testCases = [
  {
    boxes: '110',
    result: [1, 1, 3],
  },
  {
    boxes: '000',
    result: [0, 0, 0],
  },
  {
    boxes: '001011',
    result: [11, 8, 5, 4, 3, 4],
  },
]

testCases.forEach((c) => {
  test(`should return ${c.result} for ${c.boxes}`, () => {
    expect(minOperations(c.boxes)).toEqual(c.result)
  })
})
