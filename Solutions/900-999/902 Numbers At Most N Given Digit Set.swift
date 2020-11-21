//
//  902 Numbers At Most N Given Digit Set.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 21/11/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/numbers-at-most-n-given-digit-set/
class Solution {

    /// Finds the number of positive integers that can be generated that are less
    /// than or equal to a given integer `n`.
    ///
    /// - Parameters:
    ///   - digits: An array of digits.
    ///   - n: An integer.
    /// - Returns: The number of positive integers.
    ///
    /// - Complexity:
    ///     - time: O(log (n)), where n is the length of `digits`.
    ///     - space: O(1), only constant space is used.
    func atMostNGivenDigitSet(_ digits: [String], _ n: Int) -> Int {
        guard !digits.isEmpty, n > 0 else { return 0 }

        var n = Array(String(n))
        var digitsCount = Double(digits.count)

        var ans = 0
        for i in 1..<n.count {
            ans += Int(pow(digitsCount, Double(i)))
        }

        for i in 0..<n.count {
            var hasSameNum = false
            for digit in digits {
                guard let num = Int(digit), let s = Int(String(n[i])) else { continue }
                if num < s {
                    ans += Int(pow(digitsCount, Double(n.count - i - 1)))
                } else if num == s {
                    hasSameNum = true
                }
            }
            guard !hasSameNum else { continue }
            return ans
        }

        return ans + 1
    }

}
