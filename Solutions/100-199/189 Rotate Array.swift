//
//  189 Rotate Array.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 15/10/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/rotate-array/
class Solution {

    /// Rotates an array to the right by k steps.
    ///
    /// - Parameters:
    ///   - nums: The array.
    ///   - k: The number of steps.
    ///
    /// - Complexity:
    ///   - time: O(n), where n is the length of the `nums`.
    ///   - space: O(1), only constant space is used.
    func rotate(_ nums: inout [Int], _ k: Int) {
        guard !nums.isEmpty else { return }

        let k = k % nums.count
        reverse(&nums, start: 0, end: nums.count - 1)
        reverse(&nums, start: 0, end: k - 1)
        reverse(&nums, start: k, end: nums.count - 1)
    }

    private func reverse(_ nums: inout [Int], start: Int, end: Int) {
        var start = start
        var end = end
        while start < end {
            nums.swapAt(start, end)
            start += 1
            end -= 1
        }
    }

}
