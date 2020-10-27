//
//  142 Linked List Cycle II.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 27/10/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/linked-list-cycle-ii/
class Solution {

    /// Finds the node where the cycle begins.
    ///
    /// - Parameter head: Linked list head.
    /// - Returns: The node where the cycle begins, if the cycle doesn't exist
    ///   returns nil.
    ///
    /// - Complexity:
    ///   - time: O(n), where n is the number of nodes in the linked list.
    ///   - space: O(1), only constant space is used.
    func detectCycle(_ head: ListNode?) -> ListNode? {
        guard head?.next != nil else { return nil }
        var slow = head
        var fast = head

        while slow?.next != nil || fast?.next?.next != nil {
            slow = slow?.next
            fast = fast?.next?.next
            guard slow !== fast else { break }
        }

        slow = head
        while slow !== fast {
            slow = slow?.next
            fast = fast?.next
        }

        return slow
    }

}

/// Provided code
public class ListNode {

    public var val: Int
    public var next: ListNode?

    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }

}
