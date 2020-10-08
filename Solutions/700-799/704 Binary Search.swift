//
//  704 Binary Search.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 08/10/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/binary-search/
class Solution {

    /// Finds the index of `target` in the given array.
    ///
    /// - Parameters:
    ///   - nums: A sorted (in ascending order) integer array.
    ///   - target: The target value.
    /// - Returns: If the target exists in an array returns its index, otherwise
    ///   returns -1.
    ///
    /// - Complexity:
    ///     - time: O(log(n)), where n is the length of the `nums`.
    ///     - space: O(1), only constant space is used.
    func search(_ nums: [Int], _ target: Int) -> Int {
        var low = 0
        var high = nums.count - 1

        while low <= high {
            var mid = low + (high - low) / 2

            guard nums[mid] != target else { return mid }

            if nums[mid] < target {
                low = mid + 1
            } else {
                high = mid - 1
            }
        }

        return -1
    }

}
