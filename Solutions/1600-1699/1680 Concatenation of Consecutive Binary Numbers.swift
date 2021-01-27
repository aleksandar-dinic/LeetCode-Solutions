//
//  1680 Concatenation of Consecutive Binary Numbers.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 27/01/2021.
//  Copyright © 2021 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/concatenation-of-consecutive-binary-numbers/
class Solution {

    /// Finds the decimal value of the binary string formed by concatenating the
    /// binary representations of 1 to `n` in order, modulo 10^9 + 7.
    ///
    /// - Parameter n: An integer.
    /// - Returns: The decimal value of the binary string.
    ///
    /// - Complexity:
    ///   - time: O(n), where n is the given `n`.
    ///   - space: O(1), only constant space is used.
    func concatenatedBinary(_ n: Int) -> Int {
        let mod = 1_000_000_007
        var length = 0
        var ans = 0
        
        for i in 1...n {
            if i & (i - 1) == 0 {
                length += 1
            }
            ans = ((ans << length) | i) % mod
        }
        
        return ans
    }

}
