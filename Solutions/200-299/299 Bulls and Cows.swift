//
//  299 Bulls and Cows.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 10/09/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/bulls-and-cows/
class Solution {

    /// Calculates bulls and cows hint according to the secret number and a guess.
    ///
    /// - Parameters:
    ///   - secret: The secret number.
    ///   - guess: The guess number.
    /// - Returns: The hint of bulls and cows.
    ///
    /// - Complexity:
    ///     - time: O(n), where n is the length of `secret` and `guess`.
    ///     - space: O(1), only constant space is used, `tmp` contains at most 10 elements.
    func getHint(_ secret: String, _ guess: String) -> String {
        var tmp = [Character: Int]()

        var bulls = 0
        var cows = 0

        let g = Array(guess)
        for (i, s) in secret.enumerated() {
            guard s != g[i] else {
                bulls += 1
                continue
            }

            if tmp[s, default: 0] < 0 {
                cows += 1
            }

            if tmp[g[i], default: 0] > 0 {
                cows += 1
            }

            tmp[s, default: 0] += 1
            tmp[g[i], default: 0] -= 1
        }

        return "\(bulls)A\(cows)B"
    }

}
