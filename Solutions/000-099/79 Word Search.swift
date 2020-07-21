//
//  79 Word Search.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 21/07/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundations

/// Source: https://leetcode.com/problems/word-search/
class Solution {

    /// Finds if a word exists in the board.
    ///
    /// - Parameters:
    ///   - board: 2D array of characters.
    ///   - word: The word.
    /// - Returns: True if the word exists in the board, otherwise returns false.
    ///
    /// - Complexity:
    ///   - time: O(n * m * 4^l), where n is the number of rows in the board, m is the
    ///     number of columns in the board, and l is the number of characters in the word.
    ///   - space: O(n * m + l), where n is the number of rows in the board, m is the
    ///     number of columns in the board, and l is the number of characters in the word.
    func exist(_ board: [[Character]], _ word: String) -> Bool {
        var board = board
        let word = Array(word)

        for x in 0..<board.count {
            for y in 0..<board[x].count {
                guard exist(&board, word: word, x: x, y: y, i: 0) else { continue }
                return true
            }
        }

        return false
    }

    private func exist(_ board: inout [[Character]], word: [String.Element], x: Int, y: Int, i: Int) -> Bool {
        guard i < word.count else { return true }
        guard x >= 0, y >= 0, x < board.count, y < board[x].count, board[x][y] == word[i] else { return false }

        board[x][y] = "-"
        let ans = exist(&board, word: word, x: x-1, y: y,   i: i+1) ||
                  exist(&board, word: word, x: x+1, y: y,   i: i+1) ||
                  exist(&board, word: word, x: x,   y: y-1, i: i+1) ||
                  exist(&board, word: word, x: x,   y: y+1, i: i+1)

        board[x][y] = word[i]
        return ans
    }

}
