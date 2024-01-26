import { test, expect } from 'vitest'

type GarbageObject = {
  G: number
  P: number
  M: number
}

function garbageCollection(garbage: string[], travel: number[]): number {
  let lastGlassIndex = 0
  let lastPaperIndex = 0
  let lastMetalIndex = 0
  const garbageAsObjects: GarbageObject[] = garbage.map((g, index) => {
    const object = g.split('').reduce(
      (acc, current) => {
        const casted = current as keyof GarbageObject

        if (casted === 'G') {
          lastGlassIndex = index
          acc['G']++
        }
        if (casted === 'M') {
          lastMetalIndex = index
          acc['M']++
        }
        if (casted === 'P') {
          lastPaperIndex = index
          acc['P']++
        }

        return acc
      },
      { M: 0, G: 0, P: 0 } as GarbageObject,
    )

    return object
  })

  let result = 0
  garbageAsObjects.forEach((ga, index) => {
    result = result + ga.M + ga.P + ga.G
    if (index < lastMetalIndex) {
      result = result + travel[index]
    }
    if (index < lastGlassIndex) {
      result = result + travel[index]
    }
    if (index < lastPaperIndex) {
      result = result + travel[index]
    }
  })

  return result
}

const testCases = [
  {
    garbage: ['G', 'P', 'GP', 'GG'],
    travel: [2, 4, 3],
    result: 21,
  },
  {
    garbage: ['MMM', 'PGM', 'GP'],
    travel: [3, 10],
    result: 37,
  },
]

testCases.forEach((c) => {
  test(`should return ${c.result} for ${c.garbage} garbage and ${c.travel} travel timesa`, () => {
    expect(garbageCollection(c.garbage, c.travel)).toEqual(c.result)
  })
})
