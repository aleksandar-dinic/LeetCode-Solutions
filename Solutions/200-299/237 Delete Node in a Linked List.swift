//
//  237 Delete Node in a Linked List.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 03/06/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/delete-node-in-a-linked-list/
class Solution {

    /// Deletes a node (except the tail) in a singly linked list.
    ///
    /// - Parameter node: Node for deletion.
    ///
    /// - Complexity:
    ///   - time: O(1), only constant time is used.
    ///   - space: O(1), only constant space is used.
    func deleteNode(_ node: ListNode?) {
        guard let node = node, let next = node.next else { return }
        node.val = next.val
        node.next = next.next
    }

}

/// Provided Code
public class ListNode {

    public var val: Int
    public var next: ListNode?

    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }

}
