//
//  232 Implement Queue using Stacks.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 02/03/2021.
//  Copyright © 2021 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/implement-queue-using-stacks/
class MyQueue {

    private var input: [Int]
    private var output: [Int]

    init() {
        input = [Int]()
        output = [Int]()
    }

    /// Push element x to the back of queue.
    ///
    /// - Parameter x: New element.
    ///
    /// - Complexity:
    ///     - time: O(1), only constant time is used.
    ///     - space: O(n), where n is the number of elements in the queue.
    func push(_ x: Int) {
        input.append(x)
    }

    /// Removes the element from in front of queue and returns that element.
    ///
    /// - Returns: First element in the queue.
    ///
    /// - Complexity:
    ///     - time: O(1), only constant time is used.
    ///     - space: O(1), only constant space is used.
    func pop() -> Int {
        peek()
        return output.removeLast()
    }

    /// Get the front element.
    ///
    /// - Returns: First element in the queue.
    ///
    /// - Complexity:
    ///     - time: O(n), where n is the number of elements in the queue.
    ///     - space: O(1), only constant space is used.
    func peek() -> Int {
        guard output.isEmpty else { return output.last ?? -1 }

        while !input.isEmpty  {
            output.append(input.removeLast())
        }

        return output.last ?? -1
    }

    /// Returns whether the queue is empty.
    ///
    /// - Returns: True if the queue is empty, otherwise returns false.
    ///
    /// - Complexity:
    ///     - time: O(1), only constant time is used.
    ///     - space: O(1), only constant space is used.
    func empty() -> Bool {
        input.isEmpty && output.isEmpty
    }

}
