//
//  81 Search in Rotated Sorted Array II.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 20/11/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/search-in-rotated-sorted-array-ii/
class Solution {

    /// Searches for `target` in an array.
    ///
    /// - Parameters:
    ///   - nums: The array sorted in ascending order rotated at some pivot.
    ///   - target: The target value.
    /// - Returns: True if the target exists, otherwise returns false.
    ///
    /// - Complexity:
    ///   - time: O(n), where n is the length of `nums`.
    ///   - space: O(1), only constant space is used.
    func search(_ nums: [Int], _ target: Int) -> Bool {
        guard !nums.isEmpty else { return false }

        var start = 0
        var end = nums.count - 1

        while start <= end {
            let mid = start + (end - start) / 2

            guard nums[mid] != target else { return true }

            if nums[start] == nums[mid], nums[end] == nums[mid] {
                start += 1
                end -= 1
            } else if nums[start] <= nums[mid] {
                if nums[start] <= target, target < nums[mid] {
                    end = mid - 1
                } else {
                    start = mid + 1
                }
            } else {
                if nums[mid] < target, target <= nums[end] {
                    start = mid + 1
                } else {
                    end = mid - 1
                }
            }
        }

        return false
    }

}
