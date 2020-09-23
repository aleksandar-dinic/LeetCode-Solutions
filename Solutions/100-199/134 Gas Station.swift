//
//  134 Gas Station.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 23/09/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/gas-station/
class Solution {

    /// Finds out if you can once travel around the circle in a clockwise direction.
    ///
    /// - Parameters:
    ///   - gas: The gas stations.
    ///   - cost: Gas costs for travel from station `i` to the next station (i + 1).
    /// - Returns: The starting gas station's index if you can travel, otherwise returns -1.
    ///
    /// - Complexity:
    ///   - time: O(n), where n is the number of gas stations.
    ///   - space: O(1), only constant space is used.
    func canCompleteCircuit(_ gas: [Int], _ cost: [Int]) -> Int {
        var totalTank = 0
        var currTank = 0
        var startingStation = 0

        for i in 0..<gas.count {
            totalTank += gas[i] - cost[i]
            currTank += gas[i] - cost[i]

            guard currTank < 0 else { continue }
            startingStation = i + 1
            currTank = 0
        }

        return totalTank >= 0 ? startingStation : -1
    }

}
