//
//  1332 Remove Palindromic Subsequences.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 08/03/2021.
//  Copyright © 2021 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/remove-palindromic-subsequences/
class Solution {

    /// Finds the minimum number of steps to make the given string empty.
    ///
    /// - Parameter s: The string.
    /// - Returns: The minimum number of steps.
    ///
    /// - Complexity:
    ///   - time: O(n), where n is the length of `s`.
    ///   - space: O(1), only constant space is used.
    func removePalindromeSub(_ s: String) -> Int {
        guard !s.isEmpty else { return 0 }
        
        return isPalindrome(Array(s)) ? 1 : 2
    }
    
    private func isPalindrome(_ s: [Character]) -> Bool {
        var start = 0
        var end = s.count - 1
        
        while start < end {
            guard s[start] == s[end] else { return false }
            start += 1
            end -= 1
        }
        
        return true
    }

}
