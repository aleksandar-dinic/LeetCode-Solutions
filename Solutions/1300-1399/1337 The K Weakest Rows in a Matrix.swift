//
//  1337 The K Weakest Rows in a Matrix.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 15/02/2021.
//  Copyright © 2021 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/the-k-weakest-rows-in-a-matrix/
class Solution {

    /// Finds the indexes of the `k` weakest rows in the matrix ordered from the
    /// weakest to the strongest.
    ///
    /// - Parameters:
    ///   - mat: The matrix.
    ///   - k: An integer.
    /// - Returns: The indexes of the `k` weakest rows.
    ///
    /// - Complexity:
    ///   - time: O(m * n), where m is the number of rows in the matrix, and m is
    ///   the number of columns in the matrix.
    ///   - space: O(k), where k is the given `k`.
    func kWeakestRows(_ mat: [[Int]], _ k: Int) -> [Int] {
        let m = mat.count
        let n = mat[0].count
        
        var ans = [Int](repeating: 0, count: k)
        var next = 0
        
        for col in 0..<n where next < k {
            for row in 0..<m where next < k {
                guard mat[row][col] == 0, (col == 0 || mat[row][col-1] == 1) else { continue }
                ans[next] = row
                next += 1
            }
        }
        
        for row in 0..<m where next < k {
            guard mat[row][n-1] == 1 else { continue }
            ans[next] = row
            next += 1
        }
        
        return ans
    }

}
