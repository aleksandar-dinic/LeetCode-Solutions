//
//  1007 Minimum Domino Rotations For Equal Row.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 19/10/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/minimum-domino-rotations-for-equal-row/
class Solution {

    /// Finds the minimum number of rotations so that all the values in `A` are
    /// the same, or all the values in `B` are the same.
    ///
    /// - Parameters:
    ///   - A: `A` array of dominoes.
    ///   - B: `B` array of dominoes.
    /// - Returns: The minimum number of rotations, if it cannot be done returns -1.
    ///
    /// - Complexity:
    ///   - time: O(n), where n is the length of `A` and the length of `B`.
    ///   - space: O(1), only constant space is used.
    func minDominoRotations(_ A: [Int], _ B: [Int]) -> Int {
        let ans = check(A[0], B, A)

        if ans != -1 || A[0] == B[0] {
            return ans
        }

        return check(B[0], B, A)
    }

    private func check(_ x: Int, _ A: [Int], _ B: [Int]) -> Int {
        var ansA = 0
        var ansB = 0

        for i in 0..<A.count {
            guard A[i] == x || B[i] == x else { return -1 }

            if A[i] != x {
                ansA += 1
            } else if B[i] != x {
                ansB += 1
            }
        }

        return min(ansA, ansB)
    }

}
