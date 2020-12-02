//
//  382 Linked List Random Node.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 02/12/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/linked-list-random-node/
class Solution {

    private let head: ListNode?

    /// Initialize data structure.
    ///
    /// - Parameter head: The linked list head.
    init(_ head: ListNode?) {
        self.head = head
    }

    /// Returns a random node's value from the linked list.
    ///
    /// - Returns: A random node's value.
    ///
    /// - Complexity:
    ///   - time: O(n), where n is the number of nodes in the linked list.
    ///   - space: O(1), only constant space is used.
    func getRandom() -> Int {
        var scope = 1.0
        var ans = 0

        var curr = head
        while let node = curr {
            if Double.random(in: 0..<1) < 1.0 / scope {
                ans = node.val
            }

            scope += 1
            curr = curr?.next
        }

        return ans
    }

}

/// Provided code
public class ListNode {

    public var val: Int
    public var next: ListNode?

    public init() {
        self.val = 0
        self.next = nil
    }

    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }

    public init(_ val: Int, _ next: ListNode?) {
        self.val = val
        self.next = next
    }

}
