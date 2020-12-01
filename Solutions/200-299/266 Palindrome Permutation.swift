//
//  266 Palindrome Permutation.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 01/12/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/palindrome-permutation/
class Solution {

    /// Finds if a permutation of the string could form a palindrome.
    ///
    /// - Parameter s: A string.
    /// - Returns: True if palindrome could be formed, otherwise returns false.
    ///
    /// - Complexity:
    ///   - time: O(n), where n is the length of `s`.
    ///   - space: O(1), only constant space is used.
    func canPermutePalindrome(_ s: String) -> Bool {
        var set = Set<Character>()

        for ch in s {
            guard !set.insert(ch).inserted else { continue }
            set.remove(ch)
        }

        return set.count <= 1
    }

}
