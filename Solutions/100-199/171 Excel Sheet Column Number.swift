//
//  171 Excel Sheet Column Number.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 10/08/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/excel-sheet-column-number/
class Solution {

    /// Finds the corresponding column number for a column title.
    ///
    /// - Parameter s: The column title.
    /// - Returns: The column title corresponding column number.
    ///
    /// - Complexity:
    ///   - time: O(n), where n is the length of the column title.
    ///   - space: O(1), only constant space is used.
    func titleToNumber(_ s: String) -> Int {
        let A = Int(("A" as Character).asciiValue ?? 0)
        var ans = 0

        for ch in s {
            ans *= 26
            ans += Int(ch.asciiValue ?? 0) - A + 1
        }

        return ans
    }

}
