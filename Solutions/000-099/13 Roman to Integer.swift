//
//  13 Roman to Integer.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 11/07/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/roman-to-integer/
class Solution {

    /// Converts Roman numeral to an integer.
    ///
    /// - Parameter s: Roman numeral.
    /// - Returns: The integer.
    ///
    /// - Complexity:
    ///   - time: O(n), where n is the number of characters in s.
    ///   - space: O(1), only constant space is used.
    func romanToInt(_ s: String) -> Int {
        guard !s.isEmpty else { return 0 }
        let dict: [Character: Int] = ["I": 1, "V": 5, "X": 10, "L": 50, "C": 100, "D": 500, "M": 1000]

        let s = Array(s)
        var ans = 0
        var prev = dict[s[0]] ?? 0

        for i in 1..<s.count {
            guard let next = dict[s[i]] else { continue }

            if prev < next {
                ans -= prev
            } else {
                ans += prev
            }

            prev = next
        }

        ans += prev
        return ans
    }

}
