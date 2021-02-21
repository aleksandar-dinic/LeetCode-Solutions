//
//  07 Reverse Integer.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 21/02/2021.
//  Copyright © 2021 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/reverse-integer/
class Solution {

    /// Reverse digits in `x`.
    ///
    /// - Parameter x: An integer.
    /// - Returns: Reversed `x`.
    ///
    /// - Complexity:
    ///     - time: O(log n), where n is the given `x`.
    ///     - space: O(1), only constant space is used.
    func reverse(_ x: Int) -> Int {
        var x = x
        var ans = 0

        while x != 0 {
            let tmp = (x % 10)
            x /= 10

            if ans > Int32.max / 10 || (ans == Int32.max / 10 && tmp > 7) { return 0 }
            if ans < Int32.min / 10 || (ans == Int32.max / 10 && tmp < -8) { return 0 }

            ans = (ans * 10) + tmp
        }

        return ans
    }

}
