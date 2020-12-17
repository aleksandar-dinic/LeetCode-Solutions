//
//  454 4Sum II.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 17/12/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/4sum-ii/
class Solution {

    /// Finds how many tuples `(i, j, k, l)` there are such that
    /// `A[i] + B[j] + C[k] + D[l]` is zero.
    ///
    /// - Parameters:
    ///   - A: An array list of integer values.
    ///   - B: An array list of integer values.
    ///   - C: An array list of integer values.
    ///   - D: An array list of integer values.
    /// - Returns: The number of tuples.
    ///
    /// - Complexity:
    ///   - time: O(n^2), where n is the length of the given lists.
    ///   - space: O(n^2), where n is the length of the given lists.
    func fourSumCount(_ A: [Int], _ B: [Int], _ C: [Int], _ D: [Int]) -> Int {
        var dict = [Int: Int]()

        for a in A {
            for b in B {
                dict[a + b, default: 0] += 1
            }
        }

        var ans = 0
        for c in C {
            for d in D {
                guard let val = dict[-(c+d)] else { continue }

                ans += val
            }
        }

        return ans
    }

}
