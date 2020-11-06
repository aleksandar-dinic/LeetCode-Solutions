//
//  1283 Find the Smallest Divisor Given a Threshold.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 05/11/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/find-the-smallest-divisor-given-a-threshold/
class Solution {

    /// Finds the smallest divisor such that the result is less than or equal to
    /// `threshold`.
    ///
    /// - Parameters:
    ///   - nums: An array of integers.
    ///   - threshold: An integer.
    /// - Returns: The smallest divisor.
    ///
    /// - Complexity:
    ///   - time: O(log n), where n is the maximum number in `nums`.
    ///   - space: O(1), only constant space is used.
    func smallestDivisor(_ nums: [Int], _ threshold: Int) -> Int {
        var left = 1
        var right = 2

        while computeSum(nums, right) > threshold {
            left = right
            right *= 2
        }

        while left <= right {
            var mid = left + (right - left) / 2
            var num = computeSum(nums, mid)

            if num > threshold {
                left = mid + 1
            } else {
                right = mid - 1
            }
        }

        return left
    }

    private func computeSum(_ nums: [Int], _ x: Int) -> Int {
        var ans = 0

        for num in nums {
            ans += num / x + (num % x == 0 ? 0 : 1)
        }

        return ans
    }

}
