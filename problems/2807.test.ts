import { expect, test } from 'vitest'

const euclidianGCD = (a: number, b: number): number => {
  const reminder = a % b
  if (reminder === 0) {
    return b
  }

  return euclidianGCD(b, reminder)
}

class ListNode {
  val: number
  next: ListNode | null
  constructor(val?: number, next?: ListNode | null) {
    this.val = val === undefined ? 0 : val
    this.next = next === undefined ? null : next
  }
}

function insertGreatestCommonDivisors(head: ListNode | null): ListNode | null {
  if (head === null) {
    return null
  }

  if (head.next === null) {
    return head
  }

  if (head.next !== null) {
    const next = head.next
    const gcd = euclidianGCD(head.val, next.val)
    head.next = new ListNode(gcd, next)
    insertGreatestCommonDivisors(next)
  }

  return head
}

test('should handle null', () => {
  const result = insertGreatestCommonDivisors(null)
  expect(result).toEqual(null)
})

test('should do nothing when list has only 1 node', () => {
  const head = new ListNode(5)
  const result = insertGreatestCommonDivisors(head)

  expect(result?.val).toEqual(5)
  expect(result?.next).toEqual(null)
})

test('should handle list with many nodes', () => {
  const node2 = new ListNode(10)
  const node1 = new ListNode(20, node2)
  const head = new ListNode(3, node1)

  const result = insertGreatestCommonDivisors(head)

  expect(result?.val).toEqual(3)
  expect(result?.next?.val).toEqual(1)
  expect(result?.next?.next?.val).toEqual(20)
  expect(result?.next?.next?.next?.val).toEqual(10)
  expect(result?.next?.next?.next?.next?.val).toEqual(10)
})
