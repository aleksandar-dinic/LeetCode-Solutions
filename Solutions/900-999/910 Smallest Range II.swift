//
//  910 Smallest Range II.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 21/12/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/smallest-range-ii/
class Solution {

    /// Finds the smallest possible difference between the maximum value of `B` and
    /// the minimum value of `B`. `B[i] = A[i] + K` or `B[i] = A[i] - K`.
    ///
    /// - Parameters:
    ///   - A: An array of integers.
    ///   - K: An integer.
    /// - Returns: The smallest possible difference.
    ///
    /// - Complexity:
    ///     - time: O(n log(n)), where n is the length of `A`.
    ///     - space: O(1), only constant space is used.
    func smallestRangeII(_ A: [Int], _ K: Int) -> Int {
        let n = A.count
        let a = A.sorted()
        var ans = a[n-1] - a[0]
        
        for i in 0..<n-1 {
            let high = max(a[n-1] - K, a[i] + K)
            let low = min(a[0] + K, a[i+1] - K)
            ans = min(ans, high - low)
        }
        
        return ans
    }

}
