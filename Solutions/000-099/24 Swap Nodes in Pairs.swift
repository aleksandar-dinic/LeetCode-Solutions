//
//  24 Swap Nodes in Pairs.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 24/12/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/swap-nodes-in-pairs/
class Solution {

    /// Swaps every two adjacent nodes in the linked list.
    ///
    /// - Parameter head: Linked list head.
    /// - Returns: Linked list head.
    ///
    /// - Complexity:
    ///   - time: O(n), where n is the number of nodes in the linked list.
    ///   - space: O(1), only constant space is used.
    func swapPairs(_ head: ListNode?) -> ListNode? {
        let dummy = ListNode(-1)
        dummy.next = head

        var head = head
        var prevNode: ListNode? = dummy

        while head?.next != nil {
            let firstNode = head
            let secondNode = head?.next

            prevNode?.next = secondNode
            firstNode?.next = secondNode?.next
            secondNode?.next = firstNode

            prevNode = firstNode
            head = firstNode?.next
        }

        return dummy.next
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
