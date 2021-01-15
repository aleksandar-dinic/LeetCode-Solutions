//
//  1646 Get Maximum in Generated Array.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 15/01/2021.
//  Copyright © 2021 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/get-maximum-in-generated-array/
class Solution {

    /// Finds the maximum integer in the array.
    ///
    /// - Parameter n: An integer.
    /// - Returns: The maximum integer in the array.
    ///
    /// - Complexity:
    ///   - time: O(n), where n is given `n`.
    ///   - space: O(n), where n is given `n`.
    func getMaximumGenerated(_ n: Int) -> Int {
        guard n > 1 else { return n }
        
        var arr = [Int](repeating: 0, count: n+1)
        arr[1] = 1

        var ans = 1
        for i in 2...n {
            if i % 2 == 0 {
                arr[i] = arr[i / 2]
            } else {
                arr[i] = arr[i / 2] + arr[i / 2 + 1]
            }
            ans = max(ans, arr[i])
        }
        
        return ans
    }

}
