//
//  1426 Counting Elements.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 05/03/2021.
//  Copyright © 2021 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/counting-elements/
class Solution {

    /// Finds how many elements x is in `arr`, such that x + 1 is also in `arr`.
    ///
    /// - Parameter arr: An array.
    /// - Returns: The number of elements.
    ///
    /// - Complexity:
    ///     - time: O(n), where n is the length of `arr`.
    ///     - space: O(n), where n is the length of `arr`.
    func countElements(_ arr: [Int]) -> Int {
        var tmp = Set<Int>()

        for a in arr {
            tmp.insert(a)
        }

        var ans = 0

        for a in arr {
            guard tmp.contains(a+1) else { continue }
            ans += 1
        }

        return ans
    }

}
