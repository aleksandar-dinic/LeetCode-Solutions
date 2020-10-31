//
//  57 Insert Interval.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 13/09/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/insert-interval/
class Solution {

    /// Inserts new interval in a set of non-overlapping intervals.
    ///
    /// - Parameters:
    ///   - intervals: A set of non-overlapping intervals.
    ///   - newInterval: A new interval.
    /// - Returns: A new set of non-overlapping intervals with the `newInterval` in it.
    ///
    /// - Complexity:
    ///   - time: O(n), where n is the number of `intervals`.
    ///   - space: O(n), where n is the number of `intervals`.
    func insert(_ intervals: [[Int]], _ newInterval: [Int]) -> [[Int]] {
        var ans = [[Int]]()
        var i = 0

        while i < intervals.count, intervals[i][1] < newInterval[0] {
            ans.append(intervals[i])
            i += 1
        }

        var newInterval = newInterval
        while i < intervals.count, intervals[i][0] <= newInterval[1] {
            newInterval[0] = min(intervals[i][0], newInterval[0])
            newInterval[1] = max(intervals[i][1], newInterval[1])
            i += 1
        }

        ans.append(newInterval)

        while i < intervals.count {
            ans.append(intervals[i])
            i += 1
        }

        return ans
    }

}
