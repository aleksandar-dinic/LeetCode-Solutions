//
//  56 Merge Intervals.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 18/11/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/merge-intervals/
class Solution {

    /// Merge all overlapping intervals.
    ///
    /// - Parameter intervals: An array of `intervals`.
    /// - Returns: An array of the non-overlapping intervals.
    ///
    /// - Complexity:
    ///   - time: O(n log(n)), where n is the number of intervals.
    ///   - space: O(n), where n is the number of intervals.
    func merge(_ intervals: [[Int]]) -> [[Int]] {
        guard !intervals.isEmpty else { return [] }
        var intervals = intervals.sorted(by: { $0[0] < $1[0] })

        var ans = [[Int]]()
        var start = intervals[0][0]
        var end = intervals[0][1]

        for interval in intervals {
            guard end < interval[0] else {
                end = max(end, interval[1])
                continue
            }
            ans.append([start, end])
            start = interval[0]
            end = interval[1]
        }

        ans.append([start, end])

        return ans
    }

}
