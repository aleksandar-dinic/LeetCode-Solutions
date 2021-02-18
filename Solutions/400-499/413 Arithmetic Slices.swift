//
//  413 Arithmetic Slices.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 18/02/2021.
//  Copyright © 2021 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/arithmetic-slices/
class Solution {

    /// Finds the number of arithmetic slices in array `A`.
    ///
    /// - Parameter A: The array.
    /// - Returns: The number of arithmetic slices.
    ///
    /// - Complexity:
    ///   - time: O(n), where n is the length of `A`.
    ///   - space: O(1), only constant space is used.
    func numberOfArithmeticSlices(_ A: [Int]) -> Int {
        let n = A.count
        guard n > 2 else { return 0 }
        var dp = 0
        var ans = 0
        
        for i in 2..<n {
            if A[i] - A[i - 1] == A[i - 1] - A[i - 2] {
                dp += 1
                ans += dp
            } else {
                dp = 0
            }
        }
        
        return ans
    }

}
