//
//  59 Spiral Matrix II.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 07/12/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/spiral-matrix-ii/
class Solution {

    /// Generates an n x n matrix filled with elements from 1 to n*n in spiral order.
    ///
    /// - Parameter n: A positive integer.
    /// - Returns: Spiral matrix.
    ///
    /// - Complexity:
    ///   - time: O(n * n), where n is the given `n`.
    ///   - space: O(n * n), where n is the given `n`.
    func generateMatrix(_ n: Int) -> [[Int]] {
        var ans = [[Int]](repeating: [Int](repeating: 0, count: n), count: n)
        let dir: [(row: Int, col: Int)] = [(0, 1), (1, 0), (0, -1), (-1, 0)]
        var d = 0
        var row = 0
        var col = 0
        
        for num in 1...n*n {
            ans[row][col] = num
            
            let r = abs((row + dir[d].row) % n)
            let c = abs((col + dir[d].col) % n)

            if ans[r][c] != 0 {
                d = (d + 1) % 4
            }
            
            row += dir[d].row
            col += dir[d].col
        }
        
        return ans
    }

}
