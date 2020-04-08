//
//  03 Longest Substring Without Repeating Characters.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 08/04/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/longest-substring-without-repeating-characters
class Solution {

    /// Find the length of the longest substring without repeating characters.
    ///
    /// - Parameter s: String
    ///
    /// - Returns: Length of the longest substring.
    ///
    /// - Complexity:
    ///   - time: O(n), where n is the length of the s.
    ///   - space: O(m), where m is the size of the charset.
    func lengthOfLongestSubstring(_ s: String) -> Int {
        var dict = [Character: Int]()
        var ans = 0
        var j = 0

        for (i, c) in s.enumerated() {
            j = max(j, dict[c] ?? -1)

            ans = max(ans, i - j + 1)
            dict[c] = i + 1
        }

        return ans
    }

}
