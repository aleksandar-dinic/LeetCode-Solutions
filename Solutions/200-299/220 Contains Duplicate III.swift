//
//  220 Contains Duplicate III.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 02/09/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/contains-duplicate-iii/
class Solution {

    /// Finds out whether there are two distinct indices i and j in the array such that the
    /// absolute difference between nums[i] and nums[j] is at most t and the absolute
    /// difference between i and j is at most k.
    ///
    /// - Parameters:
    ///   - nums: An array of integers.
    ///   - k: The absolute difference between the two indices.
    ///   - t: The absolute difference between the two numbers.
    /// - Returns: True if there are two different eligible indexes, otherwise it returns
    ///   false.
    ///
    /// - Complexity:
    ///   - time: O(n), where n is the length of the nums.
    ///   - space: O(min(n, k)), where n is the length of the nums, and k is the absolute
    ///     difference between the two indices.
    func containsNearbyAlmostDuplicate(_ nums: [Int], _ k: Int, _ t: Int) -> Bool {
        guard k > 0, t >= 0 else { return false }
        var dict = [Int: Int]()
        let w = t + 1

        for i in 0..<nums.count {
            let m = getID(nums[i], w)

            guard dict[m] == nil else { return true }

            if let num = dict[m - 1], abs(nums[i] - num) < w {
                return true
            }

            if let num = dict[m + 1], abs(nums[i] - num) < w {
                return true
            }

            dict[m] = nums[i]
            guard i >= k else { continue }

            dict.removeValue(forKey: getID(nums[i - k], w))
        }

        return false
    }

    private func getID(_ x: Int, _ w: Int) -> Int {
        return x < 0 ? ((x + 1) / w) - 1 : x / w
    }

}
