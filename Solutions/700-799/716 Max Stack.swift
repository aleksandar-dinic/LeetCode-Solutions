//
//  716 Max Stack.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 19/01/2021.
//  Copyright © 2021 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/max-stack/
class MaxStack {

    private var stack: [Int]
    private var maxStack: [Int]
    
    init() {
        stack = [Int]()
        maxStack = [Int]()
    }
    
    /// Pushes element `x` onto the stack.
    ///
    /// - Parameter x: The element.
    ///
    /// - Complexity:
    ///     - time: O(1), only constant time is used.
    ///     - space: O(1), only constant space is used.
    func push(_ x: Int) {
        let curMax = max(x, maxStack.last ?? x)
        maxStack.append(curMax)
        stack.append(x)
    }
    
    ///  Removes the element on top of the stack and returns it.
    ///
    /// - Returns: The top element.
    ///
    /// - Complexity:
    ///     - time: O(1), only constant time is used.
    ///     - space: O(1), only constant space is used.
    func pop() -> Int {
        maxStack.removeLast()
        return stack.removeLast()
    }
    
    /// Gets the element on the top of the stack without removing it.
    ///
    /// - Returns: The top element.
    ///
    /// - Complexity:
    ///     - time: O(1), only constant time is used.
    ///     - space: O(1), only constant space is used.
    func top() -> Int {
        guard let last = stack.last else { fatalError("Top on empty stack") }
        return last
    }
    
    /// Retrieves the maximum element in the stack without removing it.
    ///
    /// - Returns: The maximum element.
    ///
    /// - Complexity:
    ///     - time: O(1), only constant time is used.
    ///     - space: O(1), only constant space is used.
    func peekMax() -> Int {
        guard let last = maxStack.last else { fatalError("PeekMax on empty stack") }
        return last
    }
    
    /// Retrieves the maximum element in the stack and removes it.
    ///
    /// - Returns: The maximum element.
    ///
    /// - Complexity:
    ///     - time: O(n), where n is the number of elements in the stack.
    ///     - space: O(1), only constant space is used.
    func popMax() -> Int {
        var max = peekMax()
        var buffer = [Int]()
        
        while top() != max {
            buffer.append(pop())
        }
        
        _ = pop()
        
        while !buffer.isEmpty {
            push(buffer.removeLast())
        }
        
        return max
    }
    
}
