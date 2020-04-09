//
//  217 Contains Duplicate.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 09/04/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/contains-duplicate
class Solution {

    /// Given an array of integers, find if the array contains any duplicates.
    ///
    /// - Parameter nums: Array of integers.
    ///
    /// - Returns: true if any value appears at least twice in the array,
    ///   or false if every element is distinct.
    ///
    /// - Complexity:
    ///   - time: O(n), where n is the length of the nums.
    ///   - space: O(n), where n is the length of the nums.
    func containsDuplicate(_ nums: [Int]) -> Bool {
        var set = Set<Int>()

        for num in nums {
            guard !set.contains(num) else { return true }
            set.insert(num)
        }

        return false
    }

}
