//
//  1081 Smallest Subsequence of Distinct Characters.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 11/10/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/smallest-subsequence-of-distinct-characters/
class Solution {

    /// Removes duplicate letters from the given string so that every letter appears
    /// only once.
    ///
    /// - Parameter s: The string.
    /// - Returns: The lexicographically smallest subsequence of `s`.
    ///
    /// - Complexity:
    ///   - time: O(n), where n is the length of the `s`.
    ///   - space: O(1), only constant space is used.
    func removeDuplicateLetters(_ s: String) -> String {
        var stack = [Character]()
        var seen = Set<Character>()
        var lastOccurrence = [Character: Int]()

        for (i, ch) in s.enumerated() {
            lastOccurrence[ch] = i
        }

        for (i, ch) in s.enumerated() {
            guard !seen.contains(ch) else { continue }
            while !stack.isEmpty,
                  let last = stack.last,
                  ch < last,
                  lastOccurrence[last, default: 0] > i {
                seen.remove(last)
                stack.removeLast()
            }
            seen.insert(ch)
            stack.append(ch)
        }

        var ans = ""

        for ch in stack {
            ans = "\(ans)\(ch)"
        }

        return ans
    }

}
