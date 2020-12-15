//
//  369 Plus One Linked List.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 15/12/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/plus-one-linked-list/
class Solution {

    /// Adds plus one to the integer represented as a linked list of digits.
    ///
    /// - Parameter head: The linked list head.
    /// - Returns: The new head of the linked list.
    ///
    /// - Complexity:
    ///   - time: O(n), where n is the number of nodes in the linked list.
    ///   - space: O(1), only constant space is used.
    func plusOne(_ head: ListNode?) -> ListNode? {
        var dummy = ListNode(0)
        dummy.next = head
        var notNine: ListNode? = dummy
        
        var cur = head
        while cur != nil {
            if cur?.val != 9 {
                notNine = cur
            }
            cur = cur?.next
        }
        
        notNine?.val += 1
        notNine = notNine?.next
        
        while notNine != nil {
            notNine?.val = 0
            notNine = notNine?.next
        }
        
        return dummy.val != 0 ? dummy : dummy.next
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
