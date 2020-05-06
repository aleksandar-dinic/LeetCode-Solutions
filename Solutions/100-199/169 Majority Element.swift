//
//  169 Majority Element.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 06/05/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/majority-element/
class Solution {

    /// Finds the majority element.
    ///
    /// - Parameter nums: Array of numbers.
    /// - Returns: Majority element.
    ///
    /// - Complexity:
    ///   - time: O(n), where n is the length of the nums.
    ///   - space: O(1), only constant space is used.
    func majorityElement(_ nums: [Int]) -> Int {
        var ans = -1
        var count = 0

        for num in nums {
            if count == 0 {
                ans = num
            }

            count += num == ans ? 1 : -1
        }

        return ans
    }

}
