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

function bstToGst(root: TreeNode | null): TreeNode | null {
  if (root === null) {
    return null
  }

  const nodes: TreeNode[] = []

  const iteratable: TreeNode[] = [root]
  while (true) {
    const current = iteratable.shift()
    if (current === undefined) {
      break
    }

    nodes.push(current)

    if (current.left) {
      iteratable.push(current.left)
    }

    if (current.right) {
      iteratable.push(current.right)
    }
  }

  nodes.sort((left, right) => {
    if (left.val > right.val) {
      return 1
    }
    if (left.val < right.val) {
      return -1
    }
    return 0
  })

  let prevSum = 0
  for (let i = nodes.length - 1; i >= 0; i--) {
    const node = nodes[i]
    prevSum += node.val
    node.val = prevSum
  }

  return root
}

test('should handle null', () => {
  expect(bstToGst(null)).toEqual(null)
})

test('should handle tree with single node', () => {
  const root = new TreeNode(5, null, null)

  bstToGst(root)

  expect(root.val).toEqual(5)
})

test('should handle tree with 1 leaf where leaf has bigger value than root', () => {
  const left = new TreeNode(10, null, null)
  const root = new TreeNode(5, left, null)

  bstToGst(root)

  expect(root.val).toEqual(15)
  expect(left.val).toEqual(10)
})

test('should handle tree with 2 leafs where both leafs have bigger value than root', () => {
  const left = new TreeNode(10, null, null)
  const right = new TreeNode(15, null, null)
  const root = new TreeNode(5, left, right)

  bstToGst(root)

  expect(root.val).toEqual(30)
  expect(left.val).toEqual(25)
  expect(right.val).toEqual(15)
})

test('should handle tree with 1 leaf where leaf has smaller value than root', () => {
  const left = new TreeNode(0, null, null)
  const root = new TreeNode(5, left, null)

  bstToGst(root)

  expect(root.val).toEqual(5)
  expect(left.val).toEqual(5)
})

test('should handle tree with 1 leaf where leaf has smaller value than root', () => {
  const left = new TreeNode(0, null, null)
  const right = new TreeNode(1, null, null)
  const root = new TreeNode(5, left, right)

  bstToGst(root)

  expect(root.val).toEqual(5)
  expect(left.val).toEqual(6)
  expect(right.val).toEqual(6)
})

test('should handle big tree', () => {
  const root = new TreeNode(
    4,
    new TreeNode(1, new TreeNode(0), new TreeNode(2, null, new TreeNode(3))),
    new TreeNode(6, new TreeNode(5), new TreeNode(7, null, new TreeNode(8))),
  )

  bstToGst(root)

  expect(root.val).toEqual(30)
})
