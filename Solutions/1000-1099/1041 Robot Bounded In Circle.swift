//
//  1041 Robot Bounded In Circle.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 17/09/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/robot-bounded-in-circle/
class Solution {

    /// Finds if the robot is bounded in a circle.
    ///
    /// - Parameter instructions: Movement instructions.
    /// - Returns: True if there is a circle that the robot never leaves, otherwise returns
    ///   false.
    ///
    /// - Complexity:
    ///   - time: O(n), where n is the number of `instructions`.
    ///   - space: O(1), only constant space is used.
    func isRobotBounded(_ instructions: String) -> Bool {
        var directions: [(x: Int, y: Int)] = [(0, 1), (1, 0), (0, -1), (-1, 0)]
        var x = 0
        var y = 0
        var idx = 0

        for instruction in instructions {
            if instruction == "L" {
                idx = (idx + 3) % 4
            } else if instruction == "R" {
                idx = (idx + 1) % 4
            } else {
                x += directions[idx].x
                y += directions[idx].y
            }
        }

        return (x == 0 && y == 0) || idx != 0
    }

}
