//
//  170 Two Sum III - Data structure design.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 01/09/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/two-sum-iii-data-structure-design/
class TwoSum {

    private var nums: [Int: Int]

    init() {
        nums = [Int: Int]()
    }

    /// Adds the number to the data structure.
    ///
    /// - Parameter number: The number.
    ///
    /// - Complexity:
    ///   - time: O(1), only constant time is used.
    ///   - space: O(n), where n is the total number of numbers that have been added.
    func add(_ number: Int) {
        nums[number, default: 0] += 1
    }

    /// Finds if there exists any pair of numbers whose sum is equal to the value.
    ///
    /// - Parameter value: The value.
    /// - Returns: True if pair exists, otherwise returns false.
    ///
    /// - Complexity:
    ///   - time: O(n), where n is the total number of numbers that have been added.
    ///   - space: O(1), only constant space is used.
    func find(_ value: Int) -> Bool {
        for (_, el) in nums.enumerated() {
            let complement = value - el.key

            if complement != el.key {
                guard nums[complement] != nil else { continue }
                return true

            } else if el.value > 1 {
                return true
            }
        }
        return false
    }

}
