//
//  1510 Stone Game IV.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 25/10/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/stone-game-iv/
class Solution {

    /// Finds if Alice can win a game.
    ///
    /// - Parameter n: Number of stones.
    /// - Returns: True if Alice wins the game, otherwise returns false.
    ///
    /// - Complexity:
    ///   - time: O(n sqrt(n)), where n is the given number of stones.
    ///   - space: O(n), where n is the given number of stones.
    func winnerSquareGame(_ n: Int) -> Bool {
        var dp = [Bool](repeating: false, count: n+1)

        for i in 0...n {
            guard !dp[i] else { continue }
            var j = 1
            while i + j * j <= n {
                dp[i + j * j] = true
                j += 1
            }
        }

        return dp[n]
    }

}
