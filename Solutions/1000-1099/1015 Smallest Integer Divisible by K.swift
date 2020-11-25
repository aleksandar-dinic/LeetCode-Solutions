//
//  1015 Smallest Integer Divisible by K.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 25/11/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/smallest-integer-divisible-by-k/
class Solution {

    /// Finds the length of the smallest positive integer `N` such that `N` is
    /// divisible by `K`, and `N` only contains the digit `1`.
    ///
    /// - Parameter K: A positive integer.
    /// - Returns: The length of `N` if such exists, otherwise returns -1.
    ///
    /// - Complexity:
    ///   - time: O(K), where K is the given number `K`.
    ///   - space: O(1), only constant space is used.
    func smallestRepunitDivByK(_ K: Int) -> Int {
        var ans = 0

        for i in 1...K {
            ans = (ans * 10 + 1) % K
            guard ans == 0 else { continue }
            return i
        }

        return -1
    }

}
