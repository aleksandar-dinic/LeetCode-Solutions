//
//  1035 Uncrossed Lines.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 25/05/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/uncrossed-lines/
class Solution {

    /// Calculates the maximum number of uncrossed Lines.
    ///
    /// - Parameters:
    ///   - A: An array A.
    ///   - B: An array B.
    /// - Returns: The maximum number of connecting lines.
    ///
    /// - Complexity:
    ///   - time: O(n * m), where n is the length of A and m is the length of B.
    ///   - space: O(m), where m is the length of *B*.
    func maxUncrossedLines(_ A: [Int], _ B: [Int]) -> Int {
        var dp = [Int](repeating: 0, count: B.count+1)

        for i in 1...A.count {
            var prev = 0
            for j in 1...B.count {
                let cur = dp[j]
                if A[i-1] == B[j-1] {
                    dp[j] = prev + 1
                } else {
                    dp[j] = max(dp[j-1], dp[j])
                }
                prev = cur
            }
        }

        return dp[B.count]
    }

}
