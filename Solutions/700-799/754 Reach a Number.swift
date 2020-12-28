//
//  754 Reach a Number.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 28/12/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/reach-a-number/
class Solution {

    /// Finds the minimum number of steps required to reach the destination.
    ///
    /// - Parameter target: A goal.
    /// - Returns: The minimum number of steps.
    ///
    /// - Complexity:
    ///     - time: O(sqrt(target)), where target is the given `target`.
    ///     - space: O(1), only constant space is used.
    func reachNumber(_ target: Int) -> Int {
        var target = abs(target)
        var step = 0
        
        while target > 0 {
            step += 1
            target -= step
        }
        
        return target % 2 == 0 ? step : step + (step % 2) + 1
    }

}
