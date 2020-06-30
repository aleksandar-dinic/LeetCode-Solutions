//
//  392 Is Subsequence.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 30/06/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/is-subsequence/
class Solution {

    /// Checks if s is subsequence of t.
    ///
    /// - Parameters:
    ///   - s: The string.
    ///   - t: The string.
    /// - Returns: True if s is a subsequence of t, otherwise returns false.
    ///
    /// - Complexity:
    ///   - time: O(n), where n is the number of letters in t.
    ///   - space: O(max(n, m)), where n is the number of letters in t, and m is the number
    ///     of letters in s.
    func isSubsequence(_ s: String, _ t: String) -> Bool {
        guard s.count <= t.count else { return false }

        let s = Array(s)
        let t = Array(t)

        var i = 0
        var j = 0

        while i < s.count {
            guard j < t.count else { return false }

            if s[i] == t[j] {
                i += 1
            }

            j += 1
        }

        return true
    }

}
