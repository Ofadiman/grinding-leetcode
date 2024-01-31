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

function sumEvenGrandparent(root: TreeNode | null): number {
  if (root === null) {
    return 0
  }

  let sum = 0
  const nodes: TreeNode[] = [root]
  while (nodes.length > 0) {
    const current = nodes.shift()
    if (!current) {
      break
    }

    if (current.val % 2 === 0) {
      if (current.left) {
        if (current.left.left) {
          sum += current.left.left.val
        }
        if (current.left.right) {
          sum += current.left.right.val
        }
      }

      if (current.right) {
        if (current.right.left) {
          sum += current.right.left.val
        }
        if (current.right.right) {
          sum += current.right.right.val
        }
      }
    }

    if (current.left) {
      nodes.push(current.left)
    }
    if (current.right) {
      nodes.push(current.right)
    }
  }

  return sum
}

test('should handle null', () => {
  expect(sumEvenGrandparent(null)).toEqual(0)
})

test('should return 0 if there is only root', () => {
  expect(sumEvenGrandparent(new TreeNode(2))).toEqual(0)
})

test('should return 0 if there are no nodes with grandparents', () => {
  expect(sumEvenGrandparent(new TreeNode(2, new TreeNode(1), new TreeNode(3)))).toEqual(0)
})

test('should return 0 when tree has all odd numbers', () => {
  expect(
    sumEvenGrandparent(
      new TreeNode(
        1,
        new TreeNode(1, new TreeNode(1), new TreeNode(1)),
        new TreeNode(1, new TreeNode(1), new TreeNode(1)),
      ),
    ),
  ).toEqual(0)
})

test('should return correct sum', () => {
  expect(
    sumEvenGrandparent(
      new TreeNode(
        6,
        new TreeNode(
          7,
          new TreeNode(2, new TreeNode(9)),
          new TreeNode(7, new TreeNode(1), new TreeNode(4)),
        ),
        new TreeNode(8, new TreeNode(1), new TreeNode(3, null, new TreeNode(5))),
      ),
    ),
  ).toEqual(18)
})
