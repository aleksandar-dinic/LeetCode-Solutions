//
//  1673 Find the Most Competitive Subsequence.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 21/01/2021.
//  Copyright © 2021 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/find-the-most-competitive-subsequence/
class Solution {

    /// Finds the most competitive subsequence of `nums` of size `k`.
    ///
    /// - Parameters:
    ///   - nums: An integer array.
    ///   - k: A positive integer.
    /// - Returns: The most competitive subsequence.
    ///
    /// - Complexity:
    ///   - time: O(n), where n is the length of `nums`.
    ///   - space: O(n), where n is the length of `nums`.
    func mostCompetitive(_ nums: [Int], _ k: Int) -> [Int] {
        var tmp = [Int]()
        var count = nums.count - k
        
        for num in nums {
            while !tmp.isEmpty, let last = tmp.last, last > num, count > 0 {
                tmp.removeLast()
                count -= 1
            }
            tmp.append(num)
        }
        
        return Array(tmp[0..<k])
    }

}
