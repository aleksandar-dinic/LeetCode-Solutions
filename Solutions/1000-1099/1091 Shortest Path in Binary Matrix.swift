//
//  1091 Shortest Path in Binary Matrix.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 13/02/2021.
//  Copyright © 2021 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/shortest-path-in-binary-matrix/
class Solution {

    private let directions: [(x: Int, y: Int)] = [
        (-1, -1), (-1, 0), (-1, 1), (0, -1), (0, 1), (1, -1), (1, 0), (1, 1)
    ]
    
    /// Finds the length of the shortest clear path from top-left to
    /// bottom-right.
    ///
    /// - Parameter grid: The grid.
    /// - Returns: The length of the shortest path, if a path does not exist
    ///   returns -1.
    ///
    /// - Complexity:
    ///   - time: O(n * m), where n is the number of rows in the `grid`, and m
    ///   is the number of columns in the `grid`.
    ///   - space: O(n * m), where n is the number of rows in the `grid`, and m
    ///   is the number of columns in the `grid`.
    func shortestPathBinaryMatrix(_ grid: [[Int]]) -> Int {
        var grid = grid
        let n = grid.count
        let m = grid[0].count
        guard grid[0][0] == 0, grid[n-1][m-1] == 0 else { return -1 }
        
        var queue = [(x: Int, y: Int)]()
        grid[0][0] = 1
        queue.append((0, 0))
                
        while !queue.isEmpty {
            let (x, y) = queue.removeFirst()

            guard x != n - 1 || y != m - 1 else { return grid[x][y] }
            
            for direction in directions {
                let newX = x + direction.x
                let newY = y + direction.y
                guard isValid(newX, newY, n, m, grid) else { continue }
                queue.append((newX, newY))
                grid[newX][newY] = grid[x][y] + 1
            }
        }
        
        return -1
    }
    
    private func isValid(_ x: Int, _ y: Int, _ n: Int, _ m: Int, _ grid: [[Int]]) -> Bool {
        x >= 0 && y >= 0 && x < n && y < m && grid[x][y] == 0
    }

}
