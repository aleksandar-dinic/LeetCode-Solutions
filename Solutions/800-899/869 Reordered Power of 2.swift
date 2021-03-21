//
//  869 Reordered Power of 2.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 21/03/2021.
//  Copyright © 2021 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/reordered-power-of-2/
class Solution {

    /// Finds if we can reorder digits in `N` and get the power of 2.
    ///
    /// - Parameter N: A positive integer.
    /// - Returns: True if the resulting number is a power of 2, otherwise returns false.
    ///
    /// - Complexity:
    ///     - time: O(log^2 n), where n is the given `N`.
    ///     - space: O(log n), where n is the given `N`.
    func reorderedPowerOf2(_ N: Int) -> Bool {
        let a = count(N)
        for i in 0..<31 {
            guard a == count(1 << i) else { continue }
            return true
        }
        return false
    }
    
    private func count(_ n: Int) -> [Int] {
        var n = n
        var ans = [Int](repeating: 0, count: 10)
        while n > 0 {
            ans[n % 10] += 1
            n /= 10
        }
        return ans
    }

}
