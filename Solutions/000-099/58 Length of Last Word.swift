//
//  58 Length of Last Word.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 15/09/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/length-of-last-word/
class Solution {

    /// Finds the length of the last word in a given string.
    ///
    /// - Parameter s: A string consists of upper/lower-case alphabets and empty space
    ///   characters ' '.
    /// - Returns: The length of the last word, if the last word does not exist returns 0.
    ///
    /// - Complexity:
    ///   - time: O(n), where n is the length of `s`.
    ///   - space: O(1), only constant space is used.
    func lengthOfLastWord(_ s: String) -> Int {
        var ans = 0

        for ch in s.reversed() {
            if ch != " " {
                ans += 1
            } else if ans > 0 {
                return ans
            }
        }

        return ans
    }

}
