//
//  16 3Sum Closest.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 30/11/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/3sum-closest/
class Solution {

    /// Finds three integers in `nums` such that the sum is closest to the `target`.
    ///
    /// - Parameters:
    ///   - nums: An array of integers.
    ///   - target: An integer.
    /// - Returns: The sum of the three integers.
    ///
    /// - Complexity:
    ///   - time: O(n^2), where n is the number of integers in `nums`.
    ///   - space: O(n), where n is the number of integers in `nums`.
    func threeSumClosest(_ nums: [Int], _ target: Int) -> Int {
        let nums = nums.sorted()
        var diff = Int.max

        for i in 0..<nums.count {
            var lo = i + 1
            var hi = nums.count - 1

            while lo < hi {
                let sum = nums[i] + nums[lo] + nums[hi]

                guard sum != target else { return target }
                if abs(target-sum) < abs(diff) {
                    diff = target-sum
                }

                if sum > target {
                    hi -= 1
                } else {
                    lo += 1
                }
            }
        }

        return target - diff
    }

}
