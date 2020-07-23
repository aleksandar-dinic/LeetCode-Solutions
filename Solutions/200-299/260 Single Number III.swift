//
//  260 Single Number III.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 23/07/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/single-number-iii/
class Solution {

    /// Finds the two elements that appear only once in an array of numbers.
    ///
    /// - Parameter nums: The array of numbers.
    /// - Returns: The two elements that appear only once.
    ///
    /// - Complexity:
    ///   - time: O(n), where n is the length of the nums.
    ///   - space: O(1), only constant space is used.
    func singleNumber(_ nums: [Int]) -> [Int] {
        var diff = 0
        for num in nums {
            diff ^= num
        }

        diff &= -diff

        var ans = [Int](repeating: 0, count: 2)

        for num in nums {
            if num & diff == 0 {
                ans[0] ^= num
            } else {
                ans[1] ^= num
            }
        }

        return ans
    }

}
