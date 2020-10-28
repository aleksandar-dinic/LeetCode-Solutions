//
//  228 Summary Ranges.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 28/10/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/summary-ranges/
class Solution {

    /// Finds the smallest sorted list of ranges that cover all the numbers in the
    /// array exactly.
    ///
    /// - Parameter nums: A sorted unique integer array.
    /// - Returns: The smallest sorted list of ranges.
    ///
    /// - Complexity:
    ///   - time: O(n), where n is the length of nums.
    ///   - space: O(n), where n is the length of nums.
    func summaryRanges(_ nums: [Int]) -> [String] {
        guard !nums.isEmpty else { return [] }

        var ans = [String]()

        var i = 0
        for j in 0..<nums.count {
            if j + 1 < nums.count, nums[j + 1] == nums[j] + 1 {
                continue
            }

            ans.append(i == j ? "\(nums[i])" : "\(nums[i])->\(nums[j])")
            i = j + 1
        }

        return ans
    }

}
