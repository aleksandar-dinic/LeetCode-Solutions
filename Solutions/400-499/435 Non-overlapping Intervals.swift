//
//  435 Non-overlapping Intervals.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 15/08/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/non-overlapping-intervals/
class Solution {

    /// Finds the minimum number of intervals for removal to make the rest of the intervals
    /// non-overlapping.
    ///
    /// - Parameter intervals: The intervals.
    /// - Returns: The minimum number of intervals for removal.
    ///
    /// - Complexity:
    ///   - time: O(n log(n)), where n is the number of intervals.
    ///   - space: O(n), where n is the number of intervals.
    func eraseOverlapIntervals(_ intervals: [[Int]]) -> Int {
        guard !intervals.isEmpty else { return 0 }
        let intervals = intervals.sorted(by: { $0[1] != $1[1] ? $0[1] < $1[1] : $0[0] < $1[0] })

        var end = Int.min
        var ans = 0

        for interval in intervals {
            if interval[0] >= end {
                end = interval[1]
            } else {
                ans += 1
            }
        }

        return ans
    }

}
