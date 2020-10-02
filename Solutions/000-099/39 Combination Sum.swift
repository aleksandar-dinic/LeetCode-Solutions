//
//  39 Combination Sum.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 02/10/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/combination-sum/
class Solution {

    /// Finds a list of all unique combinations of `candidates`, where the chosen numbers
    /// sum to `target`.
    ///
    /// - Parameters:
    ///   - candidates: An array of distinct integers.
    ///   - target: A target integer.
    /// - Returns: A list of all unique combinations.
    ///
    /// - Complexity:
    ///   - time: O(n^m), where n is the length of `candidates` and m is the `target` value.
    ///   - space: O(m), where m is the `target` value.
    func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
        var ans = [[Int]]()
        var comb = [Int]()
        backtrack(remain: target, comb: &comb, start: 0, candidates: candidates, ans: &ans)
        return ans
    }

    private func backtrack(remain: Int, comb: inout [Int], start: Int, candidates: [Int], ans: inout [[Int]]) {
        guard remain >= 0 else { return }

        guard remain != 0 else {
            ans.append(comb)
            return
        }

        for i in start..<candidates.count {
            comb.append(candidates[i])
            backtrack(remain: remain - candidates[i], comb: &comb, start: i, candidates: candidates, ans: &ans)
            comb.removeLast()
        }
    }

}
