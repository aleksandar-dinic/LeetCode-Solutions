//
//  394 Decode String.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 19/11/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/decode-string/
class Solution {

    /// Decode string. The encoding rule is `k[encoded_string]`.
    ///
    /// - Parameter s: An encoded string.
    /// - Returns: Decoded string.
    ///
    /// - Complexity:
    ///   - time: O(k * n), where k is the maximum value of k, and n is the length
    ///     of `s`.
    ///   - space: O(n), where n is the length of `s`.
    func decodeString(_ s: String) -> String {
        var stack = [Int]()
        var prefix = [String]()
        var digits = ""

        for char in s {
            guard !char.isNumber else {
                digits = "\(digits)\(char)"
                continue
            }

            guard char != "]" else {
                var tmp = ""
                while !prefix.isEmpty {
                    let last = prefix.removeLast()
                    guard last != "[" else { break }
                    tmp = "\(last)\(tmp)"
                }
                let count = stack.removeLast()
                tmp = String(repeating: tmp, count: count)
                prefix.append(tmp)
                continue
            }

            prefix.append(String(char))
            guard let num = Int(digits) else { continue }
            stack.append(num)
            digits = ""
        }

        var ans = ""
        while !prefix.isEmpty {
            ans = "\(prefix.removeLast())\(ans)"
        }

        return ans
    }

}
