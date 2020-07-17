//
//  15 3Sum.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 17/07/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/3sum/
class Solution {

    /// Finds all unique triplets in the array which gives the sum of zero.
    ///
    /// - Parameter nums: An array of integers.
    /// - Returns: All unique triplets which gives the sum of zero.
    ///
    /// - Complexity:
    ///   - time: O(n^2), where n is the number of integers in nums.
    ///   - space: O(n^2), where n is the number of integers in nums.
    func threeSum(_ nums: [Int]) -> [[Int]] {
        guard nums.count >= 3 else { return [] }

        let nums = nums.sorted()
        var ans = [[Int]]()

        for i in 0..<nums.count-2 {
            guard i == 0 || nums[i-1] != nums[i] else { continue }

            var left = i + 1
            var right = nums.count - 1

            while left < right {
                let sum = nums[i] + nums[left] + nums[right]

                if sum == 0 {
                    ans.append([nums[i], nums[left], nums[right]])

                    while left < right, nums[left] == nums[left + 1] {
                        left += 1
                    }

                    while left < right, nums[right] == nums[right - 1] {
                        right -= 1
                    }

                    left += 1
                    right -= 1
                } else if sum < 0 {
                    left += 1
                } else {
                    right -= 1
                }
            }
        }

        return ans
    }

}
