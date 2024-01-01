import { describe, expect, test } from 'vitest'

class MyStack {
  constructor(public values: number[] = []) { }

  push(x: number): void {
    this.values.push(x)
  }

  pop(): number {
    const last = this.values.pop()
    if (last) {
      return last
    }

    return 0
  }

  top(): number {
    const last = this.values[this.values.length - 1]
    if (last) {
      return last
    }

    return 0
  }

  empty(): boolean {
    return this.values.length === 0
  }
}

describe('stack', () => {
  test('should initialize stack', () => {
    const stack = new MyStack()

    expect(stack.top()).toEqual(0)
    expect(stack.empty()).toEqual(true)
  })

  test('should push item to the top of the stack', () => {
    const stack = new MyStack()

    expect(stack.top()).toEqual(0)

    stack.push(1)
    expect(stack.top()).toEqual(1)

    stack.push(2)
    expect(stack.top()).toEqual(2)
  })

  test('should return last item from stack and remove it', () => {
    const stack = new MyStack()

    expect(stack.empty()).toEqual(true)
    expect(stack.pop()).toEqual(0)

    stack.push(1)
    expect(stack.empty()).toEqual(false)
    expect(stack.pop()).toEqual(1)
    expect(stack.empty()).toEqual(true)
  })
})
