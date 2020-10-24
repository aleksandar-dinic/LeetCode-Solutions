//
//  948 Bag of Tokens.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 24/10/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/bag-of-tokens/
class RecentCounter {

    /// Maximizes total score by potentially playing each token.
    ///
    /// - Parameters:
    ///   - tokens: A bag of tokens.
    ///   - P: An initial power.
    /// - Returns: Total score.
    ///
    /// - Complexity:
    ///     - time: O(n log(n)), where n is the number of `tokens`.
    ///     - space: O(n), where n is the number of `tokens`.
    func bagOfTokensScore(_ tokens: [Int], _ P: Int) -> Int {
        var tokens = tokens.sorted(by: <)
        var P = P
        var points = 0
        var ans = 0
        var i = 0
        var j = tokens.count - 1

        while i <= j {
            guard P >= tokens[i] || points > 0 else { break }

            if P >= tokens[i] {
                P -= tokens[i]
                i += 1
                points += 1
                ans = max(ans, points)
            } else {
                points -= 1
                P += tokens[j]
                j -= 1
            }
        }

        return ans
    }

}
