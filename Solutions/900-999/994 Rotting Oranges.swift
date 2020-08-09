//
//  994 Rotting Oranges.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 09/08/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/rotting-oranges/
class Solution {

    /// Finds the minimum number of minutes that must elapse until no cell has a fresh
    /// orange in a grid.
    ///
    /// - Parameter grid: The grid.
    /// - Returns: The minimum number of minutes. Or -1 if this is impossible.
    ///
    /// - Complexity:
    ///     - time: O(n * m), where n is the number of rows in the grid, and m is the number
    ///     of columns in the grid.
    ///     - space: O(n * m), where n is the number of rows in the grid, and m is the
    ///     number of columns in the grid.
    func orangesRotting(_ grid: [[Int]]) -> Int {
        var grid = grid
        let directions: [(row: Int, col: Int)] = [(-1, 0), (0, 1), (1, 0), (0, -1)]
        var queue = [(row: Int, col: Int)]()

        for row in 0..<grid.count {
            for col in 0..<grid[row].count {
                guard grid[row][col] == 2 else { continue }
                queue.append((row, col))
            }
        }

        var ans = 0

        while !queue.isEmpty {
            var counted = false
            for _ in 0..<queue.count {
                let rotten = queue.removeFirst()
                for direction in directions {
                    let row = rotten.row + direction.row
                    let col = rotten.col + direction.col
                    if row >= 0, row < grid.count, col >= 0, col < grid[row].count, grid[row][col] == 1 {
                        grid[row][col] = 2
                        ans += counted ? 0 : 1
                        counted = true
                        queue.append((row, col))
                    }
                }
            }
        }

        for row in 0..<grid.count {
            for col in 0..<grid[row].count {
                guard grid[row][col] == 1 else { continue }
                return -1
            }
        }

        return ans
    }

}
