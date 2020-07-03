//
//  957 Prison Cells After N Days.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 03/07/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/prison-cells-after-n-days/
class Solution {

    /// Calculates the state of the prison after N days.
    ///
    /// - Parameters:
    ///   - cells: The initial state of the prison.
    ///   - N: The number of days.
    /// - Returns: The state of the prison after N days.
    ///
    /// - Complexity:
    ///     - time: O(1), only constant time is used.
    ///     - space: O(1), only constant space is used.
    func prisonAfterNDays(_ cells: [Int], _ N: Int) -> [Int] {
        var ans = cells

        for _ in 0..<(N-1) % 14 + 1 {
            var cur = [Int](repeating: 0, count: 8)
            for i in 1..<7 {
                cur[i] = ans[i-1] == ans[i+1] ? 1 : 0
            }
            ans = cur
        }

        return ans
    }

}
