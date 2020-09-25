//
//  487 Max Consecutive Ones II.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 25/09/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/max-consecutive-ones-ii/
class Solution {

    /// Finds the maximum number of consecutive 1s in a binary array if we can flip at
    /// most one 0.
    ///
    /// - Parameter nums: A binary array.
    /// - Returns: The maximum number of consecutive 1s.
    ///
    /// - Complexity:
    ///   - time: O(n), where n is the length of the `nums`.
    ///   - space: O(1), only constant space is used.
    func findMaxConsecutiveOnes(_ nums: [Int]) -> Int {
        var ans = 0
        var prev = 0
        var curr = 0

        for num in nums {
            if num == 0 {
                prev = curr + 1
                curr = 0
            } else {
                curr += 1
            }

            ans = max(ans, curr + prev)
        }

        return ans
    }

}
