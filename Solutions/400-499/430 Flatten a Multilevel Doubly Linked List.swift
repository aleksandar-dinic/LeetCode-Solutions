//
//  430 Flatten a Multilevel Doubly Linked List.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 10/07/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/flatten-a-multilevel-doubly-linked-list/
class Solution {

    /// Flattens the list so that all the nodes appear in a single-level, doubly linked
    /// list.
    ///
    /// - Parameter head: Multilevel doubly linked list head.
    /// - Returns: Single-level doubly linked list head.
    ///
    /// - Complexity:
    ///   - time: O(n), where n is the number of elements in multilevel linked list.
    ///   - space: O(1), only constant space is used.
    func flatten(_ head: Node?) -> Node? {
        let dummy = Node(-1)
        dummy.next = head

        var cur = dummy.next

        while cur != nil {
            if cur?.child == nil {
                cur = cur?.next
                continue
            }

            var tmp = cur?.child

            while tmp?.next != nil {
                tmp = tmp?.next
            }

            tmp?.next = cur?.next
            cur?.next?.prev = tmp

            cur?.next = cur?.child
            cur?.child?.prev = cur
            cur?.child = nil
        }

        return dummy.next
    }

}

/// Provided Code
public class Node {

    public var val: Int
    public var prev: Node?
    public var next: Node?
    public var child: Node?

    public init(_ val: Int) {
        self.val = val
        self.prev = nil
        self.next = nil
        self.child  = nil
    }

}
