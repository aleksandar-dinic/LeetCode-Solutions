//
//  933 Number of Recent Calls.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 01/10/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/number-of-recent-calls/
class RecentCounter {

    private var timeLimit: Int
    private var slideWindow: [Int]

    init(timeLimit: Int = 3_000) {
        self.timeLimit = timeLimit
        slideWindow = [Int]()
    }

    /// Adds a new request at a time `t`.
    ///
    /// - Parameter t: Time in milliseconds.
    /// - Returns: The number of requests that have happened in the past `timeLimit`
    ///   milliseconds (including the new request).
    ///
    /// - Complexity:
    ///     - time: O(n), where n is the number of calls.
    ///     - space: O(n), where n is the number of calls.
    func ping(_ t: Int) -> Int {
        slideWindow.append(t)

        var remove = 0
        for time in slideWindow {
            guard t - time > timeLimit else { break }
            remove += 1
        }
        if remove > 0 {
            slideWindow.removeFirst(remove)
        }

        return slideWindow.count
    }

}
