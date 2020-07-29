//
//  309 Best Time to Buy and Sell Stock with Cooldown.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 29/07/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/best-time-to-buy-and-sell-stock-with-cooldown/
class Solution {

    /// Finds the maximum profit.
    ///
    /// - Parameter prices: The prices of a given stock.
    /// - Returns: The maximum profit.
    ///
    /// - Complexity:
    ///   - time: O(n), where n is the length of the prices.
    ///   - space: O(1), only constant space is used.
    func maxProfit(_ prices: [Int]) -> Int {
        var sold = 0
        var hold = Int.min
        var rest = 0
        var prevSold = 0

        for price in prices {
            prevSold = sold
            sold = hold + price
            hold = max(hold, rest - price)
            rest = max(rest, prevSold)
        }

        return max(sold, rest)
    }

}
