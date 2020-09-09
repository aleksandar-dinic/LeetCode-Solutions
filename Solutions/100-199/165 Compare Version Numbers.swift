//
//  165 Compare Version Numbers.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 09/09/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/compare-version-numbers/
class Solution {

    /// Compares two version numbers.
    ///
    /// - Parameters:
    ///   - version1: First version.
    ///   - version2: Second version.
    /// - Returns: 1 if `version1` is greater than `version2`, -1 if `version2` is greater
    ///   than `version1`, otherwise returns 0.
    ///
    /// - Complexity:
    ///   - time: O(max(n,m)), where n is the length of `version1`, and m is the length of
    ///   `version2`.
    ///   - space: O(max(n,m)), where n is the length of `version1`, and m is the length of
    ///   `version2`.
    func compareVersion(_ version1: String, _ version2: String) -> Int {
        var i = 0
        var j = 0

        while i < version1.count || j < version2.count {
            let v1 = getNextChunk(version1, i)
            let v2 = getNextChunk(version2, j)

            i = v1.nextIndex
            j = v2.nextIndex

            guard v1.ver != v2.ver else { continue }
            return v1.ver > v2.ver ? 1 : -1
        }

        return 0
    }

    private func getNextChunk(_ version: String, _ index: Int) -> (ver: Int, nextIndex: Int) {
        guard index < version.count else { return (0, index) }

        var cur = ""
        for (i, ch) in version.enumerated() where i >= index {
            guard ch != "." else { break }

            cur = "\(cur)\(ch)"
        }

        return (Int(cur) ?? 0, index + cur.count + 1)
    }

}
