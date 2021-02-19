//
//  1249 Minimum Remove to Make Valid Parentheses.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 19/02/2021.
//  Copyright © 2021 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/minimum-remove-to-make-valid-parentheses/
class Solution {

    /// Removes the minimum number of parentheses.
    ///
    /// - Parameter s: The string.
    /// - Returns: Valid parenthesis string.
    ///
    /// - Complexity:
    ///   - time: O(n), where n is the length of `s`.
    ///   - space: O(n), where n is the length of `s`.
    func minRemoveToMakeValid(_ s: String) -> String {
        var remove = Set<Int>()
        var stack = [Int]()
        
        for (i, ch) in s.enumerated() {
            if ch == "(" {
                stack.append(i)
            } else if ch == ")" {
                if stack.isEmpty {
                    remove.insert(i)
                } else {
                    stack.removeLast()
                }
            }
        }
        
        while !stack.isEmpty {
            remove.insert(stack.removeLast())
        }
        
        var ans = [Character]()
        for (i, ch) in s.enumerated() {
            guard !remove.contains(i) else { continue }
            ans.append(ch)
        }
        
        return String(ans)
    }

}
