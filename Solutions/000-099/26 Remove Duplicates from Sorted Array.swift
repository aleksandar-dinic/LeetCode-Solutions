//
//  26 Remove Duplicates from Sorted Array.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 06/04/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/remove-duplicates-from-sorted-array
class Solution {

    /// Remove duplicates in-place such that each element appear only once.
    ///
    /// - Parameter nums: Sorted array
    ///
    /// - Returns: New length of array
    ///
    /// - Complexity:
    ///   - time: O(n), where n is the length of the nums.
    ///   - space: O(1), only constant space is used.
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        guard !nums.isEmpty else { return 0 }
        var i = 0

        for j in 1..<nums.count {
            guard nums[i] != nums[j] else { continue }
            i += 1
            nums[i] = nums[j]
        }

        return i + 1
    }

}
