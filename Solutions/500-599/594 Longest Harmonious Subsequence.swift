//
//  594 Longest Harmonious Subsequence.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 04/02/2021.
//  Copyright © 2021 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/longest-harmonious-subsequence/
class Solution {

    /// Finds the length of the longest harmonious subsequence among all possible
    /// subsequences.
    ///
    /// - Parameter nums: An integer array.
    /// - Returns: The length of longest harmonious subsequence.
    ///
    /// - Complexity:
    ///   - time: O(n), where n is the length of `nums`.
    ///   - space: O(n), where n is the length of `nums`.
    func findLHS(_ nums: [Int]) -> Int {
        var dict = [Int: Int]()
         
        var ans = 0
        for num in nums {
            dict[num, default: 0] += 1
            if let val = dict[num + 1] {
                ans = max(ans, val + (dict[num] ?? 0))
            }
            if let val = dict[num - 1] {
                ans = max(ans, val + (dict[num] ?? 0))
            }
        }
        
        return ans
    }

}
