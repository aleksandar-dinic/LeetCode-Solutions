//
//  694 Number of Distinct Islands.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 08/02/2021.
//  Copyright © 2021 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/number-of-distinct-islands/
class Solution {

    private var n = 0
    private var m = 0
    private var grid = [[Int]]()
    private var visited = [[Bool]]()
    private var currentIsland = ""
    
    /// Counts the number of distinct islands.
    ///
    /// - Parameter grid: A non-empty 2D array.
    /// - Returns: The number of distinct islands.
    ///
    /// - Complexity:
    ///   - time: O(n * m), where n is the number of rows in the grid, and m is
    ///   the number of columns in the grid.
    ///   - space: O(n * m), where n is the number of rows in the grid, and m is
    ///   the number of columns in the grid.
    func numDistinctIslands(_ grid: [[Int]]) -> Int {
        n = grid.count
        m = grid[0].count
        self.grid = grid
        visited = [[Bool]](repeating: [Bool](repeating: false, count: m), count: n)
        
        var ans = Set<String>()
        
        for row in 0..<n {
            for col in 0..<m {
                currentIsland = ""
                dfs(row, col, "0")
                guard !currentIsland.isEmpty else { continue }
                ans.insert(currentIsland)
            }
        }
        
        return ans.count
    }
    
    private func dfs(_ row: Int, _ col: Int, _ dir: String) {
        guard row >= 0, col >= 0, row < n, col < m else { return }
        guard !visited[row][col], grid[row][col] != 0 else { return }

        visited[row][col] = true
        currentIsland = "\(currentIsland)\(dir)"
        dfs(row + 1, col, "D")
        dfs(row - 1, col, "U")
        dfs(row, col + 1, "R")
        dfs(row, col - 1, "L")
        currentIsland = "\(currentIsland)0"
    }

}
