//
//  209 Minimum Size Subarray Sum.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 27/02/2021.
//  Copyright © 2021 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/minimum-size-subarray-sum/
class Solution {

    /// Finds the minimum length of a contiguous subarray of which the sum is
    /// greater than or equal to given target.
    ///
    /// - Parameters:
    ///   - target: The target.
    ///   - nums: An array of positive integers.
    /// - Returns: The minimum length of a contiguous subarray.
    ///
    /// - Complexity:
    ///     - time: O(n), where n is the length of `nums`.
    ///     - space: O(1), only constant space is used.
    func minSubArrayLen(_ target: Int, _ nums: [Int]) -> Int {
        var ans = Int.max
        var sum = 0
        var j = 0
        
        for i in 0..<nums.count {
            sum += nums[i]

            while sum >= target {
                ans = min(ans, i + 1 - j)
                sum -= nums[j]
                j += 1
            }
        }

        return ans == Int.max ? 0 : ans
    }

}
