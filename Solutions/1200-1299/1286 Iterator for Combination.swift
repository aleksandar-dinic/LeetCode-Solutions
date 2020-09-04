//
//  1286 Iterator for Combination.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 13/08/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/iterator-for-combination/
class CombinationIterator {

    private var combinations: [String]

    /// Initialization of data structures.
    ///
    /// - Parameters:
    ///   - characters: A string of sorted distinct lowercase English letters.
    ///   - combinationLength: The length of the combination.
    ///
    /// - Complexity:
    ///   - time: O(n * 2^n), where n is the length of characters.
    ///   - space: O(m), where m is the number of combinations.
    init(_ characters: String, _ combinationLength: Int) {
        combinations = [String]()

        let n = characters.count
        let k = combinationLength

        for bitmask in 0..<(1<<n) {
            guard bitmask.nonzeroBitCount == k else { continue }

            var current = ""
            for (j, ch) in characters.enumerated() {
                guard bitmask & (1 << (n - j - 1)) != 0 else { continue }
                current = "\(current)\(ch)"
            }
            combinations.append(current)
        }
    }

    /// Gets the next combination of length combinationLength in lexicographical order.
    ///
    /// - Returns: The next combination.
    ///
    /// - Complexity:
    ///   - time: O(1), only constant time is used.
    ///   - space: O(1), only constant space is used.
    func next() -> String {
        return combinations.removeLast()
    }

    /// Checks if the next combination exists.
    ///
    /// - Returns: True if the next combination exists, otherwise returns false.
    ///
    /// - Complexity:
    ///   - time: O(1), only constant time is used.
    ///   - space: O(1), only constant space is used.
    func hasNext() -> Bool {
        return !combinations.isEmpty
    }

}
