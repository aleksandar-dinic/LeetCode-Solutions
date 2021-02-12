//
//  1342 Number of Steps to Reduce a Number to Zero.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 12/02/2021.
//  Copyright © 2021 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/number-of-steps-to-reduce-a-number-to-zero/
class Solution {

    /// Finds the number of steps to reduce the given integer to zero.
    ///
    /// - Parameter num: A non-negative integer.
    /// - Returns: The number of steps.
    ///
    /// - Complexity:
    ///   - time: O(log n), where n is the given integer.
    ///   - space: O(1), only constant space is used.
    func numberOfSteps(_ num: Int) -> Int {
        var num = num
        var ans = 0
        
        while num > 0 {
            if num % 2 == 0 {
                num /= 2
            } else {
                num -= 1
            }
            ans += 1
        }
        
        return ans
    }

}
