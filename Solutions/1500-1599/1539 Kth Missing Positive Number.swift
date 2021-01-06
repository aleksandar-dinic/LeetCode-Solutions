//
//  1539 Kth Missing Positive Number.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 06/01/2021.
//  Copyright © 2021 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/kth-missing-positive-number/
class Solution {

    /// Finds the `k`-th positive integer that is missing from the given array.
    ///
    /// - Parameters:
    ///   - arr: An array arr sorted in a strictly increasing order.
    ///   - k: An integer.
    /// - Returns: The `k`-th missing integer.
    ///
    /// - Complexity:
    ///   - time: O(log(n)), where n is the length of `arr`.
    ///   - space: O(1), only constant space is used.
    func findKthPositive(_ arr: [Int], _ k: Int) -> Int {
        var left = 0
        var right = arr.count - 1
        
        while left <= right {
            let mid = left + (right - left) / 2
    
            if arr[mid] - mid - 1 < k {
                left = mid + 1
            } else {
                right = mid - 1
            }
        }
        
        return left + k
    }

}
