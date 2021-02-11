//
//  242 Valid Anagram.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 11/02/2021.
//  Copyright © 2021 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/valid-anagram/
class Solution {

    /// Finds if `t` is an anagram of `s`.
    ///
    /// - Parameters:
    ///   - s: A string.
    ///   - t: A string.
    /// - Returns: True if `t` is an anagram of `s`, otherwise returns false.
    ///
    /// - Complexity:
    ///   - time: O(n), where n is the length of `s`.
    ///   - space: O(n), where n is the length of `s`.
    func isAnagram(_ s: String, _ t: String) -> Bool {
        var dict = [Character: Int]()
        for ch in s {
            dict[ch, default: 0] += 1
        }
        
        for ch in t {
            guard let val = dict[ch] else { return false }
            dict[ch] = val > 1 ? val - 1 : nil
        }
        
        return dict.isEmpty
    }

}
