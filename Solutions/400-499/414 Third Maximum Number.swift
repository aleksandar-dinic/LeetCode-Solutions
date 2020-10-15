//
//  414 Third Maximum Number.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 15/10/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/third-maximum-number/
class Solution {

    /// Finds the third maximum number in the given array. If it does not exist, finds
    /// the maximum number.
    ///
    /// - Parameter nums: A non-empty array of integers.
    /// - Returns: The third maximum number in the given array, if it does not exist,
    ///   returns the maximum number.
    ///
    /// - Complexity:
    ///   - time: O(n), where n is the length of `nums`.
    ///   - space: O(1), only constant space is used.
    func thirdMax(_ nums: [Int]) -> Int {
        var top3 = Set<Int>()

        for num in nums {
            top3.insert(num)
            guard top3.count > 3, let min = top3.min() else { continue }
            top3.remove(min)
        }

        guard top3.count == 3 else {
            return top3.max() ?? -1
        }

        return top3.min() ?? -1
    }

}
