//
//  1032 Stream of Characters.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 23/08/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/stream-of-characters/
class StreamChecker {

    private let trie: TrieNode
    private var stream: [Character]
    private let longestWord: Int

    /// Initialization of data structures.
    ///
    /// - Parameter words: The given words.
    ///
    /// - Complexity:
    ///   - time: O(n * m), where n is the number of given words, and m is the word length.
    ///   - space: O(n * m), where n is the number of given words, and m is the word length.
    init(_ words: [String]) {
        trie = TrieNode()
        stream = [Character]()
        var longestWord = 0

        for word in words {
            longestWord = max(longestWord, word.count)

            var node = trie
            for ch in word.reversed() {
                if node.children[ch] == nil {
                    node.children[ch] = TrieNode()
                }

                if let child = node.children[ch] {
                    node = child
                }
            }
            node.word = true
        }

        self.longestWord = longestWord
    }

    /// Finds if the last k characters queried spell one of the words.
    ///
    /// - Parameter letter: The query.
    /// - Returns: True if the word exists in the list, otherwise returns false.
    ///
    /// - Complexity:
    ///   - time: O(m), where m is the max word length.
    ///   - space: O(m), where m is the max word length.
    func query(_ letter: Character) -> Bool {
        stream.insert(letter, at: 0)

        if stream.count > longestWord {
            stream.removeLast()
        }

        var node = trie
        for ch in stream {
            guard !node.word else { return true }

            if let child = node.children[ch] {
                node = child
            } else {
                return false
            }
        }

        return node.word
    }

}

final class TrieNode {

    var children: [Character: TrieNode]
    var word: Bool

    init(children: [Character: TrieNode] = [:], word: Bool = false) {
        self.children = children
        self.word = word
    }

}
