//
//  09 Palindrome Number.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 14/06/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/palindrome-number/
class Solution {

    /// Determines whether an integer is a palindrome.
    ///
    /// - Parameter x: The integer.
    /// - Returns: True if the integer is a palindrome, otherwise returns false.
    ///
    /// - Complexity:
    ///   - time: O(log n), where n is the number of digits in x.
    ///   - space: O(1), only constant space is used.
    func isPalindrome(_ x: Int) -> Bool {
        guard x >= 0, (x % 10 != 0 || x == 0) else { return false }

        var revertedNumber = 0
        var x = x

        while x > revertedNumber {
            revertedNumber = revertedNumber * 10 + x % 10
            x /= 10
        }

        return x == revertedNumber || x == revertedNumber/10
    }

}
