//
//  174 Dungeon Game.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 21/06/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/dungeon-game/
class Solution {

    /// Determines the knight's minimum initial health so that he can rescue the princess.
    ///
    /// - Parameter dungeon: The dungeon consists of M x N rooms laid out in a 2D grid.
    /// - Returns: The knight's minimum initial health.
    ///
    /// - Complexity:
    ///   - time: O(n * m), where n * m is the number of rooms in the dungeon.
    ///   - space: O(n * m), where n * m is the number of rooms in the dungeon.
    func calculateMinimumHP(_ dungeon: [[Int]]) -> Int {
        guard !dungeon.isEmpty else { return 1 }

        let rows = dungeon.count
        let columns = dungeon[0].count
        var dp = [[Int]](repeating: [Int](repeating: Int.max, count: columns + 1), count: rows + 1)
        dp[rows][columns - 1] = 1
        dp[rows - 1][columns] = 1

        for row in (0..<rows).reversed() {
            for column in (0..<columns).reversed() {
                let health = min(dp[row + 1][column], dp[row][column + 1]) - dungeon[row][column]
                dp[row][column] = health > 0 ? health : 1
            }
        }

        return dp[0][0]
    }

}
