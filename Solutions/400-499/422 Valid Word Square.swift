//
//  422 Valid Word Square.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 11/01/2021.
//  Copyright © 2021 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/valid-word-square/
class Solution {

    /// Finds if given sequence of words forms a valid word square.
    ///
    /// - Parameter words: A sequence of words.
    /// - Returns: True if sequence of words forms a valid word square, otherwise
    ///   returns false.
    ///
    /// - Complexity:
    ///   - time: O(n), where n is the number of characters in `words`.
    ///   - space: O(n), where n is the number of characters in `words`.
    func validWordSquare(_ words: [String]) -> Bool {
        guard !words.isEmpty else { return true }
        
        let words = words.map { Array($0) }
        
        let n = words.count
        for (i, word) in words.enumerated() {
            for (j, w) in word.enumerated() {
                guard j < n, i < words[j].count else { return false }
                guard words[j][i] == w else { return false }
            }
        }
        
        return true
    }

}
