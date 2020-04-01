//
//  01 Two Sum.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 01/04/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/two-sum
class Solution {

    /// Given an array of integers, return indices of the two numbers
    /// such that they add up to a specific target.
    ///
    /// - Parameters:
    ///   - nums: Array of integers
    ///   - target: Specific target
    ///
    /// - Returns: Indices of the two numbers
    ///
    /// - Complexity:
    ///   - time: O(n), where n is the length of the nums.
    ///   - space: O(n), where n is the length of the nums.
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var dict = [Int: Int]()

        for (i, num) in nums.enumerated() {
            if let j = dict[target - num] {
                return [j, i]
            }

            dict[num] = i
        }

        return []
    }

}
