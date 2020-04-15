//
//  118 Pascal's Triangle.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 15/04/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/pascals-triangle/
class Solution {

    /// Generates the first *numRows* of Pascal's triangle.
    ///
    /// - Parameter numRows: Number of rows.
    ///
    /// - Returns: Pascal's triangle.
    ///
    /// - Complexity:
    ///   - time: O(n * n), where n is the numRows.
    ///   - space: O(n * n), where n is the numRows.
    func generate(_ numRows: Int) -> [[Int]] {
        var ans = [[Int]](repeating: [Int](), count: numRows)

        for i in 0..<numRows {
            ans[i] = [Int](repeating: 0, count: i+1)

            for j in 0..<i+1 {
                if j == 0 || j == i {
                    ans[i][j] = 1
                } else {
                    ans[i][j] = ans[i-1][j-1] + ans[i-1][j]
                }
            }
        }

        return ans
    }

}
