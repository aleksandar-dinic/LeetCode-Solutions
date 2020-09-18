//
//  121 Best Time to Buy and Sell Stock.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 18/09/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/best-time-to-buy-and-sell-stock/
class Solution {

    /// Finds the maximum profit.
    ///
    /// - Parameter prices: An array where the i-th element is the price of
    ///   a given stock on day i.
    /// - Returns: Maximum profit.
    ///
    /// - Complexity:
    ///   - time: O(n), where n is the number of prices.
    ///   - space: O(1), only constant space is used.
    func maxProfit(_ prices: [Int]) -> Int {
        var minPrice = Int.max
        var ans = 0

        for price in prices {
            minPrice = min(minPrice, price)
            ans = max(ans, price - minPrice)
        }

        return ans
    }

}
