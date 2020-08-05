//
//  211 Add and Search Word - Data structure design.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 05/08/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/add-and-search-word-data-structure-design/
class WordDictionary {

    private var trie: TrieNode

    init() {
        trie = TrieNode()
    }

    /// Adds a word into the data structure.
    ///
    /// - Parameter word: The word.
    ///
    /// - Complexity:
    ///   - time: O(n), where n is the length of the word.
    ///   - space: O(n), where n is the length of the word.
    func addWord(_ word: String) {
        var node = trie

        for ch in word {
            if node.children[ch] == nil {
                node.children[ch] = TrieNode()
            }

            if let child = node.children[ch] {
                node = child
            }
        }
        node.word = true
    }

    /// Searches for a word in the data structure.
    ///
    /// - Parameter word: The word.
    /// - Returns: True if data structure contains the word, otherwise returns false.
    ///
    /// - Complexity:
    ///   - time: O(n), where n is the length of the word.
    ///   - space: O(n), where n is the length of the word.
    func search(_ word: String) -> Bool {
        return searchInNode(word, trie)
    }

    private func searchInNode(_ word: String, _ node: TrieNode) -> Bool {
        var node = node
        let word = Array(word)

        for i in 0..<word.count {
            if let child = node.children[word[i]] {
                node = child

            } else {
                guard word[i] == "." else { return false }

                for child in node.children.values {
                    guard searchInNode(String(word.dropFirst(i+1)), child) else { continue }
                    return true
                }

                return false
            }
        }

        return node.word
    }
}

final class TrieNode {

    var children: [Character: TrieNode]
    var word: Bool

    init(children: [Character: TrieNode] = [Character: TrieNode](), word: Bool = false) {
        self.children = children
        self.word = word
    }

}
