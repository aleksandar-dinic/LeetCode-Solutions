//
//  1344 Angle Between Hands of a Clock.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 14/07/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/angle-between-hands-of-a-clock/
class Solution {

    /// Calculates the smaller angle formed between the hour and the minute hand.
    ///
    /// - Parameters:
    ///   - hour: Hour hand.
    ///   - minutes: Minute hand.
    /// - Returns: The smaller angle between the hour and the minute hand.
    ///
    /// - Complexity:
    ///   - time: O(1), only constant time is used.
    ///   - space: O(1), only constant space is used.
    func angleClock(_ hour: Int, _ minutes: Int) -> Double {
        let hour = (Double(hour%12) * 30.0) + (Double(minutes) * 0.5)
        let minutes = Double(minutes) * 6.0
        let ans = Double(abs(minutes - hour))

        return ans <= 180 ? ans : 360 - ans
    }

}
