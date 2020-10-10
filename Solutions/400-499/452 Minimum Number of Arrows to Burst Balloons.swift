//
//  452 Minimum Number of Arrows to Burst Balloons.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 10/10/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/minimum-number-of-arrows-to-burst-balloons/
class Solution {

    /// Finds the minimum number of arrows that must be shot to burst all balloons.
    ///
    /// - Parameter points: An array of balloons points.
    /// - Returns: The minimum number of arrows.
    ///
    /// - Complexity:
    ///   - time: O(n log(n)), where n is the number of points.
    ///   - space: O(n), where n is the number of points.
    func findMinArrowShots(_ points: [[Int]]) -> Int {
        guard !points.isEmpty else { return 0 }
        let points = points.sorted(by: { $0[1] < $1[1] })

        var ans = 1
        var end = points[0][1]

        for point in points {
            guard end < point[0] else { continue }
            ans += 1
            end = point[1]
        }

        return ans
    }

}
