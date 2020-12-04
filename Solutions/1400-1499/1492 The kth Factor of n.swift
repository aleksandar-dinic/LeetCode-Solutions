//
//  1492 The kth Factor of n.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 04/12/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/the-kth-factor-of-n/
class Solution {

    /// Finds the kth factor or returns -1 if `n` has less than `k` factors.
    ///
    /// - Parameters:
    ///   - n: Positive integer.
    ///   - k: Positive integer.
    /// - Returns: The kth factor if exist, otherwise returns -1.
    ///
    /// - Complexity:
    ///   - time: O(n), where n is given `n`.
    ///   - space: O(1), only constant space is used.
    func kthFactor(_ n: Int, _ k: Int) -> Int {
        var k = k
        
        for i in 1...(n / 2 + 1) {
            guard n % i == 0 else { continue }
            k -= 1
            guard k == 0 else { continue }
            return i
        }
        
        return k == 1 ? n : -1
    }

}
