//
//  673 Number of Longest Increasing Subsequence.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 30/10/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/number-of-longest-increasing-subsequence/
class Solution {

    /// Finds the number of longest increasing subsequences.
    ///
    /// - Parameter nums: An integer array.
    /// - Returns: The number of longest increasing subsequences.
    ///
    /// - Complexity:
    ///   - time: O(n^2), where n is the length of nums.
    ///   - space: O(n), where n is the length of nums.
    func findNumberOfLIS(_ nums: [Int]) -> Int {
        guard nums.count > 1 else { return nums.count }

        var lengths = [Int](repeating: 0, count: nums.count)
        var counts = [Int](repeating: 1, count: nums.count)

        for i in 0..<nums.count {
            for j in 0..<i {
                guard nums[i] > nums[j] else { continue }
                if lengths[j] >= lengths[i] {
                    lengths[i] = lengths[j] + 1
                    counts[i] = counts[j]
                } else if lengths[j] + 1 == lengths[i] {
                    counts[i] += counts[j]
                }
            }
        }

        var ans = 0
        var maxLen = 0

        for length in lengths {
            maxLen = max(maxLen, length)
        }

        for i in 0..<nums.count {
            guard lengths[i] == maxLen else { continue }
            ans += counts[i]
        }

        return ans
    }

}
