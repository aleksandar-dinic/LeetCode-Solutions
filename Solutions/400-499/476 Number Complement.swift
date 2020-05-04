//
//  476 Number Complement.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 04/05/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/number-complement/
class Solution {

    /// Flips the bits of num.
    ///
    /// - Parameter num: Positive integer.
    /// - Returns: Complement of num.
    ///
    /// - Complexity:
    ///   - time: O(n), where n is the number of digits in num.
    ///   - space: O(1), only constant space is used.
    func findComplement(_ num: Int) -> Int {
        guard num != 0 else { return 1 }

        var i = 1

        while i <= num {
            i <<= 1
        }

        return (i - 1) ^ num
    }

}
