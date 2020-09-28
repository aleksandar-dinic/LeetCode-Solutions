//
//  713 Subarray Product Less Than K.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 28/09/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/subarray-product-less-than-k/
class Solution {

    /// Counts the number of contiguous subarrays where the product of all the elements
    /// in the subarray is less than `k`.
    ///
    /// - Parameters:
    ///   - nums: An array of positive integers.
    ///   - k: The value `k`.
    /// - Returns: The number of contiguous subarrays.
    ///
    /// - Complexity:
    ///     - time: O(n), where n is the length of `nums`.
    ///     - space: O(1), only constant space is used.
    func numSubarrayProductLessThanK(_ nums: [Int], _ k: Int) -> Int {
        guard k > 1 else { return 0 }
        var ans = 0
        var prod = 1
        var j = 0

        for (i, num) in nums.enumerated() {
            prod *= num
            while prod >= k {
                prod /= nums[j]
                j += 1
            }
            ans += i - j + 1
        }

        return ans
    }

}
