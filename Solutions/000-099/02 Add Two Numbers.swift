//
//  02 Add Two Numbers.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 27/04/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/add-two-numbers
class Solution {

    /// Adds two numbers.
    ///
    /// - Parameters:
    ///   - l1: Linked list representing non-negative integer. The digits are stored in reverse
    ///     order and each of nodes contain a single digit.
    ///   - l2: Linked list representing non-negative integer. The digits are stored in reverse
    ///     order and each of nodes contain a single digit.
    /// - Returns: Sum of l1 and l2 represented as linked list.
    ///
    /// - Complexity:
    ///   - time: O(max(n, m)), where n is the length of the l1 and m is the length of the l2.
    ///   - space: O(max(n, m)), where n is the length of the l1 and m is the length of the l2.
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var l1 = l1
        var l2 = l2

        let dummyHead = ListNode(-1)
        var tail: ListNode? = dummyHead
        var carry = 0

        while l1 != nil || l2 != nil || carry != 0  {
            var value = carry

            if let l1Val = l1?.val {
                value += l1Val
                l1 = l1?.next
            }

            if let l2Val = l2?.val {
                value += l2Val
                l2 = l2?.next
            }
            let digit = value % 10
            carry = value / 10
            tail?.next = ListNode(digit)
            tail = tail?.next
        }

        return dummyHead.next
    }

}

public class ListNode {

    public var val: Int
    public var next: ListNode?

    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }

}
