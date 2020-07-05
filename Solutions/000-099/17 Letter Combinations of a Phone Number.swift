//
//  17 Letter Combinations of a Phone Number.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 05/07/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/letter-combinations-of-a-phone-number/
class Solution {

    /// Finds all possible letter combinations that the given string of digits could
    /// represent.
    ///
    /// - Parameter digits: A string of digits.
    /// - Returns: All possible letter combinations.
    ///
    /// - Complexity:
    ///   - time: O((n + m) * 3^n * 4^m), where n + m is the total number digits in the
    ///     input, n is the number of digits in the input that maps to 3 letters (2, 3, 4,
    ///     5, 6, 8) and m is the number of digits in the input that maps to 4 letters (7, 9).
    ///   - space: O((n + m) * 3^n * 4^m), where n + m is the total number digits in the
    ///     input, n is the number of digits in the input that maps to 3 letters (2, 3, 4,
    ///     5, 6, 8) and m is the number of digits in the input that maps to 4 letters (7, 9).
    func letterCombinations(_ digits: String) -> [String] {
        guard !digits.isEmpty else { return [] }

        let dict: [Character: [String]] = ["2": ["a", "b", "c"],
                                           "3": ["d", "e", "f"],
                                           "4": ["g", "h", "i"],
                                           "5": ["j", "k", "l"],
                                           "6": ["m", "n", "o"],
                                           "7": ["p", "q", "r", "s"],
                                           "8": ["t", "u", "v"],
                                           "9": ["w", "x", "y", "z"]]

        var ans = [String]()
        ans.append("")

        for digit in digits {
            guard let letters = dict[digit] else { continue }

            var tmp = [String]()
            for i in 0..<ans.count {
                for letter in letters {
                    tmp.append("\(ans[i])\(letter)")
                }
            }
            ans = tmp
        }

        return ans
    }

}
