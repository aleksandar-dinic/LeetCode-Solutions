//
//  348 Design Tic-Tac-Toe.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 13/09/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/design-tic-tac-toe/
class TicTacToe {

    private let n: Int
    private var rows: [Int]
    private var cols: [Int]
    private var fDiag: Int
    private var bDiag: Int

    /// Initialization of data structures.
    ///
    /// - Parameter n: Board size.
    ///
    /// - Complexity:
    ///   - time: O(1), only constant time is used.
    ///   - space: O(n), where n is the board size.
    init(_ n: Int) {
        self.n = n
        rows = [Int](repeating: 0, count: n)
        cols = [Int](repeating: 0, count: n)
        fDiag = 0
        bDiag = 0
    }

    /// The player makes a move at (row, col).
    ///
    /// - Parameters:
    ///   - row: The row of the board.
    ///   - col: The column of the board.
    ///   - player: The player (1 or 2).
    /// - Returns: 0 if no one wins, 1 if player 1 wins, or 2 if player 2 wins.
    ///
    /// - Complexity:
    ///   - time: O(1), only constant time is used.
    ///   - space: O(1), only constant space is used.
    func move(_ row: Int, _ col: Int, _ player: Int) -> Int {
        let tmp = player == 1 ? 1 : -1

        rows[row] += tmp
        guard abs(rows[row]) != n else { return player }

        cols[col] += tmp
        guard abs(cols[col]) != n else { return player }

        if row == col {
            fDiag += tmp
            guard abs(fDiag) != n else { return player }
        }

        if row == n - col - 1 {
            bDiag += tmp
            guard abs(bDiag) != n else { return player }
        }

        return 0
    }

}
