//
//  520 Detect Capital.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 01/08/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/detect-capital/
class Solution {

    /// Finds whether the usage of capital letters is right or not.
    ///
    /// - Parameter word: The word.
    /// - Returns: True if the usage of capitals is right, otherwise returns false.
    ///
    /// - Complexity:
    ///   - time: O(n), where n is the length of the word.
    ///   - space: O(1), only constant space is used.
    func detectCapitalUse(_ word: String) -> Bool {
        guard word.count > 1 else { return true }

        let word = Array(word)

        for i in 1..<word.count {
            if word[i].isUppercase, word[i-1].isUppercase {
                continue
            }

            if word[i].isLowercase && (i == 1 || word[i-1].isLowercase) {
                continue
            }
            return false
        }

        return true
    }

}
