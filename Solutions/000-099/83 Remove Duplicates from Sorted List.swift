//
//  83 Remove Duplicates from Sorted List.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 17/09/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundations

/// Source: https://leetcode.com/problems/remove-duplicates-from-sorted-list/
class Solution {

    /// Deletes all duplicates such that each element appears only once.
    ///
    /// - Parameter head: The head of the sorted linked list.
    /// - Returns: The head of the sorted linked list without duplicates.
    ///
    /// - Complexity:
    ///   - time: O(n), where n is the number of nodes in the linked list.
    ///   - space: O(1), only constant space is used.
    func deleteDuplicates(_ head: ListNode?) -> ListNode? {
        var curr = head

        while curr?.next != nil {
            if curr?.val == curr?.next?.val {
                curr?.next = curr?.next?.next
            } else {
                curr = curr?.next
            }
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
