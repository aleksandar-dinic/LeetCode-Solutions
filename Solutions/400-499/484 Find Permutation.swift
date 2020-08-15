//
//  484 Find Permutation.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 15/08/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/find-permutation/
class Solution {

    /// Finds the lexicographically smallest permutation of [1, 2, ... n] which could refer
    /// to the given secret signature.
    ///
    /// - Parameter s: The secret signature.
    /// - Returns: The lexicographically smallest permutation.
    ///
    /// - Complexity:
    ///   - time: O(n), where n is the number of characters in the secret signature.
    ///   - space: O(1), only constant space is used.
    func findPermutation(_ s: String) -> [Int] {
        var ans = [Int]()

        for i in 1...s.count+1 {
            ans.append(i)
        }

        let str = Array(s)

        var i = 0
        while i < str.count {
            guard str[i] == "D" else {
                i += 1
                continue
            }

            let start = i

            while i < str.count, str[i] == "D" {
                i += 1
            }

            reverse(&ans, start: start, end: i)
        }

        return ans
    }

    private func reverse(_ ans: inout [Int], start: Int, end: Int) {
        var start = start
        var end = end

        while start < end {
            ans.swapAt(start, end)
            start += 1
            end -= 1
        }
    }

}
