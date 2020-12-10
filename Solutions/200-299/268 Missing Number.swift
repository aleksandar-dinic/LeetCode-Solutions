//
//  268 Missing Number.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 10/12/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/missing-number/
class Solution {

    /// Finds the only number in the range that is missing from the array.
    ///
    /// - Parameter nums: An array of numbers.
    /// - Returns: The missing number.
    ///
    /// - Complexity:
    ///   - time: O(n), where n is the length of `nums`.
    ///   - space: O(1), only constant space is used.
    func missingNumber(_ nums: [Int]) -> Int {
        let n = nums.count
        var ans = n
        
        for i in 0..<n {
            ans ^= i ^ nums[i]
        }
        
        return ans
    }

}
