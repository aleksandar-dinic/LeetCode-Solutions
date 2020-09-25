//
//  179 Largest Number.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 25/09/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/largest-number/
class Solution {

    /// Arranges the list of non-negative integers to make the largest number.
    ///
    /// - Parameter nums: The list of non-negative integers.
    /// - Returns: The largest number.
    ///
    /// - Complexity:
    ///   - time: O(n log(n)), where n is the length of `nums`.
    ///   - space: O(n), where n is the length of `nums`.
    func largestNumber(_ nums: [Int]) -> String {
        guard !nums.isEmpty else { return "" }

        var strs = [String]()
        for num in nums {
            strs.append(String(num))
        }

        strs.sort(by: { "\($0)\($1)" > "\($1)\($0)" })

        guard let first = strs.first, first != "0" else { return "0" }

        var ans = ""
        for str in strs {
            ans = "\(ans)\(str)"
        }

        return ans
    }

}
