//
//  949 Largest Time for Given Digits.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 01/09/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/largest-time-for-given-digits/
class Solution {

    private var maxTime = -1

    /// Finds the largest 24 hour time that can be made from an array.
    ///
    /// - Parameter A: The array.
    /// - Returns: The largest 24 hour time. If no valid time can be made, returns an empty
    ///   string.
    ///
    /// - Complexity:
    ///     - time: O(1), only constant time is used.
    ///     - space: O(1), only constant space is used.
    func largestTimeFromDigits(_ A: [Int]) -> String {
        maxTime = -1
        var array = A
        permutate(&array, start: 0)
        guard maxTime != -1 else { return "" }

        return String(format: "%02d:%02d", maxTime / 60, maxTime % 60)
    }

    private func permutate(_ array: inout [Int], start: Int) {
        guard array.count != start else {
            buildTime(array)
            return
        }

        for i in start..<array.count {
            array.swapAt(i, start)
            permutate(&array, start: start + 1)
            array.swapAt(i, start)
        }
    }

    private func buildTime(_ array: [Int]) {
        let hour = array[0] * 10 + array[1]
        let minute = array[2] * 10 + array[3]

        guard hour < 24, minute < 60 else { return }

        maxTime = max(maxTime, hour * 60 + minute)
    }

}
