//
//  977 Squares of a Sorted Array.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 13/09/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/squares-of-a-sorted-array/
class Solution {

    /// Returns an array of the squares of each number from the given array, in sorted
    /// non-decreasing order.
    ///
    /// - Parameter A: An array of integers sorted in non-decreasing order.
    /// - Returns: An array of squares.
    ///
    /// - Complexity:
    ///     - time: O(n), where n is the length of the `A`.
    ///     - space: O(n), where n is the length of the `A`.
    func sortedSquares(_ A: [Int]) -> [Int] {
        let n = A.count
        var i = n - 1

        while i >= 0, A[i] > 0 {
            i -= 1
        }

        var ans = [Int]()
        var j = i + 1

        while i >= 0 || j < n {
            let ith = i >= 0 ? A[i] * A[i] : Int.max
            let jth = j < n ? A[j] * A[j] : Int.max

            if ith < jth {
                ans.append(ith)
                i -= 1
            } else {
                ans.append(jth)
                j += 1
            }
        }

        return ans
    }

}
