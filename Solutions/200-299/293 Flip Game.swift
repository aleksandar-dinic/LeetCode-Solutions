//
//  293 Flip Game.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 04/01/2021.
//  Copyright © 2021 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/flip-game/
class Solution {

    /// Finds all possible states of the string after one valid move.
    ///
    /// - Parameter s: The string.
    /// - Returns: All possible states of the string after one valid move.
    ///
    /// - Complexity:
    ///     - time: O(n), where n is the length of `s`.
    ///     - space: O(m), where m is the number of all possible states.
    func generatePossibleNextMoves(_ s: String) -> [String] {
        guard !s.isEmpty else { return [] }
        
        var s = Array(s)
        var ans = [String]()
        
        for i in 1..<s.count {
            guard s[i-1] == "+", s[i] == "+" else { continue }
            s[i-1] = "-"
            s[i] = "-"
            ans.append(String(s))
            s[i-1] = "+"
            s[i] = "+"
        }
        
        return ans
    }

}
