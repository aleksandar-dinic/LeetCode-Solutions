//
//  849 Maximize Distance to Closest Person.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 29/10/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/maximize-distance-to-closest-person/
class Solution {

    /// Finds the maximum distance to the closest person.
    ///
    /// - Parameter seats: An array representing a row of seats.
    /// - Returns: The maximum distance to the closest person.
    ///
    /// - Complexity:
    ///     - time: O(n), where n is the number of seats.
    ///     - space: O(1), only constant space is used.
    func maxDistToClosest(_ seats: [Int]) -> Int {
        var left = -1
        var ans = 0

        for (i, seat) in seats.enumerated() {
            guard seat == 1 else { continue }

            ans = left == -1 ? max(ans, i) : max(ans, (i - left) / 2)

            left = i
        }

        guard let last = seats.last, last == 1 else {
            return max(ans, seats.count - left - 1)
        }

        return ans
    }

}
