//
//  55 Jump Game.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 30/04/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundations

/// Source: https://leetcode.com/problems/jump-game/
class Solution {

    /// Determines if it is able to reach the last index.
    ///
    /// - Parameter nums: Array of non-negative integers.
    ///
    /// - Returns: True if it is able to reach the last index, otherwise returns false.
    ///
    /// - Complexity:
    ///   - time: O(n), where n is the length of the nums.
    ///   - space: O(1), only constant space is used.
    func canJump(_ nums: [Int]) -> Bool {
        var reach = 0
        var i = 0
        while i <= reach {
            reach = max(reach, i + nums[i])
            i += 1
            if reach >= nums.count - 1 {
                return true
            }
        }

        return false
    }

}
