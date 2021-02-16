//
//  784 Letter Case Permutation.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 16/02/2021.
//  Copyright © 2021 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/letter-case-permutation/
class Solution {

    /// Finds a list of all possible strings we could create.
    ///
    /// - Parameter S: A string.
    /// - Returns: A list of all possible strings.
    ///
    /// - Complexity:
    ///     - time: O(2^n * n), where n is the length of `S`.
    ///     - space: O(2^n * n), where n is the length of `S`.
    func letterCasePermutation(_ S: String) -> [String] {
        var ans = [[Character]]()
        ans.append([])
        
        for ch in S {
            let n = ans.count
            if ch.isLetter {
                for i in 0..<n {
                    ans.append(ans[i])
                    ans[i].append(Character(ch.lowercased()))
                    ans[n+i].append(Character(ch.uppercased()))
                }
            } else {
                for i in 0..<n {
                    ans[i].append(ch)
                }
            }
        }
        
        return ans.map { String($0) }
    }

}
