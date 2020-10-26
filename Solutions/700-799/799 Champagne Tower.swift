//
//  799 Champagne Tower.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 26/10/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/champagne-tower/
class Solution {

    /// Finds how full the j-th glass in the i-th row is.
    ///
    /// - Parameters:
    ///   - poured: The number of poured glasses.
    ///   - query_row: Query row.
    ///   - query_glass: Query glass.
    /// - Returns: How full the j-th glass in the i-th row is.
    ///
    /// - Complexity:
    ///     - time: O(n^2), where n is the number of rows.
    ///     - space: O(n^2), where n is the number of rows.
    func champagneTower(_ poured: Int, _ query_row: Int, _ query_glass: Int) -> Double {
        var dp = [[Double]](repeating: [Double](repeating: 0.0, count:102), count: 102)
        dp[0][0] = Double(poured)

        for row in 0...query_row {
            for col in 0...row {
                var q = (dp[row][col] - 1) / 2
                guard q > 0 else { continue }
                dp[row+1][col] += q
                dp[row+1][col+1] += q
            }
        }

        return min(1, dp[query_row][query_glass])
    }

}
