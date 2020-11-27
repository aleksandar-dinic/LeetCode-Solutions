//
//  416 Partition Equal Subset Sum.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 27/11/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/partition-equal-subset-sum/
class Solution {

    /// Finds if the array can be partitioned into two subsets such that the sum of
    /// elements in both subsets is equal.
    ///
    /// - Parameter nums: An array containing only positive integers.
    /// - Returns: True if the array can be partitioned, otherwise returns false.
    ///
    /// - Complexity:
    ///   - time: O(m * n), where m is the `target`, and n is the length of `nums`.
    ///   - space: O(m), where m is the `target`.
    func canPartition(_ nums: [Int]) -> Bool {
        guard !nums.isEmpty else { return false }

        var totalSum = nums.reduce(0, +)

        guard totalSum % 2 == 0 else { return false }

        let target = totalSum / 2
        var dp = [Bool](repeating: false, count: target + 1)
        dp[0] = true

        for num in nums {
            for j in stride(from: target, through: num, by: -1) {
                dp[j] = dp[j] || dp[j - num]
            }
        }

        return dp[target]
    }

}
