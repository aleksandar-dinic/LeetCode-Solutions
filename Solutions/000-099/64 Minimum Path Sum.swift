//
//  64 Minimum Path Sum.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 24/02/2021.
//  Copyright © 2021 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/minimum-path-sum/
class Solution {

    /// Finds a path from top left to bottom right, which minimizes the sum of all
    /// numbers along its path.
    ///
    /// - Parameter grid: The grid.
    /// - Returns: The minimum path sum.
    ///
    /// - Complexity:
    ///     - time: O(n * m), where n is the number of rows in the grid, and m is
    ///     the number of columns in the grid.
    ///     - space: O(m), where m is the number of columns in the grid.
    func minPathSum(_ grid: [[Int]]) -> Int {
        let n = grid.count
        let m = grid[0].count
        var dp = [Int](repeating: Int.max, count: m)

        for i in (0..<n).reversed() {
            for j in (0..<m).reversed() {
                if i == n - 1, j != m - 1 {
                    dp[j] = grid[i][j] + dp[j + 1]
                } else if j == m - 1, i != n - 1 {
                    dp[j] = grid[i][j] + dp[j]
                } else if j != m - 1, i != n - 1 {
                    dp[j] = grid[i][j] + min(dp[j], dp[j + 1])
                } else {
                    dp[j] = grid[i][j]
                }
            }
        }

        return dp[0]
    }

}
