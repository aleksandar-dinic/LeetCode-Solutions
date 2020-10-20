//
//  159 Longest Substring with At Most Two Distinct Characters.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 20/10/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/longest-substring-with-at-most-two-distinct-characters/
class Solution {

    /// Finds the length of the longest substring that contains at most 2 distinct characters.
    ///
    /// - Parameter s: A string.
    /// - Returns: The length of the longest substring.
    ///
    /// - Complexity:
    ///   - time: O(n), where n is a number of characters in the `s`.
    ///   - space: O(n), where n is a number of characters in the `s`.
    func lengthOfLongestSubstringTwoDistinct(_ s: String) -> Int {
        var ans = 0

        var left = 0
        var right = 0

        let s = Array(s)
        var dict = [Character: Int]()

        for ch in s {
            dict[ch, default: 0] = right
            right += 1

            if dict.count == 3, let minIdx = dict.values.min() {
                dict.removeValue(forKey: s[minIdx])
                left = minIdx + 1
            }
            ans = max(ans, right - left)
        }

        return ans
    }

}
