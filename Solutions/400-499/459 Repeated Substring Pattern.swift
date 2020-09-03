//
//  459 Repeated Substring Pattern.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 03/09/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/repeated-substring-pattern/
class Solution {

    /// Checks if the input string can be constructed by taking a substring of it and
    /// appending multiple copies of the substring together.
    ///
    /// - Parameter s: The string.
    /// - Returns: True if the string can be constructed, otherwise return false.
    ///
    /// - Complexity:
    ///   - time: O(n), where n is the length of the input string.
    ///   - space: O(n), where n is the length of the input string.
    func repeatedSubstringPattern(_ s: String) -> Bool {
        let s = Array(s)
        var dp = [Int](repeating: 0, count: s.count)

        for i in 1..<s.count {
            var j = dp[i - 1]

            while j > 0, s[i] != s[j] {
                j = dp[j - 1]
            }

            if s[i] == s[j] {
                j += 1
            }

            dp[i] = j
        }

        let length = dp[s.count - 1]
        return length != 0 && s.count % (s.count - length) == 0
    }

}
