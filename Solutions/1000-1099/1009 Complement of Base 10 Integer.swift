//
//  1009 Complement of Base 10 Integer.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 04/05/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/complement-of-base-10-integer/
class Solution {

    /// Flips the bits of num.
    ///
    /// - Parameter num: Non-negative integer.
    /// - Returns: Complement of num.
    ///
    /// - Complexity:
    ///   - time: O(n), where n is the number of digits in num.
    ///   - space: O(1), only constant space is used.
    func bitwiseComplement(_ N: Int) -> Int {
        guard N != 0 else { return 1 }
        var i = 1

        while i <= N {
            i <<= 1
        }

        return (i - 1) ^ N
    }

}
