//
//  821 Shortest Distance to a Character.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 07/02/2021.
//  Copyright © 2021 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/shortest-distance-to-a-character/
class Solution {

    /// Finds an array of integers answer where `answer.count == s.count` and
    /// `answer[i]` is the shortest distance from `s[i]` to the character `c` in `s`.
    ///
    /// - Parameters:
    ///   - s: A string.
    ///   - c: A character.
    /// - Returns: An array of integers answer.
    ///
    /// - Complexity:
    ///     - time: O(n), where n is the length of the `s`.
    ///     - space: O(n), where n is the length of the `s`.
    func shortestToChar(_ s: String, _ c: Character) -> [Int] {
        let s = Array(s)
        let n = s.count
        var ans = [Int](repeating: 0, count: n)
        
        var prev = Int.min / 2
        for i in 0..<n {
            if s[i] == c {
                prev = i
            }
            ans[i] = i - prev
        }
        
        prev = Int.max / 2
        for i in (0..<n).reversed() {
            if s[i] == c {
                prev = i
            }
            ans[i] = min (ans[i], prev - i)
        }
        
        return ans
    }

}
