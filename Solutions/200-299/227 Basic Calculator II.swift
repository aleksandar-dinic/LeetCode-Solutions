//
//  227 Basic Calculator II.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 24/11/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/basic-calculator-ii/
class Solution {

    /// Calculates expression string.
    ///
    /// - Parameter s: The expression string.
    /// - Returns: The result.
    ///
    /// - Complexity:
    ///   - time: O(n), where n is the length of `s`.
    ///   - space: O(1), only constant space is used.
    func calculate(_ s: String) -> Int {
        guard !s.isEmpty else { return 0 }
        var curNumber = 0
        var lastNum = 0
        var ans = 0

        var operation = Character("+")

        let n = s.count
        for (i, ch) in s.enumerated() {
            if let num = Int(String(ch)) {
                curNumber = curNumber * 10 + num
            }

            if !ch.isNumber && ch != " " || i == n - 1 {
                if operation == "+" || operation == "-" {
                    ans += lastNum
                    lastNum = operation == "+" ? curNumber : -curNumber
                } else if operation == "*" {
                    lastNum *= curNumber
                } else if operation == "/" {
                    lastNum /= curNumber
                }
                operation = ch
                curNumber = 0
            }
        }

        ans += lastNum
        return ans
    }

}
