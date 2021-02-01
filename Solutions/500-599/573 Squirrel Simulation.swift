//
//  573 Squirrel Simulation.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 01/02/2021.
//  Copyright © 2021 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/squirrel-simulation/
class Solution {

    /// Finds the minimum distance for the squirrel to collect all the nuts and put
    /// them under the tree one by one.
    ///
    /// - Parameters:
    ///   - height: Height of the grid.
    ///   - width: Width of the grid.
    ///   - tree: Tree positions in the grid.
    ///   - squirrel: Squirrel positions in the grid.
    ///   - nuts: Nuts positions in the grid.
    /// - Returns: The minimum distance.
    ///
    /// - Complexity:
    ///   - time: O(n), where n is the number of `nuts`.
    ///   - space: O(1), only constant space is used.
    func minDistance(_ height: Int, _ width: Int, _ tree: [Int], _ squirrel: [Int], _ nuts: [[Int]]) -> Int {
        var ans = 0
        var d = Int.min
        
        for nut in nuts {
            let dis = distance(nut, tree)
            ans += dis * 2
            d = max(d, dis - distance(nut, squirrel))
        }
        
        return ans - d
    }
    
    private func distance(_ a: [Int], _ b: [Int]) -> Int {
        abs(a[0] - b[0]) + abs(a[1] - b[1])
    }

}
