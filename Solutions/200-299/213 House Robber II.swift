//
//  213 House Robber II.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 14/10/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/house-robber-ii/
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
        guard !nums.isEmpty else { return 0 }
        guard nums.count > 1 else { return nums[0] }

        let ans1 = rob(nums, start: 0, end: nums.count - 1)
        let ans2 = rob(nums, start: 1, end: nums.count)

        return max(ans1, ans2)
    }

    private func rob(_ nums: [Int], start: Int, end: Int) -> Int {
        var pre = 0
        var cur = 0

        for i in start..<end {
            let tmp = cur
            cur = max(cur, pre + nums[i])
            pre = tmp
        }

        return cur
    }

}
