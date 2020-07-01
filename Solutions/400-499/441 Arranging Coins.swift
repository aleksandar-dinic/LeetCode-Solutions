//
//  441 Arranging Coins.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 01/07/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/arranging-coins/
class Solution {

    /// Finds the total number of full staircase rows that can be formed from n coins.
    ///
    /// - Parameter n: The number of coins.
    /// - Returns: The number of full staircase.
    ///
    /// - Complexity:
    ///   - time: O(1), only constant time is used.
    ///   - space: O(1), only constant space is used.
    func arrangeCoins(_ n: Int) -> Int {
        return Int(sqrt(2.0 * Double(n) + 0.25) - 0.5)
    }

}
