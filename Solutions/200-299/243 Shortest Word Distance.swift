//
//  243 Shortest Word Distance.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 05/10/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/shortest-word-distance/
class Solution {

    /// Finds the shortest distance between two given words in the list.
    ///
    /// - Parameters:
    ///   - words: A list of words.
    ///   - word1: First word.
    ///   - word2: Second word.
    /// - Returns: The shortest distance between two words.
    ///
    /// - Complexity:
    ///   - time: O(n), where n is the number of words.
    ///   - space: O(1), only constant space is used.
    func shortestDistance(_ words: [String], _ word1: String, _ word2: String) -> Int {
        var ans = Int.max
        var i1: Int?
        var i2: Int?

        for (i, word) in words.enumerated() {
            if word == word1 {
                i1 = i
            } else if word == word2 {
                i2 = i
            }

            guard let i1 = i1, let i2 = i2 else { continue }
            ans = min(ans, abs(i1 - i2))
        }

        return ans
    }

}
