//
//  05 Longest Palindromic Substring.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 19/01/2021.
//  Copyright © 2021 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/longest-palindromic-substring/
class Solution {

    ///  Finds the longest palindromic substring in `s`.
    ///
    /// - Parameter s: A string.
    /// - Returns: The longest palindromic substring.
    ///
    /// - Complexity:
    ///   - time: O(n^2), where n is the length of the `s`.
    ///   - space: O(n), where n is the length of the `s`.
    func longestPalindrome(_ s: String) -> String {
        guard !s.isEmpty else { return "" }

        let s = Array(s)
        let n = s.count
        var start = 0
        var end = 0

        for i in 0..<n {
            let len1 = expandAroundCenter(s, n, left: i, right: i)
            let len2 = expandAroundCenter(s, n, left: i, right: i + 1)
            let len = max(len1, len2)

            guard len > end - start else { continue }
            start = i - (len - 1) / 2
            end = i + len / 2
        }

        return String(s[start...end])
    }

    private func expandAroundCenter(_ s: [Character], _ n: Int, left: Int, right: Int) -> Int {
        var L = left
        var R = right

        while L >= 0, R < n, s[L] == s[R] {
            L -= 1
            R += 1
        }

        return R - L - 1
    }

}
