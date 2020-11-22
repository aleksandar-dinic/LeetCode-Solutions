//
//  163 Missing Ranges.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 22/11/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/missing-ranges/
class Solution {

    /// Finds the smallest sorted list of ranges that cover every missing number in
    /// a given range.
    ///
    /// - Parameters:
    ///   - nums: A sorted unique integer array.
    ///   - lower: Lower range.
    ///   - upper: Upper range.
    /// - Returns: The smallest sorted list of ranges.
    ///
    /// - Complexity:
    ///   - time: O(n), where n is the length of the `nums`.
    ///   - space: O(n), where n is the length of the `nums`.
    func findMissingRanges(_ nums: [Int], _ lower: Int, _ upper: Int) -> [String] {
        guard !nums.isEmpty else { return [formatRange(lower, upper)] }

        let n = nums.count
        var ans = [String]()

        if nums[0] > lower {
            ans.append(formatRange(lower, nums[0] - 1))
        }

        for i in 1..<n {
            guard nums[i] - nums[i-1] > 1 else { continue }
            ans.append(formatRange(nums[i - 1] + 1, nums[i] - 1))
        }

        if nums[n - 1] < upper {
            ans.append(formatRange(nums[n - 1] + 1, upper))
        }

        return ans
    }

    private func formatRange(_ lower: Int, _ upper: Int) -> String {
        lower == upper ? "\(lower)" : "\(lower)->\(upper)"
    }

}
