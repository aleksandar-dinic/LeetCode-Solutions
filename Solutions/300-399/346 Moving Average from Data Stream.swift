//
//  346 Moving Average from Data Stream.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 02/08/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/moving-average-from-data-stream/
class MovingAverage {

    private let size: Int
    private var queue: [Double]
    private var head = 0
    private var count = 0
    private var sum = 0.0

    /// Initialization of data structures.
    ///
    /// - Parameter size: A circular queue size.
    init(_ size: Int) {
        self.size = size
        queue = [Double](repeating: 0, count: size)
    }

    /// Calculate the moving average of all integers in the sliding window.
    ///
    /// - Parameter val: The integer.
    /// - Returns: The moving average of all integers.
    ///
    /// - Complexity:
    ///   - time: O(1), only constant time is used.
    ///   - space: O(n), where n is the size of the circular queue.
    func next(_ val: Int) -> Double {
        count += 1

        let tail = (head + 1) % size
        sum = sum - queue[tail] + Double(val)
        head = (head + 1) % size
        queue[head] = Double(val)

        return sum / Double(min(count, size))
    }

}
