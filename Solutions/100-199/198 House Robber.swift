//
//  198 House Robber.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 14/09/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/house-robber/
class Solution {

    /// Determines the maximum amount of money you can rob tonight without alerting the
    /// police.
    ///
    /// - Parameter nums: A list of non-negative integers representing the amount of money
    ///   of each house.
    /// - Returns: The maximum amount of money you can rob.
    ///
    /// - Complexity:
    ///   - time: O(n), where n is the length of the `nums`.
    ///   - space: O(1), only constant space is used.
    func rob(_ nums: [Int]) -> Int {
        var prev = 0
        var ans = 0

        for num in nums {
            let tmp = ans
            ans = max(prev + num, ans)
            prev = tmp
        }

        return ans
    }

}
