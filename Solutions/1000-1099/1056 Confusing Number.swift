//
//  1056 Confusing Number.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 07/03/2021.
//  Copyright © 2021 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/confusing-number/
class Solution {

    private let dict = [0: 0, 1: 1, 6: 9, 8: 8, 9: 6]
    
    /// Finds if `N` is a confusing number.
    ///
    /// - Parameter N: The number.
    /// - Returns: True if `N` is a confusing number, otherwise return false.
    ///
    /// - Complexity:
    ///   - time: O(log n), where n is the length of `N`.
    ///   - space: O(1), only constant space is used.
    func confusingNumber(_ N: Int) -> Bool {
        var n = N
        var ans = 0
        
        while n > 0 {
            guard let num = dict[n % 10] else { return false }
            ans = ans * 10 + num
            n /= 10
        }
        return ans != N
    }

}
