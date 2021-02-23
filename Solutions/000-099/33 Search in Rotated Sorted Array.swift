//
//  33 Search in Rotated Sorted Array.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 23/02/2021.
//  Copyright © 2021 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/search-in-rotated-sorted-array/
class Solution {

    /// Finds the index of `target` in the array.
    ///
    /// - Parameters:
    ///   - nums: The array.
    ///   - target: An integer.
    /// - Returns: The index of `target` if `target` exist in `nums`, otherwise
    ///   returns -1.
    ///
    /// - Complexity:
    ///     - time: O(log n), where n is the length of `nums`.
    ///     - space: O(1), only constant space is used.
    func search(_ nums: [Int], _ target: Int) -> Int {
        var start = 0
        var end = nums.count - 1

        while start <= end {
            let mid = start + (end - start) / 2
            guard nums[mid] != target else { return mid }

            if nums[start] < nums[mid] {
                if nums[start] <= target, target < nums[mid] {
                    end = mid - 1
                } else {
                    start = mid + 1
                }
            } else if nums[start] > nums[mid] {
                if nums[mid] < target, target <= nums[end] {
                    start = mid + 1
                } else {
                    end = mid - 1
                }

            } else {
                start = mid + 1
            }

        }

        return -1
    }

}
