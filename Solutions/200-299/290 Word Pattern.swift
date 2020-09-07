//
//  290 Word Pattern.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 07/09/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/word-pattern/
class Solution {

    /// Finds if str follows the pattern.
    ///
    /// - Parameters:
    ///   - pattern: The pattern.
    ///   - str: The string.
    /// - Returns: True if str follows the pattern, otherwise returns false.
    ///
    /// - Complexity:
    ///     - time: O(n), where n is the length of the pattern and the str.
    ///     - space: O(n), where n is the length of the pattern and the str.
    func wordPattern(_ pattern: String, _ str: String) -> Bool {
        var dict = [String: Int]()
        let str = str.split(separator: " ")

        guard pattern.count == str.count else { return false }

        for (i, ch) in pattern.enumerated() {
            let c = "\(ch)_"
            let w = "_\(str[i])"

            if !dict.keys.contains(c) {
                dict[c] = i
            }

            if !dict.keys.contains(w) {
                dict[w] = i
            }

            guard dict[c] != dict[w] else { continue }
            return false
        }

        return true
    }

}
