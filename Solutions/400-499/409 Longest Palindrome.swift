//
//  409 Longest Palindrome.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 14/08/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/longest-palindrome/
class Solution {

    /// Finds the length of the longest palindromes that can be built with letters from a
    /// string.
    ///
    /// - Parameter s: The string.
    /// - Returns: The length of the longest palindromes
    ///
    /// - Complexity:
    ///   - time: O(n), where n is the number of letters in the string.
    ///   - space: O(n), where n is the number of letters in the string.
    func longestPalindrome(_ s: String) -> Int {
        var dict = [Character: Int]()
        for ch in s {
            dict[ch, default: 0] += 1
        }

        var ans = 0
        var hasOdd = false
        for (_, el) in dict.enumerated() {
            if el.value % 2 == 0 {
                ans += el.value
            } else {
                hasOdd = true
                ans += el.value - 1
            }
        }

        return ans + (hasOdd ? 1 : 0)
    }

}
