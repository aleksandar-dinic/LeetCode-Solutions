//
//  239 Sliding Window Maximum.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 28/11/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/sliding-window-maximum/
class Solution {

    /// Finds the max sliding window.
    ///
    /// - Parameters:
    ///   - nums: An array of integers.
    ///   - k: A sliding window size.
    /// - Returns: The max sliding window.
    ///
    /// - Complexity:
    ///   - time: O(n), where n is the length of `nums`.
    ///   - space: O(n), where n is the length of `nums`.
    func maxSlidingWindow(_ nums: [Int], _ k: Int) -> [Int] {
        let n = nums.count
        guard k != 1 else { return nums }

        var left = [Int](repeating: 0, count: n)
        left[0] = nums[0]
        var right = [Int](repeating: 0, count: n)
        right[n - 1] = nums[n - 1]

        for i in 1..<n {
            if i % k == 0 {
                left[i] = nums[i]
            } else {
                left[i] = max(left[i-1], nums[i])
            }

            let j = n - i - 1
            if (j + 1) % k == 0 {
                right[j] = nums[j]
            } else {
                right[j] = max(right[j + 1], nums[j])
            }
        }

        var ans = [Int]()

        for i in 0..<(n - k + 1) {
            ans.append(max(left[i + k - 1], right[i]))
        }

        return ans
    }

}
