//
//  1295 Find Numbers with Even Number of Digits.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 05/09/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/find-numbers-with-even-number-of-digits/
class Solution {

    /// Finds how many numbers in a given array contain an even number of digits.
    ///
    /// - Parameter nums: The array of integers.
    /// - Returns: How many numbers contain an even number of digits.
    ///
    /// - Complexity:
    ///   - time: O(n), where n is the length of nums.
    ///   - space: O(1), only constant space is used.
    func findNumbers(_ nums: [Int]) -> Int {
        var ans = 0

        for num in nums {
            ans += String(num).count % 2 == 0 ? 1 : 0
        }

        return ans
    }

}
