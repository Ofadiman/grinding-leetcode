import { test, expect } from 'vitest'

function maxIncreaseKeepingSkyline(grid: number[][]): number {
  let result = 0

  const rows: number[] = []
  const columns: number[] = []

  grid.forEach((row, rowIndex) => {
    row.forEach((column, columnIndex) => {
      rows[rowIndex] = Math.max(rows[rowIndex] ?? 0, column)
      columns[columnIndex] = Math.max(columns[columnIndex] ?? 0, column)
    })
  })

  grid.forEach((row, rowIndex) => {
    row.forEach((column, columnIndex) => {
      const maxFromRow = rows[rowIndex]
      const maxFromColumn = columns[columnIndex]
      const min = Math.min(maxFromRow, maxFromColumn)

      if (min > column) {
        result = result + min - column
      }
    })
  })

  return result
}

const testCases = [
  {
    grid: [
      [3, 0, 8, 4],
      [2, 4, 5, 7],
      [9, 2, 6, 3],
      [0, 3, 1, 0],
    ],
    result: 35,
  },
  {
    grid: [
      [0, 0, 0],
      [0, 0, 0],
      [0, 0, 0],
    ],
    result: 0,
  },
]

testCases.forEach((c) => {
  test(`should return ${c.result} for grid ${c.grid}`, () => {
    expect(maxIncreaseKeepingSkyline(c.grid)).toEqual(c.result)
  })
})
