//
//  758 Bold Words in String.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 24/01/2021.
//  Copyright © 2021 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/bold-words-in-string/
class Solution {

    /// Bolds words in a string.
    ///
    /// - Parameters:
    ///   - words: A set of keywords.
    ///   - S: The string.
    /// - Returns: The string with a bold words.
    ///
    /// - Complexity:
    ///     - time: O(n * w), where n is the length of the `S`, and w is the sum of
    ///     all characters in the `words`.
    ///     - space: O(n), where n is the length of the `S`.
    func boldWords(_ words: [String], _ S: String) -> String {
        guard !S.isEmpty else { return "" }
        let s = Array(S)
        let n = S.count
        var mask = [Bool](repeating: false, count: n)
        
        for i in 0..<n {
            search: for word in words {
                for (k, w) in word.enumerated() {
                    guard k+i >= n || s[k+i] != w else { continue }
                    continue search
                }
                for j in i..<i+word.count {
                    mask[j] = true
                }
            }
        }
                
        var ans = [String]()
        for i in 0..<n {
            if mask[i], (i == 0 || !mask[i-1]) {
                ans.append("<b>")
            }
            ans.append(String(s[i]))
            if mask[i], (i == n-1 || !mask[i+1]) {
                ans.append("</b>")
            }
        }
        return ans.joined()
    }

}
