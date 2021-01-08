//
//  1662 Check If Two String Arrays are Equivalent.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 08/01/2021.
//  Copyright © 2021 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/check-if-two-string-arrays-are-equivalent/
class Solution {

    /// Finds if two string arrays are equivalent.
    ///
    /// - Parameters:
    ///   - word1: An array of string.
    ///   - word2: An array of string.
    /// - Returns: True if the two arrays represent the same string, otherwise
    ///   returns false.
    ///
    /// - Complexity:
    ///   - time: O(n), where n is the number of characters in `word1` and `word2`.
    ///   - space: O(n), where n is the number of characters in `word1` and `word2`.
    func arrayStringsAreEqual(_ word1: [String], _ word2: [String]) -> Bool {
        word1.joined(separator: "") == word2.joined(separator: "")
    }

}
