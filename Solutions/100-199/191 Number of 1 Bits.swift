//
//  191 Number of 1 Bits.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 01/02/2021.
//  Copyright © 2021 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/number-of-1-bits/
class Solution {

    /// Finds the number of '1' bits in the given integer.
    ///
    /// - Parameter n: An integer.
    /// - Returns: The number of '1' bits in the given integer.
    ///
    /// - Complexity:
    ///   - time: O(1), only constant time is used.
    ///   - space: O(1), only constant space is used.
    func hammingWeight(_ n: Int) -> Int {
        var ans = 0
        
        var n = n
        while n != 0 {
            n &= n - 1
            ans += 1
        }
    
        return ans
    }
    
    // OR
    
    /// Finds the number of '1' bits in the given integer.
    ///
    /// - Parameter n: An integer.
    /// - Returns: The number of '1' bits in the given integer.
    ///
    /// - Complexity:
    ///   - time: O(1), only constant time is used.
    ///   - space: O(1), only constant space is used.
    func hammingWeight(_ n: Int) -> Int {
        n.nonzeroBitCount
    }

}
