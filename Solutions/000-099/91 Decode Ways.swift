//
//  91 Decode Ways.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 26/12/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/decode-ways/
class Solution {

    /// Finds the total number of ways to decode a message.
    ///
    /// - Parameter s: The message.
    /// - Returns: The total number of ways.
    ///
    /// - Complexity:
    ///   - time: O(n), where n is the length of `s`.
    ///   - space: O(n), where n is the length of `s`.
    func numDecodings(_ s: String) -> Int {
        let message = Array(s).compactMap { Int(String($0)) }
        let n = message.count
        
        guard n > 0, message[0] != 0 else { return 0 }
        guard n > 1 else { return 1 }
        
        var pre1 = 1
        var pre2 = 1
        var cur = 0
        
        for i in 1..<n {
            cur = 0
            if message[i] >= 1, message[i] <= 9 {
                cur += pre1
            }
            let tmp = message[i-1] * 10 + message[i]
            if tmp >= 10, tmp <= 26 {
                cur += pre2
            }
            pre2 = pre1
            pre1 = cur
        }
        
        return cur
    }

}
