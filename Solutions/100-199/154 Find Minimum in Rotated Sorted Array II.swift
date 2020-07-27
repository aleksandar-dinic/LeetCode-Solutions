//
//  154 Find Minimum in Rotated Sorted Array II.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 27/07/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/find-minimum-in-rotated-sorted-array-ii/
class Solution {

    /// Finds the minimum element.
    ///
    /// - Parameter nums: An array.
    /// - Returns: The minimum element.
    ///
    /// - Complexity:
    ///   - time: O(n), where n is the length of the nums.
    ///   - space: O(1), only constant space is used.
    func findMin(_ nums: [Int]) -> Int {
        var left = 0
        var right = nums.count-1
        var mid = 0

        while left < right {
            mid = left + (right - left) / 2

            if nums[mid] > nums[right] {
                left = mid + 1
            } else if nums[mid] < nums[right] {
                right = mid
            } else {
                right -= 1
            }
        }

       return nums[left]
    }

}
