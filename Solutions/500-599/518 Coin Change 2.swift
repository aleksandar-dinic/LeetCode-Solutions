//
//  518 Coin Change 2.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 04/03/2021.
//  Copyright © 2021 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/coin-change-2/
class Solution {

    /// Finds the number of combinations that make up `coins` to the `amount`.
    ///
    /// - Parameters:
    ///   - amount: The total amount of money.
    ///   - coins: The coins.
    /// - Returns: The number of combinations.
    ///
    /// - Complexity:
    ///     - time: O(n * m), where n is the number of coins, and m is the given
    ///     `amount`.
    ///     - space: O(m), where m is the given `amount`.
    func change(_ amount: Int, _ coins: [Int]) -> Int {
        guard amount > 0 else { return 1 }
                
        var ans = [Int](repeating: 0, count: amount+1)
        ans[0] = 1
        
        for coin in coins  {
            guard coin <= amount else { continue }
            for i in coin...amount {
                ans[i] += ans[i - coin]
            }
        }
        
        return ans[amount]
    }

}
