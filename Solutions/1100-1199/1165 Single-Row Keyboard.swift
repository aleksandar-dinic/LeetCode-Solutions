//
//  1165 Single-Row Keyboard.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 12/03/2021.
//  Copyright © 2021 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/single-row-keyboard/
class Solution {

    /// Finds how much time it takes to type `word` with one finger.
    ///
    /// - Parameters:
    ///   - keyboard: The string.
    ///   - word: The word.
    /// - Returns: How much time it takes to type `word` with one finger.
    ///
    /// - Complexity:
    ///     - time: O(max(n, m)), where n is the length of `keyboard`, and m is
    ///       the length of `word`.
    ///     - space: O(n), where n is the length of `keyboard`.
    func calculateTime(_ keyboard: String, _ word: String) -> Int {
        var dict = [Character: Int]()
        
        for (i, key) in keyboard.enumerated() {
            dict[key] = i
        }
        
        var prev = 0
        var ans = 0
        
        for ch in word {
            ans += abs(prev - (dict[ch] ?? 0))
            
            prev = dict[ch] ?? 0
        }
        
        return ans
    }

}
