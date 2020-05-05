//
//  387 First Unique Character in a String.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 05/05/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/first-unique-character-in-a-string/
class Solution {

    /// Finds the first non-repeating character in a string.
    ///
    /// - Parameter s: The string.
    /// - Returns: Index of first non-repeating character, if non-repeating character
    ///   doesn't exist returns -1.
    ///
    /// - Complexity:
    ///   - time: O(n), where n is the number of letters in s.
    ///   - space: O(n), where n is the number of letters in s.
    func firstUniqChar(_ s: String) -> Int {
        var dict = [Character: Int]()

        for c in s {
            dict[c, default: 0] += 1
        }

        for (i, c) in s.enumerated() {
            guard dict[c] == 1 else { continue }
            return i
        }

        return -1
    }

}
