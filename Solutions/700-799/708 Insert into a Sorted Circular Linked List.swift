//
//  708 Insert into a Sorted Circular Linked List.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 22/09/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/insert-into-a-sorted-circular-linked-list/
class Solution {

    /// Inserts a given value into the circular linked list such that it remains a sorted
    /// circular list.
    ///
    /// - Parameters:
    ///   - head: A node from a circular linked list.
    ///   - insertVal: An insert value.
    /// - Returns: An inserted node if the list is empty, otherwise returns the originally
    ///   given node.
    ///
    /// - Complexity:
    ///     - time: O(n), where n is the number of nodes in the list.
    ///     - space: O(1), only constant space is used.
    func insert(_ head: Node?, _ insertVal: Int) -> Node? {
        var newNode = Node(insertVal)

        guard head != nil else {
            newNode.next = newNode
            return newNode
        }

        var prev = head
        var curr = head?.next

        while true {
            let prevVal = prev?.val ?? -1
            let currVal = curr?.val ?? -1

            if (prevVal <= insertVal && insertVal <= currVal) ||
                (prevVal > currVal && (insertVal >= prevVal || insertVal <= currVal)) {
                break
            }

            prev = curr
            curr = curr?.next
            guard prev == head else { continue }
            break
        }

        prev?.next = newNode
        newNode.next = curr
        return head
    }

}

/// Provided Code
public class Node {

    public var val: Int
    public var next: Node?

    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }

}
