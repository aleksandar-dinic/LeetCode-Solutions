//
//  312 Burst Balloons.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 13/12/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/burst-balloons/
class Solution {

    /// Finds the maximum coins you can collect by bursting the balloons wisely.
    ///
    /// - Parameter nums: An array of balloons.
    /// - Returns: The maximum coins you can collect.
    ///
    /// - Complexity:
    ///   - time: O(n^3), where n is the number of balloons.
    ///   - space: O(n^2), where n is the number of balloons.
    func maxCoins(_ nums: [Int]) -> Int {
        let n = nums.count
        var newNums = [Int]()
        newNums.append(1)
        for i in 0..<n {
            newNums.append(nums[i])
        }
        newNums.append(1)
        
        var dp = [[Int]](repeating: [Int](repeating: 0, count: n + 2), count: n + 2)
        return maxCoins(&dp, newNums, 0, n + 1)
    }
    
    private func maxCoins(_ dp: inout [[Int]], _ nums: [Int], _ left: Int, _ right: Int) -> Int {
        guard left + 1 != right else { return 0 }
        guard dp[left][right] == 0 else { return dp[left][right] }

        var ans = 0
        for i in (left + 1)..<right {
            let L = maxCoins(&dp, nums, left, i)
            let R = maxCoins(&dp, nums, i, right)
            ans = max(ans, nums[left] * nums[i] * nums[right] + L + R)
        }
        
        dp[left][right] = ans
        return ans
    }

}
