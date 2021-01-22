//
//  1657 Determine if Two Strings Are Close.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 22/01/2021.
//  Copyright © 2021 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/determine-if-two-strings-are-close/
class Solution {

    /// Finds if two strings are close.
    ///
    /// - Parameters:
    ///   - word1: First word.
    ///   - word2: Second word.
    /// - Returns: True if `word1` and `word2` are close, otherwise returns false.
    ///
    /// - Complexity:
    ///   - time: O(n), where n is the max length of `word1` and `word2`.
    ///   - space: O(n), where n is the max length of `word1` and `word2`.
    func closeStrings(_ word1: String, _ word2: String) -> Bool {
        guard word1.count == word2.count else { return false }
        
        var dict1 = [Character: Int]()
        for ch in word1 {
            dict1[ch, default: 0] += 1
        }
        
        var dict2 = [Character: Int]()
        for ch in word2 {
            dict2[ch, default: 0] += 1
        }
        
        return Set(dict1.keys) == Set(dict2.keys) &&
                Set(dict1.values) == Set(dict2.values)
    }

}
