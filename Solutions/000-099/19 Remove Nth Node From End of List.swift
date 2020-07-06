//
//  19 Remove Nth Node From End of List.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 06/07/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/remove-nth-node-from-end-of-list/
class Solution {

    /// Removes the n-th node from the end of the list.
    ///
    /// - Parameters:
    ///   - head: Linked list head.
    ///   - n: Position of node, from the end, to delete.
    /// - Returns: Linked list head.
    ///
    /// - Complexity:
    ///   - time: O(m), where m is the number of elements in the linked list.
    ///   - space: O(1), only constant space is used.
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        let dummy = ListNode(-1)
        dummy.next = head

        var slow: ListNode? = dummy
        var fast: ListNode? = dummy.next

        for _ in 0..<n {
            fast = fast?.next
        }

        while fast != nil {
            fast = fast?.next
            slow = slow?.next
        }

        slow?.next = slow?.next?.next
        return dummy.next
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
