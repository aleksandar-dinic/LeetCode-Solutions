//
//  287 Find the Duplicate Number.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 25/06/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/find-the-duplicate-number/
class Solution {

    /// Finds the duplicate number.
    ///
    /// - Parameter nums: An array containing n + 1 integers where each integer is between
    /// 1 and n (inclusive).
    /// - Returns: The duplicate number.
    ///
    /// - Complexity:
    ///     - time: O(n), where n is the length of the nums.
    ///     - space: O(1), only constant space is used.
    func findDuplicate(_ nums: [Int]) -> Int {
        var slow = nums[0]
        var fast = nums[nums[0]]

        while slow != fast {
            slow = nums[slow]
            fast = nums[nums[fast]]
        }

        slow = 0
        while slow != fast {
            slow = nums[slow]
            fast = nums[fast]
        }

        return slow
    }

}
