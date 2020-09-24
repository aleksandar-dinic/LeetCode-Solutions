//
//  389 Find the Difference.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 24/09/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/find-the-difference/
class Solution {

    /// Finds the letter that appears just in `t`.
    ///
    /// - Parameters:
    ///   - s: The string.
    ///   - t: The string.
    /// - Returns: The letter that appears just in `t`.
    ///
    /// - Complexity:
    ///   - time: O(n), where n is the length of `t`.
    ///   - space: O(1), only constant space is used. The total number of unique characters
    ///     is 26.
    func findTheDifference(_ s: String, _ t: String) -> Character {
        var dict = [Character: Int]()
        for ch in s {
            dict[ch, default: 0] += 1
        }

        for ch in t {
            guard let num = dict[ch], num > 0 else { return ch }
            dict[ch] = num - 1
        }

        return "\0"
    }

}
