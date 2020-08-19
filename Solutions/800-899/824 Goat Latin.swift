//
//  824 Goat Latin.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 19/08/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/goat-latin/
class Solution {

    /// Converts the sentence to "Goat Latin".
    ///
    /// - Parameter S: The sentence.
    /// - Returns: The sentence representing the conversion to Goat Latin.
    ///
    /// - Complexity:
    ///     - time: O(n), where n is the length of the sentence.
    ///     - space: O(m), where m is the length of the sentence on Goat Latin.
    func toGoatLatin(_ S: String) -> String {
        let vowels = Set(arrayLiteral: "a","e","i","o","u")
        var ans = S.split(separator: " ")

        for i in 0..<ans.count {
            if let first = ans[i].first?.lowercased(), !vowels.contains(first) {
                ans[i].append(ans[i].removeFirst())
            }
            ans[i].append(contentsOf: "ma")
            ans[i].append(contentsOf: String(repeating: "a", count: i+1))
        }

        return ans.joined(separator: " ")
    }

}
