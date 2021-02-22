//
//  14 Longest Common Prefix.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 22/02/2021.
//  Copyright © 2021 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/longest-common-prefix/
class Solution {

    /// Finds the longest common prefix string amongst an array of strings.
    ///
    /// - Parameter strs: An array of strings.
    /// - Returns: The longest common prefix, if there is no common prefix, returns
    ///   an empty string "".
    ///
    /// - Complexity:
    ///     - time: O(n), where n is the sum of all characters in all strings.
    ///     - space: O(n), where n is the sum of all characters in all strings.
    func longestCommonPrefix(_ strs: [String]) -> String {
        guard !strs.isEmpty, !strs[0].isEmpty else { return "" }
        let strs = strs.map { Array($0) }
        let first = strs[0]
        let n = first.count
        
        var ans = Int.max
        
        for i in 1..<strs.count {
            var tmp = 0
            
            for j in 0..<strs[i].count {
                guard j < n, first[j] == strs[i][j] else { break }
                tmp += 1
            }
            
            ans = min(ans, tmp)
            
            guard ans == 0 else { continue }
            break
        }
        
        return ans == 0 ? "" : String(first.prefix(ans))
    }

}
