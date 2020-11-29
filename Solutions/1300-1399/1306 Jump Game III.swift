//
//  1306 Jump Game III.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 29/11/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/jump-game-iii/
class Solution {

    /// Checks if you can reach any index with value 0.
    ///
    /// - Parameters:
    ///   - arr: An array of non-negative integers.
    ///   - start: Start index.
    /// - Returns: True if index with value 0 can be reached, otherwise returns false.
    ///
    /// - Complexity:
    ///   - time: O(n), where n is the length of the `arr`.
    ///   - space: O(n), where n is the length of the `arr`.
    func canReach(_ arr: [Int], _ start: Int) -> Bool {
        var arr = arr
        return dfs(&arr, arr.count, start)
    }

    private func dfs(_ arr: inout [Int], _ n: Int, _ start: Int) -> Bool {
        guard start >= 0, start < n, arr[start] >= 0 else { return false }
        guard arr[start] != 0 else { return true }

        arr[start] = -arr[start]
        return dfs(&arr, n, start + arr[start]) || dfs(&arr, n, start - arr[start])
    }

}
