//
//  148 Sort List.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 13/10/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/sort-list/
class Solution {

    private var tail = ListNode(-1)
    private var nextSublist: ListNode? = ListNode(-1)

    /// Sorts linked list in ascending order.
    ///
    /// - Parameter head: Head of the linked list.
    /// - Returns: Head of the linked list after sorting.
    ///
    /// - Complexity:
    ///   - time: O(n log(n)), where n is the number of nodes in the linked list.
    ///   - space: O(1), only constant space is used.
    func sortList(_ head: ListNode?) -> ListNode? {
        guard head?.next != nil else { return head }

        var start = head
        let dummy = ListNode(-1)

        var size = 1
        let n = getCount(head)

        while size < n {
            tail = dummy
            while start != nil {
                guard start?.next != nil else {
                    tail.next = start
                    break
                }

                var mid = split(start, size)
                merge(&start, &mid)
                start = nextSublist
            }
            start = dummy.next

            size *= 2
        }

        return dummy.next
    }

    private func split(_ start: ListNode?, _ size: Int) -> ListNode? {
        var start = start
        var end = start?.next

        for _ in 1..<size {
            if let endNext = end?.next {
                end = endNext.next ?? endNext
            }

            if let startNext = start?.next {
                start = startNext
            }
        }
        let mid = start?.next
        start?.next = nil
        nextSublist = end?.next
        end?.next = nil

        return mid
    }

    private func merge(_ list1: inout ListNode?, _ list2: inout ListNode?) {
        let dummy = ListNode(-1)
        var newTail: ListNode? = dummy

        while let list1Val = list1?.val, let list2Val = list2?.val {
            if list1Val < list2Val {
                newTail?.next = list1
                list1 = list1?.next
            } else {
                newTail?.next = list2
                list2 = list2?.next
            }
            newTail = newTail?.next
        }
        newTail?.next = list1 != nil ? list1 : list2

        while newTail?.next != nil {
            newTail = newTail?.next
        }

        tail.next = dummy.next

        if let newTail = newTail {
            tail = newTail
        }
    }

    private func getCount(_ head: ListNode?) -> Int {
        var count = 0
        var cur = head

        while cur != nil {
            cur = cur?.next
            count += 1
        }

        return count
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
