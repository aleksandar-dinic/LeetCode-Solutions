//
//  203 Remove Linked List Elements.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 20/07/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/remove-linked-list-elements/
class Solution {

    /// Removes all elements from a linked list of integers that have value *val*.
    ///
    /// - Parameters:
    ///   - head: Linked list head.
    ///   - val: The value.
    /// - Returns: Linked list head.
    ///
    /// - Complexity:
    ///   - time: O(n), where n is the number of nodes.
    ///   - space: O(1), only constant space is used.
    func removeElements(_ head: ListNode?, _ val: Int) -> ListNode? {
        let dummy = ListNode(-1)
        dummy.next = head
        var cur: ListNode? = dummy

        while cur?.next != nil {
            if let curVal = cur?.next?.val, curVal == val {
                cur?.next = cur?.next?.next
            } else {
                cur = cur?.next
            }
        }

        return dummy.next
    }

}

// Provided Code
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
