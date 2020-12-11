//
//  80 Remove Duplicates from Sorted Array II.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 11/12/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/remove-duplicates-from-sorted-array-ii/
class Solution {

    /// Removes the duplicates in-place such that duplicates appeared at most twice.
    ///
    /// - Parameter nums: A sorted array.
    /// - Returns: The new length.
    ///
    /// - Complexity:
    ///   - time: O(n), where n is the length of `nums`.
    ///   - space: O(1), only constant space is used.
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        let n = nums.count
        guard n > 2 else { return n }
        var j = 1
        var count = 1
        
        for i in 1..<nums.count {
            if nums[i] == nums[i - 1] {
                count += 1
            } else {
                count = 1
            }
            
            if count <= 2 {
                nums[j] = nums[i]
                j += 1
            }
        }
        
        return j
    }

}
