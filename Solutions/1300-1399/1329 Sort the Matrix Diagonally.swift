//
//  1329 Sort the Matrix Diagonally.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 23/01/2021.
//  Copyright © 2021 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/sort-the-matrix-diagonally/
class Solution {

    /// Sorts each matrix diagonal in ascending order.
    /// 
    /// - Parameter mat: The matrix.
    /// - Returns: The matrix with sorted diagonals.
    ///
    /// - Complexity:
    ///   - time: O(n * m * log(min(n, m))), where n is the number of rows in the
    ///   `mat`, and m is the number of columns in the `mat`.
    ///   - space: O(n * m), where n is the number of rows in the `mat`, and m is
    ///   the number of columns in the `mat`.
    func diagonalSort(_ mat: [[Int]]) -> [[Int]] {
        var mat = mat
        let n = mat.count
        let m = mat[0].count
        
        for i in 0..<n {
            sortDiagonal(in: &mat, i: i, j: 0, n: n, m: m)
        }
        
        for j in 0..<m {
            sortDiagonal(in: &mat, i: 0, j: j, n: n, m: m)
        }
        
        return mat
    }
    
    private func sortDiagonal(in mat: inout [[Int]], i: Int, j: Int, n: Int, m: Int) {
        var diagonal = [Int]()
        var i = i
        var j = j
        
        while i < n, j < m {
            diagonal.append(mat[i][j])
            i += 1
            j += 1
        }
        
        diagonal.sort()
        
        while i > 0, j > 0 {
            i -= 1
            j -= 1
            mat[i][j] = diagonal.removeLast()
        }
    }

}
