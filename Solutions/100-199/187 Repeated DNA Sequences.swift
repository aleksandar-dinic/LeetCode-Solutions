//
//  187 Repeated DNA Sequences.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 17/10/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/repeated-dna-sequences/
class Solution {

    private let dict: [Character: Int] = ["A": 0, "C": 1, "G": 2, "T": 3]
    private let L = 10
    private let a = 4

    private var aL: Int {
        Int(pow(Double(a), Double(L)))
    }

    /// Finds all the 10-letter-long sequences (substrings) that occur more than once
    /// in a DNA molecule.
    ///
    /// - Parameter s: The DNA.
    /// - Returns: All the 10-letter-long sequences that occur more than once.
    ///
    /// - Complexity:
    ///   - time: O(n), where n is the length of the DNA.
    ///   - space: O(n), where n is the length of the DNA.
    func findRepeatedDnaSequences(_ s: String) -> [String] {
        guard s.count > L else { return [] }

        var nums = [Int]()

        for s in s {
            guard let num = dict[s] else { continue }
            nums.append(num)
        }

        var h = 0
        var seen = Set<Int>()
        var ans = Set<String>()

        for start in 0..<(s.count - L + 1) {
            if start != 0 {
                h = h * a - nums[start - 1] * aL + nums[start + L - 1]
            } else {
                for i in 0..<L {
                    h = h * a + nums[i]
                }
            }

            if seen.contains(h) {
                let startIndex = s.index(s.startIndex, offsetBy: start)
                let endIndex = s.index(s.startIndex, offsetBy: start + L)
                ans.insert(String(s[startIndex..<endIndex]))
            }
            seen.insert(h)
        }

        return Array(ans)
    }

}
