//
//  161 One Edit Distance.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 22/01/2021.
//  Copyright © 2021 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/one-edit-distance/
class Solution {

    /// Finds if given two strings are one edit distance apart.
    ///
    /// - Parameters:
    ///   - s: First string.
    ///   - t: Second string.
    /// - Returns: True if given strings are one edit distance apart, otherwise
    ///   returns false.
    ///
    /// - Complexity:
    ///   - time: O(n), where n is the max length of `s` and `t`.
    ///   - space: O(n), where n is the max length of `s` and `t`.
    func isOneEditDistance(_ s: String, _ t: String) -> Bool {
        let n = s.count
        let m = t.count
        guard n <= m else { return isOneEditDistance(t, s) }
        
        guard n == m || m - n == 1 else { return false }
        
        let s = Array(s)
        let t = Array(t)
                
        for i in 0..<n {
            guard s[i] != t[i] else { continue }
            
            if n == m {
                return s[i+1..<n] == t[i+1..<m]
            }
            
            return s[i..<n] == t[i+1..<m]
        }
        
        return n + 1 == m
    }

}
