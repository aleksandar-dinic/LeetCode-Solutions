//
//  1437 Check If All 1's Are at Least Length K Places Away.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 25/01/2021.
//  Copyright © 2021 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/check-if-all-1s-are-at-least-length-k-places-away/
class Solution {

    /// Checks if all 1's are at least length `k` places away.
    ///
    /// - Parameters:
    ///   - nums: An array of 0s and 1s.
    ///   - k: An integer.
    /// - Returns: True if all 1's are at least k places away from each other,
    ///   otherwise returns false.
    ///
    /// - Complexity:
    ///   - time: O(n), where n is the length of `nums`.
    ///   - space: O(1), only constant space is used.   
    func kLengthApart(_ nums: [Int], _ k: Int) -> Bool {
        guard k > 0 else { return true }
        
        var i: Int?
        
        for (j, num) in nums.enumerated() {
            guard num == 1 else { continue }
            
            if let prev = i, j - prev <= k {
                return false
            }
            
            i = j
        }
        
        return true
    }

}
