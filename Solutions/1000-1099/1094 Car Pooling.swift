//
//  1094 Car Pooling.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 21/09/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/car-pooling/
class Solution {

    /// Finds if it is possible to pick up and drop off all passengers for all the given
    /// trips.
    ///
    /// - Parameters:
    ///   - trips: A list of trips.
    ///   - capacity: A number of empty seats.
    /// - Returns: True if it is possible, otherwise returns false.
    ///
    /// - Complexity:
    ///   - time: O(max(n, 1_001)), where n is the number of `trips`.
    ///   - space: O(1), only constant space is used.
    func carPooling(_ trips: [[Int]], _ capacity: Int) -> Bool {
        var timestamp = [Int](repeating: 0, count: 1_001)

        for trip in trips {
            timestamp[trip[1]] += trip[0]
            timestamp[trip[2]] -= trip[0]
        }

        var used = 0
        for time in timestamp {
            used += time
            guard used > capacity else { continue }
            return false
        }

        return true
    }

}
