import { expect, test } from 'vitest'

class TreeNode {
  val: number
  left: TreeNode | null
  right: TreeNode | null
  constructor(val?: number, left?: TreeNode | null, right?: TreeNode | null) {
    this.val = val === undefined ? 0 : val
    this.left = left === undefined ? null : left
    this.right = right === undefined ? null : right
  }
}

function averageOfSubtree(root: TreeNode | null): number {
  let result = 0
  const fn = (node: TreeNode | null): { sum: number; nodesCount: number } => {
    if (node === null) {
      return { sum: 0, nodesCount: 0 }
    }

    const left = fn(node.left)
    const right = fn(node.right)
    const sum = node.val + left.sum + right.sum
    const nodesCount = left.nodesCount + right.nodesCount + 1
    const average = Math.floor(sum / nodesCount)

    if (average === node.val) {
      result++
    }

    return { sum, nodesCount }
  }

  fn(root)

  return result
}

test('should handle null', () => {
  expect(averageOfSubtree(null)).toEqual(0)
})

test('should handle single node with 0 as value', () => {
  const root = new TreeNode(0)

  expect(averageOfSubtree(root)).toEqual(1)
})

test('should handle single node with 1 as value', () => {
  const root = new TreeNode(1)

  expect(averageOfSubtree(root)).toEqual(1)
})

test('should handle deeper tree', () => {
  const root = new TreeNode(
    4,
    new TreeNode(8, new TreeNode(0), new TreeNode(1)),
    new TreeNode(5, null, new TreeNode(6)),
  )
  expect(averageOfSubtree(root)).toEqual(5)
})
