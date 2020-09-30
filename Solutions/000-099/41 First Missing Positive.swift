//
//  41 First Missing Positive.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 30/09/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/first-missing-positive/
class Solution {

    /// Finds the smallest missing positive integer.
    ///
    /// - Parameter nums: An unsorted integer array.
    /// - Returns: The smallest missing positive integer.
    ///
    /// - Complexity:
    ///   - time: O(n), where n is the length of the `nums`.
    ///   - space: O(1), only constant space is used, if we have parameter `nums` as inout.
    func firstMissingPositive(_ nums: [Int]) -> Int {
        var nums = nums
        var ans = 1

        for (i, num) in nums.enumerated() {
            if num == ans {
                ans += 1
            }

            if num <= 0 || num > nums.count {
                nums[i] = 1
            }
        }

        guard ans != 1, ans != nums.count + 1 else { return ans }

        for i in 0..<nums.count {
            let num = abs(nums[i])

            if num == nums.count {
                nums[0] = -abs(nums[0])
            } else {
                nums[num] = -abs(nums[num])
            }
        }

        for i in 1..<nums.count {
            guard nums[i] > 0 else { continue }
            return i
        }

        return nums.count + (nums[0] > 0 ? 0 : 1)
    }

}
