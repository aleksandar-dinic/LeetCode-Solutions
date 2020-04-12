//
//  20 Valid Parentheses.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 12/04/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/valid-parentheses
class Solution {

    /// Returns boolean value indicating whether the input string is valid.
    ///
    /// An input string is valid if:
    /// 1. Contains just the characters '(', ')', '{', '}', '[' and ']'
    /// 2. Open brackets must be closed by the same type of brackets.
    /// 3. Open brackets must be closed in the correct order.
    /// 4. An empty string is also considered valid.
    ///
    /// - Parameter s: Input string
    ///
    /// - Returns: Is the input string valid.
    ///
    /// - Complexity:
    ///   - time: O(n), where n is the length of the s.
    ///   - space: O(n), where n is the length of the s.
    func isValid(_ s: String) -> Bool {
        var stack = [Character]()

        let dict: [Character: Character] = ["(": ")", "{": "}", "[": "]"]

        for char in s {
            switch char {
            case "(", "{", "[":
                stack.append(char)

            case ")", "}", "]":
                guard !stack.isEmpty, dict[stack.removeLast()] == char else {
                    return false
                }

            default:
                return false
            }
        }

        return stack.isEmpty
    }

}
