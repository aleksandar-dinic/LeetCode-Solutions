//
//  155 Min Stack.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 10/01/2021.
//  Copyright © 2021 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/min-stack/
class MinStack {

    private var stack: [Node]
    
    init() {
        stack = [Node]()
    }
    
    /// Push element x onto stack.
    ///
    /// - Parameter x: The element.
    ///
    /// - Complexity:
    ///   - time: O(1), only constant time is used.
    ///   - space: O(n), where n is the total number of operations performed.
    func push(_ x: Int) {
        let prevMin = stack.last?.min ?? Int.max
        let node = Node(value: x, min: min(prevMin, x))
        stack.append(node)
    }
    
    /// Removes the element on top of the stack.
    ///
    /// - Complexity:
    ///   - time: O(1), only constant time is used.
    ///   - space: O(1), only constant space is used.
    func pop() {
        guard !stack.isEmpty else { return }
        stack.removeLast()
    }
    
    /// Get the top element.
    ///
    /// - Returns: The top element.
    ///
    /// - Complexity:
    ///   - time: O(1), only constant time is used.
    ///   - space: O(1), only constant space is used.
    func top() -> Int {
        stack.last?.value ?? -1
    }
    
    /// Retrieve the minimum element in the stack.
    ///
    /// - Returns: The minimum element.
    ///
    /// - Complexity:
    ///   - time: O(1), only constant time is used.
    ///   - space: O(1), only constant space is used.
    func getMin() -> Int {
        stack.last?.min ?? -1
    }

}

struct Node {
 
    var value: Int
    var min: Int

}
