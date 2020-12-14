//
//  131 Palindrome Partitioning.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 14/12/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/palindrome-partitioning/
class Solution {

    /// Finds all possible palindrome partitioning of `s`.
    ///
    /// - Parameter s: A string.
    /// - Returns: All possible palindrome.
    ///
    /// - Complexity:
    ///   - time: O(n * 2^n), where n is the length of `s`.
    ///   - space: O(n^2), where n is the length of `s`.
    func partition(_ s: String) -> [[String]] {
        let n = s.count
        var dp = [[Bool]](repeating: [Bool](repeating: false, count: n), count: n)
        var ans = [[String]]()
        var currentList = [String]()
        dfs(&ans, str: Array(s), n: n, start: 0, &currentList, &dp)
        return ans
    }
    
    private func dfs(_ ans: inout [[String]], str: [Character], n: Int, start: Int, _ currentList: inout [String], _ dp: inout [[Bool]]) {
        guard start < n else {
            ans.append(currentList)
            return
        }
            
        for end in start..<n {
            guard str[start] == str[end], (end - start <= 2 || dp[start + 1][end - 1]) else { continue }
            dp[start][end] = true
            currentList.append(String(str[start...end]))
            dfs(&ans, str: str, n: n, start: end + 1, &currentList, &dp)
            currentList.removeLast()
        }
    }

}
