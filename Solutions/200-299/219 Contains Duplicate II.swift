//
//  219 Contains Duplicate II.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 27/06/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/contains-duplicate-ii/
class Solution {

    /// Finds out if an array contains nearby duplicate.
    ///
    /// - Parameters:
    ///   - nums: The array of integers.
    ///   - k: The difference.
    /// - Returns: True if nearby duplicate exists, otherwise returns false.
    ///
    /// - Complexity:
    ///   - time: O(n), where n is the length of the nums.
    ///   - space: O(n), where n is the length of the nums.
    func containsNearbyDuplicate(_ nums: [Int], _ k: Int) -> Bool {
        var dic = [Int: Int]()

        for (i, num) in nums.enumerated() {
            if let val = dic[num], i - val <= k {
                return true
            } else {
                dic[num] = i
            }
        }

        return false
    }

}
