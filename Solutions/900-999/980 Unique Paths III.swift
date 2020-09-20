//
//  980 Unique Paths III.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 20/09/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/unique-paths-iii/
class Solution {

    /// Finds the number of 4-directional walks from the starting square to the ending
    /// square, that walk over every non-obstacle square exactly once.
    ///
    /// - Parameter grid: 2-dimensional grid.
    /// - Returns: The number of 4-directional walks.
    ///
    /// - Complexity:
    ///     - time: O(3^n), where n is the number of cells in the grid.
    ///     - space: O(n), where n is the number of cells in the grid.
    func uniquePathsIII(_ grid: [[Int]]) -> Int {
        var nonObstacles = 0
        var start = (row: 0, col: 0)

        for row in 0..<grid.count {
            for col in 0..<grid[row].count {
                guard grid[row][col] != -1 else { continue }

                if grid[row][col] == 1 {
                    start = (row, col)
                }

                nonObstacles += 1
            }
        }

        var grid = grid
        var ans = 0
        backtrack(start.row, start.col, &grid, nonObstacles, &ans)
        return ans
    }

    private func backtrack(_ row: Int, _ col: Int, _ grid: inout [[Int]], _ nonObstacles: Int, _ ans: inout Int) {
        if grid[row][col] == 2 {
            if nonObstacles == 1 {
                ans += 1
            }
            return
        }

        let tmp = grid[row][col]
        grid[row][col] = -1

        let rowOffsets = [0, 0, 1, -1]
        let colOffsets = [1, -1, 0, 0]

        for i in 0..<4 {
            let nextRow = row + rowOffsets[i]
            let nextCol = col + colOffsets[i]

            guard nextRow >= 0, nextRow < grid.count,
                    nextCol >= 0, nextCol < grid[nextRow].count else {
                continue
            }

            guard grid[nextRow][nextCol] >= 0 else { continue }
            backtrack(nextRow, nextCol, &grid, nonObstacles - 1, &ans)
        }

        grid[row][col] = tmp
    }

}
