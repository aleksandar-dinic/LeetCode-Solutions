//
//  421 Maximum XOR of Two Numbers in an Array.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 16/09/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/maximum-xor-of-two-numbers-in-an-array/
class Solution {

    /// Finds the maximum XOR of two numbers in a given array.
    ///
    /// - Parameter nums: A non-empty array of numbers.
    /// - Returns: The maximum XOR of two numbers.
    ///
    /// - Complexity:
    ///   - time: O(n), where n is the length of `nums`.
    ///   - space: O(n), where n is the length of `nums`.
    func findMaximumXOR(_ nums: [Int]) -> Int {
        guard let maxNum = nums.max() else { return 0 }
        let L = String(maxNum, radix: 2).count

        let n = nums.count
        let bitmask = 1 << L
        var strNums = [String](repeating: "", count: n)

        for (i, num) in nums.enumerated() {
            var str = String(bitmask | num, radix: 2)
            str.removeFirst()
            strNums[i] = str
        }

        let trie = TrieNode()
        var ans = 0

        for num in strNums {
            var node = trie
            var xorNode: TrieNode? = trie
            var currXor = 0

            for bit in num {
                if let child = node.children[bit] {
                    node = child
                } else {
                    let newNode = TrieNode()
                    node.children[bit] = newNode
                    node = newNode
                }

                let toggledBit: Character = bit == "1" ? "0" : "1"
                if let xNode = xorNode?.children[toggledBit] {
                    currXor = (currXor << 1) | 1
                    xorNode = xNode
                } else {
                    currXor = currXor << 1
                    xorNode = xorNode?.children[bit]
                }
            }

            ans = max(ans, currXor)
        }

        return ans
    }

}

final class TrieNode {

    var children: [Character: TrieNode]

    init() {
        children = [Character: TrieNode]()
    }

}
