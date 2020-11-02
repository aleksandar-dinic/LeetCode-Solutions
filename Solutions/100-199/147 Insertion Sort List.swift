//
//  147 Insertion Sort List.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 02/11/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/insertion-sort-list/
class Solution {

    /// Sorts a linked list using insertion sort.
    ///
    /// - Parameter head: Linked list head.
    /// - Returns: Sorted linked list head.
    ///
    /// - Complexity:
    ///   - time: O(n^2), where n is the number of nodes in the linked list.
    ///   - space: O(1), only constant space is used.
    func insertionSortList(_ head: ListNode?) -> ListNode? {
        let dummy = ListNode()
        var curr = head
        var prevNode: ListNode?
        var nextNode: ListNode?

        while curr != nil {
            prevNode = dummy
            nextNode = dummy.next

            while nextNode != nil {
                guard
                    let currVal = curr?.val,
                    let nextVal = nextNode?.val,
                    currVal >= nextVal
                else { break }
                prevNode = nextNode
                nextNode = nextNode?.next
            }

            let tmp = curr?.next
            curr?.next = nextNode
            prevNode?.next = curr

            curr = tmp
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
