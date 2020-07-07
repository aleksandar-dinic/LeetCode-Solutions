//
//  463 Island Perimeter.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 07/07/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/island-perimeter/
class Solution {

    /// Determines the perimeter of the island.
    ///
    /// - Parameter grid: A map of the island, where 1 represents land and 0 represents
    ///   water.
    /// - Returns: The perimeter of the island.
    ///
    /// - Complexity:
    ///   - time: O(n * m), where n is the number of rows in the grid, and m is the number
    ///     of columns in the grid.
    ///   - space: O(1), only constant space is used.
    func islandPerimeter(_ grid: [[Int]]) -> Int {
        var ans = 0

        for i in 0..<grid.count {
            for j in 0..<grid[i].count {
                guard grid[i][j] == 1 else { continue }
                ans += 4
                if i > 0, grid[i-1][j] == 1 {
                    ans -= 2
                }
                if j > 0, grid[i][j-1] == 1 {
                    ans -= 2
                }
            }
        }

        return ans
    }

}
