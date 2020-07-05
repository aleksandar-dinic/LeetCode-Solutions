//
//  461 Hamming Distance.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 05/07/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/hamming-distance/
class Solution {

    /// Calculates the Hamming distance between two integers.
    ///
    /// - Parameters:
    ///   - x: The integer.
    ///   - y: The integer.
    /// - Returns: The Hamming distance.
    ///
    /// - Complexity:
    ///   - time: O(1), only constant time is used.
    ///   - space: O(1), only constant space is used.
    func hammingDistance(_ x: Int, _ y: Int) -> Int {
        return (x ^ y).nonzeroBitCount
    }

}
