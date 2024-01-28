import { expect, test } from 'vitest'

class ListNode {
  val: number
  next: ListNode | null
  constructor(val?: number, next?: ListNode | null) {
    this.val = val === undefined ? 0 : val
    this.next = next === undefined ? null : next
  }
}

function mergeNodes(head: ListNode | null): ListNode | null {
  if (head === null) {
    return null
  }

  if (head.next === null) {
    return null
  }

  const nodes: ListNode[] = []
  let sum = 0
  let current: ListNode | null = head.next
  while (current !== null) {
    if (current.val === 0 && sum !== 0) {
      nodes.push(new ListNode(sum))
      sum = 0
      current = current.next
      continue
    }

    sum += current.val
    current = current.next
  }

  if (nodes.length === 0) {
    return null
  }

  let newHead = new ListNode(nodes[0].val)
  let attach = newHead
  for (let i = 1; i < nodes.length; i++) {
    attach.next = new ListNode(nodes[i].val)
    attach = attach.next
  }

  return newHead
}

test('should handle null', () => {
  expect(mergeNodes(null)).toEqual(null)
})

test('should handle linked list when all node values are 0s', () => {
  const list = new ListNode(0, new ListNode(0, new ListNode(0)))

  const result = mergeNodes(list)
  expect(result).toEqual(null)
})

test('should handle linked list when 1 value is different than 0', () => {
  const list = new ListNode(0, new ListNode(1, new ListNode(0)))

  const result = mergeNodes(list)
  expect(result?.val).toEqual(1)
  expect(result?.next).toEqual(null)
})

test('should handle linked list when 2 values are different than 0 and are adjacent', () => {
  const list = new ListNode(0, new ListNode(1, new ListNode(5, new ListNode(0))))

  const result = mergeNodes(list)
  expect(result?.val).toEqual(6)
  expect(result?.next).toEqual(null)
})

test('should handle linked list when 2 values are different than 0 and are separated by 0s', () => {
  const list = new ListNode(0, new ListNode(1, new ListNode(0, new ListNode(5, new ListNode(0)))))

  const result = mergeNodes(list)
  expect(result?.val).toEqual(1)
  expect(result?.next?.val).toEqual(5)
  expect(result?.next?.next).toEqual(null)
})

test('should handle long linked list', () => {
  const list = new ListNode(
    0,
    new ListNode(
      3,
      new ListNode(
        1,
        new ListNode(0, new ListNode(4, new ListNode(5, new ListNode(2, new ListNode(0))))),
      ),
    ),
  )

  const result = mergeNodes(list)
  expect(result?.val).toEqual(4)
  expect(result?.next?.val).toEqual(11)
  expect(result?.next?.next).toEqual(null)
})
