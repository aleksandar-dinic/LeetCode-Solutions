//
//  359 Logger Rate Limiter.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 01/08/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/logger-rate-limiter/
class Logger {

    private var limit: Int
    private var dict: [String: Int]

    /// Initialization of data structures.
    ///
    /// - Parameter limit: A number of last seconds in which message can be printed.
    init(_ limit: Int = 10) {
        self.limit = limit
        dict = [String: Int]()
    }

    /// Finds if the message should be printed in the given timestamp.
    ///
    /// - Parameters:
    ///   - timestamp: The timestamp in seconds granularity.
    ///   - message: The message.
    /// - Returns: True if the message should be printed in the given timestamp, otherwise
    ///   returns false.
    ///
    /// - Complexity:
    ///   - time: O(1), only constant time is used.
    ///   - space: O(n), where n is the number of all incoming messages.
    func shouldPrintMessage(_ timestamp: Int, _ message: String) -> Bool {
        guard let oldTimestamp = dict[message] else {
            dict[message] = timestamp
            return true
        }

        guard timestamp - oldTimestamp >= limit else { return false }

        dict[message] = timestamp
        return true
    }

}
