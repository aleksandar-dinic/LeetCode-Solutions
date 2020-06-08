//
//  231 Power of Two.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 08/06/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/power-of-two/
class Solution {

    /// Determines if the given integer is a power of two.
    ///
    /// - Parameter n: The integer.
    /// - Returns: True if the given integer is a power of two, otherwise returns false.
    ///
    /// - Complexity:
    ///   - time: O(1), only constant time is used.
    ///   - space: O(1), only constant space is used.
    func isPowerOfTwo(_ n: Int) -> Bool {
        return n > 0 && (n & (n - 1)) == 0
    }

}
