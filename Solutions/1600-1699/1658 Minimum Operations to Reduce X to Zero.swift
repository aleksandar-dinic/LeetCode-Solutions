//
//  1658 Minimum Operations to Reduce X to Zero.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 14/01/2021.
//  Copyright © 2021 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/minimum-operations-to-reduce-x-to-zero/
class Solution {

    /// Finds the minimum number of operations to reduce `x` to exactly 0.
    ///
    /// - Parameters:
    ///   - nums: An integer array.
    ///   - x: An integer.
    /// - Returns: The minimum number of operations to reduce `x` to exactly 0 if
    ///   it's possible, otherwise returns -1.
    ///
    /// - Complexity:
    ///   - time: O(n), where n is the length of `nums`.
    ///   - space: O(1), only constant space is used.
    func minOperations(_ nums: [Int], _ x: Int) -> Int {
        var sum = nums.reduce(0, +)
        let n = nums.count
        var ans = Int.max
        var i = 0
        
        for j in 0..<n {
            sum -= nums[j]
            
            while sum < x, i <= j {
                sum += nums[i]
                i += 1
            }
            
            guard sum == x else { continue }
            ans = min(ans, (n - 1 - j) + i)
        }
        
        return ans != Int.max ? ans : -1
    }

}
