//
//  50 Pow(x, n).swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 16/07/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/powx-n/
class Solution {

    /// Calculates x raised to the power n (x^n).
    ///
    /// - Parameters:
    ///   - x: The base value.
    ///   - n: The power value.
    /// - Returns: A decimal number raised to a given power.
    ///
    /// - Complexity:
    ///   - time: O(log n), where n is the power value.
    ///   - space: O(log n), where n is the power value.
    func myPow(_ x: Double, _ n: Int) -> Double {
        guard n != 0 else { return 1 }

        var x = x
        var n = n

        if n < 0 {
            n = -n
            x = 1 / x
        }

        return n % 2 == 0 ? myPow(x * x, n / 2) : x * myPow(x * x, n / 2)
    }

}
