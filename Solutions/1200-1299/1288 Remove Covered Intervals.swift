//
//  1288 Remove Covered Intervals.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 04/10/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/remove-covered-intervals/
class Solution {

    /// Calculates the number of intervals that are covered by another interval in the list.
    ///
    /// - Parameter intervals: A list of intervals.
    /// - Returns: The number of remaining intervals.
    ///
    /// - Complexity:
    ///   - time: O(n log(n)), where n is the number of intervals.
    ///   - space: O(n), where n is the number of intervals.
    func removeCoveredIntervals(_ intervals: [[Int]]) -> Int {
        let intervals = intervals.sorted(by: { $0[0] != $1[0] ? $0[0] < $1[0] : $0[1] > $1[1] })

        var ans = 0
        var prevEnd = 0

        for interval in intervals {
            guard prevEnd < interval[1] else { continue }
            ans += 1
            prevEnd = interval[1]
        }

        return ans
    }

}
