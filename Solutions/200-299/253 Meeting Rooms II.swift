//
//  253 Meeting Rooms II.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 15/10/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/meeting-rooms-ii/
class Solution {

    /// Finds the minimum number of conference rooms needed for meetings.
    ///
    /// - Parameter intervals: An array of meeting time intervals.
    /// - Returns: The minimum number of conference rooms.
    ///
    /// - Complexity:
    ///   - time: O(n log(n)), where n is the number of intervals.
    ///   - space: O(n), where n is the number of intervals.
    func minMeetingRooms(_ intervals: [[Int]]) -> Int {
        guard !intervals.isEmpty else { return 0 }

        let start = intervals.map { $0[0] }.sorted()
        let end = intervals.map { $0[1] }.sorted()

        var ans = 0
        var j = 0

        for i in 0..<start.count {
            if start[i] < end[j] {
                ans += 1
            } else {
                j += 1
            }
        }

        return ans
    }

}
