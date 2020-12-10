//
//  941 Valid Mountain Array.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 10/12/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/valid-mountain-array/
class Solution {

    /// Finds if and only if the given array is a valid mountain array.
    ///
    /// - Parameter A: An array of integers.
    /// - Returns: True if `A` is a valid mountain array, otherwise returns false.
    ///
    /// - Complexity:
    ///     - time: O(n), where n is the length of `A`.
    ///     - space: O(1), only constant space is used.
    func validMountainArray(_ A: [Int]) -> Bool {
        let n = A.count
        guard n >= 3 else { return false }
        
        var i = 0
        
        while (i + 1) < n, A[i] < A[i+1] {
            i += 1
        }
        
        guard i != 0, i != n - 1 else { return false }
        
        while (i + 1) < n, A[i] > A[i+1] {
            i += 1
        }
        
        return i == n - 1
    }

}
