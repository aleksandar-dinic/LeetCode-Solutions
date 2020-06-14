//
//  11 Container With Most Water.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 14/06/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/container-with-most-water/
class Solution {

    /// Forms a container which contains the most water.
    ///
    /// - Parameter height: Non-negative integers.
    /// - Returns: The max area of water.
    ///
    /// - Complexity:
    ///   - time: O(n), where n is the number of heights.
    ///   - space: O(1), only constant space is used.
    func maxArea(_ height: [Int]) -> Int {
        var start = 0
        var end = height.count - 1

        var ans = 0

        while start < end {
            ans = max(ans, min(height[start], height[end]) * (end - start))

            if height[start] < height[end] {
                start += 1
            } else {
                end -= 1
            }
        }

        return ans
    }

}
