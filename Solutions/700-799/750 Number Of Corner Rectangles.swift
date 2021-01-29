//
//  750 Number Of Corner Rectangles.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 29/01/2021.
//  Copyright © 2021 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/number-of-corner-rectangles/
class Solution {

    /// Finds the number of corner rectangles.
    ///
    /// - Parameter grid: A grid.
    /// - Returns: The number of corner rectangles.
    ///
    /// - Complexity:
    ///     - time: O(n * m^2), where n is the number of rows in the `grid`, and m
    ///       is the number of columns in the `grid`.
    ///     - space: O(m^2), where m is the number of columns in the `grid`.
    func countCornerRectangles(_ grid: [[Int]]) -> Int {
        var count = [Int: Int]()
        var ans = 0
        
        for row in grid {
            for c1 in 0..<row.count {
                guard row[c1] == 1 else { continue }
                for c2 in c1+1..<row.count {
                    guard row[c2] == 1 else { continue }
                    let pos = c1 * 200 + c2
                    ans += count[pos] ?? 0
                    count[pos, default: 0] += 1
                }
            }
        }
        
        return ans
    }

}
