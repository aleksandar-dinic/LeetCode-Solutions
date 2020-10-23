//
//  456 132 Pattern.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 23/10/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/132-pattern/
class Solution {

    /// Finds if 132 pattern exists in the given array.
    ///
    /// - Parameter nums: An array of integers.
    /// - Returns: True if a 132 pattern exists, otherwise returns false.
    ///
    /// - Complexity:
    ///   - time: O(n), where n is the length of the `nums`.
    ///   - space: O(n), where n is the length of the `nums`.
    func find132pattern(_ nums: [Int]) -> Bool {
        guard nums.count >= 3 else { return false }
        var nums = nums
        var tmp = [Int](repeating: 0, count: nums.count)
        tmp[0] = nums[0]

        for i in 1..<nums.count {
            tmp[i] = min(tmp[i-1], nums[i])
        }

        var j = nums.count - 1
        var k = nums.count

        while j >= 0 {
            guard nums[j] > tmp[j] else {
                j -= 1
                continue
            }
            while k < nums.count, nums[k] <= tmp[j] {
                k += 1
            }

            if k < nums.count, nums[k] < nums[j] {
                return true
            }

            k -= 1
            nums[k] = nums[j]
            j -= 1
        }

        return false
    }

}
