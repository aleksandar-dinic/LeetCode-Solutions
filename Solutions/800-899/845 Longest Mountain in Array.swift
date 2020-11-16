//
//  845 Longest Mountain in Array.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 16/11/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/longest-mountain-in-array/
class Solution {

    /// Finds the length of the longest mountain.
    ///
    /// - Parameter A: An array of integers.
    /// - Returns: The length of the longest mountain, if there is no mountain
    ///   returns 0.
    ///
    /// - Complexity:
    ///     - time: O(n), where n is the length of `A`.
    ///     - space: O(1), only constant space is used.
    func longestMountain(_ A: [Int]) -> Int {
        guard A.count >= 3 else { return 0 }
        var ans = 0
        var up = 0
        var down = 0

        for i in 1..<A.count {
            if down > 0 && A[i - 1] < A[i] || A[i - 1] == A[i] {
                up = 0
                down = 0
            }

            if A[i - 1] < A[i] {
                up += 1
            }

            if A[i - 1] > A[i] {
                down += 1
            }

            guard up > 0, down > 0 else { continue }
            ans = max(ans, up + down + 1)
        }

        return ans
    }

}
