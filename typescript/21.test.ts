import { expect, test } from 'vitest'

class ListNode {
  val: number
  next: ListNode | null
  constructor(val?: number, next?: ListNode | null) {
    this.val = val === undefined ? 0 : val
    this.next = next === undefined ? null : next
  }
}

function mergeTwoLists(list1: ListNode | null, list2: ListNode | null): ListNode | null {
  if (list1 === null && list2 === null) {
    return null
  }

  if (list1 === null) {
    return list2
  }

  if (list2 === null) {
    return list1
  }

  let head = null
  let tail = null

  let current1: ListNode | null = list1
  let current2: ListNode | null = list2

  while (true) {
    if (current1 === null && current2 === null) {
      break
    }

    let node: ListNode | null = null

    if (current1 === null && current2 !== null) {
      node = new ListNode(current2.val)
      current2 = current2.next
    }

    if (current1 !== null && current2 === null) {
      node = new ListNode(current1.val)
      current1 = current1.next
    }

    if (current1 !== null && current2 !== null) {
      if (current1.val < current2.val) {
        node = new ListNode(current1.val)
        current1 = current1.next
      } else {
        node = new ListNode(current2.val)
        current2 = current2.next
      }
    }

    if (node === null) {
      throw new Error(`node cannot be null here`)
    }

    if (head === null) {
      head = node
    }

    if (tail === null) {
      tail = node
    } else {
      tail.next = node
      tail = node
    }
  }

  return head
}

test(`should handle null lists`, () => {
  expect(mergeTwoLists(null, null)).toEqual(null)
})

test(`should handle null node in first list`, () => {
  const l2 = new ListNode(4, null)

  const result = mergeTwoLists(null, l2)
  expect(result?.val).toEqual(4)
  expect(result?.next).toEqual(null)
})

test(`should handle null node in first list`, () => {
  const l1 = new ListNode(1, null)

  const result = mergeTwoLists(l1, null)
  expect(result?.val).toEqual(1)
  expect(result?.next).toEqual(null)
})

test(`merge lists with 1 items`, () => {
  const l1 = new ListNode(1, null)
  const l2 = new ListNode(4, null)

  const result = mergeTwoLists(l1, l2)
  expect(result?.val).toEqual(1)
  expect(result?.next?.val).toEqual(4)
  expect(result?.next?.next).toEqual(null)
})

test(`should concatenate list 1 to list 2`, () => {
  const l1n3 = new ListNode(9, null)
  const l1n2 = new ListNode(5, l1n3)
  const l1n1 = new ListNode(1, l1n2)

  const l2n3 = new ListNode(10, null)
  const l2n2 = new ListNode(6, l2n3)
  const l2n1 = new ListNode(4, l2n2)

  const result = mergeTwoLists(l1n1, l2n1)
  expect(result?.val).toEqual(1)
  expect(result?.next?.val).toEqual(4)
  expect(result?.next?.next?.val).toEqual(5)
  expect(result?.next?.next?.next?.val).toEqual(6)
  expect(result?.next?.next?.next?.next?.val).toEqual(9)
  expect(result?.next?.next?.next?.next?.next?.val).toEqual(10)
  expect(result?.next?.next?.next?.next?.next?.next).toEqual(null)
})

test(`should concatenate list 2 to list 1`, () => {
  const l1n3 = new ListNode(3, null)
  const l1n2 = new ListNode(2, l1n3)
  const l1n1 = new ListNode(1, l1n2)

  const l2n3 = new ListNode(6, null)
  const l2n2 = new ListNode(5, l2n3)
  const l2n1 = new ListNode(4, l2n2)

  const result = mergeTwoLists(l1n1, l2n1)
  expect(result?.val).toEqual(1)
  expect(result?.next?.val).toEqual(2)
  expect(result?.next?.next?.val).toEqual(3)
  expect(result?.next?.next?.next?.val).toEqual(4)
  expect(result?.next?.next?.next?.next?.val).toEqual(5)
  expect(result?.next?.next?.next?.next?.next?.val).toEqual(6)
  expect(result?.next?.next?.next?.next?.next?.next).toEqual(null)
})

test(`should merge lists`, () => {
  const l1n2 = new ListNode(4, null)
  const l1n1 = new ListNode(3, l1n2)

  const l2n2 = new ListNode(2, null)
  const l2n1 = new ListNode(1, l2n2)

  const result = mergeTwoLists(l1n1, l2n1)
  expect(result?.val).toEqual(1)
  expect(result?.next?.val).toEqual(2)
  expect(result?.next?.next?.val).toEqual(3)
  expect(result?.next?.next?.next?.val).toEqual(4)
  expect(result?.next?.next?.next?.next).toEqual(null)
})
