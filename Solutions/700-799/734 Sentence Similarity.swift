//
//  734 Sentence Similarity.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 20/01/2021.
//  Copyright © 2021 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/sentence-similarity/
class Solution {

    /// Finds if `sentence1` and `sentence2` are similar.
    ///
    /// - Parameters:
    ///   - sentence1: The first sentence.
    ///   - sentence2: The second sentence.
    ///   - similarPairs: An array of string pairs indicates that the two words are
    ///     similar.
    /// - Returns: True if `sentence1` and `sentence2` are similar, otherwise
    ///   returns false.
    ///
    /// - Complexity:
    ///     - time: O(max(n, p)), where n is the length of `sentence1` and
    ///     `sentence2`, and p is the length of the `similarPairs`.
    ///     - space: O(p), where p is the length of the `similarPairs`.
    func areSentencesSimilar(_ sentence1: [String], _ sentence2: [String], _ similarPairs: [[String]]) -> Bool {
        let n = sentence1.count
        let m = sentence2.count
        guard n == m else { return false }
        
        var pairset = Set<String>()
        for pair in similarPairs {
            pairset.insert("\(pair[0])#\(pair[1])")
        }
        
        for i in 0..<n {
            guard sentence1[i] != sentence2[i] else { continue }
            guard !pairset.contains("\(sentence1[i])#\(sentence2[i])"),
                    !pairset.contains("\(sentence2[i])#\(sentence1[i])") else { continue }
            return false
        }
        
        return true
    }

}
