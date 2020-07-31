//
//  70 Climbing Stairs.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 31/07/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundations

/// Source: https://leetcode.com/problems/climbing-stairs/
class Solution {

    /// Calculates how many different ways we can climb to the top.
    ///
    /// - Parameter n: The number of steps.
    /// - Returns: Number of distinct ways to climb to the top.
    ///
    /// - Complexity:
    ///   - time: O(n), where n is the number of steps.
    ///   - space: O(1), only constant space is used.
    func climbStairs(_ n: Int) -> Int {
        if n == 0 || n == 1 {
            return 1
        }

        var first = 1
        var second = 1
        var third = 0
        for _ in 2...n {
            third = first + second
            first = second
            second = third
        }

        return second
    }

}
