//
//  1631 Path With Minimum Effort.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 26/01/2021.
//  Copyright © 2021 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/path-with-minimum-effort/
class Solution {

    private let directions: [(x: Int, y: Int)] = [(1, 0), (-1, 0), (0, 1), (0, -1)]
    
    /// Finds the minimum effort required to travel from the top-left cell to the
    /// bottom-right cell.
    ///
    /// - Parameter heights: The heights of cells.
    /// - Returns: The minimum effort.
    ///
    /// - Complexity:
    ///   - time: O(n * m), where n is the number of rows in the matrix `height`,
    ///     and m is the number of columns in the matrix `height`.
    ///   - space: O(n * m), where n is the number of rows in the matrix `height`,
    ///     and m is the number of columns in the matrix `height`.
    func minimumEffortPath(_ heights: [[Int]]) -> Int {
        let n = heights.count
        let m = heights[0].count
        var left = 0
        var right = 1_000_000
        var ans = right
        
        while left <= right {
            let mid = left + (right - left) / 2
            var visited = [[Bool]](repeating: [Bool](repeating: false, count: m), count: n)
            if dfs(0, 0, heights, &visited, n, m, mid) {
                ans = min(ans, mid)
                right = mid - 1
            } else {
                left = mid + 1
            }
        }
        
        return ans
    }
    
    private func dfs(_ x: Int, _ y: Int, _ heights: [[Int]], _ visited: inout [[Bool]], _ row: Int, _ col: Int, _ mid: Int) -> Bool {
        guard x != row - 1 || y != col - 1 else { return true }
        
        visited[x][y] = true
        for direction in directions {
            let adjacentX = x + direction.x
            let adjacentY = y + direction.y
            
            guard isValidCell(adjacentX, adjacentY, row, col), !visited[adjacentX][adjacentY] else { continue }
                
            var diff = abs(heights[adjacentX][adjacentY] - heights[x][y])
            guard diff <= mid, dfs(adjacentX, adjacentY, heights, &visited, row, col, mid) else { continue }
            return true
        }
        return false
    }
    
    private func isValidCell(_ x: Int, _ y: Int, _ row: Int, _ col: Int) -> Bool {
        x >= 0 && x < row && y >= 0 && y < col
    }

}
