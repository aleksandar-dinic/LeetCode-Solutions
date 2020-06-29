//
//  62 Unique Paths.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 29/06/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundations

/// Source: https://leetcode.com/problems/unique-paths/
class Solution {

    /// Finds how many unique paths exist.
    ///
    /// - Parameters:
    ///   - m: Number of rows.
    ///   - n: Number of columns.
    /// - Returns: Number of unique paths.
    ///
    /// - Complexity:
    ///   - time: O(n * m), where n is the number of rows, and m is the number of columns.
    ///   - space: O(min(n, m)), where n is the number of rows, and m is the number of
    ///     columns.
    func uniquePaths(_ m: Int, _ n: Int) -> Int {
        guard m <= n else { return uniquePaths(n, m) }

        var dp = [Int](repeating: 1, count: m)

        for _ in 1..<n {
            for i in 1..<m {
                dp[i] += dp[i-1]
            }
        }

        return dp[m-1]
    }

}
