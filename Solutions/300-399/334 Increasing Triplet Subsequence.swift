//
//  334 Increasing Triplet Subsequence.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 18/12/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/increasing-triplet-subsequence/
class Solution {

    /// Finds if there exists a triple of indices `(i, j, k)` such that `i < j < k`
    /// and `nums[i] < nums[j] < nums[k]`
    ///
    /// - Parameter nums: An integer array.
    /// - Returns: True if indices exist, otherwise returns false.
    ///
    /// - Complexity:
    ///   - time: O(n), where n is the length of the `nums`.
    ///   - space: O(1), only constant space is used.
    func increasingTriplet(_ nums: [Int]) -> Bool {
        var first = Int.max
        var second = Int.max
        
        for num in nums {
            if num <= first {
                first = num
            } else if num <= second {
                second = num
            } else {
                return true
            }
        }
        
        return false
    }

}
