//
//  188 Best Time to Buy and Sell Stock IV.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 18/10/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/best-time-to-buy-and-sell-stock-iv/
class Solution {

    /// Finds the maximum profit.
    ///
    /// - Parameters:
    ///   - k: The number of transactions that can be completed.
    ///   - prices: An array where the i-th element is the price of
    ///   a given stock on day i.
    /// - Returns: Maximum profit.
    ///
    /// - Complexity:
    ///   - time: O(nk), where n is the number of `prices`, and `k` is the number of
    ///   transactions.
    ///   - space: O(nk), where n is the number of `prices`, and `k` is the number of
    ///   transactions.
    func maxProfit(_ k: Int, _ prices: [Int]) -> Int {
        guard !prices.isEmpty, k > 0 else { return 0 }

        let count = prices.count
        guard k < count / 2 else {
            return maxProfit(prices)
        }

        var ans = [[Int]](repeating: [Int](repeating: 0, count: count), count: k+1)

        for i in 1...k {
            var tmpMax = -prices[0]
            for j in 1..<count {
                ans[i][j] = max(ans[i][j-1], prices[j] + tmpMax)
                tmpMax = max(tmpMax, ans[i-1][j-1] - prices[j])
            }
        }

        return ans[k][count-1]
    }

    private func maxProfit(_ prices: [Int]) -> Int {
        var ans = 0

        for i in 1..<prices.count {
            guard prices[i] > prices[i-1] else { continue }
            ans += prices[i] - prices[i-1]
        }

        return ans
    }

}
