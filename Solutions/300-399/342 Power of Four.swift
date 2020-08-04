//
//  342 Power of Four.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 04/08/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/power-of-four/
class Solution {

    /// Checks whether an integer is a power of 4.
    ///
    /// - Parameter num: The integer.
    /// - Returns: True if the integer is a power of 4, otherwise returns false.
    ///
    /// - Complexity:
    ///   - time: O(1), only constant time is used.
    ///   - space: O(1), only constant space is used.
    func isPowerOfFour(_ num: Int) -> Bool {
        return num > 0 && (log(Double(num)) / log(2.0)).truncatingRemainder(dividingBy: 2) == 0
    }

}
