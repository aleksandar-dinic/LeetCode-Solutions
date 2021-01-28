//
//  1663 Smallest String With A Given Numeric Value.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 28/01/2021.
//  Copyright © 2021 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/smallest-string-with-a-given-numeric-value/
class Solution {

    /// Finds the lexicographically smallest string with length equal to `n` and
    /// numeric value equal to `k`.
    ///
    /// - Parameters:
    ///   - n: An integer.
    ///   - k: An integer.
    /// - Returns: The lexicographically smallest string.
    ///
    /// - Complexity:
    ///   - time: O(n), where n is the given `n`.
    ///   - space: O(n), where n is the given `n`.
    func getSmallestString(_ n: Int, _ k: Int) -> String {
        let a = Character("a").asciiValue ?? 0
        var ans = [String](repeating: "", count: n)
        
        var k = k
        for i in (0..<n).reversed() {
            let add = min(k - i, 26)
            ans[i] = String(UnicodeScalar(UInt8(add - 1) + a))
            k -= add
        }
        
        return ans.joined()
    }

}
