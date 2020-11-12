//
//  47 Permutations II.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 12/11/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/permutations-ii/
class Solution {

    /// Finds all possible unique permutations in any order.
    ///
    /// - Parameter nums: An array of numbers.
    /// - Returns: All unique permutations.
    ///
    /// - Complexity:
    ///   - time: O(n * n!), where n is the length of the `nums`.
    ///   - space: O(n), where n is the length of the `nums`.
    func permuteUnique(_ nums: [Int]) -> [[Int]] {
        var dict = [Int: Int]()

        for num in nums {
            dict[num, default: 0] += 1
        }

        var ans = [[Int]]()
        var comb = [Int]()
        backtrack(&comb, nums.count, &dict, &ans)
        return ans
    }

    private func backtrack(_ comb: inout [Int], _ n: Int, _ dict: inout [Int: Int], _ ans: inout [[Int]]) {
        guard comb.count != n else {
            ans.append(comb)
            return
        }

        for (_, el) in dict.enumerated() {
            guard el.value != 0 else { continue }
            comb.append(el.key)
            dict[el.key, default: 0] -= 1
            backtrack(&comb, n, &dict, &ans)
            comb.removeLast()
            dict[el.key] = el.value
        }
    }

}
