//
//  289 Game of Life.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 30/12/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/game-of-life/
class Solution {

    /// Finds the next state.
    ///
    /// - Parameter board: The board.
    ///
    /// - Complexity:
    ///     - time: O(m * n), where m is the number of rows of the `board`, and the
    ///     n is the number of columns of the `board`.
    ///     - space: O(1), only constant space is used.
    func gameOfLife(_ board: inout [[Int]]) {
        let neighbors = [0, 1, -1]
        
        let rows = board.count
        let cols = board[0].count
        
        for row in 0..<rows {
            for col in 0..<cols {
                var liveNeighbors = 0
                
                for i in 0..<3 {
                    for j in 0..<3 {
                        guard !(neighbors[i] == 0 && neighbors[j] == 0) else { continue }
                        let r = row + neighbors[i]
                        let c = col + neighbors[j]
                        
                        guard r < rows, r >= 0, c < cols, c >= 0, abs(board[r][c]) == 1 else { continue }
                        liveNeighbors += 1
                    }
                }
                
                if board[row][col] == 1, (liveNeighbors < 2 || liveNeighbors > 3) {
                    board[row][col] = -1
                }
                
                if board[row][col] == 0, liveNeighbors == 3 {
                    board[row][col] = 2
                }
            }
        }
        
        for row in 0..<rows {
            for col in 0..<cols {
                board[row][col] = board[row][col] > 0 ? 1 : 0
            }
        }
    }

}
