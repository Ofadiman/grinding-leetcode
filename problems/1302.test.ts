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

function deepestLeavesSum(root: TreeNode | null): number {
  if (root === null) {
    return 0
  }

  let current: TreeNode[] = [root]
  let next: TreeNode[] = []
  let result = 0
  while (true) {
    current.forEach((node) => {
      if (node.left) {
        next.push(node.left)
      }
      if (node.right) {
        next.push(node.right)
      }
    })

    if (next.length === 0) {
      result = current.reduce((a, c) => {
        a = a + c.val
        return a
      }, 0)
      break
    } else {
      current = next
      next = []
    }
  }

  return result
}

test('should return value of root node', () => {
  const root = new TreeNode(5)

  expect(deepestLeavesSum(root)).toEqual(root.val)
})

test('should return sum of left and right leafs', () => {
  const root = new TreeNode(5)
  const left = new TreeNode(3)
  const right = new TreeNode(9)
  root.left = left
  root.right = right

  expect(deepestLeavesSum(root)).toEqual(left.val + right.val)
})

test('should return value of left leaf', () => {
  const root = new TreeNode(5)
  const left = new TreeNode(3)
  root.left = left

  expect(deepestLeavesSum(root)).toEqual(left.val)
})
