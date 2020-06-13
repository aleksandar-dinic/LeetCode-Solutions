//
//  167 Two Sum II - Input array is sorted.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 13/06/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/two-sum-ii-input-array-is-sorted/
class Solution {

    /// Finds two numbers such that they add up to a specific target number.
    ///
    /// - Parameters:
    ///   - numbers: An array of integers sorted in ascending order.
    ///   - target: Specific target number.
    /// - Returns: Indices of the two numbers such that they add up to the target, where
    ///   index1 must be less than index2.
    ///
    /// - Complexity:
    ///   - time: O(n), where n is the length of the numbers.
    ///   - space: O(1), only constant space is used.
    func twoSum(_ numbers: [Int], _ target: Int) -> [Int] {
        guard !numbers.isEmpty else { return [] }
        var i = 0
        var j = numbers.count - 1

        while i < j {
            guard numbers[i] + numbers[j] != target else { break }

            if numbers[i] + numbers[j] > target {
                j -= 1
            } else {
                i += 1
            }
        }

        return [i + 1, j + 1]
    }

}
