//
//  858 Mirror Reflection.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 17/11/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/mirror-reflection/
class Solution {

    /// Finds the number of the receptor that the ray meets first.
    ///
    /// - Parameters:
    ///   - p: Walls length.
    ///   - q: The distance where a laser ray first meets the east wall.
    /// - Returns: The number of the receptor.
    ///
    /// - Complexity:
    ///     - time: O(log(p)), where p is wall length.
    ///     - space: O(1), only constant space is used.
    func mirrorReflection(_ p: Int, _ q: Int) -> Int {
        var m = q
        var n = p

        while m % 2 == 0, n % 2 == 0 {
            m /= 2
            n /= 2
        }

        if m % 2 == 0, n % 2 == 1 {
            return 0
        }

        if m % 2 == 1, n % 2 == 1 {
            return 1
        }

        if m % 2 == 1, n % 2 == 0 {
            return 2
        }

        return -1
    }

}
