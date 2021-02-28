//
//  225 Implement Stack using Queues.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 28/02/2021.
//  Copyright © 2021 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/implement-stack-using-queues/
class MyStack {

    private var queue: [Int]

    init() {
        queue = [Int]()
    }

    /// Push element x onto stack.
    ///
    /// - Parameter x: New element.
    ///
    /// - Complexity:
    ///     - time: O(n), where n is the number of elements in the stack.
    ///     - space: O(1), only constant space is used.
    func push(_ x: Int) {
        queue.append(x)
        for _ in 1..<queue.count {
            queue.append(queue.removeFirst())
        }
    }

    /// Removes the element on top of the stack and returns that element.
    ///
    /// - Returns: The element on top of the stack.
    ///
    /// - Complexity:
    ///     - time: O(1), only constant time is used.
    ///     - space: O(1), only constant space is used.
    func pop() -> Int {
        queue.removeFirst()
    }

    /// Get the top element.
    ///
    /// - Returns: The top element.
    ///
    /// - Complexity:
    ///     - time: O(1), only constant time is used.
    ///     - space: O(1), only constant space is used.
    func top() -> Int {
        queue.first ?? -1
    }

    /// Returns whether the stack is empty.
    ///
    /// - Returns: True if the stack is empty, otherwise returns false.
    ///
    /// - Complexity:
    ///     - time: O(1), only constant time is used.
    ///     - space: O(1), only constant space is used.
    func empty() -> Bool {
        queue.isEmpty
    }

}
