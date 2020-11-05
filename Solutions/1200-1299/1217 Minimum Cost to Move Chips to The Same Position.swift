//
//  1217 Minimum Cost to Move Chips to The Same Position.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 05/11/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/minimum-cost-to-move-chips-to-the-same-position/
class Solution {

    /// Finds the minimum cost needed to move all the chips to the same position.
    ///
    /// - Parameter position: The positions of chips.
    /// - Returns: The minimum cost needed to move all the chips.
    ///
    /// - Complexity:
    ///   - time: O(n), where n is the number of chips.
    ///   - space: O(1), only constant time is used.
    func minCostToMoveChips(_ position: [Int]) -> Int {
        var even = 0
        var odd = 0

        for pos in position {
            if pos % 2 == 0 {
                even += 1
            } else {
                odd += 1
            }
        }

        return min(odd, even)
    }

}
