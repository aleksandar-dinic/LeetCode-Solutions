//
//  140 Word Break II.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 30/07/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/word-break-ii/
class Solution {

    /// Adds spaces in *s* to construct a sentence where each word is a valid dictionary
    /// word.
    ///
    /// - Parameters:
    ///   - s: A non-empty string.
    ///   - wordDict: A dictionary containing a list of non-empty words.
    /// - Returns: All possible sentences.
    ///
    /// - Complexity:
    ///   - time: O(2^n), where n is the length of the wordDict.
    ///   - space: O(2^n), where n is the length of the wordDict.
    func wordBreak(_ s: String, _ wordDict: [String]) -> [String] {
        var dict = [String: [String]]()
        return dfs(s, wordDict, &dict)
    }

    private func dfs(_ s: String, _ wordDict: [String], _ dict: inout [String: [String]]) -> [String] {
        if let val = dict[s] {
            return val
        }

        var ans = [String]()
        guard !s.isEmpty else { return [""] }

        for word in wordDict {
            guard s.hasPrefix(word) else { continue }
            let sublist = dfs(String(s.dropFirst(word.count)), wordDict, &dict)
            for sub in sublist {
                ans.append("\(word)\(sub.isEmpty ? "" : " ")\(sub)")
            }
        }

        dict[s] = ans
        return ans
    }

}
