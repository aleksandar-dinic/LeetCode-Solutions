//
//  1064 Fixed Point.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 10/03/2021.
//  Copyright © 2021 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/fixed-point/
class Solution {

    /// Finds the smallest index `i` that satisfies `arr[i] == i`.
    ///
    /// - Parameter arr: An array of distinct integers.
    /// - Returns: The smallest index.
    ///
    /// - Complexity:
    ///   - time: O(log n), where n is the length of `arr`.
    ///   - space: O(1), only constant space is used.
    func fixedPoint(_ arr: [Int]) -> Int {
        var lo = 0
        var hi = arr.count - 1
        
        while lo < hi {
            let mid = lo + (hi - lo) / 2
                        
            if arr[mid] < mid {
                lo = mid + 1
            } else {
                hi = mid
            }
        }
        
        return arr[lo] == lo ? lo : -1
    }

}
