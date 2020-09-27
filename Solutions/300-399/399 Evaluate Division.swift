//
//  399 Evaluate Division.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 27/09/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/evaluate-division/
class Solution {

    /// Evaluates division for given equations.
    ///
    /// - Parameters:
    ///   - equations: The equations in the format A / B = k.
    ///   - values: The values.
    ///   - queries: The queries.
    /// - Returns: The answers, if the answer does not exist return -1.0.
    ///
    /// - Complexity:
    ///   - time: O((n + m) log(n)), where n is the number of equations and m is the number
    ///   of queries.
    ///   - space: O(n), where n is the number of equations.
    func calcEquation(_ equations: [[String]], _ values: [Double], _ queries: [[String]]) -> [Double] {
        var gidWeight = [String: (key: String, value: Double)]()

        for (i, equation) in equations.enumerated() {
            union(&gidWeight, dividend: equation[0], divisor: equation[1], value: values[i])
        }

        var ans = [Double]()

        for querie in queries {
            if !gidWeight.keys.contains(querie[0]) || !gidWeight.keys.contains(querie[1]) {
                ans.append(-1.0)

            } else {
                let dividendEntry = find(&gidWeight, querie[0])
                let divisorEntry = find(&gidWeight, querie[1])

                if dividendEntry.key != divisorEntry.key {
                    ans.append(-1.0)
                } else {
                    ans.append(dividendEntry.value / divisorEntry.value)
                }
            }
        }

        return ans
    }

    private func union(_ gidWeight: inout [String: (key: String, value: Double)], dividend: String, divisor: String, value: Double) {
        let dividendEntry = find(&gidWeight, dividend)
        let divisorEntry = find(&gidWeight, divisor)

        guard dividendEntry.key != divisorEntry.key else { return }
        gidWeight[dividendEntry.key] = (divisorEntry.key, divisorEntry.value * value / dividendEntry.value)

    }

    private func find(_ gidWeight: inout [String: (key: String, value: Double)], _ nodeID: String) -> (key: String, value: Double) {
        if !gidWeight.keys.contains(nodeID) {
            gidWeight[nodeID] = (nodeID, 1.0)
        }

        let entry = gidWeight[nodeID] ?? (nodeID, 1.0)

        guard entry.key != nodeID else { return entry }
        let newEntry = find(&gidWeight, entry.key)
        gidWeight[nodeID] = (newEntry.key, entry.value * newEntry.value)

        return gidWeight[nodeID] ?? (nodeID, 1.0)
    }

}
