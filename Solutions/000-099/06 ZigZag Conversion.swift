//
//  06 ZigZag Conversion.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 20/02/2021.
//  Copyright © 2021 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/zigzag-conversion/
class Solution {

    /// Makes ZigZag conversion of string.
    ///
    /// - Parameters:
    ///   - s: The string.
    ///   - numRows: The number of rows.
    /// - Returns: ZigZag conversion of the string.
    ///
    /// - Complexity:
    ///     - time: O(n), where n is the length of `s`.
    ///     - space: O(n), where n is the length of `s`.
    func convert(_ s: String, _ numRows: Int) -> String {
        guard s.count > 1, numRows > 1 else { return s }

        var ans = [String](repeating: "", count: numRows)
        let tmp = (numRows - 1) * 2

        for (i, ch) in s.enumerated() {
            let location = i % tmp
            if location < numRows {
                ans[location].append(ch)
            } else {
                let upLocation = location - numRows
                ans[numRows - 1 - upLocation - 1].append(ch)
            }
        }

        return ans.joined()
    }

}
