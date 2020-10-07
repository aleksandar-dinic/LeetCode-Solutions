//
//  61 Rotate List.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 07/10/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundations

/// Source: https://leetcode.com/problems/rotate-list/
class Solution {

    /// Rotates the list to the right by `k` places.
    ///
    /// - Parameters:
    ///   - head: Head of the linked list.
    ///   - k: A number of rotation steps.
    /// - Returns: The new head of the linked list.
    ///
    /// - Complexity:
    ///   - time: O(n), where n is the number of nodes in the linked list.
    ///   - space: O(1), only constant space is used.
    func rotateRight(_ head: ListNode?, _ k: Int) -> ListNode? {
        guard head?.next != nil else { return head }

        var curr = head
        var len = 1

        while curr?.next != nil {
            curr = curr?.next
            len += 1
        }
        curr?.next = head

        for _ in 0..<(len - k % len) {
            curr = curr?.next
        }

        var newHead = curr?.next
        curr?.next = nil

        return newHead
    }

}

/// Provided Code
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
