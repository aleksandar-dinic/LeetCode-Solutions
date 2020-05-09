//
//  367 Valid Perfect Square.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 09/05/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/valid-perfect-square/
class Solution {

    /// **Newton's Algorithm** for checking if the number is a perfect square.
    ///
    /// - Parameter num: Positive integer.
    /// - Returns: True if num is a perfect square, otherwise returns false.
    ///
    /// - Complexity:
    ///   - time: O(log n), where n is the num.
    ///   - space: O(1), only constant space is used.
    func isPerfectSquare(_ num: Int) -> Bool {
        guard num > 0 else { return false }
        
        var n = num

        while n * n > num {
            n = (n + num/n) / 2
        }

        return n * n == num
    }

}
