//
//  880 Decoded String at Index.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 20/12/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/decoded-string-at-index/
class Solution {

    /// Finds the K-th letter in the decoded string.
    ///
    /// - Parameters:
    ///   - S: An encoded string.
    ///   - K: An index.
    /// - Returns: The K-th letter in the decoded string.
    ///
    /// - Complexity:
    ///     - time: O(n), where n is the length of an encoded string.
    ///     - space: O(1), only constant space is used.
    func decodeAtIndex(_ S: String, _ K: Int) -> String {
        var size = 0
        let n = S.count
        
        for ch in S {
            if ch.isLetter {
                size += 1
            } else if let num = Int(String(ch)) {
                size *= num
            }
        }
        
        var k = K
        for ch in S.reversed() {
            k %= size
            
            if k == 0, ch.isLetter {
                return String(ch)
            }
            
            if ch.isLetter {
                size -= 1
            } else if let num = Int(String(ch)) {
                size /= num
            }
        }
        
        fatalError("Invalid input string")
    }

}
