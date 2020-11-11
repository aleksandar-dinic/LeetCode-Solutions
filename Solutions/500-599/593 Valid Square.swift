//
//  593 Valid Square.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 11/11/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/valid-square/
class Solution {

    private typealias Point = (x: Int, y: Int)

    /// Finds if the four points could construct a square.
    ///
    /// - Parameters:
    ///   - p1: First point.
    ///   - p2: Second point.
    ///   - p3: Third point.
    ///   - p4: Fourth point.
    /// - Returns: True if the four points could construct a square, otherwise
    /// returns false.
    ///
    /// - Complexity:
    ///   - time: O(1), only constant time is used.
    ///   - space: O(1), only constant space is used.
    func validSquare(_ p1: [Int], _ p2: [Int], _ p3: [Int], _ p4: [Int]) -> Bool {
        let p1 = Point(p1[0], p1[1])
        let p2 = Point(p2[0], p2[1])
        let p3 = Point(p3[0], p3[1])
        let p4 = Point(p4[0], p4[1])
        return check(p1, p2, p3, p4) || check(p1, p3, p2, p4) || check(p1, p2, p4, p3)
    }

    private func check(_ p1: Point, _ p2: Point, _ p3: Point, _ p4: Point) -> Bool {
        dist(p1,p2) > 0 &&
            dist(p1, p2) == dist(p2, p3) &&
            dist(p2, p3) == dist(p3, p4) &&
            dist(p3, p4) == dist(p4, p1) &&
            dist(p1, p3) == dist(p2, p4)
    }

    private func dist(_ p1: Point, _ p2: Point) -> Int {
        (p1.x - p2.x) * (p1.x - p2.x) + (p1.y - p2.y) * (p1.y - p2.y)
    }

}
