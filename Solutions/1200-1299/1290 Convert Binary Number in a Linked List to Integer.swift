//
//  1290 Convert Binary Number in a Linked List to Integer.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 01/11/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/convert-binary-number-in-a-linked-list-to-integer/
class Solution {

    /// Converts the binary number in the linked list in decimal representation.
    ///
    /// - Parameter head: Linked list head.
    /// - Returns: The decimal value of the number in the linked list.
    ///
    /// - Complexity:
    ///   - time: O(n), where n is the number of nodes in the linked list.
    ///   - space: O(1), only constant space is used.
    func getDecimalValue(_ head: ListNode?) -> Int {
        var ans = 0
        var cur = head

        while let node = cur {
            ans = ans * 2 + node.val

            cur = node.next
        }

        return ans
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
