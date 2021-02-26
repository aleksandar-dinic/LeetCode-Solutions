//
//  202 Happy Number.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 26/02/2021.
//  Copyright © 2021 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/happy-number/
class Solution {

    /// Finds if a given number is happy humber.
    ///
    /// - Parameter n: The number.
    /// - Returns: True if `n` is a happy number, otherwise returns false.
    ///
    /// - Complexity:
    ///     - time: O(log n), where n is the given `n`.
    ///     - space: O(log n), where n is the given `n`.
    func isHappy(_ n: Int) -> Bool {
        var n = n
        var seen = Set<Int>()
        
        while n != 1, !seen.contains(n) {
            seen.insert(n)
            n = getNext(n)
        }
        
        return n == 1
    }
    
    private func getNext(_ n: Int) -> Int {
        var n = n
        var ans = 0
        while n > 0 {
            let d = n % 10
            n /= 10
            ans += d * d
        }
        return ans
    }

}
