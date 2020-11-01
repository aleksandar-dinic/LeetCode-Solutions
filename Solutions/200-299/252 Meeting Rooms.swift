//
//  252 Meeting Rooms.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 01/11/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/meeting-rooms/
class Solution {

    /// Determines if a person can attend all meetings.
    ///
    /// - Parameter intervals: An array of meeting time intervals.
    /// - Returns: True if a person can attend all meetings, otherwise returns false.
    ///
    /// - Complexity:
    ///   - time: O(n log(n)), where n is the number of `intervals`.
    ///   - space: O(n), where n is the number of `intervals`.
    func canAttendMeetings(_ intervals: [[Int]]) -> Bool {
        guard !intervals.isEmpty else { return true }

        var intervals = intervals.sorted(by: { $0[0] < $1[0] })

        for i in 1..<intervals.count {
            guard intervals[i-1][1] > intervals[i][0] else { continue }
            return false
        }

        return true
    }

}
