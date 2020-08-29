//
//  489 Robot Room Cleaner.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 29/08/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/robot-room-cleaner/
class Solution {

    private let directions: [(x: Int, y: Int)] = [(-1, 0), (0, 1), (1, 0), (0, -1)]
    private var visited = Set<Cell>()

    /// Cleans all cells in a room.
    ///
    /// - Parameter robot: The robot.
    ///
    /// - Complexity:
    ///   - time: O(4^n), where n is the number of cells in the room.
    ///   - space: O(n), where n is the number of cells in the room.
    func cleanRoom(_ robot: Robot) {
        backtrack(robot, x: 0, y: 0, d: 0)
    }

    private func backtrack(_ robot: Robot, x: Int, y: Int, d: Int) {
        visited.insert(Cell(x: x, y: y))
        robot.clean()

        for i in 0..<4 {
            let newD = (d + i) % 4
            let newX = x + directions[newD].x
            let newY = y + directions[newD].y

            if !visited.contains(Cell(x: newX, y: newY)), robot.move() {
                backtrack(robot, x: newX, y: newY, d: newD)
                goBack(robot)
            }

            robot.turnRight()
        }
    }

    private func goBack(_ robot: Robot) {
        robot.turnRight()
        robot.turnRight()
        robot.move()
        robot.turnRight()
        robot.turnRight()
    }

}

struct Cell: Hashable {

    let x: Int
    let y: Int

}

/// Provided Code
public class Robot {

    /// Moves forward.
    ///
    /// - Returns: True if the cell in front is open and the robot moves into the cell,
    /// otherwise returns false and robot stays in the current cell.
    public func move() -> Bool

    /// Turns left for 90 degrees.
    public func turnLeft()

    /// Turns right for 90 degrees.
    public func turnRight()

    /// Cleans the current cell.
    public func clean()

}
