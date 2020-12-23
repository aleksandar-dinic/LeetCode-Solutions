//
//  556 Next Greater Element III.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 23/12/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/next-greater-element-iii/
class Solution {

    /// Finds the smallest integer which has exactly the same digits existing in the
    /// integer `n` and is greater in value than `n`.
    ///
    /// - Parameter n: A positive integer.
    /// - Returns: The smallest integer if exist, otherwise returns false.
    ///
    /// - Complexity:
    ///   - time: O(m), where m is the number of digits in `n`.
    ///   - space: O(m), where m is the number of digits in `n`.
    func nextGreaterElement(_ n: Int) -> Int {
        var a = Array(String(n))
        var i = a.count - 2
        while i >= 0, a[i + 1] <= a[i] {
            i -= 1
        }
        
        guard i >= 0 else { return -1 }
        
        var j = a.count - 1
        while j >= 0, a[j] <= a[i] {
            j -= 1
        }
        
        a.swapAt(i, j)
        reverse(&a, i + 1)
        let ans = Int(String(a)) ?? -1
        return Double(ans) < pow(2, 31) - 1 ? ans : -1
    }
    
    private func reverse(_ a: inout [Character], _ start: Int) {
        var i = start
        var j = a.count - 1
        while i < j {
            a.swapAt(i, j)
            i += 1
            j -= 1
        }
    }
    
}
