//
//  1099 Two Sum Less Than K.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 08/11/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/two-sum-less-than-k/
class Solution {

    /// Finds the maximum sum less than `K` between two numbers in a given array. If
    /// this sum does not exist, it returns -1.
    ///
    /// - Parameters:
    ///   - A: An array of integers.
    ///   - K: An integer.
    /// - Returns: The maximum sum if exists, otherwise returns -1.
    ///
    /// - Complexity:
    ///   - time: O(n log(n)), where n is the length of `A`.
    ///   - space: O(n), where n is the length of `A`.
    func twoSumLessThanK(_ A: [Int], _ K: Int) -> Int {
        var arr = A.sorted(by: <)

        var ans = -1
        var i = 0
        var j = arr.count - 1

        while i < j {
            let sum = arr[i] + arr[j]

            if sum < K {
                ans = max(ans, sum)
                i += 1
            } else {
                j -= 1
            }
        }

        return ans
    }

}
