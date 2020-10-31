//
//  74 Search a 2D Matrix.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 16/10/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/search-a-2d-matrix/
class Solution {

    /// Finds if a value exists in an m x n matrix.
    ///
    /// - Parameters:
    ///   - matrix: The matrix.
    ///   - target: The target value.
    /// - Returns: True if `target` exists in the matrix, otherwise returns false.
    ///
    /// - Complexity:
    ///   - time: O(log(nm)), where n is the number of rows in the `matrix`, and m is
    ///     the number of columns in the `matrix`.
    ///   - space: O(1), only constant space is used.
    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        guard !matrix.isEmpty else { return false }

        let m = matrix.count
        let n = matrix[0].count

        var left = 0
        var right = m * n - 1

        while left <= right {
            let mid = left + (right - left) / 2

            let el = matrix[mid / n][mid % n]
            guard el != target else { return true }

            if el < target {
                left = mid + 1
            } else {
                right = mid - 1
            }
        }

        return false
    }

}
