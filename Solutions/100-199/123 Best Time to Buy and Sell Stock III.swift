//
//  123 Best Time to Buy and Sell Stock III.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 16/08/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/best-time-to-buy-and-sell-stock-iii/
class Solution {

    /// Finds the maximum profit.
    ///
    /// - Parameter prices: An array where the i-th element is the price of
    ///   a given stock on day i.
    /// - Returns: Maximum profit.
    ///
    /// - Complexity:
    ///   - time: O(n), where n is the length of the prices.
    ///   - space: O(1), only constant space is used.
    func maxProfit(_ prices: [Int]) -> Int {
        var buy1 = Int.max
        var buy2 = Int.max
        var sell1 = 0
        var sell2 = 0

        for price in prices {
            buy1 = min(buy1, price)
            sell1 = max(sell1, price - buy1)

            buy2 = min(buy2, price - sell1)
            sell2 = max(sell2, price - buy2)
        }

        return sell2
    }

}
