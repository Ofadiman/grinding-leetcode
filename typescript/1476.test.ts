import { expect, test } from 'vitest'

class SubrectangleQueries {
  public rectangle: number[][]

  constructor(rectangle: number[][]) {
    this.rectangle = rectangle
  }

  updateSubrectangle(
    row1: number,
    col1: number,
    row2: number,
    col2: number,
    newValue: number,
  ): void {
    this.getValue(row1, col1)
    this.getValue(row2, col2)
    for (let i = row1; i <= row2; i++) {
      for (let j = col1; j <= col2; j++) {
        this.rectangle[i][j] = newValue
      }
    }
  }

  getValue(row: number, col: number): number {
    if (row < 0) {
      throw new Error(`row is below 0`)
    }

    if (col < 0) {
      throw new Error(`column is below 0`)
    }

    if (row > this.rectangle.length - 1) {
      throw new Error(`row is above total number of rows in rectangle`)
    }

    if (col > this.rectangle[0].length - 1) {
      throw new Error(`col is above total number of columns in rectangle`)
    }

    return this.rectangle[row][col]
  }
}

const rectangle = [
  [0, 1, 2],
  [3, 4, 5],
]

test('should throw error when trying to get value from row with negative index', () => {
  const instance = new SubrectangleQueries(structuredClone(rectangle))
  expect(() => instance.getValue(-1, 0)).toThrowError()
})

test('should throw error when trying to get value from non-existing row', () => {
  const instance = new SubrectangleQueries(structuredClone(rectangle))
  expect(() => instance.getValue(2, 0)).toThrowError()
})

test('should throw error when trying to get value from column with negative index', () => {
  const instance = new SubrectangleQueries(structuredClone(rectangle))
  expect(() => instance.getValue(0, -1)).toThrowError()
})

test('should throw error when trying to get value from non-existing column', () => {
  const instance = new SubrectangleQueries(structuredClone(rectangle))
  expect(() => instance.getValue(0, 3)).toThrowError()
})

test('should return correct value', () => {
  const instance = new SubrectangleQueries(structuredClone(rectangle))
  expect(instance.getValue(0, 0)).toEqual(0)
})

test('should throw error when trying to update row with negative index', () => {
  const instance = new SubrectangleQueries(structuredClone(rectangle))
  expect(() => instance.updateSubrectangle(-1, 0, 0, 0, 9)).toThrowError()
})

test('should throw error when trying to update non-existing row', () => {
  const instance = new SubrectangleQueries(structuredClone(rectangle))
  expect(() => instance.updateSubrectangle(0, 0, 2, 0, 9)).toThrowError()
})

test('should throw error when trying to update column with negative index', () => {
  const instance = new SubrectangleQueries(structuredClone(rectangle))
  expect(() => instance.updateSubrectangle(0, -1, 0, 0, 9)).toThrowError()
})

test('should throw error when trying to update non-existing column', () => {
  const instance = new SubrectangleQueries(structuredClone(rectangle))
  expect(() => instance.updateSubrectangle(0, 0, 0, 3, 9)).toThrowError()
})

test('should update whole rectangle', () => {
  const instance = new SubrectangleQueries(structuredClone(rectangle))
  instance.updateSubrectangle(0, 0, 1, 2, 9)
  expect(instance.rectangle).toEqual([
    [9, 9, 9],
    [9, 9, 9],
  ])
})

test('should update part of rectangle', () => {
  const instance = new SubrectangleQueries(structuredClone(rectangle))
  instance.updateSubrectangle(0, 0, 1, 1, 9)
  expect(instance.rectangle).toEqual([
    [9, 9, 2],
    [9, 9, 5],
  ])
})
