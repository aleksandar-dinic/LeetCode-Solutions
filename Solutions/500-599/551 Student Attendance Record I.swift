//
//  551 Student Attendance Record I.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 22/06/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/student-attendance-record-i/
class Solution {

    /// Finds whether the student could be rewarded according to his attendance record.
    ///
    /// - Parameter s: A string representing an attendance record for a student.
    /// - Returns: True if the student could be rewarded, otherwise returns false.
    ///
    /// - Complexity:
    ///   - time: O(n), where n is the number of records in s.
    ///   - space: O(1), only constant space is used.
    func checkRecord(_ s: String) -> Bool {
        var a = 0
        var l = 0

        for c in s {
            if c == "A" {
                a += 1
            }

            if c == "L" {
                l += 1
            } else {
                l = 0
            }

            guard a < 2, l < 3 else { return false }
        }

        return true
    }

}
