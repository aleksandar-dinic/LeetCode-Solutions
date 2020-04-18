//
//  136 Single Number.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 18/04/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/single-number/
class Solution {

    /// Except for one, every other element appears twice in given array of integers.
    /// Finds that single one.
    ///
    /// - Parameter nums: Array of integers.
    /// - Returns: A number that appears only once.
    ///
    /// - Complexity:
    ///   - time: O(n), where n is the length of the nums.
    ///   - space: O(1), only constant space is used.
    func singleNumber(_ nums: [Int]) -> Int {
        var ans = 0

        for num in nums {
            ans ^= num
        }

        return ans
    }

}
