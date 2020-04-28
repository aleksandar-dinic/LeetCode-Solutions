//
//  122 Best Time to Buy and Sell Stock II.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 28/04/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/best-time-to-buy-and-sell-stock-ii/
class Solution {

    /// Finds the maximum profit.
    ///
    /// - Parameter prices: An array where the i-th element is the price of
    ///   a given stock on day i.
    ///
    /// - Returns: Maximum profit.
    ///
    /// - Complexity:
    ///   - time: O(n), where n is the length of the prices.
    ///   - space: O(1), only constant space is used.
    func maxProfit(_ prices: [Int]) -> Int {
        guard !prices.isEmpty else { return 0 }

        var ans = 0
        for i in 1..<prices.count {
            guard prices[i] > prices[i - 1] else { continue }
            ans += prices[i] - prices[i - 1]
        }

        return ans
    }

}
