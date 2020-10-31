//
//  67 Add Binary.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 19/07/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/add-binary/
class Solution {

    /// Given two binary strings, return their sum (also a binary string).
    ///
    /// - Parameters:
    ///   - a: Binary string.
    ///   - b: Binary string.
    /// - Returns: Binary string sum.
    ///
    /// - Complexity:
    ///   - time: O(n + m), where n is the length of the `a` and m is the length of the `b`.
    ///   - space: O(n + m), where n is the length of the `a` and m is the length of the `b`.
    func addBinary(_ a: String, _ b: String) -> String {
        guard !a.isEmpty else { return b }
        guard !b.isEmpty else { return a }

        var carry = 0
        let a = Array(a)
        let b = Array(b)
        var i = a.count - 1
        var j = b.count - 1
        var ans = [Int]()

        while i >= 0 || j >= 0 || carry != 0 {
            var sum = carry
            if i >= 0, a[i] == "1" {
                sum += 1
            }
            if j >= 0, b[j] == "1" {
                sum += 1
            }

            let digit = sum % 2
            carry = sum / 2
            ans.append(digit)

            i -= 1
            j -= 1
        }

        return ans.map { String($0) }.reversed().joined()
    }

}
