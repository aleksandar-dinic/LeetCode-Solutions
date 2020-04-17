//
//  1365 How Many Numbers Are Smaller Than the Current Number.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 17/04/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/how-many-numbers-are-smaller-than-the-current-number/
class Solution {

    /// For each *nums[i]* finds out how many numbers in the array are smaller than it.
    ///
    /// - Parameter nums: Array of numbers.
    /// - Returns: Array where number on position *i* represent how many numbers are
    ///   smaller than *nums[i]*.
    ///
    /// - Complexity:
    ///   - time: O(n), where n is the length of the nums.
    ///   - space: O(n), where n is the length of the nums.
    func smallerNumbersThanCurrent(_ nums: [Int]) -> [Int] {
        var rank = [Int](repeating: 0, count: 101)

        for num in nums {
            rank[num] += 1
        }

        for i in 1..<rank.count {
            rank[i] += rank[i-1]
        }

        var ans = [Int](repeating: 0, count: nums.count)

        for (i, num) in nums.enumerated() {
            if num == 0 {
                ans[i] = 0
            } else {
                ans[i] = rank[num-1]
            }
        }

        return ans
    }

}
