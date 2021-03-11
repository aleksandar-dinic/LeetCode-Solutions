//
//  322 Coin Change.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 11/03/2021.
//  Copyright © 2021 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/coin-change/
class Solution {

    /// Finds the fewest number of coins that you need to make up to the amount.
    ///
    /// - Parameters:
    ///   - coins: The coins.
    ///   - amount: The total amount of money.
    /// - Returns: The fewest number of coins, if the amount of money cannot be
    ///   made up returns -1.
    ///
    /// - Complexity:
    ///   - time: O(s * n), where s is the `amount`, and n is the length of `coins`.
    ///   - space: O(s), where s is the `amount`.
    func coinChange(_ coins: [Int], _ amount: Int) -> Int {
        guard amount > 0 else { return 0 }
        var dp = [Int](repeating: amount + 1, count: amount + 1)
        dp[0] = 0
        for i in 1...amount {
            for coin in coins {
                guard coin <= i else { continue }
                dp[i] = min(dp[i], dp[i - coin] + 1)
            }
        }
        return dp[amount] > amount ? -1 : dp[amount]
    }

}
