//
//  408 Valid Word Abbreviation.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 07/01/2021.
//  Copyright © 2021 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/valid-word-abbreviation/
class Solution {

    /// Finds whether the string matches with the given abbreviation.
    ///
    /// - Parameters:
    ///   - word: A string.
    ///   - abbr: A string.
    /// - Returns: True if the string matches with the given abbreviation, otherwise
    ///   returns false.
    ///
    /// - Complexity:
    ///   - time: O(max(n, m)), where n is the length of `word`, and m is the length
    ///     of `abbr`.
    ///   - space: O(max(n, m)), where n is the length of `word`, and m is the length
    ///     of `abbr`.
    func validWordAbbreviation(_ word: String, _ abbr: String) -> Bool {
        let word = Array(word)
        let abbr = Array(abbr)
        let n = word.count
        let m = abbr.count
        
        var i = 0
        var j = 0
        
        while i < n, j < m {
            guard word[i] != abbr[j] else {
                i += 1
                j += 1
                continue
            }
            
            guard abbr[j].isNumber else {
                return false
            }
            
            let start = j
            while j < m, abbr[j].isNumber {
                j += 1
            }
            
            guard abbr[start] != "0", let num = Int(String(abbr[start..<j])) else {
                return false
            }
            i += num
        }
        
        return i == n && j == m
    }

}
