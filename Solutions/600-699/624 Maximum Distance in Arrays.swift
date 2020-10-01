//
//  624 Maximum Distance in Arrays.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 01/10/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/maximum-distance-in-arrays/
class Solution {

    /// Finds the maximum distance between two integers.
    ///
    /// - Parameter arrays: Arrays where each array is sorted in ascending order.
    /// - Returns: The maximum distance.
    ///
    /// - Complexity:
    ///   - time: O(n), where n is the length of `arrays`.
    ///   - space: O(1), only constant space is used.
    func maxDistance(_ arrays: [[Int]]) -> Int {
        guard var minVal = arrays.first?.first,
                var maxVal = arrays.first?.last else {
            return -1
        }

        var ans = 0

        for i in 1..<arrays.count {
            guard let first = arrays[i].first, let last = arrays[i].last else { continue }

            ans = max(ans, abs(last - minVal), abs(maxVal - first))

            minVal = min(minVal, first)
            maxVal = max(maxVal, last)
        }

        return ans
    }

}
