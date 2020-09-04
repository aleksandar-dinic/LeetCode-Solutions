//
//  763 Partition Labels.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 04/09/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source:  https://leetcode.com/problems/partition-labels/
class Solution {

    /// Partitions a string into as many parts as possible so that each letter appears in
    /// at most one part.
    ///
    /// - Parameter S: The string.
    /// - Returns: A list of integers representing the size of parts.
    ///
    /// - Complexity:
    ///     - time: O(n), where n is the length of the given string.
    ///     - space: O(n), where n is the length of the given string.
    func partitionLabels(_ S: String) -> [Int] {
        var dict = [Character: Int]()

        for (i, ch) in S.enumerated() {
            dict[ch] = i
        }

        var j = 0
        var anchor = 0
        var ans = [Int]()
        for (i, ch) in S.enumerated() {
            j = max(j, dict[ch] ?? -1)

            guard i == j else { continue }
            ans.append(i - anchor + 1)
            anchor = i + 1
        }

        return ans
    }

}
