//
//  445 Add Two Numbers II.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 07/11/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/add-two-numbers-ii/
class Solution {

    /// Adds two numbers represented in linked lists.
    ///
    /// - Parameters:
    ///   - l1: First number represented in the linked list.
    ///   - l2: Second number represented in the linked list.
    /// - Returns: Sum represented in the linked list.
    ///
    /// - Complexity:
    ///   - time: O(n + m), where n is the length of `l1`, and m is the length of `l2`.
    ///   - space: O(max(n, m)), where n is the length of `l1`, and m is the length of `l2`.
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var n1 = 0
        var n2 = 0

        var cur1 = l1
        var cur2 = l2

        while cur1 != nil {
            cur1 = cur1?.next
            n1 += 1
        }

        while cur2 != nil {
            cur2 = cur2?.next
            n2 += 1
        }

        cur1 = l1
        cur2 = l2
        var head: ListNode?
        while n1 > 0, n2 > 0 {
            var val = 0
            if n1 >= n2 {
                val += cur1?.val ?? 0
                cur1 = cur1?.next
                n1 -= 1
            }
            if n1 < n2 {
                val += cur2?.val ?? 0
                cur2 = cur2?.next
                n2 -= 1
            }

            let newHead = ListNode(val)
            newHead.next = head
            head = newHead
        }

        cur1 = head
        head = nil
        var carry = 0
        while let cur = cur1 {
            let val = (cur.val + carry) % 10
            carry = (cur.val + carry) / 10

            let newHead = ListNode(val)
            newHead.next = head
            head = newHead

            cur1 = cur.next
        }

        if carry != 0 {
            let newHead = ListNode(carry)
            newHead.next = head
            head = newHead
        }

        return head
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
