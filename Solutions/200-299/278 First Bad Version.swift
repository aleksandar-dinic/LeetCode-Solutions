//
//  278 First Bad Version.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 30/01/2021.
//  Copyright © 2021 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/first-bad-version/
class Solution {

    /// Finds the first bad version.
    ///
    /// - Parameter n: The number of versions.
    /// - Returns: First bad version.
    ///
    /// - Complexity:
    ///   - time: O(log n), where n is the given `n`.
    ///   - space: O(1), only constant space is used.
    func firstBadVersion(_ n: Int) -> Int {
        var start = 1
        var end = n

        while start < end {
            let mid = start + (end - start) / 2
            if isBadVersion(mid) {
                end = mid
            } else {
                start = mid + 1
            }
        }

        return start
    }

}

/// Provided code
class VersionControl {
    
    func isBadVersion(_ version: Int) -> Bool
    
}
