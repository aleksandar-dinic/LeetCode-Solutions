//
//  152 Maximum Product Subarray.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 11/09/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/maximum-product-subarray/
class Solution {

    /// Finds the contiguous subarray within an array that has the largest product.
    ///
    /// - Parameter nums: The array of integers.
    /// - Returns: The largest product.
    ///
    /// - Complexity:
    ///   - time: O(n), where n is the length of `nums`.
    ///   - space: O(1), only constant space is used.
    func maxProduct(_ nums: [Int]) -> Int {
        guard !nums.isEmpty else { return 0 }

        var ans = nums[0]
        var maxSoFar = nums[0]
        var minSoFar = nums[0]

        for i in 1..<nums.count {
            let curr = nums[i]

            let tmpMax = max(curr, maxSoFar * curr, minSoFar * curr)
            minSoFar = min(curr, maxSoFar * curr, minSoFar * curr)
            maxSoFar = tmpMax

            ans = max(ans, maxSoFar)
        }

        return ans
    }

}
