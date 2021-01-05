//
//  82 Remove Duplicates from Sorted List II.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 05/01/2021.
//  Copyright © 2021 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/remove-duplicates-from-sorted-list-ii/
class Solution {

    /// Deletes all nodes that have duplicate numbers, leaving only distinct numbers
    /// from the original list.
    ///
    /// - Parameter head: Linked list head.
    /// - Returns: Linked list head.
    ///
    /// - Complexity:
    ///   - time: O(n), where n is the number of nodes in the linked list.
    ///   - space: O(1), only constant space is used.
    func deleteDuplicates(_ head: ListNode?) -> ListNode? {
        let dummy: ListNode? = ListNode(-1)
        dummy?.next = head

        var curr = dummy
        while let nextVal = curr?.next?.val, let nextNextVal = curr?.next?.next?.val {
            if nextVal == nextNextVal {
                let duplicate = nextVal
                while curr?.next != nil, curr?.next?.val == duplicate {
                    curr?.next = curr?.next?.next
                }
            } else {
                curr = curr?.next
            }
        }

        return dummy?.next
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
