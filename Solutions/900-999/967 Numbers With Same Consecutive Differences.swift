//
//  967 Numbers With Same Consecutive Differences.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 18/08/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/numbers-with-same-consecutive-differences/
class Solution {

    /// Finds all non-negative integers of length N such that the absolute difference
    /// between every two consecutive digits is K.
    ///
    /// - Parameters:
    ///   - N: The length of the integers.
    ///   - K: The absolute difference.
    /// - Returns: All non-negative integers of length N such that the absolute difference
    ///   between every two consecutive digits is K.
    ///
    /// - Complexity:
    ///     - time: O(n * 2^n), where n is the length of the integers.
    ///     - space: O(2^n), where n is the length of the integers.
    func numsSameConsecDiff(_ N: Int, _ K: Int) -> [Int] {
        guard N > 1 else { return [0, 1, 2, 3, 4, 5, 6, 7, 8, 9] }

        var ans = [Int]()

        for num in 1..<10 {
            dfs(N-1, num, K, &ans)
        }

        return ans
    }

    private func dfs(_ n: Int, _ num: Int, _ k: Int, _ ans: inout [Int]) {
        guard n > 0 else {
            ans.append(num)
            return
        }

        var nextDigits = [Int]()

        let tailDigits = num % 10
        nextDigits.append(tailDigits + k)

        if k != 0 {
            nextDigits.append(tailDigits - k)
        }

        for nextDigit in nextDigits {
            guard nextDigit >= 0, nextDigit < 10 else { continue }
            dfs(n-1, num * 10 + nextDigit, k, &ans)
        }
    }

}
