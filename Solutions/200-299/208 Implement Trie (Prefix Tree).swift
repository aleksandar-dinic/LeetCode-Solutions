//
//  208 Implement Trie (Prefix Tree).swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 14/05/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/implement-trie-prefix-tree/
class Trie {

    private var root: TrieNode

    init(_ root: TrieNode = TrieNode()) {
        self.root = root
    }

    /// Inserts a word into the trie.
    ///
    /// - Parameter word: The string to insert.
    ///
    /// - Complexity:
    ///   - time: O(n), where n is the length of the word.
    ///   - space: O(n), where n is the length of the word.
    func insert(_ word: String) {
        var curr: TrieNode? = root

        for w in word {
            if let curr = curr, !curr.contains(w) {
                curr[w] = TrieNode()
            }
            curr = curr?[w]
        }
        curr?.isEnd = true
    }

    /// Returns if the word is in the trie.
    ///
    /// - Parameter word: The string for search.
    /// - Returns: True if the word is in the trie, otherwise returns false.
    ///
    /// - Complexity:
    ///   - time: O(n), where n is the length of the word.
    ///   - space: O(1), only constant space is used.
    func search(_ word: String) -> Bool {
        var curr = root

        for w in word {
            guard let child = curr[w] else { return false }
            curr = child
        }

        return curr.isEnd
    }

    /// Returns if there is any word in the trie that starts with the given prefix.
    ///
    /// - Parameter prefix: The prefix string for search.
    /// - Returns: True if there is any word in the trie that starts with the given
    ///   prefix, otherwise returns false.
    ///
    /// - Complexity:
    ///   - time: O(n), where n is the length of the word.
    ///   - space: O(1), only constant space is used.
    func startsWith(_ prefix: String) -> Bool {
        var curr = root

        for w in prefix {
            guard let child = curr[w] else { return false }
            curr = child
        }

        return true
    }

}

final class TrieNode {

    private var children: [Character: TrieNode]
    var isEnd: Bool

    init(
        _ children: [Character: TrieNode] = [:],
        isEnd: Bool = false
    ) {
        self.children = children
        self.isEnd = isEnd
    }

    func contains(_ key: Character) -> Bool {
        return children.keys.contains(key)
    }

    subscript(_ key: Character) -> TrieNode? {
        set {
            children[key] = newValue
        }
        get {
            return children[key]
        }
    }

}

