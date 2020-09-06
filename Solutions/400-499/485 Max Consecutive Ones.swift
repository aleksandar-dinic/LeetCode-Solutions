//
//  485 Max Consecutive Ones.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 06/09/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/max-consecutive-ones/
class Solution {

    /// Finds the maximum number of consecutive 1s in a binary array.
    ///
    /// - Parameter nums: The binary array.
    /// - Returns: The maximum number of consecutive 1s.
    ///
    /// - Complexity:
    ///   - time: O(n), where n is the length of nums.
    ///   - space: O(1), only constant space is used.
    func findMaxConsecutiveOnes(_ nums: [Int]) -> Int {
        var ans = 0
        var currentMax = 0

        for i in nums {
            guard i != 1 else {
                currentMax += 1
                continue
            }
            ans = max(ans, currentMax)
            currentMax = 0
        }

        return max(ans, currentMax)
    }

}
