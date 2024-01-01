import { describe, expect, test } from "vitest";

function maxPower(s: string): number {
  let max = 0;
  let letter = "";
  let counter = 0;

  for (let i = 0; i < s.length; i++) {
    const loopLetter = s[i];
    if (!loopLetter) {
      continue;
    }

    if (letter === loopLetter) {
      counter++;
    } else {
      letter = loopLetter;
      counter = 1;
    }

    max = Math.max(max, counter);
  }

  return max;
}

describe("1446", () => {
  test("should return 0 when string is empty", () => {
    expect(maxPower("")).toEqual(0);
  });

  test("should return string.length if string has only 1 distinct letter", () => {
    expect(maxPower("aaa")).toEqual(3);
  });

  test("should return correct number if string has multiple letters", () => {
    expect(maxPower("leetcode")).toEqual(2);
  });
});
