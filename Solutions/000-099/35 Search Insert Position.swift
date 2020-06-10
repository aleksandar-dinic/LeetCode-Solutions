//
//  35 Search Insert Position.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 10/06/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/search-insert-position/
class Solution {

    /// Search insert position.
    ///
    /// - Parameters:
    ///   - nums: A sorted array.
    ///   - target: A target value.
    /// - Returns: The index of the target if exists, or the index where it would be if it
    ///   were inserted in order.
    ///
    /// - Complexity:
    ///   - time: O(log n), where n is the length of the nums.
    ///   - space: O(1), only constant space is used.
    func searchInsert(_ nums: [Int], _ target: Int) -> Int {
        var start = 0
        var end = nums.count

        while start < end {
            let mid = start + (end - start) / 2

            if nums[mid] < target {
                start = mid + 1
            } else {
                end = mid
            }
        }

        return start
    }

}
