//
//  442 Find All Duplicates in an Array.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 06/08/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/find-all-duplicates-in-an-array/
class Solution {

    /// Finds all the elements that appear twice in an array.
    ///
    /// - Parameter nums: The array of integers.
    /// - Returns: All elements that appear twice.
    ///
    /// - Complexity:
    ///   - time: O(n), where n is the length of the nums.
    ///   - space: O(n), where n is the length of the nums.
    func findDuplicates(_ nums: [Int]) -> [Int] {
        var nums = nums
        var ans = [Int]()

        for num in nums {
            if nums[abs(num) - 1] < 0 {
                ans.append(num)
            }
            nums[abs(num) - 1] *= -1
        }

        return ans
    }

}
