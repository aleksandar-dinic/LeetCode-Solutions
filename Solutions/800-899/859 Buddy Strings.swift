//
//  859 Buddy Strings.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 12/10/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/buddy-strings/
class Solution {

    /// Finds if two letters in `A` can be swapped so the result is equal to `B`.
    ///
    /// - Parameters:
    ///   - A: A string of lowercase letters.
    ///   - B: A string of lowercase letters.
    /// - Returns: True if `A` after swapping can be equal to `B`, otherwise returns false.
    ///
    /// - Complexity:
    ///     - time: O(n), where n is the length of `A` and `B`.
    ///     - space: O(n), where n is the length of `A` and `B`.
    func buddyStrings(_ A: String, _ B: String) -> Bool {
        guard A.count == B.count else { return false }

        if A == B {
            var tmp = Set<Character>()
            for a in A {
                tmp.insert(a)
            }
            return tmp.count < A.count
        }

        var A = Array(A)
        var B = Array(B)
        var dif = [Int]()

        for (i, a) in A.enumerated() {
            guard a != B[i] else { continue }
            dif.append(i)
        }

        return dif.count == 2 && A[dif[0]] == B[dif[1]] && A[dif[1]] == B[dif[0]]
    }

}
