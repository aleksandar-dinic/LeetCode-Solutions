//
//  292 Nim Game.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 01/05/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source:  https://leetcode.com/problems/nim-game/
class Solution {

    /// Determines whether you can win the Nim Game.
    ///
    /// - Parameter n: The number of stones.
    /// - Returns: True if you can win, otherwise returns false.
    ///
    /// - Complexity:
    ///     - time: O(1), only constant time is used.
    ///     - space: O(1), only constant space is used.
    func canWinNim(_ n: Int) -> Bool {
        return n % 4 != 0
    }

}
