//
//  412 Fizz Buzz.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 26/08/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/fizz-buzz/
class Solution {

    /// Finds the string representation of numbers from 1 to n.
    ///
    /// - Parameter n: Upper bound.
    /// - Returns: The string representation of numbers.
    ///
    /// - Complexity:
    ///   - time: O(n), where n is the upper bound.
    ///   - space: O(n), where n is the upper bound.
    func fizzBuzz(_ n: Int) -> [String] {
        var ans = [String]()

        for i in 1...n {
            switch (i % 3 == 0, i % 5 == 0) {
            case (true, true):
                ans.append("FizzBuzz")

            case (false, true):
                ans.append("Buzz")

            case (true, false):
                ans.append("Fizz")

            default:
                ans.append(String(i))
            }
        }

        return ans
    }

}
