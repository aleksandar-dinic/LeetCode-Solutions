//
//  1272 Remove Interval.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 15/11/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/remove-interval/
class Solution {

    /// Removes the intersections between any interval in `intervals` and the
    /// interval `toBeRemoved`.
    ///
    /// - Parameters:
    ///   - intervals: A sorted list of disjoint intervals.
    ///   - toBeRemoved: The interval to be removed.
    /// - Returns: A sorted list of intervals after removals.
    ///
    /// - Complexity:
    ///   - time: O(n), where n is the number of intervals.
    ///   - space: O(n), where n is the number of intervals.
    func removeInterval(_ intervals: [[Int]], _ toBeRemoved: [Int]) -> [[Int]] {
        var ans = [[Int]]()

        for interval in intervals {
            guard interval[1] > toBeRemoved[0], interval[0] < toBeRemoved[1] else {
                ans.append(interval)
                continue
            }

            if interval[0] < toBeRemoved[0] {
                ans.append([interval[0], toBeRemoved[0]])
            }

            if interval[1] > toBeRemoved[1] {
                ans.append([toBeRemoved[1], interval[1]])
            }
        }

        return ans
    }

}
