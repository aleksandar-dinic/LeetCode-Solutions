//
//  495 Teemo Attacking.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 26/09/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/teemo-attacking/
class Solution {

    /// Finds the total time that the enemy is in poisoned condition.
    ///
    /// - Parameters:
    ///   - timeSeries: Attacking time series.
    ///   - duration: The poisoning time duration.
    /// - Returns: The total time that the enemy is in poisoned condition.
    ///
    /// - Complexity:
    ///   - time: O(n), where n is the length of `timeSeries`.
    ///   - space: O(1), only constant space is used.
    func findPoisonedDuration(_ timeSeries: [Int], _ duration: Int) -> Int {
        guard !timeSeries.isEmpty else { return 0 }

        var ans = duration
        for i in 0..<timeSeries.count - 1 {
            ans += min(duration, timeSeries[i + 1] - timeSeries[i])
        }

        return ans
    }

}
