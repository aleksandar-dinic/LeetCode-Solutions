//
//  1641 Count Sorted Vowel Strings.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 17/01/2021.
//  Copyright © 2021 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/count-sorted-vowel-strings/
class Solution {

    /// Finds the number of strings of length `n` that consist only of vowels
    /// (a, e, i, o, u) and are lexicographically sorted.
    ///
    /// - Parameter n: An integer.
    /// - Returns: The number of strings.
    ///
    /// - Complexity:
    ///   - time: O(n), where n is given `n`.
    ///   - space: O(n), where n is given `n`.
    func countVowelStrings(_ n: Int) -> Int {
        guard n > 1 else { return 5 }
        var dp = [[Int]](repeating: [Int](repeating: 0, count: 6), count: n + 1)
        
        for i in 1...5 {
            dp[1][i] = i
        }
        
        for i in 2...n {
            dp[i][1] = 1
            for j in 2...5 {
                dp[i][j] = dp[i][j - 1] + dp[i - 1][j]
            }
        }
        
        return dp[n][5]
    }

}
