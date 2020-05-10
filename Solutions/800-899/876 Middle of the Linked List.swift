//
//  876 Middle of the Linked List.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 10/05/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/middle-of-the-linked-list/
class Solution {

    /// Finds middle node of the Linked List.
    ///
    /// - Parameter head: Non-empty linked list.
    /// - Returns: A middle node of the linked list.
    ///
    /// - Complexity:
    ///     - time: O(n), where n is the number of nodes in the linked list.
    ///     - space: O(1), only constant space is used.
    func middleNode(_ head: ListNode?) -> ListNode? {
        var slow = head
        var fast = head

        while let fastNext = fast?.next {
            slow = slow?.next
            fast = fastNext.next
        }

        return slow
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
