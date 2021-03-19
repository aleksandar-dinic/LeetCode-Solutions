//
//  1065 Index Pairs of a String.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 19/03/2021.
//  Copyright © 2021 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/index-pairs-of-a-string/
class Solution {

    /// Finds all index pairs `[i, j]` so that the substring `text[i]...text[j]`
    /// is in the list of `words`.
    ///
    /// - Parameters:
    ///   - text: A string.
    ///   - words: A list of strings.
    /// - Returns: All index pairs.
    ///
    /// - Complexity:
    ///   - time: O(n * m), where n is the length of `text`, and m is the length
    ///     of `words`.
    ///   - space: O(n), where n is the length of `text`.
    func indexPairs(_ text: String, _ words: [String]) -> [[Int]] {
        var root = Trie()
        
        for word in words {
            var node = root
            root.insert(word, &node)
        }
        
        let text = Array(text)
        let count = text.count
        var ans = [[Int]]()
        
        for i in 0..<count {
            var node = root
            var j = i
            
            while let child = node.children[text[j]] {
                node = child
                if child.isLast {
                    ans.append([i, j])
                }
                j += 1
                guard j == count else { continue }
                break
            }
        }
        
        return ans.sorted { $0[0] != $1[0] ? $0[0] < $1[0] : $0[1] < $1[1] }
    }

}

final class Trie {
    
    private(set) var children = [Character: Trie]()
    private(set) var isLast = false
    
    func insert(_ word: String, _ node: inout Trie) {
        for ch in word {
            if let child = node.children[ch] {
                node = child
            } else {
                let curr = Trie()
                node.children[ch] = curr
                node = curr
            }
        }
        node.isLast = true
    }
    
}
