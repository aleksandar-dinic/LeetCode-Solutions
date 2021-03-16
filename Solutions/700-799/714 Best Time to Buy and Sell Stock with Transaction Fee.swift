//
//  714 Best Time to Buy and Sell Stock with Transaction Fee.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 16/03/2021.
//  Copyright © 2021 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/best-time-to-buy-and-sell-stock-with-transaction-fee/
class Solution {

    /// Finds the maximum profit you can achieve.
    ///
    /// - Parameters:
    ///   - prices: An array of prices.
    ///   - fee: A transaction fee.
    /// - Returns: The maximum profit.
    ///
    /// - Complexity:
    ///     - time: O(n), where n is the length of `prices`.
    ///     - space: O(1), only constant space is used.
    func maxProfit(_ prices: [Int], _ fee: Int) -> Int {
        var ans = 0
        var hold = -prices[0]
        
        for i in 1..<prices.count {
            ans = max(ans, hold + prices[i] - fee)
            hold = max(hold, ans - prices[i])
        }
        
        return ans
    }

}
