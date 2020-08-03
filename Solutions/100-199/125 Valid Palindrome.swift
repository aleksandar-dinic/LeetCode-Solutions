//
//  125 Valid Palindrome.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 03/08/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/valid-palindrome/
class Solution {

    /// Determines if a string is a palindrome.
    ///
    /// - Parameter s: The string.
    /// - Returns: True if the string is a palindrome, otherwise returns false.
    ///
    /// - Complexity:
    ///   - time: O(n), where n is the length of the *s*.
    ///   - space: O(1), only constant space is used.
    func isPalindrome(_ s: String) -> Bool {
        guard !s.isEmpty else { return true }

        let s = Array(s)
        var i = 0
        var j = s.count - 1

        while i < j {
            if !s[i].isLetter, !s[i].isNumber {
                i += 1
                continue
            }

            if !s[j].isLetter, !s[j].isNumber {
                j -= 1
                continue
            }

            guard s[i].lowercased() == s[j].lowercased() else { return false }
            i += 1
            j -= 1
        }

        return true
    }

}
