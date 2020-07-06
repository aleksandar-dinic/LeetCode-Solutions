//
//  66 Plus One.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 06/07/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundations

/// Source: https://leetcode.com/problems/plus-one/
class Solution {

    /// Adds one to an integer that is represented as an array.
    ///
    /// - Parameter digits: A non-empty array of digits representing a non-negative integer.
    /// - Returns: Given integer plus one represented as an array.
    ///
    /// - Complexity:
    ///   - time: O(n), where n is the length of the digits.
    ///   - space: O(n), where n is the length of the digits.
    func plusOne(_ digits: [Int]) -> [Int] {
        var digits = digits

        for i in (0..<digits.count).reversed() {
            guard digits[i] == 9 else {
                digits[i] += 1
                return digits
            }

            digits[i] = 0
        }

        digits.insert(1, at: 0)

        return digits
    }

}
