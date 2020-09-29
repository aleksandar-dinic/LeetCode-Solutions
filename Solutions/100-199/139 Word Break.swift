//
//  139 Word Break.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 29/09/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/word-break/
class Solution {

    /// Determines if `s` can be segmented into a space-separated sequence of one or more
    /// dictionary words.
    ///
    /// - Parameters:
    ///   - s: A non-empty string.
    ///   - wordDict: A dictionary containing a list of non-empty words.
    /// - Returns: True if `s` can be segmented, otherwise returns false.
    ///
    /// - Complexity:
    ///   - time: O(n^2), where n is the length of `s`.
    ///   - space: O(n), where n is the length of `s`.
    func wordBreak(_ s: String, _ wordDict: [String]) -> Bool {
        var dp = [Bool](repeating: false, count: s.count+1)
        dp[0] = true

        let chars = Array(s)
        let wordSet = Set(wordDict)

        for i in 1...s.count {
            for j in 0..<i {
                guard dp[j], wordSet.contains(String(chars[j..<i])) else { continue }
                dp[i] = true
                break
            }
        }

        return dp[s.count]
    }

}
