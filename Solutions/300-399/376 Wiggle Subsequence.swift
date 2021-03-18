//
//  376 Wiggle Subsequence.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 18/03/2021.
//  Copyright © 2021 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/wiggle-subsequence/
class Solution {

    /// Finds the length of the longest wiggle sequence.
    ///
    /// - Parameter nums: An integer array.
    /// - Returns: The length of the longest wiggle sequence.
    ///
    /// - Complexity:
    ///   - time: O(n), where n is the length of `nums`.
    ///   - space: O(1), only constant space is used.
    func wiggleMaxLength(_ nums: [Int]) -> Int {
        let n = nums.count
        guard n > 1 else { return n }
        
        var diff = nums[1] - nums[0]
        var ans = diff != 0 ? 2 : 1
        
        for i in 2..<n {
            let tmp = nums[i] - nums[i - 1]
            guard (tmp > 0 && diff <= 0) || (tmp < 0 && diff >= 0) else { continue }
            ans += 1
            diff = tmp
        }
        
        return ans
    }

}
