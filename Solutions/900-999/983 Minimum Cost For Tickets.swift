//
//  983 Minimum Cost For Tickets.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 25/08/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/minimum-cost-for-tickets/
class Solution {

    /// Calculates the minimum number of dollars for traveling every day.
    ///
    /// - Parameters:
    ///   - days: The days of the year in the travel plan.
    ///   - costs: Train ticket costs.
    /// - Returns: The minimum number of dollars for travel.
    ///
    /// - Complexity:
    ///     - time: O(n), where n is the number of the days in the travel plan.
    ///     - space: O(n), where n is the number of the days in the travel plan.
    func mincostTickets(_ days: [Int], _ costs: [Int]) -> Int {
        var memo = [Int](repeating: -1, count: days.count)
        let durations = [1, 7, 30]

        return dp(0, days, costs, &memo, durations)
    }

    private func dp(_ i: Int, _ days: [Int], _ costs: [Int], _ memo: inout [Int], _ durations: [Int]) -> Int {
        guard i < days.count else { return 0 }

        guard memo[i] == -1 else { return memo[i] }

        var ans = Int.max
        var j = i

        for k in 0..<3 {
            while j < days.count, days[j] < days[i] + durations[k] {
                j += 1
            }

            ans = min(ans, dp(j, days, costs, &memo, durations) + costs[k])
        }

        memo[i] = ans
        return ans
    }

}
