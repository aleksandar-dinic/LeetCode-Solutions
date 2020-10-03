//
//  532 K-diff Pairs in an Array.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 03/10/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/k-diff-pairs-in-an-array/
class Solution {

    /// Calculates the number of unique `k`-diff pairs in an array.
    ///
    /// - Parameters:
    ///   - nums: The array of integers.
    ///   - k: An integer.
    /// - Returns: The number of unique `k`-diff pairs.
    ///
    /// - Complexity:
    ///   - time: O(n), where n is the length of the `nums`.
    ///   - space: O(n), where n is the length of the `nums`.
    func findPairs(_ nums: [Int], _ k: Int) -> Int {
        var dict = [Int: Int]()

        for num in nums {
            dict[num, default: 0] += 1
        }

        var ans = 0

        for (_, el) in dict.enumerated() {
            guard (k == 0 && el.value > 1) || (k > 0 && dict.keys.contains(el.key + k)) else {
                continue
            }
            ans += 1
        }

        return ans
    }

}
