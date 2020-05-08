//
//  678 Valid Parenthesis String.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 08/05/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/valid-parenthesis-string/
class Solution {

    /// Checks whether a string is valid.
    ///
    /// - Parameter s: The string.
    /// - Returns: True if the string is valid, otherwise returns false.
    ///
    /// - Complexity:
    ///   - time: O(n), where n is the length of the string.
    ///   - space: O(1), only constant space is used.
    func checkValidString(_ s: String) -> Bool {
        var open = 0
        var close = 0

        for c in s {
            open += c == "(" ? 1 : -1
            close += c != ")" ? 1 : -1
            guard close >= 0 else { return false }
            open = max(open, 0)
        }

        return open == 0
    }

}
