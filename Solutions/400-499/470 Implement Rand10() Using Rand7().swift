//
//  470 Implement Rand10() Using Rand7().swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 28/08/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/implement-rand10-using-rand7/
class Solution : SolBase {

    /// Generates a uniform random integer in the range 1 to 10.
    ///
    /// - Returns: The random integer in the range 1 to 10.
    ///
    /// - Complexity:
    ///   - time: O(1), only constant time is used in the average case, but O(∞) is the
    ///     worst case.
    ///   - space: O(1), only constant space is used.
    func rand10() -> Int {
        var ans = 40

        while ans >= 40 {
            ans = 7 * (rand7() - 1) + rand7() - 1
        }

        return ans % 10 + 1
    }
}

/// Provided code
class SolBase {

    /// Generates a uniform random integer in the range 1 to 7.
    ///
    /// - Returns: The random integer in the range 1 to 7.
    func rand7() -> Int

}
