//
//  1446 Consecutive Characters.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 03/11/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/consecutive-characters/
class Solution {

    /// Finds the power of the string.
    ///
    /// - Parameter s: The string.
    /// - Returns: The power of the string.
    ///
    /// - Complexity:
    ///   - time: O(n), where n is the length of `s`.
    ///   - space: O(1), only constant space is used.
    func maxPower(_ s: String) -> Int {
        var ans = 0
        var cur = 0

        var prev: Character = "-"

        for ch in s {
            if prev == ch {
                cur += 1
            } else {
                cur = 1
                prev = ch
            }

            ans = max(ans, cur)
        }

        return ans
    }

}
