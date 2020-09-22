//
//  229 Majority Element II.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 22/09/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/majority-element-ii/
class Solution {

    /// Finds all elements that appear more than ⌊n/3⌋ times.
    ///
    /// - Parameter nums: An integer array.
    /// - Returns: All elements that appear more than ⌊n/3⌋ times.
    ///
    /// - Complexity:
    ///   - time: O(n), where n is the length of `nums`.
    ///   - space: O(1), only constant space is used.
    func majorityElement(_ nums: [Int]) -> [Int] {
        var count1 = 0
        var count2 = 0

        var candidate1: Int?
        var candidate2: Int?

        for num in nums {
            if candidate1 == num {
                count1 += 1
            } else if candidate2 == num {
                count2 += 1
            } else if count1 == 0 {
                candidate1 = num
                count1 = 1
            } else if count2 == 0 {
                candidate2 = num
                count2 = 1
            } else {
                count1 -= 1
                count2 -= 1
            }
        }

        count1 = 0
        count2 = 0

        for num in nums {
            if candidate1 == num {
                count1 += 1
            }
            if candidate2 == num {
                count2 += 1
            }
        }

        var ans = [Int]()

        if let candidate1 = candidate1, count1 > nums.count/3 {
            ans.append(candidate1)
        }
        if let candidate2 = candidate2, count2 > nums.count/3 {
            ans.append(candidate2)
        }

        return ans
    }

}
