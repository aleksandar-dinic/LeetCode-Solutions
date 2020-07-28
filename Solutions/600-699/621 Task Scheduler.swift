//
//  621 Task Scheduler.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 28/07/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/task-scheduler/
class Solution {

    /// Calculates the least number of units of times that the CPU will take to finish all
    /// the given tasks.
    ///
    /// - Parameters:
    ///   - tasks: A char array representing tasks CPU needs to do.
    ///   - n: The cooldown period between two same tasks.
    /// - Returns: The least number of units of time.
    ///
    /// - Complexity:
    ///   - time: O(n), where n is the length of the tasks.
    ///   - space: O(1), only constant space is used.
    func leastInterval(_ tasks: [Character], _ n: Int) -> Int {
        guard !tasks.isEmpty else { return 0 }

        var counter = [Int](repeating: 0, count: 26)
        let offset = "A".utf8.first ?? 0

        for task in String(tasks).utf8 {
            counter[Int(task - offset)] += 1
        }

        var mostFrequency = 0
        var numOfMostFrequency = 0
        for count in counter {
            if count == mostFrequency {
                numOfMostFrequency += 1
            } else if count > mostFrequency {
                mostFrequency = count
                numOfMostFrequency = 1
            }
        }

        return max((n + 1) * (mostFrequency - 1) + numOfMostFrequency, tasks.count)
    }

}
