//
//  1463 Cherry Pickup II.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 19/12/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/cherry-pickup-ii/
class Solution {

    /// Finds the maximum number of cherries collection using both robots.
    ///
    /// - Parameter grid: The matrix.
    /// - Returns: The maximum number of cherries.
    ///
    /// - Complexity:
    ///   - time: O(m * n^2), where m is the number of rows in the matrix, and n is
    ///   the number of columns in the matrix.
    ///   - space: O(m * n^2), where m is the number of rows in the matrix, and n is
    ///   the number of columns in the matrix.
    func cherryPickup(_ grid: [[Int]]) -> Int {
        var m = grid.count
        var n = grid[0].count
        var dpCache = [[[Int]]](repeating: [[Int]](repeating: [Int](repeating: -1, count: n), count: n), count: m)
        
        return dp(row: 0, col1: 0, col2: n - 1, grid: grid, n: n, m: m, dpCache: &dpCache)
    }
    
    private func dp(row: Int, col1: Int, col2: Int, grid: [[Int]], n: Int, m: Int, dpCache: inout [[[Int]]]) -> Int {
        guard col1 >= 0, col1 < n, col2 >= 0, col2 < n else { return 0 }
        
        guard dpCache[row][col1][col2] == -1 else {
            return dpCache[row][col1][col2]
        }

        var ans = grid[row][col1]
        if col1 != col2 {
            ans += grid[row][col2]
        }

        if row != m-1 {
            var cur = 0
            for newCol1 in (col1 - 1)...(col1 + 1) {
                for newCol2 in (col2 - 1)...(col2 + 1) {
                    cur = max(cur, dp(row: row + 1, col1: newCol1, col2: newCol2, grid: grid, n: n, m: m, dpCache: &dpCache))
                }
            }
            ans += cur
        }
        
        dpCache[row][col1][col2] = ans
        return ans
    }

}
