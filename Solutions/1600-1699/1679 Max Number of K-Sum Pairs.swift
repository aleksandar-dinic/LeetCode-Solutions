//
//  1679 Max Number of K-Sum Pairs.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 18/01/2021.
//  Copyright © 2021 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/max-number-of-k-sum-pairs/
class Solution {

    /// Finds the maximum number of operations you can perform on the array.
    ///
    /// - Parameters:
    ///   - nums: An integer array.
    ///   - k: An integer.
    /// - Returns: The maximum number of operations.
    ///
    /// - Complexity:
    ///   - time: O(n), where n is the length of the `nums`.
    ///   - space: O(n), where n is the length of the `nums`.
    func maxOperations(_ nums: [Int], _ k: Int) -> Int {
        var dict = [Int: Int]()
        
        var ans = 0
        for num in nums {
            if let val = dict[k - num] {
                dict[k - num] = val > 1 ? val - 1 : nil
                ans += 1
            } else {
                dict[num, default: 0] += 1
            }
        }
        
        return ans
    }

}
