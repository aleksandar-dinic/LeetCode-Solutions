//
//  616 Add Bold Tag in String.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 24/01/2021.
//  Copyright © 2021 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/add-bold-tag-in-string/
class Solution {

    /// Adds bold tag in a string.
    ///
    /// - Parameters:
    ///   - s: The string.
    ///   - dict: A list of strings.
    /// - Returns: The string with a bold tags.
    ///
    /// - Complexity:
    ///   - time: O(n * w), where n is the length of the `s`, and w is the sum of
    ///     all characters in the `dict`.
    ///   - space: O(n), where n is the length of the `s`.
    func addBoldTag(_ s: String, _ dict: [String]) -> String {
        guard !s.isEmpty else { return "" }
        let s = Array(s)
        let n = s.count
        var mask = [Bool](repeating: false, count: n)
        
        for i in 0..<n {
            search: for word in dict {
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
