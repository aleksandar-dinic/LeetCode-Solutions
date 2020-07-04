//
//  264 Ugly Number II.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 04/07/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/ugly-number-ii/
class Solution {

    /// Finds the n-th ugly number.
    ///
    /// - Parameter n: The integer.
    /// - Returns: N-th ugly number.
    ///
    /// - Complexity:
    ///   - time: O(n), where n is given n.
    ///   - space: O(n), where n is given n.
    func nthUglyNumber(_ n: Int) -> Int {
        guard n > 0 else { return -1 }
        var ans = [Int](repeating: 0, count: n)
        ans[0] = 1

        var i2 = 0
        var i3 = 0
        var i5 = 0

        for i in 1..<n {
            ans[i] = min(ans[i2] * 2, ans[i3] * 3, ans[i5] * 5)

            if ans[i] == ans[i2] * 2 {
                i2 += 1
            }
            if ans[i] == ans[i3] * 3 {
                i3 += 1
            }
            if ans[i] == ans[i5] * 5 {
                i5 += 1
            }
        }

        return ans[n-1]
    }

}
