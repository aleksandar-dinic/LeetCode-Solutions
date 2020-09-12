//
//  216 Combination Sum III.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 12/09/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/combination-sum-iii/
class Solution {

    /// Finds all possible combinations of `k` numbers that add up to a number `n`.
    ///
    /// - Parameters:
    ///   - k: The number of digits in combination.
    ///   - n: The number.
    /// - Returns: All possible combinations.
    ///
    /// - Complexity:
    ///   - time: O(m), where m is the number of combinations.
    ///   - space: O(m), where m is the number of combinations.
    func combinationSum3(_ k: Int, _ n: Int) -> [[Int]] {
        var ans = [[Int]]()
        var curr = [Int]()
        backtracking(k: k, n: n, start: 0, curr: &curr, ans: &ans)
        return ans
    }

    private func backtracking(k: Int, n: Int, start: Int, curr: inout [Int], ans: inout [[Int]]) {
        if n == 0, curr.count == k {
            ans.append(curr)
            return
        } else if n < 0 || curr.count == k {
            return
        }

        for i in start..<9 {
            curr.append(i + 1)
            backtracking(k: k, n: n - i - 1, start: i + 1, curr: &curr, ans: &ans)
            curr.removeLast()
        }
    }

}
