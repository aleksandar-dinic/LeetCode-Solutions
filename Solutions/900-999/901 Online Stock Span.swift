//
//  901 Online Stock Span.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 19/05/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/online-stock-span/
class StockSpanner {

    typealias Stock = (price: Int, span: Int)

    private var stack: [Stock]

    init() {
        stack = [Stock]()
    }

    /// Collects daily price quotes for the stock, and returns the span of that stock's
    /// price for the current day.
    ///
    /// - Parameter price: The daily price for the stock.
    /// - Returns: The span of that stock's price for the current day.
    ///
    /// - Complexity:
    ///     - time: O(q), where q is the number of calls to *StockSpanner.next*.
    ///     - space: O(q), where q is the number of calls to *StockSpanner.next*.
    func next(_ price: Int) -> Int {
        var span = 1

        while let last = stack.last, last.price <= price {
            span += last.span
            stack.removeLast()
        }

        stack.append((price, span))
        return span
    }

}
