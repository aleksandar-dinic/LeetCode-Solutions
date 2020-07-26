//
//  258 Add Digits.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 26/07/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/add-digits/
class Solution {

    /// Repeatedly add all digits until the result has only one digit.
    ///
    /// - Parameter num: A non-negative integer.
    /// - Returns: Sum of all digits until the result has only one digit.
    ///
    /// - Complexity:
    ///   - time: O(1), only constant time is used.
    ///   - space: O(1), only constant space is used.
    func addDigits(_ num: Int) -> Int {
        return num == 0 ? 0 : 1 + (num - 1) % 9
    }

}
